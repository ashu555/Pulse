# First-Time Experience

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 8 — First-Time Experience  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Experience Summary](#experience-summary)
2. [Experience Philosophy](#experience-philosophy)
3. [Handoff from Installation](#handoff-from-installation)
4. [Success Definition](#success-definition)
5. [The First Five Minutes](#the-first-five-minutes)
6. [Act 1 — Discovery](#act-1--discovery)
7. [Act 2 — City Build](#act-2--city-build)
8. [Act 3 — First Live Observation](#act-3--first-live-observation)
9. [Act 4 — First Inspection](#act-4--first-inspection)
10. [Guidance Without Tutorials](#guidance-without-tutorials)
11. [Quiet City and Empty States](#quiet-city-and-empty-states)
12. [Degraded Modes](#degraded-modes)
13. [What Must Never Happen](#what-must-never-happen)
14. [Persona Variations](#persona-variations)
15. [Emotional Arc](#emotional-arc)
16. [Failure Modes and Recovery](#failure-modes-and-recovery)
17. [First-Time Experience Metrics](#first-time-experience-metrics)
18. [Product and UX Implications](#product-and-ux-implications)
19. [MVP First-Time Experience Contract](#mvp-first-time-experience-contract)

---

## Experience Summary

The first-time experience is the moment Pulse either becomes inevitable—or forgettable.

Installation gets the developer to the door.  
First-time experience is what happens when they walk through it.

In the first session, Pulse must deliver two irreversible realizations:

1. **"It already knows my application."**
2. **"I can see my application think."**

If those two lines are not earned quickly, feature depth later will not save product-market fit.

This chapter defines the end-to-end first session: from dashboard open → discovery → city build → first live request → first meaningful inspection.

---

## Experience Philosophy

### Value before explanation

Pulse must not require:

- a mandatory guided tour
- a video before entry
- a checklist of setup tasks
- a configuration wall
- fake sample traffic to "look alive"

The product teaches by revealing the developer's own application.

### Delight with discipline

Animation is allowed—and expected—only when it communicates real structure or real execution.

Beauty that lies is a product bug.

### Progressive disclosure

Show the city first.  
Reveal details on demand.  
Do not dump every collector metric onto the first viewport.

### Honest silence

If the application is quiet, the city is quiet. Quiet is truthful. Fake motion is forbidden.

### One path to Aha

There should be one primary first-session path. Optional power features must not obstruct it.

---

## Handoff from Installation

[Chapter 7: Installation Journey](./InstallationJourney.md) ends when:

- package is installed
- dashboard is reachable
- collectors are ready

Chapter 8 begins at the first successful dashboard render.

There must be **no interstitial**:

```text
Setup complete
Please configure collectors
Please connect AI
Please create an account
Please take this tour
```

The first screen of value is discovery.

```text
Installation success
        ↓
Dashboard opens
        ↓
Discovery begins immediately
```

---

## Success Definition

A first-time experience is successful when, within one session, the developer:

1. Sees discovery progress for their real app
2. Watches the city construct from discovered components
3. Observes at least one real request (or understands an honest quiet state)
4. Inspects at least one element and learns something specific
5. Feels confident enough to attempt a real job next (debug / onboard / validate)

North-star timing targets:

| Milestone | Target |
|---|---|
| Dashboard open → discovery started | < 2 seconds |
| Discovery started → city visible | < 60 seconds |
| City visible → first request observed | same session (ideally < 5 minutes total from open) |
| First observation → first inspection | < 60 seconds after observation |
| Emotional conversion ("I get it") | within first 5 minutes |

---

## The First Five Minutes

Canonical first-session script:

| Time | Experience |
|---|---|
| **0:00** | Dashboard loads. Welcome is brief. Discovery starts automatically. |
| **0:05–0:45** | Pulse scans routes, events, queues, controllers, jobs (and related signals). Progress is visible. |
| **0:45–1:00** | City builds: districts and buildings appear, roads connect. |
| **1:00** | First Aha: *It already knows my application.* |
| **1:00–3:00** | Developer triggers a real action *or* watches existing traffic *or* sees quiet-state guidance. |
| **3:00–4:00** | Live path animates: request → middleware → controller/service → events → jobs as applicable. |
| **4:00–5:00** | Developer clicks one element and reads real detail. Second Aha: *I can see my application think.* |

After five minutes, Pulse should no longer feel like "a new tool to learn."  
It should feel like "a window that was always missing."

---

## Act 1 — Discovery

### Purpose

Prove that Pulse can understand a Laravel application without the developer teaching it.

### Entry

On first open (or until discovery completes successfully once):

```text
Welcome to Pulse.

Let's discover your application...
```

Tone: calm confidence. Not carnival. Not enterprise coldness.

### Discovery sequence

Pulse scans and reports progress for core structure:

| Scan target | User-facing label | Meaning |
|---|---|---|
| Routes | Routes | Entry roads into the system |
| Controllers / actions | Controllers | Primary buildings where work starts |
| Events | Events | Messengers / signals in the city |
| Listeners (as available) | Listeners | Recipients of messengers |
| Jobs | Jobs | Work units that leave stations |
| Queues | Queues | Train stations / waiting areas |
| Additional signals (MVP+) | Cache, Notifications, etc. | Enrichment districts later |

Example progress presentation:

```text
Routes...        ██████████  42 found
Events...        ██████████  18 found
Queues...        ██████████   3 found
Controllers...   ██████████  27 found
Jobs...          ██████████  14 found

Discovery complete.
```

### Discovery rules

1. Discovery uses **real application structure**, not placeholders.
2. Counts and names should be recognizable to the developer.
3. Partial discovery is allowed if some subsystems are absent; labels should say "none found" honestly.
4. Discovery may be re-run later (deploy/change), but first run must feel automatic.
5. Discovery must not block forever. Timeouts need clear recovery.

### First Aha gate

Discovery succeeds only if the developer can recognize their application in the results.

Wrong framework guesses, empty false positives, or generic template cities kill trust immediately.

---

## Act 2 — City Build

### Purpose

Transform discovered structure into a spatial mental model.

### Build behavior

After discovery:

```text
Now... the city builds itself.
```

Buildings rise. Roads connect. Districts form.

### Metaphor mapping (first session)

First-time experience uses a reduced, readable mapping:

| Reality | City metaphor |
|---|---|
| HTTP entry / auth boundary | City gate |
| Routes | Roads |
| Controllers / key app areas | Buildings |
| Events | Messengers |
| Queues | Stations |
| Jobs | Trains |
| Workers | Worker yards / engineering buildings |

Later chapters (UX / feature design) may expand mapping. First session must remain cognitively light.

### Build principles

1. **Recognition over ornament** — developer should map buildings to known app areas quickly.
2. **Stable layout bias** — similar rediscovery should not reshuffle the city chaotically.
3. **Readable density** — large apps need grouping/clustering, not a particle explosion of every class.
4. **No manual city editing required** — first session is auto-generated.

### Completion state

City is ready when:

- primary districts are visible
- user can pan/zoom without instruction beyond tiny affordances
- a clear cue exists for "waiting for live traffic" or "trigger a request"

---

## Act 3 — First Live Observation

### Purpose

Deliver the second Aha: runtime behavior becomes visible.

### Trigger paths

Pulse supports three legitimate first observation paths:

| Path | When it happens | Product response |
|---|---|---|
| **A. Organic traffic** | App already receiving requests | Animate immediately |
| **B. Developer-triggered action** | User hits an endpoint / clicks UI in their app | Animate that request prominently |
| **C. Quiet guidance** | No traffic yet | Honest empty state + suggest triggering one action |

Never invent Path D: simulated tourists walking around for decoration.

### Canonical observation story

When a request arrives, first-time users should be able to follow:

1. Request enters (person / pulse enters through gate)
2. Middleware / route road traversal
3. Arrival at controller/service building
4. Internal work indicated (without overwhelming detail yet)
5. Event messengers departing (if any)
6. Jobs dispatched as trains (if any)
7. Request completion

The point is **continuity of story**, not every database column on first pass.

### Focus behavior

For first session, Pulse should weakly bias toward:

- highlighting the newest request
- auto-following the active path (optional, cancellable)
- reducing unrelated ambient noise

Power users can disable follow-camera later. First session benefits from guided attention without a modal tour.

### Second Aha gate

Observation succeeds when the developer can narrate out loud:

> "That request went through auth, hit this controller, fired this event, and queued this job."

If they cannot say that after watching, the visualization failed—even if animations played.

---

## Act 4 — First Inspection

### Purpose

Convert spectacle into understanding.

### First click contract

Every primary city element shown in the first session must be inspectable.

| Element | Minimum first-click detail |
|---|---|
| Request / person | Route, method, status, duration, timeline steps |
| Building | Component identity (e.g. controller action), related requests |
| Road / route segment | Route signature, middleware chain summary |
| Messenger / event | Event name, payload summary/redacted, listeners |
| Train / job | Job class, queue, status, timing, related parent request if known |

### Detail panel UX rules

1. Open on click without page navigation away from city context.
2. Prefer side panel / drawer over dead-end pages for first session.
3. Show **timeline continuity** between steps of one request.
4. Redact sensitive values by default.
5. Provide clear "source of truth" cues (real runtime data).

### First-session inspection goal

One click should answer one concrete question, for example:

- Where did this fail?
- What event fired after the controller?
- Which queue did this job enter?
- How long did middleware take?

Deep architecture explorer features can wait. First session needs answers, not a second IDE.

---

## Guidance Without Tutorials

### Allowed guidance

Lightweight, dismissible cues that never block the canvas:

- one-line status: "Discovering events…"
- quiet tip: "Trigger any request in your app to watch it move."
- legend peek: "Buildings = controllers / areas"
- keyboard hint after first interaction: "Press `?` for shortcuts"

### Forbidden guidance patterns

- Forced multi-step product tour before city is usable
- Checklist walls ("Complete these 8 setup tasks")
- Fake playable demo city mixed into real app view
- Chatty agent interrupting discovery
- Marketing carousel inside the product shell

### Teaching model

```text
Show structure
  → Show motion
    → Show detail on demand
      → Then offer docs / deeper tools
```

Docs exist for depth. First session exists for conversion.

---

## Quiet City and Empty States

Quiet is a first-class scenario.

### Quiet city copy principles

- Honest: "Your application is quiet."
- Actionable: "Hit an endpoint, submit a form, or run a job."
- Reassuring: "Pulse will animate real traffic when it appears."
- Never desperate: no fake wanderers.

### Empty discovery outcomes

| Situation | Message intent |
|---|---|
| No queues configured | "No queues discovered yet." |
| No domain events found | "No events discovered yet." |
| Minimal app | City is small and truthful; do not pad with invented districts |

### First-run without traffic

Success is still possible:

1. Discovery completes
2. City builds from structure
3. Developer understands map
4. Quiet-state CTA leads them to trigger traffic

Structure Aha can precede motion Aha. Motion should follow quickly, but honesty comes first.

---

## Degraded Modes

First-time experience must survive imperfect environments.

| Degradation | First-session behavior |
|---|---|
| No Reverb / websocket | Fall back to polling; show subtle "live via polling" state |
| No queue worker | City works; jobs may appear queued without processing motion; explain why |
| Partial collector failure | Show what succeeded; warn what failed; do not hide all value |
| Large monolith (thousands of routes) | Cluster aggressively; prioritize high-signal areas; avoid unusable spaghetti |
| Slow discovery | Show determinate/indeterminate progress + cancel/retry |

Degraded mode still aims for Aha. It just tells the truth about limits.

---

## What Must Never Happen

These are hard product constraints for first session:

1. **Never show fake traffic** as if it were real.
2. **Never require config publish** before discovery.
3. **Never force AI key entry** before first Aha.
4. **Never trap users in onboarding modals.**
5. **Never present a blank white screen without status.**
6. **Never reorder metaphor meanings mid-session.**
7. **Never expose secrets in first-click payloads by default.**
8. **Never blame the user for quiet traffic.**
9. **Never make uninstall or disable hard to find** if anxiety spikes.
10. **Never prioritize visual fireworks over causal accuracy.**

---

## Persona Variations

Same first-session spine; different emphasis after Aha.

### Maya (Backend Engineer) — "Prove it helps me debug"

Needs:

- clear request timeline
- failure states visible
- fast inspection of jobs/events linked to a request

### Aarav (Senior Laravel Developer) — "Prove it knows my architecture"

Needs:

- recognizable structure after discovery
- confidence that mappings are accurate
- ability to verify a known flow quickly

### Isha (New Team Member) — "Prove I can learn this app"

Needs:

- readable city density
- low jargon in first cues
- obvious "what should I do next?" quiet-state help

### Neha (Architect) — "Prove runtime matches intent"

Needs:

- structural honesty
- inspectable relationships
- no decorative inventions that invent architecture

First session does not need persona toggles. It needs a default that serves all four without specializing yet.

---

## Emotional Arc

| Minute | Desired emotion | Design lever |
|---|---|---|
| 0:00 | Relief ("install worked") | Instant discovery start |
| 0:30 | Anticipation | Progress that names familiar components |
| 1:00 | Recognition / delight | City that looks like *their* app |
| 2:00 | Curiosity | Soft CTA to trigger traffic |
| 3:30 | Wonder | Continuous request story animation |
| 4:30 | Confidence | Inspection that answers a real question |
| 5:00 | Attachment | Desire to try one real job next |

If emotion peaks at wonder but dies at inspection, Pulse becomes a demo—not a tool.

---

## Failure Modes and Recovery

| Failure | User interpretation | Recovery |
|---|---|---|
| Discovery hangs | "Broken" | Timeout + retry + `pulse:check` link |
| City empty after discovery | "Doesn't understand my app" | Explain zero finds; verify providers/paths |
| No animation after requests | "Not realtime / not hooked" | Confirm collectors; show last seen request timestamp |
| Animation without inspectability | "Pretty but useless" | Ensure panels always populate |
| Overwhelming visual density | "Too chaotic" | Auto-cluster + focus mode |
| Wrong linkage request→job | "I can't trust this" | Prefer unknown over incorrect assignment |
| Secret leakage in panel | "Unsafe" | Redaction defaults + disable collector path |

**Rule:** when data confidence is low, show uncertainty explicitly.

---

## First-Time Experience Metrics

### Primary metric

**Time-to-double-Aha:** dashboard open → structure recognized → first real execution understood.

Target: **≤ 5 minutes** median for supported local apps.

### Supporting metrics

| Metric | Target |
|---|---|
| Discovery completion rate | > 95% |
| Discovery ≤ 60s | > 90% |
| City rendered after discovery | > 98% |
| Session with ≥1 inspection click | > 60% |
| Session with quiet-state → later traffic observed | directional uplift |
| Immediate bounce (<30s) | < 15% once install success is filtered |

### Qualitative gate questions

After first session interviews:

1. What did you recognize immediately in the city?
2. What confused you?
3. When did you first trust it?
4. What did your first click teach you?
5. Would you open this tomorrow before Telescope?

---

## Product and UX Implications

### UX implications

- First viewport = discovery/city, not settings
- Motion system must encode causality
- Detail panel is part of MVP, not polish
- Empty/quiet states are designed artifacts, not blanks
- Accessibility: motion can be reduced; information must remain available without animation alone

### Product implications

- Do not market "SimCity for Laravel" until first inspection is reliable
- Demo GIFs must match real first-session physics (no fake omnipresent traffic)
- Feature brainstorm after this chapter must protect first-session purity

### Engineering implications

| Need | Why |
|---|---|
| Fast structural discovery APIs | Act 1 timing |
| Stable graph generation from discovery | Act 2 recognition |
| Reliable realtime/polling ingestion | Act 3 confidence |
| Request correlation IDs across events/jobs | Act 3 continuity |
| Redaction + safe payload previews | Act 4 trust |
| Instrumentation for first-session funnel | Measurable Aha |

---

## MVP First-Time Experience Contract

MVP first-time experience is complete when a developer on a supported local Laravel app can:

1. Open Pulse after install
2. Watch auto-discovery complete on their real app
3. See a generated city representing discovered structure
4. Observe a real request path with event/job continuation when present
5. Click at least one element and receive accurate detail
6. Encounter honest quiet/degraded states when applicable

### Explicitly deferred from first-session MVP

| Item | Why deferred |
|---|---|
| Forced product tour | Blocks Aha |
| AI narrative of the city | Assistant later; comprehension first |
| Shareable session replay links | Team stage later |
| Full historical playback | Storage architecture later |
| Advanced city customization | Power-user later |
| Multi-app switcher | SaaS/team later |

### Handoff to next chapters

When first-time experience is defined and protected, product work expands outward:

```text
First-Time Experience
        ↓
Feature Brainstorm (what can exist without harming Aha)
        ↓
MVP boundary (what must exist to keep Aha)
```

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 7: Installation Journey](./InstallationJourney.md) |
| **Next chapter** | [Chapter 9: Feature Brainstorm](./FeatureBrainstorm.md) |
| **Related documents** | [Vision](./Vision.md) · [Mission](./Mission.md) · [Problem Statement](./ProblemStatement.md) · [Target Audience](./TargetAudience.md) · [Personas](./Personas.md) · [User Journey](./UserJourney.md) · [Installation Journey](./InstallationJourney.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | All changes require review. Version increment on material changes. |

---

*The first-time experience is Pulse's thesis made visceral. If developers do not feel the Aha here, no roadmap item downstream can compensate.*
