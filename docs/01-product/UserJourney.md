# User Journey

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 6 — User Journey  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Journey Summary](#journey-summary)
2. [Journey Philosophy](#journey-philosophy)
3. [Relationship to Later Chapters](#relationship-to-later-chapters)
4. [Master Journey Map](#master-journey-map)
5. [Stage-by-Stage Journey](#stage-by-stage-journey)
6. [Persona Journey Narratives](#persona-journey-narratives)
7. [Emotional Journey](#emotional-journey)
8. [Critical Moments of Truth](#critical-moments-of-truth)
9. [Failure Points and Recovery](#failure-points-and-recovery)
10. [Journey Metrics](#journey-metrics)
11. [Product Implications](#product-implications)
12. [Journey Prioritization for MVP](#journey-prioritization-for-mvp)

---

## Journey Summary

Pulse does not succeed when someone star-stars a GitHub repository.  
Pulse succeeds when a developer **ships a request, watches it move through their city, understands something they could not see before, and comes back the next day**.

The user journey is the sequence of experiences that takes a Laravel developer from:

> *"I wish I could see what this app is doing"*

to:

> *"I cannot imagine working on a Laravel app without Pulse."*

This chapter defines that journey end to end—from discovery through habitual use—and identifies the moments where Pulse either earns trust or loses it forever.

---

## Journey Philosophy

### Journey is a product requirement

User journeys are not soft documentation. They are product constraints. Every UI screen, collector, animation, error message, and install command must serve a specific stage of this journey.

### First session beats feature depth

A developer who never experiences the "Aha!" moment will not care that Pulse has advanced architecture exploration later. The journey prioritizes **first comprehension**, then depth, then team adoption.

### Reality over rehearsal

Every journey in this document assumes real application behavior—not demo traffic. If the city is empty because nothing is running, the journey should still feel honest and useful, never fake.

### Progress without interruption

Developers protect cognitive load. The journey must never force:

- mandatory account creation before value
- mandatory configuration before discovery
- mandatory tutorial before visualization
- mandatory reading before observation

### Four journeys, one product

Pulse serves multiple personas, but v1 optimizes around four journey archetypes:

| Archetype | Primary persona | Core job |
|---|---|---|
| **Debug journey** | Maya (Backend Engineer) | Understand a failing/slow path |
| **Comprehension journey** | Aarav (Senior Laravel Developer) | See the invisible execution graph |
| **Onboarding journey** | Isha (New Team Member) | Understand unfamiliar codebase fast |
| **Validation journey** | Neha (Software Architect) | Compare intended architecture to runtime |

---

## Relationship to Later Chapters

This chapter is the **master map**. Later product chapters drill into specific segments:

| Later chapter | Focus |
|---|---|
| **Chapter 7: Installation Journey** | Discovery → install → package boot → environment readiness |
| **Chapter 8: First-Time Experience** | First 60 seconds, discovery animation, city build, first request |

Chapter 6 connects those moments into the larger lifecycle: awareness → retention → advocacy.

---

## Master Journey Map

```
Awareness
    ↓
Consideration
    ↓
Installation
    ↓
First Session  ←── "Aha!" moment must happen here
    ↓
First Real Job  ←── debugging / onboarding / validation
    ↓
Habitual Use
    ↓
Team Sharing
    ↓
Advocacy
```

| Stage | Time horizon (target) | Success signal |
|---|---|---|
| Awareness | Before install | "This might be what I need" |
| Consideration | Minutes | "Worth trying on my app" |
| Installation | < 5 minutes | Package installed, dashboard reachable |
| First Session | < 60 seconds to city; < 5 minutes to Aha | "It already knows my app" then "I can see it think" |
| First Real Job | Same session or same day | Solves one real debug/onboarding/validation question |
| Habitual Use | Days 2–14 | Opens Pulse before logs/Telescope by default |
| Team Sharing | Week 1–4 | Shows a teammate or uses in stand-up/review |
| Advocacy | Ongoing | Recommends Pulse publicly or on another project |

---

## Stage-by-Stage Journey

### Stage 1 — Awareness

**Trigger:** The developer feels the invisibility problem acutely.

High-signal entry points:

- A hard-to-trace bug spanning request → event → job
- Slow onboarding for a new teammate
- Architecture review where diagrams conflict with lived experience
- Frustration after tool-hopping (Telescope → Horizon → logs → Debugbar)
- Seeing a demo GIF, conference talk, blog post, or GitHub README

**Mental state:** Curious but skeptical. Developer-tool fatigue is real. They have seen many "revolutionary" products that were dashboards with prettier CSS.

**What Pulse must communicate immediately:**

- This is not Telescope clone
- This is not Datadog for Laravel
- This is a living visualization of real runtime behavior
- Zero-config install promise is credible

**Outcome needed:** Enough curiosity to try on a real project.

---

### Stage 2 — Consideration

**Trigger:** The developer evaluates whether Pulse fits their stack and workflow.

They look for answers to:

| Question | Trust signal they need |
|---|---|
| Will this break my app? | Package is observational / uninstall is clean |
| Will setup waste an afternoon? | Composer install + auto-discovery |
| Does this know Laravel deeply? | First-class Laravel integration language |
| Is this serious engineering? | Docs quality, architecture clarity, repo polish |
| Will it work on my size of app? | Mid/large Laravel apps are explicitly supported |

**Mental state:** Risk assessment. They are judging the project as much as the demo.

**What Pulse must communicate:**

- Laravel-first credibility
- Open-source permanence
- Non-invasive installation
- Complementary stance toward Telescope/Horizon

**Outcome needed:** Decision to install.

---

### Stage 3 — Installation

**Trigger:** `composer require ...` (or equivalent package install path).

This stage is detailed in [Chapter 7: Installation Journey](./InstallationJourney.md). At master-journey level, installation succeeds when:

1. Package installs without code changes
2. Service provider is auto-discovered
3. Dashboard URL is reachable
4. Collectors begin observing automatically
5. No forced config file editing is required for the happy path

**Mental state:** Impatient. Any friction here risks abandonment before the Aha moment.

**Failure conditions:**

- Manual provider registration required with no clear error
- Missing extension obscures the real problem
- Dashboard 500s with opaque message
- "Configure collectors first" wall before anything is shown

**Outcome needed:** Developer opens dashboard ready for discovery.

---

### Stage 4 — First Session (The "Aha!" Sequence)

This is the emotional and commercial center of Pulse.

#### Act 1 — Discovery

Target: city visible within **60 seconds**.

```
Welcome to Pulse.
Let's discover your application...

Routes...        ██████████
Events...        ██████████
Queues...        ██████████
Controllers...   ██████████
Jobs...          ██████████

Done.
The city builds itself.
```

First Aha: *"It already knows my application."*

#### Act 2 — Observation

Developer triggers a real action (or watches existing traffic).

They see a request enter, pass middleware, hit controllers/services, fire events, dispatch jobs—animated and inspectable.

Second Aha: *"I can see my application think."*

This stage is detailed in [Chapter 8: First-Time Experience](./FirstTimeExperience.md).

**Outcome needed:** Emotional conversion from skeptic to believer.

---

### Stage 5 — First Real Job

The Aha moment creates belief. The first real job creates habit.

In the same session or same day, the developer should use Pulse to complete one concrete job from a primary persona:

| Job type | Example | Persona |
|---|---|---|
| **Debug** | Why does checkout fail for saved payment methods? | Maya |
| **Trace** | What fires after `OrderCreated`? | Aarav |
| **Onboard** | What happens when a user registers? | Isha |
| **Validate** | Does inventory update still go through the intended event flow? | Neha |

If Pulse only looks impressive but cannot answer the developer's actual question, retention collapses.

**Outcome needed:** One solved real problem attributed to Pulse.

---

### Stage 6 — Habitual Use

**Trigger:** The developer faces the next debugging/onboarding/architecture question and chooses Pulse first.

Habitual use indicators:

- Opens Pulse before opening log files
- Uses Pulse during PR review of behavior-critical changes
- Checks the city after deploying a risky flow
- Inspects events/jobs visually instead of reconstructing from Horizon + Telescope tables

**What Pulse must sustain:**

- Low overhead trust
- Predictable accuracy
- Fast load / realtime freshness
- Clear empty states when traffic is quiet

**Outcome needed:** Pulse becomes part of the default engineering loop.

---

### Stage 7 — Team Sharing

**Trigger:** The developer shows someone else what they saw.

Examples:

- "Look at this request path—here is where it stalls."
- Screen share during incident triage
- Walk a new hire through the city on day one
- Use a city screenshot/export in architecture review

Team sharing is the bridge from individual utility to team adoption.

**Outcome needed:** Second user experiences value without selling effort from founders.

---

### Stage 8 — Advocacy

**Trigger:** The developer recommends Pulse beyond their own team.

Examples:

- Adds Pulse to another company project
- Mentions Pulse in a blog, talk, Discord, or Twitter/X thread
- Opens a "good first issue" contribution
- Stars, sponsors, or writes docs/examples

Advocacy is not vanity. It is how open-source developer tools compound.

**Outcome needed:** Organic acquisition and contribution growth.

---

## Persona Journey Narratives

### Journey A — Maya's Debug Day (P1 Backend Engineer)

**Context:** Checkout intermittently fails for users with saved payment methods.

| Stage | Maya's experience with Pulse |
|---|---|
| Awareness | Already frustrated after Telescope + Horizon + logs fail to show the full cascade |
| Install | Installs package on staging clone; city appears quickly |
| First Session | Watches a checkout request travel landmark by landmark |
| First Real Job | Clicks a failed train (job) and sees the charge listener timeout after a cache miss |
| Habit | Keeps Pulse open while reproducing the bug three more times |
| Share | Sends the flow to Aarav with timestamps attached |
| Outcome | Bug fixed same day; Maya trusts Pulse for the next ambiguous incident |

**Before Pulse:** hours of reconstructing fragmented evidence.  
**After Pulse:** minutes of observing the cascade.

---

### Journey B — Aarav's Comprehension Gate (P1 Senior Laravel Developer)

**Context:** New service layer + event architecture was introduced six months ago. Aarav still answers "how does this work?" for everyone else.

| Stage | Aarav's experience |
|---|---|
| Awareness | Tired of redrawing mental maps whiteboarding for juniors |
| First Session | City reflects services as buildings and events as messengers without him drawing anything |
| First Real Job | Uses city during a design review to prove an unintended listener still fires |
| Habit | Opens Pulse before design discussions |
| Share | Makes Pulse the default onboarding artifact for the team |
| Outcome | Aarav's knowledge becomes visible infrastructure, not tribal memory |

---

### Journey C — Isha's First Week (P2 New Team Member)

**Context:** Day 2 on a legacy e-commerce Laravel monolith.

| Stage | Isha's experience |
|---|---|
| Awareness | Overwhelmed by `app/` directory size and sparse docs |
| First Session | City gives her a map without asking her to reverse-engineer every class |
| First Real Job | Follows registration flow end to end by watching a real request |
| Habit | Explores unknown areas by triggering actions and observing |
| Share | Asks better questions in stand-up ("I saw InventoryUpdated fire—is that intended?") |
| Outcome | First meaningful PR by end of week instead of end of month |

---

### Journey D — Neha's Architecture Validation (P1 Software Architect)

**Context:** Team claims the inventory system is fully event-driven. Neha suspects sync shortcuts remain.

| Stage | Neha's experience |
|---|---|
| Awareness | Diagram and recent Outage #17 flash conflict |
| First Session | City shows unexpected direct repository writes from controller |
| First Real Job | Captures evidence for architecture review |
| Habit | Uses Pulse as runtime acceptance criteria for architectural RFCs |
| Share | Attaches city evidence to ADR update |
| Outcome | Architecture decisions become runtime-verified |

---

## Emotional Journey

Pulse must manage emotion as carefully as information.

| Stage | Desired emotion | Risk emotion | Design response |
|---|---|---|---|
| Awareness | Curiosity | Cynicism | Honest positioning, no hype language |
| Consideration | Cautious hope | Fear of risk | Non-invasive guarantees |
| Installation | Momentum | Frustration | Zero-config happy path |
| Discovery | Surprise / delight | Confusion | Clear progress + recognizable app structure |
| First live request | Wonder + understanding | Disbelief or distrust | Accurate timing/order + inspectability |
| First real job | Relief / confidence | Disappointment | Details that answer the actual question |
| Habitual use | Dependence (healthy) | Annoyance at noise | Filters, focus modes, quiet empty states |
| Team sharing | Pride | Embarrassment if inaccurate | Accuracy above spectacle |
| Advocacy | Belonging | Fatigue | Easy share paths, public docs quality |

The competitive advantage is not animation alone. It is **delight that survives technical scrutiny**.

---

## Critical Moments of Truth

These moments decide retention. They must be designed, measured, and protected.

### Moment 1 — Repository first impression

Before install. README, demo, architecture clarity. If this fails, there is no journey.

### Moment 2 — Install to dashboard

From Composer to a working UI. Every failure here is near-fatal.

### Moment 3 — City self-build

Auto-discovery must feel magical and correct. Misidentified buildings destroy trust immediately.

### Moment 4 — First animated request

The product thesis is proven or disproven here.

### Moment 5 — First inspection click

Beauty is insufficient. Clicking a person/building/messenger must answer a developer question.

### Moment 6 — First quiet city

If no traffic is flowing, empty state authenticity matters. Fake demo traffic is forbidden.

### Moment 7 — First share moment

If sharing is hard or visuals feel unserious, team adoption stalls.

### Moment 8 — Day 3 return

Habit forms if Pulse remains useful during ordinary work, not only the launch moment.

---

## Failure Points and Recovery

| Failure point | User reaction | Recovery principle |
|---|---|---|
| Install fails | Abandons | Actionable errors + docs deep links; no silent failures |
| City empty and unexplained | Assumes product is broken | Honest empty state: "Your app is quiet. Trigger a request." |
| Visualization feels decorative | Loses trust | Every motion encodes real data |
| Latency too high | Feels useless for debugging | Sub-second realtime aim for live flows |
| Overhead noticeable | Uninstalls | Measure, publish, allow reduced collection modes |
| Misattributed event linkage | Actively distrusts | Prefer showing less over showing wrong |
| Overwhelming city | Cognitive overload | Progressive disclosure; filters; focus on one request |

**Product rule:** when uncertain, fail honest. Quiet > wrong. Sparse accuracy > dense fiction.

---

## Journey Metrics

Journey health is measured by stage conversion and time-to-value.

### North-star journey metric

**Time from install → first explained real request understood by the user.**

Target: **under 5 minutes** for P1/P2 personas.

### Funnel metrics

| Metric | Target |
|---|---|
| Install → dashboard open | > 90% |
| Dashboard open → city visible | > 95% within 60 seconds |
| City visible → first request observed | > 70% same session |
| First observation → first inspection click | > 60% |
| Session → return within 7 days | > 40% (early beta: directional) |
| User → teammate shared in 30 days | Track qualitatively then quantitatively |

### Qualitative checkpoints

Ask in interviews/beta:

1. What did you understand in the first five minutes that you did not understand before?
2. When did you first trust the visualization?
3. When did you almost uninstall, and why?
4. What would make you open Pulse before Telescope tomorrow?

---

## Product Implications

### Must exist before messaging scale

Do not drive traffic to Pulse until Moments 2–5 are reliable. Advocacy without first-session integrity creates lasting distrust.

### UX hierarchy

1. Discovery clarity
2. Request trace accuracy
3. Inspection usefulness
4. Visual delight
5. Advanced architecture tooling

Delight is required—but only after accuracy and clarity.

### Content hierarchy

README and docs should follow the journey:

1. What pain this solves
2. 60-second install promise
3. Aha sequence
4. Real debugging example
5. Architecture trust signals

### Engineering hierarchy for MVP

Build collectors and realtime path that max out Stages 3–5 before investing(heavy) in Stages 7–8 tooling (shareable sessions, org features). Org features amplify journeys that already work; they do not create them.

---

## Journey Prioritization for MVP

MVP journey scope is intentionally narrow:

### In MVP

- Awareness content (README/demo)
- Installation happy path
- Discovery + city build
- Live request/event/queue observation
- Inspection of one request end to end
- Honest empty/error states
- Enough quality to enable Day-1 sharing via screenshare

### Deferred post-MVP (but journey-aware)

| Capability | Stage it serves | Why deferred |
|---|---|---|
| Historical replay | Habitual use / validation | Needs durable storage model |
| Shareable session links | Team sharing | Needs auth/session model |
| AI explanations | First real job / learners | Needs stable visualization first |
| Multi-app org dashboard | Team/advocacy scale | SaaS concern |
| Cross-framework journeys | Awareness expansion | Laravel-first constraint |

### MVP journey contract

If a developer can:

1. Install Pulse,
2. Watch their city build,
3. Observe a real request,
4. Inspect enough detail to answer one real question,

...then the master user journey is fulfilled for v1.

Everything else is expansion of a proven path.

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 5: Personas](./Personas.md) |
| **Next chapter** | [Chapter 7: Installation Journey](./InstallationJourney.md) |
| **Related documents** | [Vision](./Vision.md) · [Mission](./Mission.md) · [Problem Statement](./ProblemStatement.md) · [Target Audience](./TargetAudience.md) · [Personas](./Personas.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | All changes require review. Version increment on material changes. |

---

*A product without a journey is a feature list. This chapter defines the path Pulse users take from skepticism to inevitability—and where we must never lose them.*
