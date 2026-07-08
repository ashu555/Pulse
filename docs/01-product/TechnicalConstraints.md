# Technical Constraints

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 19 — Technical Constraints  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Constraints Statement](#constraints-statement)
2. [Purpose of This Chapter](#purpose-of-this-chapter)
3. [Hard Product Constraints](#hard-product-constraints)
4. [Platform and Language Constraints](#platform-and-language-constraints)
5. [Package and Delivery Constraints](#package-and-delivery-constraints)
6. [Runtime and Performance Constraints](#runtime-and-performance-constraints)
7. [Data, Privacy, and Security Constraints](#data-privacy-and-security-constraints)
8. [Realtime and Transport Constraints](#realtime-and-transport-constraints)
9. [Visualization and UX Constraints](#visualization-and-ux-constraints)
10. [Architecture Constraints (Pre-Volume 3)](#architecture-constraints-pre-volume-3)
11. [Compatibility Constraints](#compatibility-constraints)
12. [Testing and Quality Constraints](#testing-and-quality-constraints)
13. [Infrastructure Constraints](#infrastructure-constraints)
14. [AI Constraints](#ai-constraints)
15. [SaaS and Multi-Tenant Constraints (Later)](#saas-and-multi-tenant-constraints-later)
16. [Explicit Non-Constraints](#explicit-non-constraints)
17. [Constraint Priority When Conflicts Arise](#constraint-priority-when-conflicts-arise)
18. [Handoff to Architecture](#handoff-to-architecture)

---

## Constraints Statement

**Technical constraints are the non-negotiable boundaries that keep Pulse honest, installable, Laravel-native, and architecturally evolvable—before a single production collector is written.**

They are derived from Vision, Mission, MVP, Version 2, SaaS, Marketplace, and Risks. Architecture (Volume 3) must satisfy them; it may not casually waive them.

---

## Purpose of This Chapter

| This chapter does | This chapter does not |
|---|---|
| Bind engineering choices to product truth | Design full class diagrams |
| Freeze stack baselines and vetoes | Pick every library revision forever |
| Inform Final PRD acceptance boundaries | Replace Volume 3 System Design |

---

## Hard Product Constraints

These are product-technical hybrids—engineering must enforce them.

| ID | Constraint |
|---|---|
| H1 | Never fabricate runtime traffic or structure in real-app mode |
| H2 | Prefer **unknown** over incorrect causality links |
| H3 | Zero-config happy path: no mandatory config publish before Aha |
| H4 | No mandatory cloud account for local visualization |
| H5 | No mandatory AI key for core product use |
| H6 | Package install must not require application code edits |
| H7 | Uninstall must cleanly remove runtime hooks |
| H8 | Core Aha capabilities remain open source |
| H9 | Complement Telescope/Horizon—do not require uninstalling them |
| H10 | First-session Time-to-Aha targets remain binding (≤5 min median goal) |

Violation of H1–H5 is treated as a release blocker.

---

## Platform and Language Constraints

### MVP / v1 baseline

| Layer | Constraint | Notes |
|---|---|---|
| Language | **PHP 8.4+** | Align with modern Laravel direction in PROJECT_SPEC |
| Framework (integration) | **Laravel** first-class | Support matrix published per release; start with current major lines compatible with 8.4 |
| Frontend | **React** + modern JS tooling | Dashboard UI |
| Styling | **Tailwind CSS** | Consistency and speed |
| Motion | **Framer Motion** (or equivalent) allowed | Must honor reduced-motion |
| Graph/canvas | **React Flow** (or equivalent) allowed | City graph substrate candidate |
| Data fetching | **React Query** (or equivalent) allowed | Server state |
| API | **REST + OpenAPI** | API-first client UI |
| Realtime | **Laravel Reverb** preferred when present | Not hard-required |
| Cache/queue/backoff | **Redis** recommended | Not hard-required for all features |
| DB | **MySQL** primary in reference stacks | Abstract storage; SQLite may be ok for limited local modes if tested |

### Note on PROJECT_SPEC Laravel version label

PROJECT_SPEC mentions Laravel 12; the skeleton in-repo may track newer Laravel majors over time. **Constraint:** maintain an explicit compatibility matrix—do not silently assume a single version forever.

### Framework-agnostic core (direction)

Core visualization/storage/correlation types should not forever embed `Illuminate\*` in every layer—so future adapters remain possible. Laravel integration remains the only v1 adapter.

---

## Package and Delivery Constraints

| ID | Constraint |
|---|---|
| P1 | Distributed as Composer package(s) with auto-discovery |
| P2 | Dashboard assets **shipped with package** (no consumer Vite requirement for Pulse UI) |
| P3 | Routes/API namespaced under Pulse prefix |
| P4 | Optional config via `vendor:publish` only—never mandatory for Aha |
| P5 | `pulse:check` (or equivalent) diagnostics command required for MVP |
| P6 | Docker Compose path exists for Pulse development/verification |
| P7 | Monorepo package extraction (`pulse-core`, `pulse-laravel`, …) must remain possible; avoid dead-end coupling |

---

## Runtime and Performance Constraints

| ID | Constraint |
|---|---|
| R1 | Observation overhead must be documented with published guidance |
| R2 | Collectors individually disableable |
| R3 | Sampling mode required before heavy-traffic claims |
| R4 | Pulse failure must not break host application request success by default (observational posture) |
| R5 | Discovery for typical mid-size apps targets **< 60 seconds** |
| R6 | Realtime visualization latency target **< 1s** on websocket path; polling must remain usable |
| R7 | History/replay mode (Version 2) must support finite retention + purge + disable without breaking live mode |

### Performance honesty rule

If we cannot measure overhead, we do not market “negligible.”

---

## Data, Privacy, and Security Constraints

| ID | Constraint |
|---|---|
| S1 | Redaction on by default for sensitive fields |
| S2 | Raw secrets must not appear in default inspectors |
| S3 | Local enabled by default; non-local requires explicit policy/auth |
| S4 | Production exposure must not be silent-on-install |
| S5 | No default silent telemetry phone-home from OSS core |
| S6 | Cloud shipping (later) is outbound-first and pauseable |
| S7 | Security policy (`SECURITY.md`) required before public v0.1 marketing push |
| S8 | Plugin permissions manifest required before marketplace Verified tier |

---

## Realtime and Transport Constraints

| ID | Constraint |
|---|---|
| T1 | Transport abstraction: broadcast **or** polling |
| T2 | UI must indicate degraded live mode honestly |
| T3 | Correlation IDs stable across request/event/job pipeline |
| T4 | Live stream schema versioned for forward compatibility |

Reverb is preferred, never a hard gate for MVP install success.

---

## Visualization and UX Constraints

| ID | Constraint |
|---|---|
| V1 | Same metaphor language in OSS and hosted UI |
| V2 | Motion encodes real causality—not decoration alone |
| V3 | Reduced-motion mode preserves information without animation-only meaning |
| V4 | Primary inspection via in-context panel/drawer in first session |
| V5 | Large graphs must cluster; unreadability is a defect |
| V6 | Keyboard access for primary flows |
| V7 | Dark mode in MVP quality bar |
| V8 | Tutorial/demo modes explicitly labeled; never mixed silently into real mode |

---

## Architecture Constraints (Pre-Volume 3)

These bind upcoming system design:

| ID | Constraint |
|---|---|
| A1 | **Package-first**, then dashboard as client |
| A2 | **API-first** — UI not source of truth |
| A3 | **Plugin-first** evolution — collectors behind contracts |
| A4 | Event-driven internal pipeline (collect → bus → store/stream → API → UI) |
| A5 | SOLID boundaries between discovery, collection, storage, replay, visualization |
| A6 | DDD/CQRS where beneficial—especially live write vs replay/read paths |
| A7 | Feature flags for collectors |
| A8 | Design replay store so MVP APIs need not be thrown away |
| A9 | Docs/spec before irreversible public contract freezes |

### Suggested package seams (not yet finalized structure)

```text
pulse-core          # domain types, contracts, correlation
pulse-laravel       # Integrate + default collectors + provider
pulse-ui / dashboard
pulse-plugin-api
(later) pulse-replayer, pulse-ai, adapters
```

Volume 3 may rename boundaries; it may not erase seams entirely.

---

## Compatibility Constraints

| ID | Constraint |
|---|---|
| C1 | Coexist with Telescope installed |
| C2 | Coexist with Horizon installed |
| C3 | Support Sail / Docker common setups in docs |
| C4 | Do not require specific app architecture (DDD/actions/etc.) beyond normal Laravel apps |
| C5 | Graceful behavior when queues/events unused |
| C6 | Explicit unsupported environments listed (not discovered by user grief) |

---

## Testing and Quality Constraints

| ID | Constraint |
|---|---|
| Q1 | Tests accompany collectors/API behavior from early implementation |
| Q2 | CI on supported PHP/Laravel matrix |
| Q3 | Static analysis at a published strictness level |
| Q4 | Smoke: install → provider → discovery readiness |
| Q5 | Regression tests against fake-data leakage |
| Q6 | Redaction tests for inspector serialization |
| Q7 | Contract tests for plugin API once published |

---

## Infrastructure Constraints

For Pulse development and reference deployments:

| ID | Constraint |
|---|---|
| I1 | Docker Compose supported for local verification |
| I2 | Secrets never committed |
| I3 | Environments reproducible from docs |
| I4 | SaaS later: tenant isolation tested as first-class |

Cloud vendor lock-in avoided in early design (portable object storage/SQL where practical).

---

## AI Constraints

| ID | Constraint |
|---|---|
| AI1 | Optional forever |
| AI2 | Must cite observed/recorded evidence |
| AI3 | Cannot invent traffic/structure |
| AI4 | Product valuable with AI disabled |
| AI5 | No AI gate on install or first session |
| AI6 | Local LLM path eventual option for privacy-sensitive users |

---

## SaaS and Multi-Tenant Constraints (Later)

When Chapter 12 ships:

| ID | Constraint |
|---|---|
| CL1 | Outbound connector preferred over inbound exposure |
| CL2 | Redaction before leave-app defaults |
| CL3 | Tenant isolation hard-enforced |
| CL4 | Retention finite and user-visible |
| CL5 | Pause shipping without package uninstall |
| CL6 | OSS local mode remains functional if cloud is down |

---

## Explicit Non-Constraints

Things we are *not* constraining ourselves into prematurely:

- Supporting every PHP framework in v1
- Supporting every queue driver equally on day one (document gaps)
- Pixel-perfect mobile-first city manipulation on day one (responsive yes; desktop-class primary)
- Edge runtime embedding
- Replacing users’ APM vendors
- Multi-region active-active on SaaS day one

---

## Constraint Priority When Conflicts Arise

If two constraints conflict, resolve in this order:

1. **Honesty / safety** (H1, H2, S1–S4)
2. **Install / Aha reachability** (H3–H6, H10, T1–T2)
3. **OSS openness** (H8, H4)
4. **Performance honesty** (R1–R3)
5. **Elegance / preferred stack choices**

Example: prettier websocket-only UX loses to polling fallback (T1) when it blocks Aha.

---

## Handoff to Architecture

Volume 3 must produce designs that satisfy this chapter, especially:

1. Collector pipeline + correlation model
2. Transport abstraction
3. Redaction pipeline
4. Storage for live vs replay
5. Plugin capability/permission manifests
6. Package boundaries and versioning

### One-sentence freeze

> **Architecture is free to innovate inside the fence—not free to move the fence.**

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 18: Competitive Analysis](./CompetitiveAnalysis.md) |
| **Next chapter** | [Chapter 20: Final PRD](./PRD.md) |
| **Related documents** | [Vision](./Vision.md) · [Mission](./Mission.md) · [MVP](./MVP.md) · [Version 2](./Version2.md) · [Risks](./Risks.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | Waiving a hard constraint requires written ADR + Mission review; version increment |

---

*Constraints are how Pulse stays itself while it grows. Without them, every path looks like progress.*
