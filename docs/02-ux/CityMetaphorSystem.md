# City Metaphor System

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 2 — City Metaphor System  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

This chapter is the **canonical dictionary** of Pulse’s living-city language. Every UI label, animation, inspector title, and doc string must use these meanings. Divergence without an explicit revision is a bug.

Upstream: [UX Vision & Principles](./UXVisionPrinciples.md), [First-Time Experience](../01-product/FirstTimeExperience.md).

---

## Metaphor Thesis

**A Laravel application is a city whose geography is structure and whose traffic is runtime behavior.**

- Structure without traffic = map  
- Traffic without structure = noise  
- Pulse shows both, with structure first

---

## Canonical Entity Dictionary (MVP)

| ID | Metaphor | Laravel reality (MVP) | Visual role | Inspects to |
|---|---|---|---|---|
| E01 | **City** | The application instance Pulse is observing | Canvas world | App name, env, discovery summary |
| E02 | **Gate** | HTTP entry / auth boundary (middleware group sensation) | Entry landmark | Auth/middleware summary when known |
| E03 | **Road** | Route (URI + methods + middleware chain) | Edges between landmarks | Route signature, middleware |
| E04 | **Building** | Controller / primary action area | Node / landmark | Controller@action, related routes |
| E05 | **District** | Cluster of related buildings (namespace/domain grouping) | Region label | Group membership, counts |
| E06 | **Person / Traveler** | HTTP request (or equivalent inbound execution) | Moving actor | Timeline, status, duration |
| E07 | **Messenger** | Event dispatch | Moving signal between buildings | Event name, listeners, payload (redacted) |
| E08 | **Station** | Queue connection/name | Hub landmark | Queue name, waiting depth if known |
| E09 | **Train** | Job | Moving cargo between station ↔ worker | Job class, status, tries, parent request |
| E10 | **Worker Yard** | Queue worker processing locus | Landmark | Worker activity summary when known |

### Naming display rule

Always dual-label in UI when space allows:

```text
Building
OrderController@store
```

Metaphor first for orientation; Laravel name for trust.

---

## Post-MVP Extensions (Reserved Meanings)

Do not invent alternate meanings later.

| Metaphor | Future reality | Horizon |
|---|---|---|
| Mail office | Notifications / mail | v0.3 literacy |
| Power station | Cache store / hit-miss | v0.3 |
| Checkpoint | Policy / gate authorization | v0.3 |
| Highway out | External HTTP client calls | v0.3 |
| Clock tower | Scheduler | v0.3+ |
| Loudspeakers | Broadcast channels | v0.3+ |

---

## Spatial Grammar

### Layout intent

1. **Gate** near conceptual “edge” of city (entry side)  
2. **Roads** connect gate → buildings  
3. **Buildings** cluster into **districts** by namespace/path affinity  
4. **Stations** sit near districts that dispatch jobs (or central logistics zone)  
5. **Worker yards** adjacent to stations  

### Stability rule

Re-discovery should preserve approximate positions of unchanged entities (stable layout bias). Only new/removed nodes should visibly change geography.

### Scale rule

MVP may show a simplified world; it must never invent buildings that discovery did not find.

---

## Behavioral Grammar (Traffic)

| Runtime fact | City behavior |
|---|---|
| Request starts | Traveler enters at gate |
| Middleware / routing | Traveler moves along road segments |
| Controller handling | Traveler arrives at / enters building |
| Event fired | Messenger departs from origin building |
| Listener runs | Messenger arrives at listener-associated building when mappable; else “delivery” badge |
| Job dispatched | Train leaves station (link to traveler when correlated) |
| Job processing | Train at worker yard |
| Job/request success | Settled success encoding |
| Job/request failure | Distinct failure encoding (shape + label + color) |
| Correlation unknown | No forced fake edge; show unknown in inspector |

### Causality rule

Edges and relay animations only when correlation confidence is sufficient. Otherwise: traveler + separate train with “parent unknown.”

---

## State Vocabulary

| State | Applies to | Encoding requirements |
|---|---|---|
| Idle / structural | Buildings, roads, stations | Neutral, readable |
| Active | Entities on a live path | Emphasis, not scream |
| Selected | Any entity | Strong selection ring / outline |
| Focused path | Subgraph | Dim non-path; keep readable |
| Succeeded | Request/job | Clear success marker |
| Failed | Request/job | Unmistakable fail marker (not color-only) |
| Running / pending | Job/request | Progress sensation |
| Degraded transport | World HUD | Banner, not fake smoothness |
| Quiet world | City | No synthetic actors |

---

## District Taxonomy (MVP)

| District type | Membership heuristic (product) |
|---|---|
| HTTP / Controllers | Controller actions + routes |
| Domain cluster | Namespace prefix / path segment grouping |
| Async / Queues | Stations + worker yards |
| Unclustered | Overflow “Other” with honest count |

Exact clustering algorithm is engineering; UX requires readable labels and drill-into-cluster.

---

## Legend Requirements

Legend peek must include at minimum:

- Building = controller/action  
- Road = route  
- Traveler = request  
- Messenger = event  
- Train = job  
- Station = queue  

Legend is optional to open, always available, never a blocking tour.

---

## Metaphor Anti-Patterns

1. Renaming “job” metaphor between screens (train vs truck vs drone)  
2. Using people for jobs and trains for requests  
3. Decorative citizens unrelated to requests  
4. Buildings for Eloquent models in MVP (deferred; causes Telescope overlap confusion)  
5. Mixing SaaS “workspace” metaphor into city geography  

---

## Copy Templates

| Situation | Copy |
|---|---|
| Select building | “Building · {Controller@action}” |
| Select train | “Train · {JobClass} · {status}” |
| Unknown parent | “Parent request unknown” |
| Empty stations | “No queues discovered” |

---

## Acceptance Criteria

- [ ] MVP entities E01–E10 used consistently in UI strings  
- [ ] Dual-label rule on inspectors and tooltips  
- [ ] No real-mode entities without discovery/runtime source  
- [ ] Failure states distinguishable without color alone  
- [ ] Legend matches this dictionary  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 1: UX Vision & Principles](./UXVisionPrinciples.md) |
| **Next** | [Ch 3: Discovery & First-Run UX Spec](./DiscoveryFirstRunUX.md) |
| **Volume** | 2 — UX |

---

*The city is not decoration. It is a language. Speak it consistently or not at all.*
