# Inspector UX

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 5 — Inspector UX  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

The inspector converts spectacle into understanding. It is MVP P0 UX—not polish.

---

## Placement & Chrome

| Property | Spec |
|---|---|
| Pattern | Right drawer / side panel (LTR); full-sheet fallback on narrow widths |
| Width | ~360–420px desktop; resizable optional P1 |
| City | Remains visible; dimmed slightly OK |
| Close | Esc / X / click-empty per canvas rules |
| Header | Metaphor + Laravel identity dual-label |

---

## Common Header

```text
{Metaphor icon}  {Metaphor}
{Primary identity string}
{Status chip}  {Duration if any}
```

Examples:

- `Building` / `App\Http\Controllers\OrderController@store`  
- `Train` / `App\Jobs\SendInvoiceJob` · `failed`

---

## Panels by Entity (MVP)

### Request / Traveler

| Section | Content |
|---|---|
| Summary | Method, route, status code, duration |
| Timeline | Ordered steps with durations when known |
| Relations | Events spawned, jobs spawned (links) |
| Meta | Request id / correlation id (copyable) |

### Road / Route

| Section | Content |
|---|---|
| Signature | Methods + URI |
| Middleware | Ordered chain |
| Links | Related buildings/actions |

### Building / Controller action

| Section | Content |
|---|---|
| Identity | Class@method |
| Traffic | Recent related requests (if available) |
| Structure | Related routes |

### Messenger / Event

| Section | Content |
|---|---|
| Identity | Event class/name |
| Listeners | List |
| Payload | Redacted key/value preview |
| Relations | Parent request if known |

### Train / Job

| Section | Content |
|---|---|
| Identity | Job class |
| Queue | Queue name |
| Status | pending/running/done/failed + tries |
| Relations | Parent request if known |
| Error | Message summary when failed (redact sensitive) |

### Station / Worker yard

| Section | Content |
|---|---|
| Identity | Queue/worker label |
| Activity | Counts when known |
| Honest empty | If no depth metrics yet |

---

## Timeline Component Rules

1. Top-to-bottom chronological.  
2. Each step: name · start offset/duration · status.  
3. Clickable steps select related city entity when mappable.  
4. Unknown gaps labeled—not filled with fiction.  
5. Failure step visually dominant.

---

## Redaction UX

| Rule | UI |
|---|---|
| Redacted field | Show key + `Redacted` placeholder |
| Reason | Tooltip: “Hidden by Pulse redaction defaults” |
| Bypass | Not in MVP first-run; power setting later with warning |
| Copy | Copying redacted values copies placeholder, not secret |

---

## Causality Navigation

Inline links:

- `View parent request`  
- `View job`  
- `View event`  

Selecting updates canvas selection + inspector content without full page reload.

If unknown: disabled link style + “Unknown” text—never a fake target.

---

## Empty & Loading Inspector

| State | UI |
|---|---|
| Loading detail | Skeleton sections |
| Soft error | Retry + diagnostics hint |
| No extra detail | “No additional detail available” |

---

## Accessibility

- Focus moves into inspector on open; returns to canvas on close  
- Sections as headings  
- Status chips have text equivalents  
- Timeline as ordered list  

---

## Anti-Patterns

1. Navigating to a separate route that unmounts city  
2. Raw unbounded JSON blobs as default view  
3. Secrets shown “for convenience”  
4. Inspector covering entire city permanently on desktop  

---

## Acceptance Criteria

- [ ] All MVP primary entities have inspector schemas above  
- [ ] Timeline present for requests  
- [ ] Causality links work or honestly unknown  
- [ ] Redaction visible and safe  
- [ ] First-click teaches ≥1 concrete fact  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 4: Canvas Interaction Model](./CanvasInteractionModel.md) |
| **Next** | [Ch 6: Motion Language](./MotionLanguage.md) |

---

*If the city is the story, the inspector is the footnotes that make the story true.*
