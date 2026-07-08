# Discovery & First-Run UX Spec

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 3 — Discovery & First-Run UX Spec  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Screen-level specification for the first session spine defined in Volume 1 Chapter 8. This is the **UX acceptance script** for double Aha.

---

## Entry Conditions

User arrives from successful install ([Installation Journey](../01-product/InstallationJourney.md)):

- Dashboard route loads  
- Collectors ready or readiness reported  
- No forced account/AI/config walls  

---

## Flow Overview

```text
S0 Boot
 → S1 Welcome + Discovery (auto)
 → S2 City Build
 → S3 Live / Quiet fork
 → S4 First Inspection
 → S5 Soft landing (ready for first real job)
```

No step may require a modal tour.

---

## S0 — Boot

| Element | Spec |
|---|---|
| Shell | App chrome minimal; city stage dominant |
| Timeout | If boot > 3s, show determinate/soft status “Starting Pulse…” |
| Failure | Actionable error + link to `pulse:check` docs |

**Exit:** Ready to discover.

---

## S1 — Discovery

### Layout

- Center or upper-stage **discovery card/panel** over dim empty stage (or skeleton ground plane)  
- Progress list of scan targets  

### Content

```text
Welcome to Pulse.
Let's discover your application…
```

Progress rows (MVP): Routes, Controllers, Events, Queues, Jobs (listeners may nest under Events).

Each row: label · progress · count or “none found”.

### Behavior

| Event | UI |
|---|---|
| Scan start | Auto, no button required |
| Partial complete | Row completes independently |
| All complete | “Discovery complete.” |
| Timeout | Error row + Retry |
| Zero finds for a type | Honest empty, not error style |

### Accessibility

Announce completion via live region; progress available as text, not color bar alone.

### Exit criteria

Discovery finished (success or soft-fail with retry). User recognizes counts as plausible.

**Aha 1 gate:** recognition of *their* app signals.

---

## S2 — City Build

### Trigger copy

```text
Now… the city builds itself.
```

### Motion

- Districts/buildings appear (staggered, cancellable under reduced motion → appear settled)  
- Roads connect  
- Stations/yards appear if discovered  

### HUD

- Build progress optional; don’t block interaction longer than needed  
- When ready: tip “Trigger a request in your app to watch it move.”

### Exit criteria

City interactive (pan/zoom/select). Soft tip visible for traffic.

---

## S3 — Live / Quiet Fork

### Branch A — Organic traffic exists

- Newest request lightly emphasized  
- Optional follow-camera ON by default for first live event only; user can dismiss permanently for session  

### Branch B — Quiet

Use quiet pattern from Ch 9:

- Honest empty traffic state  
- Primary CTA text (not fake play)  

### Branch C — Degraded transport

Banner: “Live updates via polling.” City still works.

### Exit criteria

User either watches a path or understands how to create one.

---

## S4 — First Inspection

### Trigger

Click traveler / building / road / messenger / train.

### UI

Inspector drawer/side panel; city remains visible.

### First-run success

User reads at least: identity + status/timing + one relational fact (middleware list, listener, parent request, etc.).

**Aha 2 gate:** can narrate path aloud.

---

## S5 — Soft Landing

After first successful inspection, optional one-line coach (dismissible, never modal):

```text
Tip: Press F to focus the selected path · ? for shortcuts
```

Do not queue more tips.

---

## Timing Budget

| Milestone | Target |
|---|---|
| Boot → discovery start | < 2s |
| Discovery → city visible | < 60s |
| City → meaningful inspect | within first 5 minutes session |

---

## States Matrix (First Run)

| State | Allowed overlays |
|---|---|
| Discovering | Discovery panel |
| Building | Light build status |
| Ready quiet | Quiet tip |
| Live | Optional follow cue |
| Error | Error panel with recovery |
| Inspecting | Inspector |

Never: account wall, AI wall, config checklist wall.

---

## Acceptance Checklist

- [ ] Cold user completes S0–S4 without documentation  
- [ ] No blocking tour  
- [ ] Quiet path works without fake actors  
- [ ] Inspector in-context  
- [ ] Reduced-motion still completable  
- [ ] Matches Volume 1 first-five-minutes script  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 2: City Metaphor System](./CityMetaphorSystem.md) |
| **Next** | [Ch 4: Canvas Interaction Model](./CanvasInteractionModel.md) |

---

*First-run UX is the product. Everything else is expansion of a promise kept in five minutes.*
