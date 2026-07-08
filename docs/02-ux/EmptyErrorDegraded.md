# Empty, Error & Degraded Patterns

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 9 — Empty, Error & Degraded Patterns  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Catalogs non-happy UI states so Pulse never shows a mysterious blank city or false life.

---

## State Classes

| Class | Meaning | Visual tone |
|---|---|---|
| **Empty** | Nothing to show yet; system OK | Neutral / calm |
| **Quiet** | Structure exists; no live traffic | Neutral + tip |
| **Degraded** | Working with limits | Info/warning |
| **Error** | Operation failed | Danger |
| **Unknown** | Missing correlation/detail | Warning soft |

---

## Pattern Library

### P-EMPTY-DISCOVERY-TYPE

**When:** No queues/events/etc. found.  
**UI:** Row “None found” in discovery; no error styling.  
**Copy:** “No queues discovered.”

### P-QUIET-CITY

**When:** City built; no requests yet.  
**UI:** City visible; centered or HUD tip.  
**Copy:** “Your application is quiet. Hit an endpoint, submit a form, or dispatch a job.”  
**Must not:** spawn decorative traffic.

### P-DEGRADED-POLLING

**When:** Websocket unavailable.  
**UI:** Persistent chip/banner “Live updates via polling.”  
**Copy:** Optional expand: how to enable Reverb later.

### P-DEGRADED-NO-WORKER

**When:** Jobs visible queued but not processed.  
**UI:** Tip near station: “No queue worker detected—jobs may wait.”  
**Must not:** animate false processing.

### P-ERROR-DISCOVERY-TIMEOUT

**When:** Discovery exceeds limit.  
**UI:** Error panel + Retry + `pulse:check`.  
**Copy:** “Discovery timed out. Retry or run diagnostics.”

### P-ERROR-BOOT

**When:** Dashboard cannot start.  
**UI:** Full actionable error; no empty canvas pretend-ready.

### P-ERROR-INSPECTOR

**When:** Detail fetch fails.  
**UI:** Inline retry in panel; keep selection.

### P-UNKNOWN-PARENT

**When:** Job/event lacks parent request.  
**UI:** “Parent request unknown.” No fabricated edge.

### P-PARTIAL-COLLECTOR

**When:** One collector fails.  
**UI:** Warning listing what works vs failed; city continues with available data.

### P-REDACTED

**When:** Field hidden.  
**UI:** `Redacted` token; never empty confusing hole without label.

---

## Hierarchy of Surfaces

1. Hard boot errors block city.  
2. Discovery errors allow retry.  
3. Degraded/quiet allow exploration.  
4. Toasts only for rare hard events.

---

## Visual Rules

| Class | Panel style |
|---|---|
| Empty/Quiet | Neutral surface, primary text tip |
| Degraded | Info border + icon + text |
| Error | Danger border + icon + recovery CTA |
| Unknown | Muted warning |

Do not use danger styles for quiet apps.

---

## Acceptance Criteria

- [ ] Quiet city has explicit pattern + copy  
- [ ] Polling degraded always indicated  
- [ ] Discovery timeout recoverable  
- [ ] Unknown causality never drawn as known  
- [ ] Partial collector failure doesn’t blank entire product  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 8: HUD / Navigation / Shortcuts](./HUDNavigationShortcuts.md) |
| **Next** | [Ch 10: Density & Large-App Strategies](./DensityLargeApp.md) |

---

*Honesty scales. Empty states are how Pulse tells the truth when the app is silent.*
