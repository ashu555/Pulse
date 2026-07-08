# Visual Foundations

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 7 — Visual Foundations  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Defines the visual system tokens and rules so Pulse looks like one product—precise, calm, technical—without falling into generic AI-dashboard clichés.

This chapter sets **rules and roles** for color/type/space. Exact hex values may be refined in implementation as long as roles remain.

---

## Aesthetic Direction

**Wanted:** nocturnal workshop + city glass—clarity, depth, quiet neon accents for state.  
**Not wanted:** purple-gradient SaaS; cream-serif terracotta; dense paper newsprint UI; cartoon game HUD.

Brand mark may evolve with rename; visual system should not depend on provisional wordmark.

---

## Color Roles

| Role | Meaning | Notes |
|---|---|---|
| `canvas.bg` | World background | Deep neutral, not pure black if contrast suffers |
| `canvas.grid` | Optional subtle structure | Extremely low contrast |
| `surface.panel` | Inspector/HUD | Elevated over canvas |
| `surface.border` | Separators | Hairline, low contrast |
| `text.primary` | Main labels | High contrast on surfaces |
| `text.secondary` | Meta | |
| `text.inverse` | On bold chips | |
| `entity.road` | Roads | Distinct from bg |
| `entity.building` | Buildings | |
| `entity.station` | Stations | |
| `actor.request` | Travelers | Distinguish family |
| `actor.event` | Messengers | |
| `actor.job` | Trains | |
| `state.success` | OK | Pair with icon |
| `state.danger` | Fail | Pair with icon |
| `state.warning` | Degraded/unknown soft | |
| `state.info` | Live/polling info | |
| `focus.ring` | Keyboard/selection | Visible on both themes |
| `diff.dim` | Unfocused ambient | For focus mode |

### Rules

1. Never encode fail vs success by color alone.  
2. Entity families remain distinguishable in monochrome tests via shape.  
3. Dark mode is default preference for city; light mode supported.  
4. Avoid rainbow dashboards—reserve chroma for actors/states.

---

## Typography

| Role | Spec guidance |
|---|---|
| `font.ui` | Clean sans for HUD/inspector (system-safe stack OK; branded choice later) |
| `font.mono` | Route signatures, class names, ids |
| `size.hud` | Compact but ≥14px body on desktop panels where possible |
| `size.meta` | Secondary ≥12px |
| `weight` | Medium for titles; regular for body; avoid all-caps walls |

Dual-label pattern: metaphor in UI sans; Laravel identity in mono.

---

## Spacing & Radius

| Token | Guidance |
|---|---|
| Space scale | 4-based (4/8/12/16/24/32) |
| Panel padding | 16–20px |
| Radius | Modest (6–12px) for panels; city nodes may differ by shape language |
| Elevation | Panels float softly; avoid heavy skeuomorphism |

---

## Shape Language (Entities)

| Entity | Shape cue |
|---|---|
| Building | Rounded rect / block |
| Station | Platform / elongated marks |
| Gate | Arch / portal mark |
| Traveler | Dot/person glyph simplified |
| Messenger | Small chevron/pulse dart |
| Train | Capsule |
| Fail | Badge with distinct marker (e.g., ! in square) |

Shapes must remain distinguishable at minimum zoom.

---

## Iconography

- Sparse HUD icons with text labels preferred  
- Metaphor icons match Ch 2 dictionary  
- Don’t rely on icon-only for destructive/fail  
- Stroke consistency; avoid mixed filled/outline chaos  

---

## Elevation & Depth

Canvas may use subtle vignette/depth to make panels readable. Depth must not obscure path contrast.

Focus mode: ambient opacity reduction, not blur that destroys text.

---

## Dark / Light Parity

| Requirement | Both themes |
|---|---|
| State semantics | Same roles |
| Selection ring | Visible |
| Panel readability | WCAG AA target for text |
| Canvas actors | Distinguishable |

---

## Brand-Safe Don’ts

- Purple-on-white gradient hero chrome inside app  
- Confetti on discovery complete  
- Glassmorphism so heavy that text fails  
- Comic shadows on trains  

---

## Token Delivery (Engineering Handoff)

Implement as CSS variables / design tokens:

```text
--pulse-color-state-danger
--pulse-font-mono
--pulse-space-4
...
```

UI kit consumes tokens; no hard-coded one-offs for states.

---

## Acceptance Criteria

- [ ] Color roles documented in code tokens  
- [ ] Fail != success without color-only  
- [ ] Mono used for technical identities  
- [ ] Dark + light pass contrast checks for inspector text  
- [ ] Entity shapes distinct at min zoom  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 6: Motion Language](./MotionLanguage.md) |
| **Next** | [Ch 8: HUD / Navigation / Shortcuts](./HUDNavigationShortcuts.md) |

---

*Visual foundations make truth scannable. Taste without semantics is costume.*
