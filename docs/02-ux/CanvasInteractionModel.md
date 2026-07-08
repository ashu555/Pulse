# Canvas Interaction Model

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 4 — Canvas Interaction Model  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Defines how users navigate and manipulate the city canvas—the primary surface of Pulse.

---

## Canvas Roles

| Role | Description |
|---|---|
| **World stage** | Infinite/pannable plane containing districts |
| **Camera** | Viewport transform (pan/zoom) |
| **Selection** | Currently highlighted entity |
| **Focus set** | Optional subset emphasized (path focus) |
| **Follow target** | Optional live entity camera tracks |

---

## Input Map (MVP)

| Input | Action |
|---|---|
| Drag background | Pan |
| Trackpad/scroll | Zoom toward pointer |
| Click entity | Select + open inspector |
| Click empty | Clear selection (inspector may collapse/idle) |
| Shift+drag / box (P1 if time) | Multi-select deferred if needed; MVP single-select OK |
| Esc | Clear follow; clear focus; then clear selection (layered) |
| F | Toggle focus on selected path/entity |
| Space / Follow toggle | Toggle follow-camera when live target exists |
| +/- or `[` `]` | Zoom steps |
| `?` | Shortcut sheet |

Exact keys finalized in Ch 8; behaviors here are binding.

---

## Camera Rules

1. Zoom range clamped (legible icons at min; overview at max).  
2. Zoom focuses around cursor/focal point.  
3. First city-ready frame: auto-fit to content with padding.  
4. Follow-camera: smooth tracking; user pan interrupts follow and disables it.  
5. Reduced motion: snap camera vs easing.

---

## Selection Rules

| Rule | Detail |
|---|---|
| Single selection MVP | One primary selected entity |
| Visual | Distinct selection affordance |
| Z-order | Selected + active path above ambient |
| Tooltip | Optional hover identity; click for inspector |
| Keyboard | Tab cycle among focusable entities in view (progressive enhancement) |

---

## Focus Mode

**Purpose:** Isolate one request path (traveler + related messengers/trains/buildings/roads).

| Behavior | Spec |
|---|---|
| Enter | `F` or HUD control with selection/path available |
| Effect | Non-path dimmed; path readable; ambient traffic reduced visually |
| Exit | `F` again, Esc, or HUD control |
| Empty | If no path, no-op + tip |

Focus must not hide failure states on the focused path.

---

## Follow Mode

| Behavior | Spec |
|---|---|
| Default first live request in first session | Soft follow ON once |
| Persistent preference | Remember “don’t auto-follow” for session/local preference |
| Interrupt | Manual pan/zoom cancels follow |
| Indicator | HUD shows “Following request …” with stop control |

---

## Hit Testing & Overlap

- Prefer smallest meaningful entity under cursor  
- Crowded clusters: click cluster → select cluster / zoom into district (Ch 10)  
- Moving actors remain clickable with slightly expanded hit area  

---

## Performance Interaction Constraints

- Prefer transforming camera vs reflowing world every frame  
- Pause non-essential ambient animations while panning if needed  
- Under polling lag, do not tween as if websocket-smooth without honesty  

---

## Gesture Anti-Patterns

1. Accidental select while panning (use drag threshold)  
2. Zoom that yanks away from user’s focus without indication  
3. Follow fighting user input  
4. Required right-click only actions  

---

## Acceptance Criteria

- [ ] Pan/zoom/select usable without docs  
- [ ] Esc layered clear works  
- [ ] Focus and follow exit easy  
- [ ] Auto-fit on city ready  
- [ ] Reduced-motion camera snaps  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 3: Discovery & First-Run UX Spec](./DiscoveryFirstRunUX.md) |
| **Next** | [Ch 5: Inspector UX](./InspectorUX.md) |

---

*The canvas is a telescope and a map. Interaction should disappear behind understanding.*
