# MVP

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 10 — MVP  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [MVP Statement](#mvp-statement)
2. [Thesis and Proof](#thesis-and-proof)
3. [Selection Method](#selection-method)
4. [Aha Veto Rule](#aha-veto-rule)
5. [In Scope — Committed Features](#in-scope--committed-features)
6. [Feature Acceptance Criteria](#feature-acceptance-criteria)
7. [Persona and Journey Coverage](#persona-and-journey-coverage)
8. [Out of Scope](#out-of-scope)
9. [Decisions on Open Questions](#decisions-on-open-questions)
10. [Non-Functional Requirements](#non-functional-requirements)
11. [Technical Shape (Product-Level)](#technical-shape-product-level)
12. [Definition of Done](#definition-of-done)
13. [Success Metrics](#success-metrics)
14. [Release Naming](#release-naming)
15. [Risks Specific to MVP](#risks-specific-to-mvp)
16. [Handoff to Later Chapters](#handoff-to-later-chapters)

---

## MVP Statement

**Pulse MVP is the smallest product that makes a Laravel developer install a package, watch their real application become a city, observe a real request move through it, inspect one concrete detail, and say: “I’ve never seen Laravel visualized like this.”**

Anything that does not serve that sentence is deferred.

MVP is not “Phase 1 of a giant platform.”  
MVP is a **complete proof** of the category Pulse invents.

---

## Thesis and Proof

### Product thesis

Developers understand software faster by **watching real behavior** than by reconstructing it from logs and dashboards.

### MVP proof obligations

Pulse MVP must prove all four:

| Proof | Observable outcome |
|---|---|
| **Install proof** | Zero-config package install reaches a working dashboard |
| **Structure proof** | Auto-discovery builds a recognizable city from the real app |
| **Motion proof** | A real request/event/job path is visible as it happens |
| **Understanding proof** | Inspection answers a developer question without leaving Pulse |

If any proof fails, MVP has failed—even if the repository looks impressive.

---

## Selection Method

Features were selected from [Chapter 9: Feature Brainstorm](./FeatureBrainstorm.md) using:

1. **H0 (Aha-critical)** — include unless impossible
2. **Necessary H1** — include only if required for trust, clarity, or first-session usability
3. **P1/P2 persona jobs** — Maya, Aarav, Neha, Isha/Rohan coverage without boiling the ocean
4. **Journey stages 3–5** — Install, First Session, First Real Job
5. **Veto** — anything that delays or fakes Aha is cut

Primary cluster adopted:

> **Aha Core + Trust & Safety thin slice + essential polish**

---

## Aha Veto Rule

This rule is binding for MVP scope changes.

> **No feature may enter MVP if it delays, dilutes, fakes, or gates the first-session double Aha.**

Examples that auto-fail the veto:

- mandatory AI key before discovery
- mandatory config publish before city
- fake traffic to make the city look busy
- forced multi-step tour before canvas use
- production alerting work that crowds out live visualization

Any proposed MVP addition must pass the veto in writing.

---

## In Scope — Committed Features

### Summary table

| ID | Feature | Horizon origin | Priority |
|---|---|---|---|
| M01 | Laravel package install (auto-discovery) | I1 | P0 |
| M02 | Structural auto-discovery (routes, controllers, events/listeners, jobs/queues) | A1–A4 | P0 |
| M03 | Middleware chain discovery per route | A5 | P0 |
| M04 | Living city visualization | B1 | P0 |
| M05 | Live request visualization | B2 | P0 |
| M06 | Live event visualization | B3 | P0 |
| M07 | Live queue/job visualization | B4 | P0 |
| M08 | Distinct failure states | B8 | P0 |
| M09 | Realtime transport with polling fallback | B13 | P0 |
| M10 | Request timeline inspection | C1 | P0 |
| M11 | Event inspection (redacted) | C2 | P0 |
| M12 | Job inspection | C3 | P0 |
| M13 | Request → event → job causality links | C6 | P0 |
| M14 | Middleware + controller/action inspection | C4, C5 | P0 |
| M15 | Focus mode for one request path | B6 | P1 |
| M16 | Optional follow-camera for active request | B5 | P1 |
| M17 | Default redaction + safe payload previews | C11 (thin) | P0 |
| M18 | Env enablement matrix + non-local access protection | I3, I4 | P0 |
| M19 | `pulse:check` diagnostics | I2 | P1 |
| M20 | Honest quiet/empty/degraded states | Ch 8 | P0 |
| M21 | React dashboard (package-owned UI) | Vision | P0 |
| M22 | Dark mode | J1 | P1 |
| M23 | Keyboard basics + reduced-motion support | J2, J3 | P1 |
| M24 | Metaphor legend / glossary peek | J6 | P1 |
| M25 | Step timing on request timeline | E1 | P1 |
| M26 | Soft re-discovery trigger | A15 (thin) | P1 |
| M27 | Docker-based local verification path for Pulse itself | I6 | P1 |
| M28 | OSS-facing install + first-run docs quality | K1, K2 (thin) | P1 |

P0 = must ship for MVP release.  
P1 = must ship unless blocked by hard dependency; cannot displace P0.

---

## Feature Acceptance Criteria

### M01 — Laravel package install

**Acceptance:**

- Installable via Composer on supported Laravel versions
- Service provider auto-discovered
- No mandatory application code edits
- Dashboard reachable after install on local env
- Documented uninstall via Composer remove

### M02 / M03 — Auto-discovery

**Acceptance:**

- Discovers routes, controllers/actions, events, listeners (when available), jobs, queues
- Discovers middleware chains for discovered routes
- Completes for a standard mid-size app in under 60 seconds under normal local conditions
- Shows honest “none found” states
- Discovery results are visible as city structure

### M04 — Living city

**Acceptance:**

- Renders buildings/roads/stations mapped from discovery
- Pan/zoom usable without a forced tutorial
- Layout remains readable for typical app sizes via grouping/clustering when needed
- No fake nodes invented for aesthetics

### M05–M08 — Live runtime visualization

**Acceptance:**

- Live request appears and traverses a coherent path
- Events appear as messengers linked to origin when known
- Jobs appear as queue traffic with success/fail/retry-visible basics (fail must be distinct)
- Real traffic only; never simulated pedestrians in real-app mode

### M09 — Realtime transport

**Acceptance:**

- Prefer websocket/realtime when available (e.g. Reverb)
- Automatically fall back to polling when realtime is unavailable
- UI clearly indicates degraded live mode without alarming falsely
- Target latency: < 1s preferred; polling mode remains usable for first session

### M10–M14 — Inspection + causality

**Acceptance:**

- Clicking request/event/job/building/road opens detail without leaving city context
- Request panel includes ordered timeline of steps
- Event panel shows name, timing, listener list, redacted payload preview
- Job panel shows class, queue, status, timing, parent request if correlated
- Causality links allow moving across request → events → jobs

### M15–M16 — Attention aids

**Acceptance:**

- Focus mode isolates one request path
- Follow-camera is optional and cancellable
- Neither blocks first interaction with the canvas

### M17–M18 — Trust & safety thin slice

**Acceptance:**

- Sensitive payload fields redacted by default
- Local env enabled by default
- Non-local access protected by default (auth gate / explicit enable policy)
- Production not silently exposed on install

### M19 — Diagnostics

**Acceptance:**

- `php artisan pulse:check` reports provider, routes, collectors, env policy, and transport mode
- Failures are actionable

### M20 — Quiet / degraded states

**Acceptance:**

- Quiet city explains honesty + suggests triggering a request
- Partial collector failure shows what still works
- Missing queue worker explained when jobs cannot process

### M21–M24 — Dashboard experience bar

**Acceptance:**

- Dashboard shipped with package-owned UI assets (no consumer Vite requirement)
- Dark mode available
- Essential keyboard navigation exists
- Reduced-motion mode preserves information without relying on animation alone
- Legend explains metaphor lightly

### M25 — Step timing

**Acceptance:**

- Request timeline shows durations for major steps when measured
- Timing is informational for comprehension, not an APM product surface

### M26 — Re-discovery (thin)

**Acceptance:**

- User can re-run discovery manually
- City updates from new structural scan without reinstall

### M27–M28 — Delivery quality

**Acceptance:**

- Pulse development/verification can run via Docker Compose documentation path
- README install and first-run path match this MVP contract

---

## Persona and Journey Coverage

| Persona | MVP job served | Primary features |
|---|---|---|
| **Maya** | Debug one complex path visually | M05–M14, M15, M25 |
| **Aarav** | Trust structural + runtime visibility | M02–M04, M13, M19 |
| **Neha** | Validate that a flow behaves as claimed | M04, M13, M14, M26 |
| **Isha** | Build first mental model quickly | M02, M04, M20, M24 |
| **Rohan** | See onboarding / sharing potential | M04, M15, screenshare-friendly UI |

| Journey stage | MVP obligation |
|---|---|
| Installation | M01, M18, M19 |
| First session (double Aha) | M02–M14, M20 |
| First real job | M10–M16, M25 |
| Habit / share / advocacy | Not required to be productized beyond quality UX |

---

## Out of Scope

These are deferred by commitment, not by accident.

### Deferred to post-MVP (near-term candidates)

| Item | Why deferred |
|---|---|
| Historical replay / scrubber | Needs durable storage architecture |
| Recent session recording vault | Same |
| Architecture export / shareable links | Needs stable graph + sharing model |
| AI explanations | Visualization must be trusted first |
| Collector plugin API / marketplace | Needs stable contracts |
| Bottleneck detection productization | Needs baselines; keep only step timing in MVP |
| Notifications / cache / scheduler districts | Enrichment after core path is excellent |
| Jump-to-source IDE deep links | Nice-to-have after inspection reliability |
| Onboarding playlists | After Aha retention is proven |

### Deferred to later horizons

| Item | Horizon |
|---|---|
| Multi-framework adapters | H4 |
| Hosted SaaS / billing / RBAC / org dashboards | H4 |
| Enterprise audit controls | H4 |
| Multi-app monorepo control plane | H4 |

### Permanently rejected in MVP (and general product identity)

| Item | Why |
|---|---|
| Alerting / paging / SLO suites | Monitoring non-goal |
| Log aggregation/search product | Logging non-goal |
| Fake traffic in real app views | Honesty non-negotiable |
| AI-required setup | AI philosophy |
| Telescope/Horizon replacement scope | Complement, never replace |

---

## Decisions on Open Questions

From Chapter 9 open questions, MVP decides:

| Question | MVP decision |
|---|---|
| Smallest set for double Aha? | M01–M14 + M17–M18 + M20–M21 |
| Mandatory collectors? | Requests, routes/middleware, events/listeners, jobs/queues |
| Reverb required? | **No.** Realtime preferred; polling fallback required |
| Payload detail default? | Redacted previews on; raw secrets off by default |
| Large app strategy? | Auto-cluster / group; prefer readability over showing every node |
| Defer first among replay/AI/plugins/sharing? | All deferred; **replay** is first major post-MVP epic |
| Polish bar? | Dark mode, keyboard basics, reduced motion, legend are MVP quality bar |

---

## Non-Functional Requirements

| Area | MVP requirement |
|---|---|
| **Accuracy** | Prefer showing “unknown” over incorrect causality |
| **Performance overhead** | Document expected overhead; provide disable/sampling escape hatch in config (optional publish) |
| **Security** | Local-first; non-local protected; redaction defaults |
| **Reliability** | Dashboard must fail loudly with actionable errors, not blank states |
| **Accessibility** | Keyboard reachability for primary flows; reduced-motion support |
| **Compatibility** | Coexist with Telescope and Horizon |
| **Documentation** | Install + first-run docs match actual product behavior |
| **Testing** | Smoke coverage for install discovery readiness and core API/canvas data paths |

Exact engineering architecture remains Volume 3+ concern; these are product NFRs MVP must honor.

---

## Technical Shape (Product-Level)

This is product shape, not full system design.

```text
composer require <pulse-laravel>
        ↓
PulseServiceProvider (auto-discovered)
        ↓
Collectors (request, route/middleware, event, queue/job)
        ↓
Realtime bus (broadcast or polling fallback)
        ↓
Visualization API
        ↓
React city dashboard (package-owned assets)
```

### Delivery constraints

- Package-first
- API-first enough that UI is a client, not the source of truth
- No consumer app rewrite
- No mandatory cloud dependency

Full monorepo/package decomposition is deferred to architecture chapters, but MVP must not invent a dead-end module that blocks later `pulse-core` / plugin extraction.

---

## Definition of Done

MVP is done only when all are true:

### Product DoD

1. Double Aha works on at least two real Laravel sample apps (simple + moderately complex)
2. All P0 acceptance criteria pass
3. Out-of-scope list remains unviolated
4. Quiet/degraded modes are intentional and tested
5. Docs: install → first-run path verified by a cold-start developer

### Experience DoD

1. Install → city visible ≤ 60 seconds target on supported local setup
2. First meaningful inspection possible in first session without docs deep-dive
3. At least one internal dogfood debugging session uses Pulse instead of tool-hopping

### Quality DoD

1. No known fake-data paths
2. No known default secret leakage in inspectors
3. Non-local dashboard exposure defaults are safe
4. Baseline automated tests for discovery + trace ingestion critical paths

---

## Success Metrics

### Launch gates (must track)

| Metric | Target |
|---|---|
| Install → city visible | < 60 seconds |
| Request execution → visible animation | < 5 seconds (realtime path); still usable under polling |
| Realtime latency (when websocket available) | < 1 second preferred |
| Zero-config install success (supported apps) | > 95% |
| First-session inspection rate | > 60% of sessions that open dashboard |

### Qualitative gate

Top reaction in interviews/beta:

> “I’ve never seen Laravel visualized like this.”

### Non-vanity note

GitHub stars are a trailing indicator, not MVP DoD. Early stars without double Aha reliability create false progress.

---

## Release Naming

| Candidate name | Meaning |
|---|---|
| **v0.1.0** | First public MVP preview proving double Aha |
| **v0.2.0** | First major post-MVP: replay/history foundations |
| **v1.0.0** | Production-ready OSS statement after hardening + ecosystem readiness |

MVP chapter commits the **v0.1 content bar**, not the final marketing version string.

Working package name remains provisional until branding decision.

---

## Risks Specific to MVP

| Risk | Impact | Mitigation |
|---|---|---|
| City layout unreadable on large apps | Aha fails | Aggressive clustering; focus mode |
| Causality correlation incomplete | Trust dies | Show unknown; don’t invent links |
| Over-indexing on animation | Demo without utility | Inspection P0 gate |
| Scope creep via “just one more collector” | Delays proof | Aha veto |
| Realtime dependency anxiety | Setup friction | Polling fallback first-class |
| Overhead fear | Uninstall | Publish guidance + disable switches |
| Naming collisions with Laravel Pulse (official) | Brand/market confusion | Prioritize rename before broad public launch |

The naming collision risk is acknowledged as strategic and should be resolved at product/branding level before major OSS push.

---

## Handoff to Later Chapters

### Immediate next (Volume 1)

- **Chapter 11: Version 2** — first expansion beyond MVP (starting with replay/history)
- Later chapters: SaaS, plugins, OSS strategy, metrics, risks, business model, competitors, constraints, final PRD

### Architecture implication

Volume 3 must design for:

1. Collectors as replaceable modules
2. Correlation IDs across request/event/job
3. Transport abstraction (broadcast vs poll)
4. Redaction pipeline
5. Future replay store without rewriting MVP APIs wholesale

### One-sentence freeze

Until MVP DoD is met, the team optimizes for **proof**, not platform completeness.

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 9: Feature Brainstorm](./FeatureBrainstorm.md) |
| **Next chapter** | [Chapter 11: Version 2](./Version2.md) |
| **Related documents** | [Vision](./Vision.md) · [Mission](./Mission.md) · [Problem Statement](./ProblemStatement.md) · [Target Audience](./TargetAudience.md) · [Personas](./Personas.md) · [User Journey](./UserJourney.md) · [Installation Journey](./InstallationJourney.md) · [First-Time Experience](./FirstTimeExperience.md) · [Feature Brainstorm](./FeatureBrainstorm.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | Scope changes require Aha veto review + version increment |

---

*MVP is a promise with a boundary. We ship the smallest true Pulse—and we refuse every attractive distraction that cannot prove the thesis.*
