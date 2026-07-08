# Prototype Scripts & Usability Plan

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 13 — Prototype Scripts & Usability Plan  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Defines how we validate Pulse UX before and during implementation—tied to Volume 1 success metrics and the double Aha gates.

---

## Research Goals

1. Validate Time-to-double-Aha ≤ 5 minutes on supported local apps  
2. Detect trust breaks (fake, illegible, secret fear, wrong causality)  
3. Confirm quiet/degraded states are understood  
4. Confirm inspectors answer real questions for Maya/Aarav personas  
5. Prioritize density issues on larger apps  

---

## Methods

| Method | When | n guidance |
|---|---|---|
| Moderated first-run usability | Before MVP RC & each major UX change | 5–8 Laravel developers |
| Unmoderated task script (beta) | After private beta | 10+ |
| Dogfood diary | Continuous internal | Weekly notes |
| Heuristic review | Each UX PR cluster | 1–2 reviewers vs Ch 1 filter |
| A11y keyboard/SR smoke | Each RC | Ch 11 scripts |

---

## Participant Profile

Prefer:

- Mid/senior Laravel developers who have used Telescope or Horizon  
- At least 1 newer Laravel developer (Isha-like)  
- Mix of app sizes if possible  

Exclude from early tests (or debrief carefully): pure ops-only buyers expecting APM.

---

## Prototype Fidelity Stages

| Stage | Artifact | Goal |
|---|---|---|
| F1 | Clickable IA + discovery/city static mock | Comprehension of first-run |
| F2 | Motion prototype with sample **recorded real** fixture data (labeled) | Motion literacy; never pretend unlabeled fake is live |
| F3 | Instrumented alpha on real apps | True Aha timing |

**Rule:** Any fixture demo must be explicitly labeled “Fixture replay” if not live.

---

## Canonical Moderated Script (60 min)

### Setup (5)

Consent, stack survey, Telescope familiarity.

### Task 1 — First run (15) — critical

> Install is done. Open Pulse. Talk aloud. Stop when you understand what this app is and have watched or know how to watch a request.

**Success signals:** discovery understood; city recognized; quiet tip or live path; one inspection.

**Metrics:** time to city; time to first inspect; assist count.

### Task 2 — Narrate a path (10)

> Trigger `{endpoint}`. Explain what happened using the UI.

**Success:** causal narration including async if present.

### Task 3 — Failure find (10) — if fixture/live fail available

> Find what failed and where.

### Task 4 — Controls (10)

> Focus a path. Leave focus. Find live mode indicator. Open shortcuts.

### Debrief (10)

Standing questions from Volume 1 Success Metrics Ch 15.

---

## Scoring Rubric

| Score | Meaning |
|---|---|
| 3 | Unassisted success |
| 2 | Minor hint |
| 1 | Heavy assist |
| 0 | Fail / trust break |

**Ship gate intuition:** Task 1 average ≥ 2.5 across sessions before public MVP marketing push.

Hard fail flags (any occurrence = must fix):

- Believes quiet city is broken without reading tip after 60s  
- Sees fake/confused causality they trust incorrectly  
- Cannot find inspector value  
- Secret visible that should be redacted  

---

## Fixture Policy

- Prefer anonymized recordings from real dogfood apps  
- Label clearly  
- Never use fixture in “Live” chip mode  

---

## Reporting Template

```text
Date / build / participants
Task scores
Time-to-city / time-to-inspect median
Top 3 friction quotes
Trust incidents
A11y notes
Decisions / follow-ups (link issues)
```

---

## Continuous Dogfood Checklist (Weekly)

- [ ] Fresh install cold path  
- [ ] Quiet state copy still correct  
- [ ] One real debug used Pulse before Telescope  
- [ ] Polling mode forced once  
- [ ] Reduced motion once  

---

## Acceptance Criteria for Volume 2 Close

Volume 2 is planning-complete when:

- [ ] Chapters 1–13 exist and cross-linked  
- [ ] Usability script ready for F1+ testing  
- [ ] MVP UX quality bar (Ch 1) remains uncontradicted  
- [ ] Handoff to Volume 3 lists UX→architecture obligations  

---

## Handoff to Volume 3 — Architecture

Architecture must enable:

1. Fixture/live labeling integrity  
2. Correlation confidence flags for UI unknown states  
3. Redaction before UI serialization  
4. Transport mode signal for HUD chips  
5. Stable IDs for selection/focus across rediscovery  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 12: Component Inventory](./ComponentInventory.md) |
| **Next** | Volume 3 — Architecture (index TBD) |
| **Related** | [Success Metrics](../01-product/SuccessMetrics.md) · [First-Time Experience](../01-product/FirstTimeExperience.md) · [UX Vision](./UXVisionPrinciples.md) |

---

*We don’t ship vibes. We ship comprehension that survives contact with real developers.*
