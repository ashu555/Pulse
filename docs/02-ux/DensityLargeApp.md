# Density & Large-App Strategies

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 10 — Density & Large-App Strategies  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Keeps the city legible as applications grow from tens to thousands of routable units. Unreadability is a defect.

---

## Density Levels

| Level | Approx. signal | UX posture |
|---|---|---|
| **S** | Small app | Show buildings directly; light clustering |
| **M** | Mid | District clusters by namespace/path |
| **L** | Large | Multi-level clustering; progressive reveal |
| **XL** | Extreme monolith | Overview districts only + search/focus required |

Thresholds are heuristic; engineering may tune. UX requires automatic level selection with manual expand.

---

## Clustering Rules

1. Prefer **namespace / path segment / domain folder** heuristics.  
2. Cluster label must be human (`Billing`, `Admin`, `Api\V1`).  
3. Cluster shows **counts** (buildings/routes).  
4. Click cluster → zoom expand or inspector summary.  
5. “Other” overflow cluster allowed; never invent members.  

---

## Progressive Reveal

```text
World overview (districts)
  → District expand (buildings)
    → Building inspect
```

Deepest level not required for Aha—path focus can surface only involved nodes.

---

## Live Traffic Density

| Problem | Strategy |
|---|---|
| Too many travelers | Visually sample; prioritize selected/followed/newest |
| Path spaghetti | Focus mode defaults when concurrency high |
| Edge clutter | Bundle parallel roads; emphasize active |

Sampling visual actors ≠ fabricating actors. Shown subset must be real.

---

## Focus as Density Valve

When node count high, prompt once:

```text
Tip: Press F to focus a single request path.
```

Do not auto-trap users permanently in focus.

---

## Search (P1 / Large-app requirement)

Entity search by class, route, job name. Result selects + frames camera.

MVP: ship if large-app dogfood fails without it; otherwise P1 ASAP after MVP.

---

## Layout Stability Under Growth

Adding new buildings should minimize global shuffle (Ch 2 stability rule). Prefer local insertion.

---

## Acceptance Criteria

- [ ] Auto clustering kicks in before illegibility  
- [ ] Clusters labeled + counted  
- [ ] Focus mode usable as density escape hatch  
- [ ] No fake nodes to “fill” space  
- [ ] XL apps still allow path storytelling via focus  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 9: Empty, Error & Degraded Patterns](./EmptyErrorDegraded.md) |
| **Next** | [Ch 11: Accessibility Spec](./AccessibilitySpec.md) |

---

*A city that can’t be read isn’t smart—it’s smog. Density control is oxygen.*
