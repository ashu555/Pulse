# HUD, Navigation & Shortcuts

**Project:** Pulse (working name)  
**Document:** Volume 2 — Chapter 8 — HUD / Navigation / Shortcuts  
**Version:** 1.0 · **Status:** Approved for planning · **Updated:** July 2026

---

## Purpose

Specifies chrome around the city: status, controls, navigation, and keyboard map—always secondary to the canvas.

---

## IA Layout (Desktop MVP)

```text
┌──────────────────────────────────────────────────────────┐
│ Top HUD: brand · env · live mode · discovery · actions   │
├───────────────────────────────────────────────┬──────────┤
│                                               │ Inspector│
│                 CITY CANVAS                   │ (when    │
│                                               │ open)    │
├───────────────────────────────────────────────┴──────────┤
│ Bottom HUD (optional): legend · focus · follow · tip     │
└──────────────────────────────────────────────────────────┘
```

Mobile/narrow: inspector as sheet; HUD collapses into menus.

---

## Top HUD Elements

| Element | Behavior |
|---|---|
| Product mark/name | Links to about/docs optional; not settings |
| Environment badge | `local` / `staging` / … with safe coloring |
| Live mode chip | `Live` / `Polling` / `Paused` |
| Discovery control | Re-run discovery (confirm if live-heavy) |
| Diagnostics | Opens guidance for `pulse:check` |
| Theme toggle | Dark/light |
| Shortcuts | `?` |
| Settings | Gear → secondary; never first-run blocker |

---

## Bottom / Contextual HUD

| Element | Behavior |
|---|---|
| Legend | Toggle peek |
| Focus | Toggle + indicator |
| Follow | Toggle + target label |
| Quiet tip | Dismissible |

---

## Navigation Principles

1. No separate “Home dashboard” above the city for MVP.  
2. Settings are a drawer/page nested—not a replacement shell.  
3. Deep links later may open city + selected entity; MVP can omit.  

---

## Shortcut Map (MVP)

| Key | Action |
|---|---|
| `?` | Toggle shortcut help |
| `Esc` | Layered clear (follow → focus → selection → inspector) |
| `F` | Focus mode |
| `L` | Legend |
| `D` | Re-discover (with confirm) |
| `Ctrl/Cmd + K` | Command palette (P1; optional MVP) |
| `/` | Search entities (P1) |
| `↑↓` | Move selection among nearby (P1) |

Show shortcuts in help overlay; discoverable labels on buttons.

---

## Command Palette (P1)

Commands: focus, follow stop, re-discover, open legend, toggle theme, copy correlation id.

Not required to pass MVP if keyboard basics exist.

---

## Notification Toasts

Use sparingly:

- Discovery complete (once)  
- Hard errors  
- Plugin failures (later)  

Do not toast every request.

---

## Acceptance Criteria

- [ ] Canvas >70% of first viewport on desktop  
- [ ] Live/polling chip always accurate  
- [ ] Settings not on critical first-run path  
- [ ] Shortcut help available  
- [ ] Esc layered behavior documented + implemented  

---

## Document Governance

| Field | Value |
|---|---|
| **Previous** | [Ch 7: Visual Foundations](./VisualFoundations.md) |
| **Next** | [Ch 9: Empty, Error & Degraded Patterns](./EmptyErrorDegraded.md) |

---

*Chrome is a cockpit. If the cockpit outshines the windshield, redesign the cockpit.*
