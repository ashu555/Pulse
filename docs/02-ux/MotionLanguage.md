# Motion Language

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 6 — Motion Language  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Defines what may move, why it moves, how long it moves, and how motion degrades. Implements UX Principles motion laws as a concrete language.

---

## Motion Taxonomy

| Code | Name | Purpose | Example |
|---|---|---|---|
| M1 | **Appear** | Existence | Building rises into city |
| M2 | **Traverse** | Travel along structure | Traveler along road |
| M3 | **Relay** | Causal handoff | Messenger departs |
| M4 | **Settle** | Completion | Request ends successfully |
| M5 | **Alert** | Failure emphasis | Job fail pulse (finite) |
| M6 | **Attention** | Soft guidance | Newest path highlight |
| M7 | **Camera** | Framing | Follow / fit |

Forbidden: **M0 AmbientFake** — looping citizens, random sparks, false load.

---

## Timing Tokens (Guidance)

| Token | Range | Use |
|---|---|---|
| `motion.instant` | 0–100ms | Snaps under reduced motion / microfeedback |
| `motion.fast` | 150–250ms | Selection, small settles |
| `motion.base` | 300–500ms | Appear, short traversals (schematic) |
| `motion.path` | 400–1200ms | Path storytelling (may compress long real durations) |
| `motion.build` | staggered ≤ 800ms total feel for MVP small cities | City build |

### Time compression rule

UI may compress long real durations for watchability, but:

1. Timeline panel shows true durations  
2. Causal order preserved  
3. Compression never invents steps  

---

## Easing Guidance

- Traversals: gentle in-out; avoid elastic bounce (toy signal)  
- Failures: short emphasis, then static (don’t hysterically loop)  
- Prefers clarity over “juice”

---

## Causal Choreography (Request Story)

Default sequence when data present:

1. Traveler **Appear** at gate (M1)  
2. **Traverse** road segments (M2)  
3. Arrive building (M2/M4 short)  
4. For each event: **Relay** messenger (M3)  
5. For each job: train **Appear** + move station→yard (M2)  
6. Terminal **Settle** or **Alert** (M4/M5)

If events/jobs missing: still complete traveler story honestly.

---

## City Build Choreography

1. District labels fade/appear  
2. Buildings appear by district clusters  
3. Roads draw/connect  
4. Async landmarks last  

Reduced motion: final frame only (or opacity fades ≤100ms).

---

## Failure Motion

- Finite (1–2 pulses max), then persistent static fail glyph  
- Must include non-color channel (icon/shape)  
- Screen-reader: status text update  

---

## Follow Camera Motion

- Low-frequency smoothing  
- Cancel on user input immediately  
- Reduced motion: discrete recentering  

---

## Performance Budgets (UX)

| Condition | Policy |
|---|---|
| Many concurrent travelers | Sample visually; prefer focus on newest/selected |
| Pan in progress | Reduce non-selected motion |
| Polling gap | Idle; don’t interpolate false midpoints beyond honesty |
| Tab hidden | Pause animations |

---

## Reduced Motion Contract

When `prefers-reduced-motion: reduce` (or in-app toggle):

| Still required | Changed |
|---|---|
| State visible in inspector/timeline | No path tweening |
| Fail/success glyphs | No looping emphasis |
| Selection feedback | Instant |
| Discovery progress | Textual, not only animated bars |

---

## Acceptance Criteria

- [ ] Only M1–M7 used in real mode  
- [ ] No ambient fake actors  
- [ ] Causal order tests in storytelling scenarios  
- [ ] Reduced-motion path completable  
- [ ] True timings available in inspector even when motion compressed  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 5: Inspector UX](./InspectorUX.md) |
| **Next** | [Ch 7: Visual Foundations](./VisualFoundations.md) |

---

*Motion is a verb for truth—not a soundtrack for boredom.*
