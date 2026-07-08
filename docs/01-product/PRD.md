# Final PRD

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 20 — Final Product Requirements Document  
**Version:** 1.0  
**Status:** Approved for planning — Volume 1 complete  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. Rename is a pre-launch gate due to collision risk with official Laravel Pulse (metrics).

---

## Table of Contents

1. [PRD Purpose](#prd-purpose)
2. [Executive Summary](#executive-summary)
3. [Problem](#problem)
4. [Goals and Non-Goals](#goals-and-non-goals)
5. [Users and Personas](#users-and-personas)
6. [Product Principles](#product-principles)
7. [Solution Overview](#solution-overview)
8. [User Journeys (Summary)](#user-journeys-summary)
9. [MVP Requirements](#mvp-requirements)
10. [Version 2 Requirements (Post-MVP)](#version-2-requirements-post-mvp)
11. [SaaS Requirements (Later Horizon)](#saas-requirements-later-horizon)
12. [Plugin Marketplace Requirements (Later Horizon)](#plugin-marketplace-requirements-later-horizon)
13. [Cross-Cutting Requirements](#cross-cutting-requirements)
14. [Technical Constraints Summary](#technical-constraints-summary)
15. [Analytics and Success Metrics](#analytics-and-success-metrics)
16. [Risks and Mitigations](#risks-and-mitigations)
17. [Open Source and Business Constraints](#open-source-and-business-constraints)
18. [Competitive Positioning](#competitive-positioning)
19. [Release Plan](#release-plan)
20. [Acceptance and Definition of Done](#acceptance-and-definition-of-done)
21. [Out of Scope (Frozen)](#out-of-scope-frozen)
22. [Document Map (Volume 1 Index)](#document-map-volume-1-index)
23. [Authority and Change Control](#authority-and-change-control)
24. [Handoff to Volume 2+](#handoff-to-volume-2)

---

## PRD Purpose

This Final PRD consolidates Volume 1 (Chapters 1–19) into a single product authority document.

| Role of this PRD | |
|---|---|
| **Canonical** | Conflicts with older one-off notes defer to this PRD + linked chapter |
| **Scoped** | Distinguishes MVP vs Version 2 vs SaaS vs Marketplace |
| **Binding** | Engineering, UX, and GTM must satisfy MVP section before later horizons |

Detailed narrative remains in chapter files; this PRD is the executable summary.

---

## Executive Summary

**Pulse** is an open-source developer experience platform that transforms a running Laravel application into a **living, interactive digital twin**—a city whose roads, buildings, messengers, and trains represent real routes, components, events, and jobs.

Developers install a Composer package, watch Pulse discover their application, see the city build itself, observe real requests move through the system, and inspect causality—without mandatory configuration, cloud accounts, or AI keys.

Pulse complements Telescope, Horizon, and APM tools. It does not replace them.

**MVP thesis proof:** install → city → live path → inspection (“double Aha”) in minutes.

---

## Problem

Laravel developers cannot *see* runtime behavior as a connected system. They reconstruct narratives from logs, Telescope tables, Horizon screens, diagrams, and senior engineers’ memory.

**Unanswered question:**

> What is happening in my application right now—and how does everything connect?

Full analysis: [Problem Statement](./ProblemStatement.md).

---

## Goals and Non-Goals

### Goals

1. Make real Laravel runtime behavior visible, spatial, and inspectable
2. Deliver double Aha in the first session without config walls
3. Remain package-first, observational, and uninstall-clean
4. Establish category leadership for runtime comprehension (not APM)
5. Grow via OSS; optionally monetize team/cloud convenience later without enclosure

### Non-Goals (permanent)

- Monitoring/alerting/SLO product
- Log aggregation/search product
- Telescope/Horizon/Datadog clone war
- Fake traffic in real-app mode
- Mandatory app rewrites
- AI as the product or install gate
- CRUD admin dashboard identity

Sources: [Vision](./Vision.md), [Mission](./Mission.md).

---

## Users and Personas

### P1 (drive MVP)

| Persona | Job |
|---|---|
| Aarav — Senior Laravel Developer | See and verify complex paths fast |
| Maya — Backend Engineer | Debug request/event/job cascades |
| Neha — Software Architect | Validate runtime vs intended design |

### P2

| Persona | Job |
|---|---|
| Rohan — EM / Tech Lead | Onboarding & shared understanding |
| Isha — New team member | Mental model in days, not weeks |

### Secondary / later

Learners, OSS contributors, DevOps collaborators, SaaS org admins.

Details: [Target Audience](./TargetAudience.md), [Personas](./Personas.md).

---

## Product Principles

1. Visualize reality — never fake data  
2. Beauty improves understanding  
3. Reduce cognitive load — progressive disclosure  
4. Zero-config value before power-user config  
5. Delight with discipline  
6. Documentation before irreversible contracts  
7. AI assists, never leads  
8. Open by default; no bait-and-switch  

---

## Solution Overview

### Metaphor (MVP-reduced)

| Reality | City |
|---|---|
| Auth/HTTP entry | Gate |
| Routes | Roads |
| Controllers/areas | Buildings |
| Events | Messengers |
| Queues | Stations |
| Jobs | Trains |

### System shape (product-level)

```text
Composer package (pulse-laravel + core)
  → auto-discovery + collectors
    → realtime bus (broadcast or poll)
      → visualization API
        → React city dashboard (package assets)
```

---

## User Journeys (Summary)

| Stage | Requirement |
|---|---|
| Install | `< 5 min` to dashboard on supported local apps |
| First session | Discovery + city ≤ 60s; live path + inspection in ≤ 5 min median |
| First real job | Answer one debug/onboard/validate question in-session |
| Habit / share | Quality UX; productized share deferred |

Details: [User Journey](./UserJourney.md), [Installation Journey](./InstallationJourney.md), [First-Time Experience](./FirstTimeExperience.md).

### Aha Veto (binding)

No feature may delay, dilute, fake, or gate first-session double Aha.

---

## MVP Requirements

MVP feature IDs from [MVP](./MVP.md) (M01–M28) are authoritative. Summary:

### Must (P0)

- Composer auto-discovered package
- Discover routes, controllers, middleware chains, events/listeners, jobs/queues
- Living city from real discovery
- Live request, event, job visualization with distinct failures
- Realtime with **polling fallback**
- Inspectors + request→event→job causality
- Default redaction; env enablement; non-local protection
- Honest quiet/degraded states
- Package-owned React dashboard

### Should (P1)

- Focus mode + optional follow-camera
- `pulse:check`
- Dark mode, keyboard basics, reduced motion, legend
- Step timing on timeline
- Manual re-discovery
- Docker verification path + docs quality

### MVP explicit exclusions

Replay, AI, plugins/marketplace, SaaS/billing, shareable cloud sessions, bottleneck productization, multi-framework, export-as-productized graph packs—per MVP chapter.

---

## Version 2 Requirements (Post-MVP)

Entry only after MVP DoD.

Lead epic: **Replay & history**, then literacy districts, comprehension-first performance highlights, export/snapshots, onboarding playlists, plugin **contracts** (not store), optional AI.

Semver bias: v0.2→v0.5→v1.0.

Guiding freeze: *Memory before marketplace. Evidence before AI. Literacy before platform.*

Details: [Version 2](./Version2.md).

---

## SaaS Requirements (Later Horizon)

Hosted workspaces, environments, outbound connector, hosted city/replay, shared pins/links/playlists, RBAC/SSO, billing.

**Hard rule:** OSS Aha remains complete without cloud.

Details: [SaaS Features](./SaaSFeatures.md), [Business Model](./BusinessModel.md).

---

## Plugin Marketplace Requirements (Later Horizon)

Sequence: contracts → registry → marketplace UX → commerce.

Composer remains install substrate. Verified tier + permissions. No fabricated traffic. Core collectors never paid-only.

Details: [Plugin Marketplace](./PluginMarketplace.md).

---

## Cross-Cutting Requirements

| Area | Requirement |
|---|---|
| Accessibility | Keyboard primary flows; reduced-motion parity |
| Security | Redaction defaults; SECURITY.md before public push |
| Coexistence | Telescope/Horizon safe |
| Docs | Install + first-run match product |
| Open source | MIT; contributing ladder before v0.1 marketing |
| Naming | Resolve collision before broad Packagist campaign |

---

## Technical Constraints Summary

Binding constraints live in [Technical Constraints](./TechnicalConstraints.md).

Highlights:

- PHP 8.4+, Laravel-first integration, React UI
- Package-first, API-first, plugin-evolvable seams
- Never fabricate; prefer unknown causality
- Polling fallback; assets shipped with package
- Telemetry off by default in OSS core
- Constraint priority: honesty/safety → Aha reachability → OSS → performance honesty → elegance

---

## Analytics and Success Metrics

North star: **Time-to-double-Aha ≤ 5 minutes** median.

MVP gates: install→city <60s; animation promptness; zero-config >95%; inspection rate >60%; zero fake-data paths.

Stars are trailing, not DoD.

Details: [Success Metrics](./SuccessMetrics.md).

---

## Risks and Mitigations

Top S1 risks: category misfile, naming collision, fake data, Aha failure, bad causality, secret leakage, APM drift, bait-and-switch optics, malicious plugins.

Details: [Risks](./Risks.md).

---

## Open Source and Business Constraints

| OSS | Business |
|---|---|
| MIT core | Monetize multiplayer/governance/retention |
| Premium GitHub presence | Not local Aha |
| No enclosure of collectors | Team → Scale → Enterprise ladder |
| Public roadmap themes | Product-led then enterprise |

Details: [Open Source Strategy](./OpenSourceStrategy.md), [Business Model](./BusinessModel.md).

---

## Competitive Positioning

Pulse owns **spatial realtime comprehension**. Coexist with Telescope (microscope), Horizon (queue ops), APM (health/alerts).

Disambiguate from official Laravel Pulse (metrics).

Details: [Competitive Analysis](./CompetitiveAnalysis.md).

**Coexistence line (canonical):**

> Use Pulse to see the story. Use Telescope for deep lists. Use Horizon to operate queues. Use APM for production health and alerts.

---

## Release Plan

| Release | Intent |
|---|---|
| **v0.1.x** | MVP double Aha |
| **v0.2.x** | Replay foundations |
| **v0.3.x** | Literacy + comprehension-first performance |
| **v0.4.x** | Export + extensibility contracts |
| **v0.5.x** | Playlists + optional AI |
| **v1.0.0** | Production-ready OSS declaration |
| **SaaS beta/GA** | After v1 credibility + Version 2 trust |
| **Marketplace GA** | After stable contracts + registry |

---

## Acceptance and Definition of Done

### MVP DoD (ship gate)

From [MVP](./MVP.md):

1. Double Aha on ≥2 representative Laravel apps  
2. All P0 acceptance criteria pass  
3. Out-of-scope respected  
4. Quiet/degraded intentional  
5. Cold-start docs verified  
6. No fake-data paths; no default secret leakage; safe non-local defaults  
7. Baseline automated tests for discovery + ingestion paths  

### Volume 1 planning DoD

This PRD + Chapters 1–19 approved → Volume 1 complete.

---

## Out of Scope (Frozen)

### Not in MVP

Historical scrubbing as GA, AI explanations, marketplace, SaaS, multi-framework, alerting, log search, paid core collectors, cloud-required local mode.

### Never (category)

Fake real-mode traffic; bait-and-switch enclosure; APM identity pivot.

---

## Document Map (Volume 1 Index)

| Ch | Document |
|---|---|
| 1 | [Vision](./Vision.md) |
| 2 | [Mission](./Mission.md) |
| 3 | [Problem Statement](./ProblemStatement.md) |
| 4 | [Target Audience](./TargetAudience.md) |
| 5 | [Personas](./Personas.md) |
| 6 | [User Journey](./UserJourney.md) |
| 7 | [Installation Journey](./InstallationJourney.md) |
| 8 | [First-Time Experience](./FirstTimeExperience.md) |
| 9 | [Feature Brainstorm](./FeatureBrainstorm.md) |
| 10 | [MVP](./MVP.md) |
| 11 | [Version 2](./Version2.md) |
| 12 | [SaaS Features](./SaaSFeatures.md) |
| 13 | [Plugin Marketplace](./PluginMarketplace.md) |
| 14 | [Open Source Strategy](./OpenSourceStrategy.md) |
| 15 | [Success Metrics](./SuccessMetrics.md) |
| 16 | [Risks](./Risks.md) |
| 17 | [Business Model](./BusinessModel.md) |
| 18 | [Competitive Analysis](./CompetitiveAnalysis.md) |
| 19 | [Technical Constraints](./TechnicalConstraints.md) |
| 20 | **Final PRD (this document)** |

Upstream input: [PROJECT_SPEC.md](../../PROJECT_SPEC.md).

---

## Authority and Change Control

| Change type | Required |
|---|---|
| MVP scope add | Aha veto review + update MVP.md + this PRD |
| Non-goal waiver | Mission review (expected: reject) |
| Monetizing OSS Aha | Forbidden without Mission rewrite (expected: never) |
| Hard technical constraint waiver | ADR + Mission/engineering review |
| Rename product | Brand decision + global doc update |

Version increment this PRD on material changes.

---

## Handoff to Volume 2+

Volume 1 answers **what & why**.  
Next volumes answer **how it feels, how it’s built, how it’s implemented**.

| Next | Focus |
|---|---|
| **Volume 2 — UX** | City design system, motion, screens, interaction specs |
| **Volume 3 — Architecture** | Packages, pipelines, contracts, storage, security design |
| **Volume 4+** | Laravel implementation, data, React, DevOps, AI, OSS runbooks, testing, SaaS build |

### Build authority sentence

> Until MVP Definition of Done is met, the organization optimizes for **proof of double Aha**—not platform completeness.

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 19: Technical Constraints](./TechnicalConstraints.md) |
| **Next** | Volume 2 — UX (chapter structure TBD in UX index) |
| **Related documents** | Entire `docs/01-product/` set · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | PRD edits require review; MVP-affecting changes require Aha veto pass |

---

*This PRD ends Volume 1. From here forward, Pulse is no longer an idea looking for shape—it is a shaped product waiting for disciplined design and engineering.*
