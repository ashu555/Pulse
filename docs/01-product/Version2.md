# Version 2

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 11 — Version 2  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Version 2 Statement](#version-2-statement)
2. [Relationship to MVP](#relationship-to-mvp)
3. [Version Naming Clarification](#version-naming-clarification)
4. [Version 2 Thesis](#version-2-thesis)
5. [Entry Gate](#entry-gate)
6. [North-Star Outcomes](#north-star-outcomes)
7. [Epic Map](#epic-map)
8. [Epic 1 — Replay and History (Lead)](#epic-1--replay-and-history-lead)
9. [Epic 2 — Deeper City Literacy](#epic-2--deeper-city-literacy)
10. [Epic 3 — Comprehension-First Performance](#epic-3--comprehension-first-performance)
11. [Epic 4 — Capture, Export, and Lightweight Sharing](#epic-4--capture-export-and-lightweight-sharing)
12. [Epic 5 — Onboarding Accelerator](#epic-5--onboarding-accelerator)
13. [Epic 6 — Platform Foundations for Extensibility](#epic-6--platform-foundations-for-extensibility)
14. [Epic 7 — Optional AI Companion (Late)](#epic-7--optional-ai-companion-late)
15. [Sequencing](#sequencing)
16. [In Scope vs Deferred](#in-scope-vs-deferred)
17. [Persona Value in Version 2](#persona-value-in-version-2)
18. [Non-Negotiables Carried Forward](#non-negotiables-carried-forward)
19. [Success Metrics](#success-metrics)
20. [Risks](#risks)
21. [Handoff](#handoff)

---

## Version 2 Statement

**Version 2 is the product phase where Pulse expands from “watch it breathe live” to “understand what it did, why it mattered, and how to teach that understanding to others”—without becoming monitoring, logging, or SaaS.**

MVP proves the category.  
Version 2 deepens it.

If MVP is a window, Version 2 adds memory, sharper literacy, and the first collaborative artifacts—still Laravel-first, still package-first, still honest.

---

## Relationship to MVP

| | MVP (Chapter 10) | Version 2 (this chapter) |
|---|---|---|
| **Primary question** | Can we create the double Aha? | Can we make Pulse useful across time and teaching loops? |
| **Dominant mode** | Live observation | Live + historical comprehension |
| **Time horizon** | Now | Now + recent past |
| **Proof** | Install → city → live path → inspect | Replay a real path → explain → share/export → onboard faster |
| **Risk to avoid** | Scope creep before Aha | Platform sprawl before replay quality |

Version 2 **must not reopen** MVP debates that undermine the Aha veto. It builds on a frozen MVP DoD.

```text
MVP DoD met
    ↓
Version 2 begins
    ↓
v1.0 readiness work accumulates
    ↓
SaaS / marketplace / multi-framework (later chapters)
```

---

## Version Naming Clarification

Product language and semver language can diverge. This chapter uses:

| Term | Meaning in Pulse docs |
|---|---|
| **MVP / v0.1 bar** | Double Aha product defined in Chapter 10 |
| **Version 2 (product phase)** | Post-MVP expansion defined here (typically begins at **v0.2.0**) |
| **v1.0.0** | Production-ready OSS declaration after Version 2 hardening + ecosystem readiness |
| **Marketing “v2.0” in long-term vision** | Later multi-year platform milestone (Year 2 in Vision)—**not** this chapter’s scope |

This chapter is **not** the Year-2 SaaS/multi-framework vision. Those belong to Chapters 12–13 and beyond.

Recommended semver mapping:

| Release | Intent |
|---|---|
| **v0.1.x** | MVP proof + hardening patches |
| **v0.2.x** | Replay/history foundations (Version 2 lead epic) |
| **v0.3.x** | Deeper literacy + comprehension-first performance |
| **v0.4.x** | Extensibility foundations (plugin contracts), export/share basics |
| **v0.5.x** | Onboarding accelerator + optional AI companion |
| **v1.0.0** | Stable contracts, docs, quality bar, community-ready |

Exact patch boundaries can flex; epic order should not.

---

## Version 2 Thesis

### Thesis

After developers believe Pulse, they will ask:

1. Can I scrub what just happened?
2. Can I compare this path to one from earlier today?
3. Can I show this to a teammate without screenshare theater?
4. Can a new hire replay the five flows that matter?
5. Can Pulse point me at the slow step without becoming New Relic?

Version 2 exists to answer those questions while staying inside Pulse’s category: **visual comprehension of real Laravel behavior**.

### Anti-thesis

Version 2 is not:

- an APM suite
- an incident management platform
- a log warehouse
- a plugin marketplace launch
- a hosted cloud launch
- multi-framework support

---

## Entry Gate

Version 2 work starts only when MVP Definition of Done is met (Chapter 10), including:

- Double Aha reliability on representative apps
- Honest quiet/degraded modes
- Safe defaults (redaction, non-local protection)
- No fake-data pathways
- Install → city contracts holding

Additionally recommended before major Version 2 marketing:

- Final project name decision (avoid collision with official Laravel Pulse)
- Public v0.1 feedback loop with at least early adopters

---

## North-Star Outcomes

By the end of the Version 2 product phase (approaching v1.0), a developer should be able to:

1. **Replay** a recent real request path end-to-end on the city
2. **Bookmark / export** a path for later or for a teammate
3. **See richer districts** (selected H2 collectors) without losing readability
4. **Spot comprehension-first bottlenecks** as visual highlights, not alert storms
5. **Run an onboarding path set** for a new teammate
6. **Trust extension points** exist (collector contracts / OpenAPI) even if marketplace is later
7. Optionally use **AI explanation** that only narrates observed data—and works with AI disabled

---

## Epic Map

| Epic | Intent | Semver bias |
|---|---|---|
| **E1 Replay & History** | Give Pulse memory | v0.2 |
| **E2 Deeper City Literacy** | Expand truthful districts | v0.3 |
| **E3 Comprehension-First Performance** | Make slowness visible in-context | v0.3 |
| **E4 Capture / Export / Lightweight Share** | Move evidence beyond one screen | v0.4 |
| **E5 Onboarding Accelerator** | Institutionalize knowledge transfer | v0.5 |
| **E6 Extensibility Foundations** | Contracts before marketplace | v0.4 |
| **E7 Optional AI Companion** | Explain after trust exists | v0.5 |

Lead epic is **E1**. No later epic may starve E1 of reliability.

---

## Epic 1 — Replay and History (Lead)

### Problem

Live visualization is powerful only while traffic happens. Debugging and teaching often require reconstructing a path after the fact.

### Version 2 answer

Pulse stores and replays **recent, real** execution traces onto the same city metaphor.

### Capabilities

| Capability | Brainstorm IDs | Priority |
|---|---|---|
| Recent runtime window retention | D1 | P0 |
| Playback scrubber (play/pause/seek) | D2 | P0 |
| Bookmark a request path | D3 | P1 |
| Deploy-bounded history (“since last deploy”) | D6 | P2 |
| Incident vault / pinned traces | D5 | P2 |

### Acceptance (phase complete)

1. User can select a recent request and replay its city motion
2. Playback uses recorded real events—never regenerated fiction
3. Scrubbing preserves causality (request → events → jobs) when known
4. Retention defaults are finite, documented, and configurable
5. Storage can be disabled without breaking live MVP mode

### Architecture implications (product constraints for Volume 3+)

- Append-only trace store (local/dev-first)
- Correlation IDs stable from MVP
- Retention + purge tooling
- Replay API separate from live stream transport
- Redaction applied at write and/or read consistently

### Non-goals for E1

- Infinite cloud retention
- Org-wide multi-app history
- Legal hold / enterprise compliance suites

---

## Epic 2 — Deeper City Literacy

### Problem

MVP districts prove the metaphor. Real Laravel apps contain more systems developers still cannot see.

### Version 2 answer

Add selected enrichment collectors/districts that increase literacy without collapsing into Telescope-clone completeness.

### Capabilities

| Capability | Brainstorm IDs | Priority |
|---|---|---|
| Notifications / mail district | A6 | P1 |
| Cache district + hit/miss signals | A7 | P1 |
| Auth gates / policy checkpoints | A8 | P1 |
| Scheduler / timetable | A9 | P2 |
| External HTTP outbound highways | A11 | P1 |
| Broadcast channel surfacing | A10 | P2 |
| Discovery diff (“what changed”) | A16 | P1 |
| Query step attachment (thin, complementary) | C12 | P2 |

### Acceptance guidelines

1. Each new district must map to real discovered/runtime data
2. New districts are toggleable collectors (overhead honesty)
3. Clustering/readability rules from MVP still hold
4. No district ships without inspect panel minimums

### Explicitly delayed

- Full container-binding architecture explorer as a primary mode
- Manual annotation systems as a dependency for literacy

---

## Epic 3 — Comprehension-First Performance

### Problem

Developers ask “where is time going?” Today they leave Pulse for APM/query tools mid-thought.

### Version 2 answer

Promote performance signals **inside the path story**, not as a separate monitoring product.

### Capabilities

| Capability | Brainstorm IDs | Priority |
|---|---|---|
| Stronger path bottleneck highlighting | E2 | P0 |
| Queue wait-time visualization | E4 | P1 |
| N+1 suspicion markers (conservative) | E3 | P2 |
| Before/after compare for a bookmarked path | E8 | P2 |

### Hard boundary

| Allowed | Not allowed |
|---|---|
| Visual “this step dominated duration” | Paging/alerting product |
| Queue wait as city congestion | SLO dashboards |
| Suspicion markers with uncertainty | Claiming Perfect N+1 detection |
| Compare two captured paths | Always-on production APM replacement |

### Acceptance

1. Bottleneck highlight maps to measured timings
2. Uncertainty is visible when confidence is low
3. Feature remains useful with APM tools still in the stack (complement)

---

## Epic 4 — Capture, Export, and Lightweight Sharing

### Problem

Screenshare is fragile. Architecture reviews and PR discussions need portable evidence.

### Version 2 answer

Make a path capturable as an artifact—without shipping full multi-tenant share infrastructure yet.

### Capabilities

| Capability | Brainstorm IDs | Priority |
|---|---|---|
| Snapshot image/GIF of a path | F3 | P1 |
| Export trace JSON | D4 | P0 |
| Local bookmark library | D3 | P1 |
| Shareable session links | F2 | P2 (thin) |

### Thin share decision

Shareable links may appear late in Version 2 only if:

- auth model is clear
- redaction is enforced
- links are optionally expiring
- MVP local/package mode still works offline without cloud

If those cannot be met safely, keep exports + snapshots and defer hosted sharing to SaaS chapters.

---

## Epic 5 — Onboarding Accelerator

### Problem

Isha and Rohan’s jobs are only partly served by Aha. Teams need repeatable “learn these flows” loops.

### Version 2 answer

Curate and replay the flows that define a codebase.

### Capabilities

| Capability | Brainstorm IDs | Priority |
|---|---|---|
| Onboarding playlist (“watch these 5 flows”) | F6 | P0 |
| “Why is this building here?” discovery rationale | C10 | P1 |
| Example gallery / reference apps | G4 | P1 |
| Dismissible coach marks for new users of playlists | J7 | P2 |

### Acceptance

1. A team can define a small set of saved paths as an onboarding playlist
2. New contributor can replay them in order
3. Playlist value works with history/replay foundations from E1

This epic depends on E1. Do not fake playlists with scripted demos.

---

## Epic 6 — Platform Foundations for Extensibility

### Problem

Long-term Pulse must be package/plugin extensible. Marketplace without contracts creates chaos.

### Version 2 answer

Ship **contracts and documentation**, not a storefront.

### Capabilities

| Capability | Brainstorm IDs | Priority |
|---|---|---|
| Collector plugin API (documented contracts) | G1 | P0 |
| OpenAPI for visualization/trace APIs | I7 | P0 |
| Feature flags for collectors | I8 | P1 |
| Overhead controls / sampling maturity | I5 | P1 |
| SDK seeds for non-UI consumers | G5 | P2 |

### Non-goals for this epic

- Plugin marketplace UI
- Paid plugin store
- Third-party review/certification program

Those belong to Chapter 13+.

### Acceptance

1. A third party can implement a sample collector against stable interfaces
2. Public OpenAPI describes live + replay-facing read APIs at a useful baseline
3. Internal collectors use the same contracts they publish

---

## Epic 7 — Optional AI Companion (Late)

### Problem

Once the city and replay exist, newcomers still ask “what am I looking at?”

### Version 2 answer

Optional explanations grounded only in observed/recorded data.

### Capabilities

| Capability | Brainstorm IDs | Priority |
|---|---|---|
| Explain selected path in plain language | H1 | P1 |
| Suggest where to look next | H4 | P2 |
| Local LLM option | H8 | P2 |

### Binding AI rules (unchanged)

1. AI never fabricates traffic or structure
2. Pulse remains fully valuable with AI disabled
3. No AI key gate before core product use
4. Explanations must cite visible/recorded evidence

### Sequencing constraint

E7 starts only after E1 is trusted. AI on bad history amplifies fiction risk.

---

## Sequencing

### Recommended order

```text
v0.1 MVP stable
    ↓
E1 Replay & History          → v0.2
    ↓
E2 Literacy + E3 Perf        → v0.3
    ↓
E4 Export/Share-thin + E6 Extensibility foundations → v0.4
    ↓
E5 Onboarding + E7 AI-optional → v0.5
    ↓
Hardening, docs, ecosystem polish → v1.0
```

### Parallelization rules

- E2 and E3 may proceed in parallel after E1 storage primitives exist
- E6 contracts can be drafted early, but public stability claims await v0.4
- E5 must not precede E1
- E7 must not precede E1

### Dependency graph

```text
E1 (Replay)
├── E5 (Playlists)
├── E4 (Export/Share uses traces)
├── E3 (Compare paths / historical bottleneck context)
└── E7 (Explain recorded paths)

E6 (Contracts) ── enriches E2 collectors over time
```

---

## In Scope vs Deferred

### In Version 2 phase

- Replay/history foundations
- Selective new districts
- Comprehension-first bottleneck visuals
- Trace export + snapshots (+ thin share if safe)
- Onboarding playlists
- Collector contracts + OpenAPI
- Optional AI explanations

### Still deferred (later chapters)

| Item | Chapter bias |
|---|---|
| SaaS cloud dashboard, billing, seats | Chapter 12 |
| Plugin marketplace / storefront | Chapter 13 |
| Multi-framework adapters | Post-v1 / Vision Year 2+ |
| Enterprise RBAC/SSO/audit as product line | SaaS/enterprise track |
| Always-on production monitoring positioning | Never (non-goal) |

---

## Persona Value in Version 2

| Persona | Version 2 upgrade |
|---|---|
| **Maya** | Replay failed path after the fact; bottleneck highlight on the same story |
| **Aarav** | Discovery diffs + richer districts; stronger trust in change impact |
| **Neha** | Exported traces as architecture evidence; deploy-bounded history |
| **Isha** | Playlists shorten “what happens when…” ramp |
| **Rohan** | Onboarding becomes a team asset, not senior-engineer theater |
| **OSS contributors** | Contracts/OpenAPI make extension conceivable |
| **Learners** | Optional AI explanations + examples deepen literacy |

---

## Non-Negotiables Carried Forward

Version 2 inherits and reinforces:

1. Never fake data
2. Package-first / zero-config core path remains intact
3. Complement Telescope/Horizon/Datadog—do not replace
4. AI assists never leads
5. Aha of live first-session remains unregressable
6. Prefer unknown over incorrect causality
7. Docs-before-breaking-changes for contracts

### Regression veto

> If a Version 2 feature worsens first-session time-to-Aha or forces config before live city, it is rejected or redesigned—no matter how useful for power users.

---

## Success Metrics

### Phase metrics (directional)

| Metric | Target direction |
|---|---|
| % of debugging sessions using replay weekly (early adopters) | Rising after v0.2 |
| Median time to re-understand a past failure | Down vs MVP-era tool-hopping |
| Playlist completion by new hires | Track once E5 ships |
| Export/snapshot usage in reviews | Qualitative then quantitative |
| Third-party sample collector appears | At least one external or docs-provided example by v0.4 |
| AI attach rate | Optional; never required for retention |

### Quality gates before v1.0

1. Replay fidelity trusted in dogfood
2. No critical redaction regressions
3. Stable collector contracts versioned
4. Performance overhead documented for history mode
5. Naming/branding collision resolved for public v1 push

---

## Risks

| Risk | Mitigation |
|---|---|
| History storage bloat / overhead fear | Finite defaults, purge tools, disable switch |
| Replay desync from city metaphor | Same renderer; recorded event model first-class |
| Becoming “APM lite” | Keep E3 inside path story; reject alert surfaces |
| Plugin contracts freezing too early | Version contracts; mark experimental until v0.4 |
| AI explaining incomplete traces as certainty | Require citations; show confidence limits |
| Scope merging with SaaS ambitions | Keep Chapter 12 boundaries sacred |
| Name collision while growth accelerates | Rename before v1 launch marketing |

---

## Handoff

### To Chapter 12 — SaaS Features

Version 2 ends where hosted multi-user product concerns begin:

- cloud control plane
- team workspaces
- billing
- remote org monitoring as a service

Do not invent SaaS requirements inside E4 thin sharing.

### To Chapter 13 — Plugin Marketplace

E6 creates contracts. Marketplace consumes them later.

### To architecture / engineering volumes

Version 2 forces design for:

1. Trace storage and retention
2. Replay protocols
3. Versioned collector contracts
4. Export schemas
5. Optional AI evidence-citing interfaces

### One-sentence freeze for Version 2

> **Memory before marketplace. Evidence before AI. Literacy before platform.**

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 10: MVP](./MVP.md) |
| **Next chapter** | [Chapter 12: SaaS Features](./SaaSFeatures.md) |
| **Related documents** | [Vision](./Vision.md) · [Mission](./Mission.md) · [Feature Brainstorm](./FeatureBrainstorm.md) · [MVP](./MVP.md) · [First-Time Experience](./FirstTimeExperience.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | Epic priority changes require review; regression veto is binding; version increment on material changes |

---

*Version 2 is how Pulse grows up without growing false. Live Aha remains sacred; memory, literacy, and teachability become the next proofs of category leadership.*
