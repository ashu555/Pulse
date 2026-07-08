# System Overview

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Volume 3 — Chapter 1 — System Overview  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release.

---

## Table of Contents

1. [Purpose](#purpose)
2. [Architecture Mission](#architecture-mission)
3. [Upstream Authority](#upstream-authority)
4. [System in One Sentence](#system-in-one-sentence)
5. [Context Diagram](#context-diagram)
6. [High-Level Runtime Flow](#high-level-runtime-flow)
7. [Logical Subsystems](#logical-subsystems)
8. [Package Topology](#package-topology)
9. [Deployment Topologies](#deployment-topologies)
10. [Data Planes](#data-planes)
11. [Control vs Data Path](#control-vs-data-path)
12. [Key Architectural Decisions (Summary)](#key-architectural-decisions-summary)
13. [Quality Attributes](#quality-attributes)
14. [Trust Boundaries](#trust-boundaries)
15. [MVP vs Later Horizons](#mvp-vs-later-horizons)
16. [Non-Goals for Architecture](#non-goals-for-architecture)
17. [Volume 3 Roadmap](#volume-3-roadmap)
18. [Handoff](#handoff)

---

## Purpose

This chapter is the **map of the Pulse system**. It answers:

- What major parts exist?
- How do they connect?
- What runs inside the developer’s Laravel app vs beside it?
- How does architecture honor Volume 1 (product) and Volume 2 (UX)?

It does **not** yet specify every class, table, or OpenAPI path. Those land in later Volume 3 chapters.

---

## Architecture Mission

**Pulse architecture turns real Laravel structure and execution into a trustworthy, queryable, streamable model that a UI can render as a living city—without coupling the host application to Pulse’s future evolution.**

Success criteria for the architecture (not just the product):

1. Zero-config package boots and observes  
2. Structure discovery → city graph  
3. Runtime events → correlated traces → live UI  
4. Inspectors read APIs, never invent data  
5. Seams allow replay, plugins, and SaaS connectors without rewrite  

---

## Upstream Authority

| Source | Binding input |
|---|---|
| [Final PRD](../01-product/PRD.md) | MVP scope M01–M28 |
| [Technical Constraints](../01-product/TechnicalConstraints.md) | H1–H10, transport, security |
| [UX Vision](../02-ux/UXVisionPrinciples.md) + metaphor | Truth UI, entity dictionary |
| [Version 2](../01-product/Version2.md) | Replay/plugin seams must not be boxed out |
| PROJECT_SPEC | Package-first, Laravel-first, event-driven |

Architecture may not waive hard constraints without ADR + Mission review.

---

## System in One Sentence

Pulse is an **observation + modeling + streaming + visualization** system: collectors observe a Laravel app, a domain model stores structure and traces, a transport publishes updates, and a React dashboard renders the city.

---

## Context Diagram

```text
┌─────────────────────────────────────────────────────────────┐
│                     Host Laravel Application                │
│  HTTP / Queues / Events / Jobs / Routing / Containers       │
│                           │                                 │
│                           ▼                                 │
│                 ┌─────────────────────┐                     │
│                 │  pulse-laravel      │  Service provider,  │
│                 │  (integration)      │  hooks, routes, UI  │
│                 └─────────┬───────────┘                     │
│                           │                                 │
│                 ┌─────────▼───────────┐                     │
│                 │  pulse-core         │  Domain, contracts, │
│                 │                     │  pipeline, models   │
│                 └─────────┬───────────┘                     │
└───────────────────────────┼─────────────────────────────────┘
                            │
              ┌─────────────┼─────────────┐
              ▼             ▼             ▼
        Discovery      Live traces    Local store
        (structure)    (runtime)      (optional MVP+)
              │             │
              └──────┬──────┘
                     ▼
            Visualization API
                     │
                     ▼
              Dashboard UI
           (package assets /
            React city client)
                     │
                     ▼
                 Developer
```

### External actors

| Actor | Interaction |
|---|---|
| **Developer** | Installs package, opens dashboard, triggers app traffic |
| **Host app runtime** | Emits the truth Pulse observes |
| **Redis / DB / Reverb** (optional) | Storage and realtime infrastructure |
| **Pulse Cloud** (later) | Receives redacted outbound traces |
| **Plugins** (later) | Extend collectors/visualizations via contracts |

---

## High-Level Runtime Flow

### A. Structure path (Aha Act 1)

```text
Dashboard open / rediscover
        ↓
Discovery engine scans Laravel (routes, controllers, events, queues, jobs, …)
        ↓
Structure graph written (in-memory + optional persistence)
        ↓
API: GET structure/city model
        ↓
UI builds city (metaphor mapping)
```

### B. Live path (Aha Act 2)

```text
Request / event / job occurs in host app
        ↓
Collectors observe (middleware, dispatcher listeners, queue hooks)
        ↓
Normalize → domain facts (no fabrications)
        ↓
Correlate (confidence-aware)
        ↓
Redact sensitive fields
        ↓
Publish to live bus (broadcast) OR poll buffer
        ↓
API / websocket channel
        ↓
UI animates travelers / messengers / trains
```

### C. Inspect path

```text
User selects entity
        ↓
API: GET entity detail + timeline relations
        ↓
Inspector renders dual-label + redacted payload
```

Honesty rule: if correlation confidence is low, API returns `parent: null` / `confidence: unknown`—UI shows unknown (UX Ch 2/9).

---

## Logical Subsystems

| ID | Subsystem | Responsibility | MVP |
|---|---|---|---|
| **S1** | Integration kernel | Service provider, config defaults, route registration, boot | P0 |
| **S2** | Discovery engine | Structural scanners → city graph | P0 |
| **S3** | Collector runtime | Request/event/queue/job observers | P0 |
| **S4** | Correlation engine | Link request ↔ events ↔ jobs | P0 |
| **S5** | Redaction pipeline | Strip/mask sensitive values | P0 |
| **S6** | Trace/stream pipeline | Buffer, publish, optionally persist | P0 |
| **S7** | Transport adapters | Reverb/broadcast + polling fallback | P0 |
| **S8** | Visualization API | Structure + live + inspect endpoints | P0 |
| **S9** | Dashboard UI | City canvas + HUD + inspector | P0 |
| **S10** | Diagnostics | `pulse:check`, health probes | P1 |
| **S11** | Replay store | Historical scrubbing | Post-MVP (v0.2) |
| **S12** | Plugin host | Load third-party collectors | Post-MVP contracts → marketplace |
| **S13** | Cloud shipper | Outbound SaaS connector | Later |

Subsystem boundaries should remain clear even when MVP ships as fewer Composer packages initially.

---

## Package Topology

### Target topology (evolved)

```text
packages/
  pulse-core          # Framework-agnostic domain + contracts + pipeline
  pulse-laravel       # Laravel integration + default collectors + routes + provider
  pulse-ui            # Built dashboard assets (or subdirectory of laravel package initially)
  pulse-plugin-api    # Public extension contracts (stabilize by v0.4)
  pulse-replayer      # Later extraction
  pulse-ai            # Later optional
```

### MVP delivery pragmatism

MVP may ship as:

| Option | Pros | Cons |
|---|---|---|
| **A. `pulse-laravel` meta-package** depending on path-repos / monorepo packages | Clean seams early | Heavier scaffolding |
| **B. Single installable package** with internal namespaces mirroring seams | Faster first release | Extraction discipline required |

**Decision for Volume 3:** Prefer **logical seams now**, allow **Option B packaging for first public MVP** if it accelerates proof—namespaces must still mirror `Core`, `Discovery`, `Collectors`, `Transport`, `Http/Api`, `Support`. Extraction to Option A before plugin GA.

### Host app relationship

```text
composer require <vendor>/pulse-laravel
        ↓
Auto-discovers provider
        ↓
Registers /pulse (or configured prefix)
        ↓
Serves API + UI assets
```

No application class edits required.

---

## Deployment Topologies

### T1 — Local package (primary MVP)

```text
[Laravel app + Pulse package] → browser dashboard
Optional: Redis, Reverb, queue workers
```

### T2 — Dockerized host app

Pulse rides inside app containers; Compose already used for host skeleton.

### T3 — Self-hosted team (later)

Same package; shared staging URL with auth gates.

### T4 — Pulse Cloud (later)

```text
App + Pulse + Shipper --outbound--> Cloud control plane → hosted UI
Local /pulse still works offline
```

Architecture must keep T1 valid forever.

---

## Data Planes

| Plane | Contents | Durability (MVP) |
|---|---|---|
| **Structure plane** | Routes, nodes, edges for city | Rebuildable via rediscovery; memory OK; optional cache |
| **Live plane** | Recent runtime facts & frames | Ephemeral ring buffer / short TTL |
| **Detail plane** | Inspector payloads (redacted) | Short-lived keyed by correlation ids |
| **Replay plane** (later) | Append-only traces | Durable store |
| **Config plane** | Enablement, redaction, sampling | File/env defaults |

CQRS lean: live ingestion is write-heavy; city/inspector APIs are read models projected from structure + traces.

---

## Control vs Data Path

| Path | Examples |
|---|---|
| **Control** | Enable Pulse, rediscover, open settings, run `pulse:check`, pause shipping (later) |
| **Data** | Discovery results, live events, inspect payloads |

UI never writes fake runtime data into the data path. Control commands may trigger rediscovery—not fabricated traffic.

---

## Key Architectural Decisions (Summary)

Formal ADRs will expand these in later chapters. Provisional decisions for MVP:

| ID | Decision | Rationale |
|---|---|---|
| AD-01 | Package-first observation inside host app | Zero-friction DX; companies install packages |
| AD-02 | `pulse-core` domain free of UI | API-first; SaaS/UI reuse |
| AD-03 | Collectors emit normalized facts, not UI commands | SOLID; plug-in ready |
| AD-04 | Transport interface with broadcast + polling | Install resilience (Ch 10 decision) |
| AD-05 | Correlation confidence explicit | Prefer unknown over wrong (H2) |
| AD-06 | Redaction before serialize-to-UI | Trust / security |
| AD-07 | UI is a pure client of Visualization API | No parallel truth in React |
| AD-08 | Structure discovery separate from live collectors | Act1 vs Act2 clarity; testability |
| AD-09 | No cloud dependency in core boot | H4 |
| AD-10 | Preserve replay append seam | Version 2 without rewrite |

---

## Quality Attributes

| Attribute | Architectural approach |
|---|---|
| **Installability** | Auto-discovery, defaults, shipped assets |
| **Honesty** | No synthetic generators on live path |
| **Observability of Pulse itself** | Diagnostics command, structured logs |
| **Performance isolation** | Sampling, disable flags, observational failure isolation |
| **Security** | Env matrix, auth gates non-local, redaction |
| **Extensibility** | Contracts for collectors early in design |
| **Testability** | Pipeline stages unit-testable with fake clocks/buses |
| **Evolvability** | Clear packages/namespaces; versioned API schemas |

---

## Trust Boundaries

```text
┌────────────── Host app trust zone ──────────────┐
│  App code + Pulse collectors (highest privilege) │
│  Must not break requests if Pulse fails (R4)     │
└───────────────────────┬──────────────────────────┘
                        │ redacted DTOs only
                        ▼
┌────────────── UI / API trust zone ──────────────┐
│  Browser sees only API output                    │
│  Non-local access gated                          │
└───────────────────────┬──────────────────────────┘
                        │ (later) outbound TLS
                        ▼
┌────────────── Cloud trust zone ─────────────────┐
│  Tenant isolation; never required for local Aha  │
└──────────────────────────────────────────────────┘
```

Plugins (later) sit inside host zone with **declared permissions**—never silent privilege escalation.

---

## MVP vs Later Horizons

| Concern | MVP system scope | Later |
|---|---|---|
| Discovery + city API | Yes | Enrichment scanners |
| Live collectors R/E/Q/J | Yes | Cache, mail, HTTP client, … |
| Polling + broadcast | Yes | |
| Short-lived buffers | Yes | Durable replay store |
| Dashboard UI | Yes | Hosted twin UI |
| Plugin runtime | Design-compatible | Implement + registry |
| Cloud shipper | Seam only | Implement |
| AI | None in path | Optional advisor on read models |

---

## Non-Goals for Architecture

Architecture will **not**:

1. Replace Horizon’s ops surface  
2. Become a distributed tracing vendor (Zipkin/Jaeger competitor) for MVP  
3. Require Kubernetes for developers trying Pulse  
4. Embed an LLM in the observation hot path  
5. Mutate application business outcomes as a default (observe ≠ intercept-break)  

---

## Volume 3 Roadmap

Suggested chapter sequence:

| Ch | Title | Outcome |
|---|---|---|
| 1 | **System Overview** (this doc) | Map + seams |
| 2 | Package & Monorepo Structure | Concrete tree + namespaces |
| 3 | Domain Model & Ubiquitous Language | Entities aligned to city metaphor |
| 4 | Discovery Architecture | Scanners, graph builder |
| 5 | Collector Architecture | Hooks, lifecycle, isolation |
| 6 | Correlation & Causality | Confidence model |
| 7 | Redaction & Security Architecture | Pipeline, env gates |
| 8 | Transport & Realtime | Broadcast vs poll |
| 9 | Visualization API | Resources, schemas, OpenAPI start |
| 10 | Storage & Replay Seams | MVP buffer + v0.2 store |
| 11 | Dashboard Architecture | UI↔API contracts |
| 12 | Plugin Architecture | Host, manifests |
| 13 | Sequence & Deployment Diagrams | End-to-end scenarios |
| 14 | ADR Log | Decided trade-offs |
| 15 | MVP Architecture Slice | Minimal build plan for Volume 4 |

Chapter count may compress; **MVP Architecture Slice** is the gate to Volume 4 code.

---

## Handoff

### Immediate next

**Chapter 2 — Package & Monorepo Structure:** freeze directories, PSR-4, Composer package names (provisional).

### To Volume 4

No production Pulse collectors ship until:

1. This overview accepted  
2. MVP Architecture Slice written  
3. Core contracts sketched (collectors, transport, API DTOs)  
4. Test strategy for honesty (no fake live path) defined  

### One-sentence freeze

> **Observe → normalize → correlate → redact → stream → render—never invent.**

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Volume** | 3 — Architecture |
| **Previous** | [Volume 2 UX Index](../02-ux/README.md) |
| **Next chapter** | [Chapter 2: Package & Monorepo Structure](./PackageMonorepoStructure.md) |
| **Related** | [PRD](../01-product/PRD.md) · [MVP](../01-product/MVP.md) · [Technical Constraints](../01-product/TechnicalConstraints.md) · [UX Vision](../02-ux/UXVisionPrinciples.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | Subsystem/package boundary changes require ADR; version increment |

---

*Architecture is how Pulse keeps its promise at scale of complexity. This overview is the map; the next chapters draw the streets.*
