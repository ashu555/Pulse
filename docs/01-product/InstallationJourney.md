# Installation Journey

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 7 — Installation Journey  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Installation Summary](#installation-summary)
2. [Installation Philosophy](#installation-philosophy)
3. [Success Definition](#success-definition)
4. [Pre-Install Decision Moment](#pre-install-decision-moment)
5. [Prerequisites](#prerequisites)
6. [Happy Path](#happy-path)
7. [What Happens Automatically](#what-happens-automatically)
8. [Environment Variants](#environment-variants)
9. [Optional Configuration](#optional-configuration)
10. [Verification and Health Checks](#verification-and-health-checks)
11. [Failure Modes and Recovery](#failure-modes-and-recovery)
12. [Upgrade Journey](#upgrade-journey)
13. [Uninstall Journey](#uninstall-journey)
14. [Security and Trust Gates](#security-and-trust-gates)
15. [Installation Metrics](#installation-metrics)
16. [Product and Engineering Implications](#product-and-engineering-implications)
17. [MVP Installation Contract](#mvp-installation-contract)

---

## Installation Summary

Installation is the narrow bridge between curiosity and the "Aha!" moment.

If installation is hard, confusing, risky, or slow, Pulse dies before the city ever builds.

This chapter defines the complete installation journey:

```
Decide to try
    ↓
Check readiness
    ↓
Install package
    ↓
Boot / auto-discover
    ↓
Reach dashboard
    ↓
Begin first-time experience
```

The installation journey ends when the dashboard is reachable and collectors are ready. The immediate next experience belongs to [Chapter 8: First-Time Experience](./FirstTimeExperience.md).

---

## Installation Philosophy

### Zero-config by default

The happy path must work without:

- publishing a config file
- registering a service provider manually
- editing application code
- creating assets by hand
- reading a long setup guide first

Configuration exists for power users. It is never the price of admission.

### Package, not patch

Pulse installs as a Laravel package. Companies adopt packages; they do not restructure applications to support developer tools.

### Observational, not invasive

By default, Pulse observes. It does not rewrite business logic, mutate request outcomes, or require controllers to change.

### Fail clearly

Silent failure is unacceptable. If install or boot fails, Pulse must explain:

- what failed
- why it failed
- how to fix it
- where docs for that failure live

### Reversible

Uninstall must be complete and clean. Trust increases when removal is safe.

### Fast enough to feel inevitable

Target end-to-end happy path:

| Milestone | Target |
|---|---|
| Decision → Composer command started | < 2 minutes |
| Composer install completed | typically < 2 minutes on average networks |
| Dashboard reachable | immediately after app reload / queue workers as needed |
| Total install journey | **under 5 minutes** |
| Transition into city discovery | immediate (Chapter 8; city visible in < 60 seconds) |

---

## Success Definition

Installation is successful when all of the following are true:

1. Package is installed via Composer
2. Laravel auto-discovers Pulse's service provider
3. Dashboard URL responds successfully
4. Core collectors are registered and enabled by default
5. No application source files required manual edits for the happy path
6. Developer can proceed to discovery without opening a troubleshooting rabbit hole

Installation is **not** successful merely because Composer returns exit code 0.

Composer success without dashboard success is still an install failure for Pulse.

---

## Pre-Install Decision Moment

Before the first command, the developer is still risk-checking.

### Questions they ask

| Question | What Pulse must signal |
|---|---|
| Will this break my app? | Observational by default; safe for local/staging first |
| How long will setup take? | Under 5 minutes for standard Laravel apps |
| Do I need Redis / Reverb / Docker first? | Not for basic install; enrichments are optional |
| Can I remove it cleanly? | Yes—documented uninstall path |
| What Laravel versions are supported? | Explicit, versioned compatibility matrix |
| Is this production-safe on day one? | Clear guidance: start in local/staging; production guidance separate |

### Pre-install promise (public contract)

```text
composer require <pulse-laravel-package>
# open dashboard
# city discovery begins
# no code changes required
```

Package name remains provisional until final naming/branding decision.

---

## Prerequisites

### Required

| Requirement | Notes |
|---|---|
| Supported Laravel version | Explicit supported range published in README |
| Supported PHP version | Align with Laravel platform requirements (target PHP 8.4 for Pulse roadmap) |
| Composer 2 | Standard for modern Laravel apps |
| Application bootable | App must already run before Pulse can visualize it |

### Recommended for full experience

| Recommendation | Why |
|---|---|
| Queue worker running | Needed to observe jobs/trains in realtime |
| Redis | Better cache/queue/realtime characteristics |
| Laravel Reverb (or compatible broadcaster) | Full realtime dashboard streaming |
| Database writable by app | If Pulse uses DB storage in a given mode |

### Explicitly not required for happy path

Pulse must not require any of these just to install and open the dashboard:

- Manual frontend asset compilation in consuming apps (package assets must be self-contained or CDN/packaged)
- Mandatory cloud account
- API keys
- License files
- Forced Telemetry signup
- Forced production deployment

### Compatibility stance

Pulse should work with **standard Laravel installations**, including:

- Fresh Laravel apps
- Breeze / Jetstream apps
- Existing production-like codebases in local/staging
- Apps using Sail / Docker Compose
- Apps with Horizon installed (coexistence, not replacement)

If an environment is unsupported, Pulse should detect and explain early.

---

## Happy Path

This is the canonical installation path Pulse optimizes for.

### Step 1 — Install the package

```bash
composer require <vendor>/<pulse-laravel-package>
```

Expected behavior:

- Dependencies resolve
- Package files land in vendor
- Laravel package auto-discovery registers the service provider
- No prompt requiring application edits

### Step 2 — Reload the application context

Depending on environment:

- Local PHP server / Sail / Docker: request the next page or reload containers if needed
- Octane / long-lived workers: restart workers so providers/config reload

Pulse docs must show environment-specific reload notes without making reload feel like "complex setup."

### Step 3 — Open the dashboard

Canonical developer command goal:

```bash
php artisan pulse:open
# or documented URL, e.g. /pulse
```

MVP may expose a stable path such as `/pulse` (exact route TBD in architecture/UX chapters). The key is:

- one obvious entrypoint
- works out of the box in local environments
- protected by default outside local (see Security)

### Step 4 — Confirm ready state

Dashboard loads a ready state that leads directly into discovery (Chapter 8).

If discovery dependencies are missing, dashboard still loads and reports readiness clearly rather than white-screening.

### Happy path timeline

```text
0:00  Run composer require
0:90  Install finishes
1:30  Open /pulse
1:45  Ready screen / discovery begins
```

Under five minutes. No ceremony.

---

## What Happens Automatically

Installation success depends on automatic behavior—not tutorials.

### Auto-discovery and registration

On install/boot, Pulse should automatically:

| Action | Purpose |
|---|---|
| Register service provider | Boot Pulse into Laravel |
| Register routes | Expose dashboard/API endpoints |
| Register default collectors | Routes, events, queues, jobs, requests (exact set defined later) |
| Register commands | Diagnostics, open, install checks |
| Publish nothing by default | Avoid file clutter unless user opts in |
| Detect environment | Local vs staging vs production policy defaults |

### Default enablement policy

| Environment | Default posture |
|---|---|
| `local` | Enabled, dashboard accessible, rich collection |
| `staging` | Enabled with safeguards; access control recommended |
| `production` | Disabled by default or locked behind explicit enable + auth (final policy in Security/Architecture) |
| `testing` | Disabled by default to avoid test pollution |

Exact production defaults will be finalized in architecture/security docs, but installation journey must never surprise a production app by exposing an open dashboard.

### Assets and UI delivery

Consuming applications should not need to run Vite for Pulse itself.

Pulse UI should be delivered as package-owned assets (prebuilt) or an equivalent packaged strategy so install remains zero-frontend-friction.

---

## Environment Variants

### Variant A — Standard local Laravel

Most important path.

```bash
composer require <vendor>/<pulse-laravel-package>
php artisan serve
# visit /pulse
```

### Variant B — Laravel Sail

```bash
sail composer require <vendor>/<pulse-laravel-package>
sail artisan pulse:check   # optional diagnostics
# visit app URL + /pulse
```

Notes:

- Service discovery and storage hosts may need Sail network names when Redis/DB are used
- Defaults should detect Sail where practical

### Variant C — Docker Compose custom setup

Principles:

- Document service hostnames clearly
- Provide health command that verifies DB/Redis/broadcast connectivity when configured
- Do not require bespoke Docker images for basic Pulse usage

### Variant D — Existing app with Horizon / Telescope already installed

Pulse must coexist.

Installation must not:

- disable Telescope/Horizon
- conflict on route names without clear namespacing
- demand uninstalling sibling tools

Positioning remains: complement, never replace.

### Variant E — Team shared staging

Install may be done by one engineer, used by many.

Requirements:

- access control defaults
- clear "Pulse is installed here" cue
- no assumption of one-person local-only workflows later in the journey

---

## Optional Configuration

Optional configuration starts only after successful install and first-session readiness.

### Publish config (optional)

```bash
php artisan vendor:publish --tag=pulse-config
```

Used for:

- enabling/disabling collectors
- storage driver selection
- path/prefix customization
- retention
- sampling rates / overhead controls
- auth gates

### Publish migrations (if/when needed)

Only when Pulse storage requires database tables.

```bash
php artisan vendor:publish --tag=pulse-migrations
php artisan migrate
```

MVP decision note: installation journey should remain valuable even before advanced historical storage. If migrations are needed for baseline dashboard auth/state, they must be automated or clearly optional with defaults that still show live visualization.

### What must never be mandatory before first value

- Customizing city themes
- Plugin setup
- AI keys
- Multi-tenancy/org setup
- Complex sampler config

---

## Verification and Health Checks

Pulse should give installers a single diagnostic entrypoint.

### Proposed command

```bash
php artisan pulse:check
```

### What it should verify

| Check | Meaning |
|---|---|
| Provider registered | Package booted |
| Routes registered | Dashboard reachable in route list |
| Storage connectivity | DB/Redis if configured |
| Broadcaster connectivity | If realtime enabled |
| Collector status | Which collectors are active |
| Environment policy | Whether Pulse is enabled in this env |
| Access policy | Whether dashboard is exposed/protected |

### Output style

Developer-friendly, actionable, non-theatrical:

```text
Pulse Check

✓ Service provider discovered
✓ Dashboard route registered (/pulse)
✓ Request collector enabled
✓ Event collector enabled
⚠ Reverb not detected — live streaming will fall back to polling
✓ Environment: local (Pulse enabled)

Ready. Open /pulse to begin discovery.
```

Warnings are acceptable. Hard failures must block silently no longer.

---

## Failure Modes and Recovery

Installation problems are near-fatal. Recovery must be crisp.

### Failure catalog

| Failure | Likely cause | Recovery |
|---|---|---|
| Composer conflict | Version constraints | Publish supported matrix; suggest compatible versions |
| Provider not discovered | Cached discovery / package discover disabled | `php artisan package:discover`; document discovered package flags |
| 404 on dashboard | Routes not loaded / wrong prefix | `pulse:check` + route:list guidance |
| 500 on dashboard | Boot exception in provider/UI | Clear exception page in local + linked docs |
| Blank UI | Asset publish/load failure | Packaged assets integrity check |
| Collectors inactive | Env disabled / config override | Explain env policy and how to enable |
| Queue activity invisible | Worker not running | Instruct to start worker; do not pretend jobs are flowing |
| Realtime lag | No Reverb/Redis | Fall back gracefully; explain degraded mode |
| Permission denied in non-local | Security gate | Explain auth/enable steps; do not bypass quietly |

### Recovery principles

1. Prefer diagnostics command before long docs
2. Prefer degraded useful mode over hard crash where safe
3. Prefer explicit "disabled in production by default" over accidental exposure
4. Prefer one canonical troubleshooting page linked from errors

### Support content hierarchy

1. In-CLI/in-UI guidance
2. Short troubleshooting FAQ
3. Deeper architecture/install docs
4. GitHub issues with templates

---

## Upgrade Journey

Upgrades must feel as safe as installs.

### Principles

- Follow semantic versioning strictly
- Minor/patch upgrades should not require remapping workflows
- Breaking changes only in major versions with migration notes
- `pulse:check` should report version and known migration actions

### Upgrade happy path

```bash
composer update <vendor>/<pulse-laravel-package>
php artisan pulse:check
```

If migrations are required:

```bash
php artisan migrate
```

No surprise redesign of install assumptions mid-minor-version.

---

## Uninstall Journey

Uninstall is part of installation trust.

### Happy path

```bash
composer remove <vendor>/<pulse-laravel-package>
```

### Required behaviors

| Concern | Expected outcome |
|---|---|
| Provider | No longer discovered |
| Routes | `/pulse` gone |
| Published config | Remains only if user published it; docs teach cleanup |
| Migrations | `down` migrations available when Pulse created tables |
| Middleware leftovers | None |
| Runtime hooks leftover | None |
| Data retention | Documented: local data cleanup commands if applicable |

### Uninstall promise

Pulse should be removable without surgical cleanup folklore.

If any cleanup is manual (rare), document exact files/tables/commands—no scavenger hunt.

---

## Security and Trust Gates

Installation journey is also a security journey.

### Defaults that protect trust

- Local-first ease
- Non-local access restricted by default
- No open production dashboard on install
- Clear warnings when binding to public hosts
- No required outbound network calls for core visualization

### Data sensitivity expectations

Install docs must explain:

- Pulse observes runtime metadata
- Sensitive payload redaction defaults (exact policy in security chapters)
- How to disable collectors that may capture high-sensitivity data

### Team install ethics

When installing on shared staging:

- announce to team
- confirm access controls
- avoid capturing secrets into shared visual timelines

---

## Installation Metrics

Measure installation as a product funnel, not an ops afterthought.

| Metric | Target |
|---|---|
| Install command → package present | > 98% on supported stacks |
| Package present → provider discovered | > 99% |
| Provider discovered → dashboard 200 | > 95% |
| Install start → dashboard open | < 5 minutes median |
| Install attempts needing support issue | Trending down each release |
| Uninstall completion cleanliness (no remnants) | Audit-confirmed |

### Qualitative install interview questions

1. Where did you hesitate before running Composer?
2. What felt risky?
3. What first confirmed "it worked"?
4. Did you touch any application files?
5. Would you install this again on another project today?

If many users edit application files for the happy path, the installation journey has failed—even if the product works.

---

## Product and Engineering Implications

### Product implications

- README install section should be copy-paste short
- Demo GIF should begin after install reads as trivial
- "Requires extensive setup" perception must be attacked continuously
- Docs must separate **Required**, **Recommended**, and **Optional** ruthlessly

### Engineering implications

| Area | Requirement |
|---|---|
| Package discovery | First-class Laravel auto-discovery |
| Routes | Namespaced, documented, stable |
| Assets | Shipped with package; no consumer Vite requirement |
| Commands | `pulse:check`, unlock/open helpers as needed |
| Config | Optional publish; safe defaults |
| Env policy | Explicit enablement matrix |
| Coexistence | No hard conflicts with Telescope/Horizon |
| Tests | Install smoke tests across supported Laravel versions in CI |

### Documentation implications

Installation docs should follow this order:

1. Happy path (shortest)
2. Verification
3. Environment variants
4. Optional config
5. Troubleshooting
6. Uninstall

Do not lead with architecture internals on the install page.

---

## MVP Installation Contract

For MVP, Pulse installation is complete when a developer can do this on a supported local Laravel app:

```bash
composer require <vendor>/<pulse-laravel-package>
# open /pulse (or pulse:open)
```

…and then immediately enter discovery with:

- no manual provider registration
- no required config publish
- no required AI/cloud setup
- no required production environments
- clear next step into the first-time experience

### Explicitly deferred from MVP install scope

| Item | Why deferred |
|---|---|
| One-click cloud provisioning | SaaS later |
| Complex multi-app installer | Team/SaaS concern |
| GUI installer wizard | Not needed if CLI/URL path is excellent |
| Broad non-Laravel installers | Out of v1 scope |
| Mandatory migration-heavy setup | Prefer live value first where architecture allows |

### Handoff to Chapter 8

When installation succeeds, the baton passes immediately:

```text
Installation Journey ends
        ↓
First-Time Experience begins
        ↓
City discovery + first live request
```

No interstitial "setup complete, now configure 12 things" page.

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 6: User Journey](./UserJourney.md) |
| **Next chapter** | [Chapter 8: First-Time Experience](./FirstTimeExperience.md) |
| **Related documents** | [Vision](./Vision.md) · [Mission](./Mission.md) · [Problem Statement](./ProblemStatement.md) · [Target Audience](./TargetAudience.md) · [Personas](./Personas.md) · [User Journey](./UserJourney.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | All changes require review. Version increment on material changes. |

---

*Installation is not a technical footnote. It is the first promise Pulse keeps—or breaks. If install is not effortless, nothing else in the product matters.*
