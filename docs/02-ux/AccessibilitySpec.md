# Accessibility Spec

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 11 — Accessibility Spec  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Concrete accessibility requirements for Pulse MVP UX. Target: **WCAG 2.1 AA** for primary application chrome and inspector; canvas conveys meaning through non-motion, non-color-only channels.

---

## Scope

| In scope | Notes |
|---|---|
| HUD, inspector, dialogs, discovery panel | Full AA aim |
| Canvas meaning | Equivalent info in inspector/timeline |
| Keyboard operation | Primary flows |
| Reduced motion | Required |
| Screen reader | Critical statuses & inspector content |

Canvas-as-raw-SVG may not be fully SR-narrated node-by-node in MVP; **selection must expose accessible names** and inspector must carry details.

---

## Perceivable

| ID | Requirement |
|---|---|
| A11Y-P1 | Text contrast ≥ 4.5:1 for normal UI text on panels |
| A11Y-P2 | State not by color alone (fail/success/running) |
| A11Y-P3 | Discovery progress available as text/live region |
| A11Y-P4 | Motion not sole carrier of meaning |
| A11Y-P5 | Redacted fields explicitly labeled |

---

## Operable

| ID | Requirement |
|---|---|
| A11Y-O1 | Keyboard: open Pulse UI, run through discovery visible states, select entity, open/close inspector, toggle focus, dismiss follow |
| A11Y-O2 | Visible focus rings (`focus.ring` token) |
| A11Y-O3 | Esc clears layered UI safely |
| A11Y-O4 | Hit targets ≥ 24px where feasible for controls |
| A11Y-O5 | No keyboard trap in inspector |

---

## Understandable

| ID | Requirement |
|---|---|
| A11Y-U1 | Consistent dual-label pattern |
| A11Y-U2 | Error copy actionable |
| A11Y-U3 | Quiet vs error visually distinct |
| A11Y-U4 | Shortcut help documents keys |

---

## Robust

| ID | Requirement |
|---|---|
| A11Y-R1 | Semantic HTML for panels (headings, lists, buttons) |
| A11Y-R2 | ARIA only when needed; prefer native |
| A11Y-R3 | Live regions for discovery complete, hard errors, follow start/stop |

---

## Canvas-Specific Guidance

1. Selected entity exposes `aria-label` e.g. `Building OrderController@store`  
2. Moving actors: SR users rely on inspector timeline; optional polite announcement of “Request completed” debounced  
3. Don’t announce every particle move  

---

## Reduced Motion

Honor OS preference + in-app toggle (Ch 6 contract). Store preference locally.

---

## Testing Requirements

| Test | Cadence |
|---|---|
| Keyboard-only first-run script | Each release candidate |
| Contrast check panels | Each visual token change |
| Screen reader smoke (VoiceOver/NVDA) inspector | Each minor |
| Reduced motion first-run | Each RC |

---

## Acceptance Criteria

- [ ] A11Y-P/O/U/R IDs above met for MVP chrome  
- [ ] Fail states identifiable without color  
- [ ] Reduced-motion first-run passes  
- [ ] Focus never lost invisibly  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 10: Density & Large-App Strategies](./DensityLargeApp.md) |
| **Next** | [Ch 12: Component Inventory](./ComponentInventory.md) |

---

*Accessibility is how truth stays available to every developer who needs to see it.*
