# Success Metrics

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 15 — Success Metrics  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Metrics Statement](#metrics-statement)
2. [Metric Philosophy](#metric-philosophy)
3. [North-Star Metric](#north-star-metric)
4. [Metric Layers](#metric-layers)
5. [Product Truth Metrics](#product-truth-metrics)
6. [Journey Funnel Metrics](#journey-funnel-metrics)
7. [Quality and Trust Metrics](#quality-and-trust-metrics)
8. [Adoption and Ecosystem Metrics](#adoption-and-ecosystem-metrics)
9. [Version 2 and Later Metrics](#version-2-and-later-metrics)
10. [SaaS Metrics (Later Horizon)](#saas-metrics-later-horizon)
11. [Qualitative Research Cadence](#qualitative-research-cadence)
12. [Anti-Metrics and Vanity Traps](#anti-metrics-and-vanity-traps)
13. [Instrumentation Ethics](#instrumentation-ethics)
14. [Scorecards and Review Cadence](#scorecards-and-review-cadence)
15. [Targets by Phase](#targets-by-phase)
16. [Handoff](#handoff)

---

## Metrics Statement

**Pulse succeeds when developers understand real Laravel behavior faster and more accurately than before—and keep returning to Pulse as the default window into their application.**

Metrics exist to protect that outcome.  
They do not exist to decorate a README with vanity counters.

---

## Metric Philosophy

1. **Prefer comprehension outcomes over engagement theater**
2. **Prefer evidence from real apps over demo sessions alone**
3. **Quantify funnels; qualify Aha with interviews**
4. **Separate OSS attention from product truth**
5. **Never instrument in ways that violate redaction/trust commitments**
6. **Ship fewer metrics that change decisions over many metrics that change nothing**

If a metric cannot change a roadmap decision or expose Mission drift, it is optional.

---

## North-Star Metric

### Primary north star

**Time from install → first explained real request/path understood by the user**  
(“Time-to-double-Aha”)

| Aspect | Definition |
|---|---|
| **Start** | Successful package install / dashboard open |
| **End** | User has seen discovery city + observed a real path + completed at least one meaningful inspection |
| **Target (MVP)** | ≤ **5 minutes** median on supported local setups |

### Supporting north star (retention proxy)

**Weekly active debugging sessions where Pulse is opened before log/Telescope-hopping** among dogfood and beta cohorts.

This is harder to measure broadly early; use interviews + optional telemetry later.

---

## Metric Layers

```text
L1  Product Truth (does Aha work?)
L2  Journey Funnel (where do people drop?)
L3  Quality & Trust (do we deserve install?)
L4  Adoption & Ecosystem (is it spreading healthily?)
L5  Commercial (SaaS later — never overrides L1)
```

L5 never outranks L1.

---

## Product Truth Metrics

These prove the thesis. They are MVP launch gates.

| ID | Metric | Target | Source |
|---|---|---|---|
| T1 | Install → city visible | < 60s | Timed dogfood / beta probes |
| T2 | Request → visible animation | < 5s realtime; usable under polling | Lab + beta |
| T3 | Realtime latency (websocket path) | < 1s preferred | Instrumentation |
| T4 | Zero-config install success (supported apps) | > 95% | Cold-start tests |
| T5 | First-session inspection rate | > 60% of dashboard opens | Privacy-safe analytics or moderated tests |
| T6 | Discovery completion rate | > 95% | Product events |
| T7 | Qualitative Aha reaction | Dominant positive quote pattern | Interviews |

### Pass/fail qualitative gate

Enough users independently say some version of:

> “I’ve never seen Laravel visualized like this.”

Absence of that sentiment after polish is a product failure, not a marketing failure.

---

## Journey Funnel Metrics

Aligned with Chapters 6–8.

| Stage | Metric | Early target |
|---|---|---|
| Awareness → try | README CTA → Composer require (approx.) | Directional |
| Install → dashboard | Success rate | > 90% |
| Dashboard → discovery complete | Success rate | > 95% |
| Discovery → city rendered | Success rate | > 98% |
| City → first observed request | Same-session rate | > 70% when traffic possible |
| Observation → first inspection | Rate | > 60% |
| Day 0 → Day 7 return | Return rate | > 40% directional in beta |
| User → teammate share | Share events | Qualitative first |

Drop-offs identify whether friction is install, discovery, empty-state, or inspection usefulness.

---

## Quality and Trust Metrics

| ID | Metric | Target | Why |
|---|---|---|---|
| Q1 | Fake-data pathway count | **0** | Honesty |
| Q2 | Default secret-leakage incidents | **0** critical | Trust |
| Q3 | Incorrect causality false-positive rate | Minimize; prefer “unknown” | Trust |
| Q4 | Plugin boot isolation failures affecting core Aha | **0** P0 | Stability |
| Q5 | Automated test pass on main | Green | Engineering |
| Q6 | Documented overhead published | Yes | Honesty |
| Q7 | Non-local exposure default safety audits | Pass each release | Security |
| Q8 | Cold-start docs walkthrough passes | Pass each minor | Docs = product |

Trust metrics can block release even if feature metrics look good.

---

## Adoption and Ecosystem Metrics

| ID | Metric | Healthy reading | Caution |
|---|---|---|---|
| A1 | GitHub stars | Social proof | Vanity if Aha weak |
| A2 | Packagist downloads | Adoption | Inflated by CI |
| A3 | Unique installing projects (best-effort) | Real spread | Hard to measure |
| A4 | Inbound issues with repro | Quality community | Noise |
| A5 | External PRs merged | Ecosystem health | Drive-by junk |
| A6 | Time-to-first external contribution | Onboarding strength | |
| A7 | Community plugins listed | Extensibility | Low-quality flood |
| A8 | Mentions in Laravel Discords/blogs/talks | Narrative spread | Hype cycles |

Open Source Strategy (Chapter 14) owns community posture; this chapter defines what we count.

---

## Version 2 and Later Metrics

After MVP, add metrics that match Version 2 epics.

| Epic | Metric | Intent |
|---|---|---|
| Replay | % beta users replaying a path weekly | Memory value |
| Replay | Time to re-understand a past failure (study) | Faster than tool-hopping |
| Literacy | Enable rate of optional districts | Usefulness vs noise |
| Performance literacy | Use of bottleneck highlight in sessions | Comprehension-first perf |
| Export | Snapshot/export usage in reviews | Collaboration without SaaS |
| Playlists | New-hire playlist completion | Onboarding ROI |
| Contracts | External sample plugins shipped | Extensibility reality |
| AI optional | Attach rate + disable rate | Assistant, not dependency |

If replay exists but weekly replay ≈ 0 while star count rises, Version 2 missed the point.

---

## SaaS Metrics (Later Horizon)

Only after Chapter 12 entry gates.

| Metric | Intent |
|---|---|
| Time-to-first-hosted-Aha in trial | Same emotional discipline |
| Connector activation success | Cloud install quality |
| Shared artifacts / week / workspace | Collaboration value |
| 90-day workspace retention | Habit |
| % SaaS users still using OSS locally | Healthy dual-mode (good) |
| Paid conversion (Team) | Business health |
| Gross margin after storage | Sustainability |
| Sev-1 security incidents | Existential |

**Rule:** SaaS conversion never justifies shipping cloud-required local Aha.

---

## Qualitative Research Cadence

Numbers without narratives lie.

| Method | Cadence | Focus |
|---|---|---|
| 5–8 user interviews | Each major milestone | Aha honesty, trust, veto breaches |
| Moderated first-run tests | Pre-release | Chapters 7–8 contracts |
| Dogfood diary | Weekly internal | Debugging displacement |
| Issue thematic review | Monthly | Recurring friction clusters |
| Win/loss notes (SaaS later) | Ongoing | Why teams buy / churn |

### Standing interview questions

1. What did you understand in five minutes that you didn’t before?
2. When did you first trust or distrust the visualization?
3. What almost made you uninstall?
4. Did Pulse replace any step in your debug loop—or add one?
5. Would you install this on another project this month?

---

## Anti-Metrics and Vanity Traps

| Trap | Why dangerous | Replacement |
|---|---|---|
| Stars as DoD | Hype ≠ comprehension | Time-to-Aha |
| Lines of code | Misaligned with craft | Acceptance criteria |
| Number of collectors | Scope creep bait | Aha + literacy usefulness |
| Animation frame wow | Demo candy | Inspection success |
| Chatty AI usage | Fake intelligence theater | Evidence-cited help rate; disable freedom |
| Forum arguments won | Ego | Reproducible outcomes |

We may report stars publicly. We do not steer the company by them alone.

---

## Instrumentation Ethics

Pulse instruments customer apps carefully; it must instrument itself *more* carefully.

### Allowed early

- Local dogfood timing studies
- Opt-in beta telemetry
- Aggregated anonymous funnel events with no payloads

### Forbidden

- Shipping customer request payloads to Pulse analytics by default
- Silent phone-home from OSS core
- Identifying telemetry without disclosure

### Default posture for OSS core

**Telemetry off by default.**  
If added later, explicit opt-in + public docs + payload schema transparency.

Product metrics can be gathered via:

- release cold-start scripts in CI
- design partner reports
- optional beta channel

Do not violate Chapter 7/8 trust to measure Chapter 15.

---

## Scorecards and Review Cadence

### Weekly (build team)

- P0 bugs open
- CI health
- Dogfood blockers to Aha

### Per release candidate

- Product Truth T1–T7 gate review
- Security/redaction checklist
- Docs cold-start pass/fail

### Monthly / quarterly (Mission review)

Inherited from Mission accountability:

- Install-to-city health
- Fake-data incidents (must be zero)
- Contributor on-ramp health
- Scope-creep audit against non-goals
- Metric dashboard honesty check (are we gaming ourselves?)

### Public scorecard (README, selective)

Publish only metrics we can stand behind:

- Install-to-city target
- Latency targets
- Explicit non-goals
- Security policy link

Avoid public vanity theater during fragile pre-1.0 phases.

---

## Targets by Phase

### Phase MVP / v0.1

| Focus | Must-hit |
|---|---|
| Truth | T1–T7 |
| Funnel | Install→inspect basics |
| Trust | Q1–Q3, Q7–Q8 |
| Adoption | Directional only |

### Phase Version 2 / v0.2–v0.5

| Focus | Must-hit |
|---|---|
| Replay usage | Rising among actives |
| Export/playlist | Qualitative→quantitative |
| Contracts | ≥1 external-style plugin |

### Phase v1.0

| Focus | Must-hit |
|---|---|
| Reliability | Sustained gates green |
| Docs | Contributor + user complete |
| Naming | Brand collision resolved |
| Ecosystem | Registry seeds healthy |

### Phase SaaS

| Focus | Must-hit |
|---|---|
| Hosted Aha | Trial time targets |
| Dual-mode OSS usage | Remains common |
| Security | No severe tenant issues |

---

## Handoff

### To Chapter 16 — Risks

Metrics that degrade are leading risk indicators; map them to mitigations there.

### To Chapter 17 — Business Model

Commercial KPIs remain subordinate to Product Truth metrics.

### To Engineering / Analytics implementation later

This chapter defines *what* to measure. Implementation must honor telemetry ethics.

### One-sentence freeze

> **If Time-to-Aha regresses, Pulse is not succeeding—regardless of stars, revenue, or roadmap length.**

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 14: Open Source Strategy](./OpenSourceStrategy.md) |
| **Next chapter** | [Chapter 16: Risks](./Risks.md) |
| **Related documents** | [Mission](./Mission.md) · [MVP](./MVP.md) · [User Journey](./UserJourney.md) · [First-Time Experience](./FirstTimeExperience.md) · [Version 2](./Version2.md) · [SaaS Features](./SaaSFeatures.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | North-star changes require Mission review; version increment on material changes |

---

*Metrics are a mirror. Pulse looks into them to protect comprehension—not to perform productivity.*
