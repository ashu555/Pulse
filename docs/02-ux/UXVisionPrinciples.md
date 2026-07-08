# UX Vision & Principles

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Volume 2 — Chapter 1 — UX Vision & Principles  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release.

---

## Table of Contents

1. [Chapter Purpose](#chapter-purpose)
2. [UX Vision](#ux-vision)
3. [Relationship to Volume 1](#relationship-to-volume-1)
4. [The Experience We Are Building](#the-experience-we-are-building)
5. [UX North Star](#ux-north-star)
6. [Core UX Principles](#core-ux-principles)
7. [Interaction Principles](#interaction-principles)
8. [Visual Principles](#visual-principles)
9. [Motion Principles](#motion-principles)
10. [Information Architecture Principles](#information-architecture-principles)
11. [Emotional Design Principles](#emotional-design-principles)
12. [Accessibility Principles](#accessibility-principles)
13. [Content and Voice Principles](#content-and-voice-principles)
14. [Anti-Patterns (UX Non-Goals)](#anti-patterns-ux-non-goals)
15. [Design Decision Filter](#design-decision-filter)
16. [Quality Bar for MVP UX](#quality-bar-for-mvp-ux)
17. [Volume 2 Roadmap Preview](#volume-2-roadmap-preview)
18. [Handoff](#handoff)

---

## Chapter Purpose

Volume 1 defined **what Pulse is** and **what must ship**.  
Volume 2 defines **how Pulse should feel and behave** before React, Tailwind, or motion libraries are chosen as visual dogma.

This chapter is the constitution of Pulse UX. Later UX chapters (city design, components, flows, motion specs) must obey it. Implementation may innovate inside these principles—not around them.

---

## UX Vision

**Pulse UX makes a Laravel application legible as a living place—so comprehension arrives through observation, not archaeology.**

When UX succeeds, a developer feels:

> “I can see my system think—and I trust what I’m seeing.”

When UX fails—even if collectors are correct—Pulse becomes either:

- a pretty lie, or  
- a chaotic graph that creates new cognitive load  

Both are product failures.

---

## Relationship to Volume 1

| Volume 1 anchor | UX obligation |
|---|---|
| [PRD / MVP](../01-product/PRD.md) | First session delivers double Aha without tours |
| [First-Time Experience](../01-product/FirstTimeExperience.md) | Discovery → city → live path → inspection spine |
| [Personas](../01-product/Personas.md) | Maya/Aarav depth + Isha readability |
| [Technical Constraints](../01-product/TechnicalConstraints.md) | Honesty, reduced-motion, polling honesty, redaction |
| Aha veto | No UX flourish that delays or fakes Aha |

UX does not reopen MVP scope. UX makes MVP *inevitable to feel*.

---

## The Experience We Are Building

Pulse is not a dashboard of cards.  
Pulse is not a graph editor for architects only.  
Pulse is not a game skin on APM.

Pulse UX is a **comprehension environment**:

| Mode | User need | UX posture |
|---|---|---|
| **Orient** | What is this app? | City from discovery |
| **Watch** | What is happening? | Live motion with focus aids |
| **Inspect** | What exactly was that? | In-context detail |
| **Confirm** | Can I trust this? | Honest empty/unknown/degraded states |

Everything in the interface should serve one of these modes.

---

## UX North Star

**In five minutes, a new user can recognize their application and narrate one real request path aloud—without reading documentation.**

Derived metrics remain Volume 1’s Time-to-double-Aha.  
UX owns the experiential conditions that make that metric possible.

---

## Core UX Principles

### 1. Reality is the interface

The UI exists to reveal real structure and real execution. If a visual element does not map to something true, remove it.

### 2. Quiet is honest

An idle application produces a quiet city. Quiet states instruct; they never impersonate life.

### 3. Understanding over spectacle

Motion, density, and dramatization are justified only when they reduce time-to-understanding.

### 4. Progressive disclosure is mandatory

Layer information:

```text
City overview
  → Focused path
    → Step timeline
      → Payload / deep detail
```

Never dump all collector fidelity onto the first viewport.

### 5. One primary question per view

Each screen/state should optimize for a dominant question:

- Discovering: “What exists?”
- Living: “What is moving?”
- Inspecting: “What is this, precisely?”

Secondary panels support; they must not compete for hierarchy.

### 6. Exploration rewards curiosity

Clicks should pay off with answers. Dead decorative clicks are bugs.

### 7. Power without prerequisites

Advanced density (filters, focus, follow-camera) may exist—but Aha cannot depend on configuring them first.

### 8. Same product, two fidelities of attention

Support both:

- soft guided attention for first session (optional follow)
- sharp manual control for seniors debugging under pressure  

Default to approachable; never trap experts in wizard mode.

### 9. Trust is a UX surface

Redaction, “unknown” causality, degraded transport banners, and env warnings are first-class UI—not footnotes.

### 10. Continuity of metaphor

Gates, roads, buildings, messengers, trains mean the same things everywhere—OSS, SaaS, docs, demos. No synonym soup.

---

## Interaction Principles

| Principle | Practice |
|---|---|
| **Direct manipulation** | Pan/zoom/click the city; minimize menu archaeology |
| **Selection clarity** | Selected path/entity always visually obvious |
| **Reversible focus** | Focus mode and follow-camera easy to exit |
| **Keyboard parity** | Primary flows reachable by keyboard |
| **No trapping modals** | No forced tours before canvas use |
| **Fast inspect** | Detail opens without route navigation that destroys city context |
| **Stable spatial memory** | Avoid chaotic re-layout that destroys mental maps between rediscovery passes |
| **Safe defaults** | Sensible zoom, focus, and density on first load |

### Click contract (from Volume 1, now UX law)

Every primary city entity shown in MVP must be inspectable and must answer at least one developer question on first click.

---

## Visual Principles

### Hierarchy

1. Active path / selected entity  
2. City structure  
3. Ambient context  
4. Chrome (controls, status)  

Chrome serves the city—not the reverse.

### Density

| App size | UX response |
|---|---|
| Small | Readable districts, generous spacing |
| Medium | Clear clustering by area/domain |
| Large | Aggressive clustering + focus tools; never show every class as equal nodes |

Unreadability is treated as a **defect**, not a “power user badge.”

### Color

Color encodes meaning (state, type, severity)—not decoration alone.

| Must encode | Must not rely on color alone |
|---|---|
| Success / fail / running | All state distinctions |
| Entity families (request/event/job) | Critical warnings |

Failure states must be unmistakable even in dark mode and for color-vision deficiency (pair with shape/label).

### Light / dark

Dark mode is MVP quality bar. Both themes must preserve state semantics and contrast.

### Aesthetic direction (bound, not styled yet)

Pulse should feel:

- precise, modern, calm-confident  
- technical without terminal cosplay clutter  
- alive without carnival noise  

Pulse should not feel:

- generic purple SaaS dashboard  
- cartoon game UI that signals “toy”  
- dense Neo-brutalist newspaper of metrics  

Exact palette/typography appear in later Volume 2 chapters—principles constrain taste.

---

## Motion Principles

### Motion must mean something

Allowed purposes:

| Purpose | Example |
|---|---|
| **Existence** | City build after discovery |
| **Traversal** | Request moving along a path |
| **Causal relay** | Event messenger departure |
| **State change** | Job fail flash / settle |
| **Attention** | Soft highlight of newest path |

Forbidden purposes:

- idle loops of fake pedestrians  
- motion that invents order not present in data  
- endless ambient sparkle that distracts from failures  

### Timing honesty

Motion may simplify for readability, but must not reverse causal order or invent steps.

If timing is uncertain, show uncertainty—do not choreograph false precision.

### Reduced motion

When reduced motion is on:

- information remains available via timeline/panels/static path emphasis  
- essential state changes still communicate without requiring animation literacy  

Animation-only meaning is a WCAG and product failure.

### Performance of motion

Motion must not make the UI feel lagged relative to transport reality. If polling is slow, don’t fake smoothness that implies live websocket fidelity.

---

## Information Architecture Principles

### Primary surfaces (MVP mental model)

| Surface | Role |
|---|---|
| **City canvas** | Orient + watch |
| **Status rail / HUD** | Discovery progress, live mode, env, quiet tips |
| **Inspector** | Understand selected entity |
| **Legend / glossary peek** | Metaphor literacy |
| **Diagnostics entry** | Trust recovery (`pulse:check` linkage) |

Settings exist—but not as the first door.

### Navigation rule

Users should spend first minutes **inside the city**, not inside a settings IA.

### Naming rule

Prefer Laravel-familiar words alongside metaphor:

> Building · `OrderController@store`  
> Messenger · `OrderCreated`  
> Train · `SendInvoiceJob`

Metaphor without grounding becomes mysticism. Grounding without metaphor becomes Telescope.

---

## Emotional Design Principles

| Moment | Desired emotion | UX lever |
|---|---|---|
| First open | Relief | Instant discovery start |
| Discovery | Anticipation | Named progress with real counts |
| City appears | Recognition | Familiar app structure |
| First live path | Wonder + clarity | Continuous causal story |
| First inspect | Confidence | Concrete detail |
| Quiet city | Calm trust | Honest copy + next action |
| Degraded mode | Informed control | Clear banner + still-usable canvas |
| Failure path | Urgency without panic | Distinct fail encoding + inspectability |

### Emotional non-goals

- Addiction mechanics  
- Dopamine spam unrelated to understanding  
- Shame for quiet apps or missing subsystems  

---

## Accessibility Principles

| Principle | Requirement |
|---|---|
| ** Perceivable** | Text alternatives for motion-borne meaning; contrast AA target for primary UI |
| **Operable** | Keyboard for select/inspect/focus/escape; visible focus |
| **Understandable** | Predictable inspector layout; plain-language status |
| **Robust** | Don’t rely on a single canvas technology without fallback info panels |
| **Inclusive density** | Clustering helps cognitive accessibility, not only screen size |

Accessibility is part of craft—not a post-MVP apology.

---

## Content and Voice Principles

### Voice

Pulse speaks like a senior engineer who is calm, precise, and kind:

- short sentences  
- concrete nouns (route, job, listener)  
- no hype (“revolutionary”, “AI-powered magic”)  
- no blame  

### Microcopy patterns

| Situation | Tone |
|---|---|
| Quiet city | “Your application is quiet. Trigger a request to watch it move.” |
| Unknown link | “Parent request unknown.” |
| Polling mode | “Live updates via polling.” |
| Redaction | “Field redacted.” |
| Discovery done | “Discovery complete. Building your city…” |

### Empty ≠ error

Do not use error styling for “no queues discovered.” Reserve error styling for true failures.

---

## Anti-Patterns (UX Non-Goals)

1. Forced multi-step product tours before canvas use  
2. Fake tourists / simulated load in real-app mode  
3. Dashboard-of-cards home replacing city as primary  
4. Modal stacks for setup during first session  
5. Unlabeled demo datasets mixed into production views  
6. Color-only failure encoding  
7. Inspector that navigates away and loses city context  
8. Layout reshuffle that destroys recognition after every rediscovery  
9. “Cinematic mode” as default physics with different truth rules  
10. AI chat overlay blocking the first Aha  
11. Settings-first IA  
12. Metaphor without Laravel labels (or Laravel labels without spatial model)

---

## Design Decision Filter

When proposing any UX change, answer in order:

1. **Does it make reality clearer?**  
2. **Does it protect or improve Time-to-Aha?**  
3. **Does it increase trust (honesty, unknown, safety)?**  
4. **Does it reduce cognitive load for P1/P2 personas?**  
5. **Can it degrade gracefully (polling, quiet, reduced motion)?**  
6. **Would removing the flourish still leave the meaning intact?**

If (1) or (2) fails, reject.  
If (6) fails, the flourish is load-bearing meaning—ensure non-motion equivalents exist.

---

## Quality Bar for MVP UX

MVP UX is done only when:

| # | Bar |
|---|---|
| 1 | First viewport is discovery/city—not settings |
| 2 | City is recognizable to the app owner after discovery |
| 3 | One real path can be followed visually end-to-end when traffic exists |
| 4 | First click on primary entities teaches something specific |
| 5 | Quiet and degraded states are designed, not blank |
| 6 | Dark mode + reduced motion + keyboard basics work for primary loop |
| 7 | Failure is unmistakable |
| 8 | No fake-traffic pathways in real mode |
| 9 | Metaphor labels remain consistent with docs |
| 10 | A cold user can complete double Aha without a human guide |

---

## Volume 2 Roadmap Preview

Suggested subsequent chapters (adjustable as UX volume expands):

| Ch | Working title | Outcome |
|---|---|---|
| 2 | [City Metaphor System](./CityMetaphorSystem.md) | Canonical mapping + naming + districts |
| 3 | [Discovery & First-Run UX Spec](./DiscoveryFirstRunUX.md) | Screen-by-screen Act 1–4 |
| 4 | [Canvas Interaction Model](./CanvasInteractionModel.md) | Pan/zoom/select/focus/follow |
| 5 | [Inspector UX](./InspectorUX.md) | Panels, timelines, redaction display |
| 6 | [Motion Language](./MotionLanguage.md) | Timing, easing, causal animation rules |
| 7 | [Visual Foundations](./VisualFoundations.md) | Color, type, spacing, elevation, dark mode |
| 8 | [HUD / Navigation / Shortcuts](./HUDNavigationShortcuts.md) | Chrome IA + keyboard map |
| 9 | [Empty, Error & Degraded Patterns](./EmptyErrorDegraded.md) | State library |
| 10 | [Density & Large-App Strategies](./DensityLargeApp.md) | Clustering as UX rules |
| 11 | [Accessibility Spec](./AccessibilitySpec.md) | WCAG-oriented requirements |
| 12 | [Component Inventory](./ComponentInventory.md) | UI kit mapped to principles |
| 13 | [Prototype Scripts & Usability Plan](./UsabilityPlan.md) | Test protocols tied to Aha metrics |

Volume 2 chapter set is complete. Principles in this chapter remain binding.

---

## Handoff

### To Volume 2 Chapter 2 (City Metaphor System)

Turn principles into a strict metaphor dictionary and layout grammar.

### To Engineering later

Principles become acceptance checks in UI PRs (“does this motion encode data?”).

### One-sentence freeze

> **Pulse UX is a truth interface: every pixel either reveals the system—or gets removed.**

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Volume** | 2 — UX |
| **Previous** | [Volume 1 Final PRD](../01-product/PRD.md) |
| **Next chapter** | [Chapter 2: City Metaphor System](./CityMetaphorSystem.md) |
| **Related documents** | [First-Time Experience](../01-product/FirstTimeExperience.md) · [MVP](../01-product/MVP.md) · [Personas](../01-product/Personas.md) · [Technical Constraints](../01-product/TechnicalConstraints.md) · [Vision](../01-product/Vision.md) |
| **Change process** | Principle changes require review; must not contradict Volume 1 Aha veto |

---

*If the interface is beautiful but false, it is broken. If it is true but illegible, it is also broken. Pulse UX must be both true and legible—at the speed of a glance that turns into understanding.*
