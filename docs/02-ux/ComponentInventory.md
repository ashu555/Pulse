# Component Inventory

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 12 — Component Inventory  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Lists UI components to implement for MVP (+ marked P1), mapped to principles and chapters. Implementation may rename, not drop P0 responsibilities.

---

## Foundations

| Component | P | Notes |
|---|---|---|
| `ThemeProvider` | P0 | Dark/light tokens |
| `Tokens` / CSS variables | P0 | Ch 7 |
| `Icon` | P0 | Metaphor set |
| `Button` | P0 | Primary/secondary/ghost |
| `IconButton` | P0 | HUD |
| `Chip` / `Badge` | P0 | Live mode, status |
| `Tooltip` | P0 | |
| `Popover` | P1 | |
| `Modal`/`ConfirmDialog` | P0 | Rare confirms only |
| `Toast` | P1 | Sparse |
| `Skeleton` | P0 | Inspector/discovery |
| `EmptyState` | P0 | Pattern wrapper |
| `ErrorState` | P0 | |
| `Banner` | P0 | Degraded transport |

---

## App Shell

| Component | P | Notes |
|---|---|---|
| `AppShell` | P0 | HUD + stage + inspector slots |
| `TopHud` | P0 | Ch 8 |
| `BottomHud` | P0 | |
| `ShortcutHelp` | P0 | |
| `SettingsDrawer` | P0 | Non-blocking |

---

## Discovery & First Run

| Component | P | Notes |
|---|---|---|
| `DiscoveryPanel` | P0 | Progress rows |
| `DiscoveryRow` | P0 | |
| `CityBuildOverlay` | P0 | Soft status |

---

## Canvas

| Component | P | Notes |
|---|---|---|
| `CityCanvas` | P0 | React Flow or equivalent host |
| `DistrictGroup` | P0 | |
| `BuildingNode` | P0 | |
| `GateNode` | P0 | |
| `StationNode` | P0 | |
| `WorkerYardNode` | P0 | |
| `RoadEdge` | P0 | |
| `TravelerActor` | P0 | |
| `MessengerActor` | P0 | |
| `TrainActor` | P0 | |
| `SelectionOverlay` | P0 | |
| `FocusDimLayer` | P0 | |
| `MiniMap` | P1 | Optional |
| `CanvasContextMenu` | P1 | Optional |

---

## Inspector

| Component | P | Notes |
|---|---|---|
| `InspectorDrawer` | P0 | |
| `InspectorHeader` | P0 | Dual-label |
| `Timeline` | P0 | |
| `TimelineStep` | P0 | |
| `KeyValueList` | P0 | Redaction-aware |
| `RedactedValue` | P0 | |
| `RelationLinks` | P0 | |
| `CopyIdButton` | P0 | |

---

## Controls

| Component | P | Notes |
|---|---|---|
| `FocusToggle` | P0 | |
| `FollowToggle` | P0 | |
| `LegendPeek` | P0 | |
| `LiveModeChip` | P0 | |
| `EnvBadge` | P0 | |
| `RediscoverButton` | P0 | |
| `CommandPalette` | P1 | |
| `EntitySearch` | P1 | Large apps |

---

## Composition Rules

1. Components consume **tokens**, not one-off colors for states.  
2. Actors never render without real data ids.  
3. `EmptyState` vs `ErrorState` never mixed.  
4. Inspector sections reusable across entity types.  

---

## Implementation Notes

- Prefer headless patterns + Pulse styling over heavy custom widgets where safe  
- React Flow (or equal) candidate for graph host per PROJECT_SPEC  
- Framer Motion optional; must respect reduced motion  

---

## Acceptance Criteria

- [ ] All P0 components exist or have explicit equivalents  
- [ ] No P0 entity without node/actor + inspector mapping  
- [ ] Status chips share one `Badge` semantics API  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 11: Accessibility Spec](./AccessibilitySpec.md) |
| **Next** | [Ch 13: Prototype Scripts & Usability Plan](./UsabilityPlan.md) |

---

*An inventory is a build contract. If it’s not listed as P0, don’t block Aha on it.*
