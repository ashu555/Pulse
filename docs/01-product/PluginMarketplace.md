# Plugin Marketplace

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 13 — Plugin Marketplace  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Marketplace Statement](#marketplace-statement)
2. [Contracts Before Storefront](#contracts-before-storefront)
3. [Why a Marketplace Exists](#why-a-marketplace-exists)
4. [Entry Gate](#entry-gate)
5. [Definitions](#definitions)
6. [Plugin Types](#plugin-types)
7. [Ecosystem Architecture (Product View)](#ecosystem-architecture-product-view)
8. [Developer Experience for Authors](#developer-experience-for-authors)
9. [User Experience for Installers](#user-experience-for-installers)
10. [Trust, Safety, and Quality Bar](#trust-safety-and-quality-bar)
11. [Open Source, Paid Plugins, and Revenue Share](#open-source-paid-plugins-and-revenue-share)
12. [Relationship to SaaS](#relationship-to-saas)
13. [Seed Catalog](#seed-catalog)
14. [Sequencing](#sequencing)
15. [Governance](#governance)
16. [Non-Goals](#non-goals)
17. [Success Metrics](#success-metrics)
18. [Risks](#risks)
19. [Handoff](#handoff)

---

## Marketplace Statement

**The Pulse Plugin Marketplace is the discovery, distribution, and trust layer for extensions that add collectors, visualizations, and integrations—built on stable public contracts, never by forking core or locking Aha behind proprietary plug-ins.**

The marketplace is how Pulse becomes an ecosystem.  
The plugin API is how Pulse remains coherent.

Without contracts, a storefront is a junk drawer.  
Without a storefront, contracts stay invisible to most developers.  
Version 2 ships contracts first. This chapter defines the marketplace that comes after.

---

## Contracts Before Storefront

Inherited from [Version 2 — Epic 6](./Version2.md):

```text
Stable collector / visualization contracts
        ↓
Documented sample plugins
        ↓
Public registry (discover + install metadata)
        ↓
Marketplace UX (browse, filter, reviews)
        ↓
Optional paid listings + SaaS entitlements
```

### Binding rule

> **No marketplace GA until versioned plugin contracts exist, internal collectors use those contracts, and at least one external-style sample plugin installs cleanly via documented steps.**

Storefront polish cannot compensate for unstable APIs.

---

## Why a Marketplace Exists

Pulse core must stay focused on comprehension. The world of Laravel apps is wider than any core team can cover:

| Need | Why core should not absorb it all |
|---|---|
| Niche collectors (Scout, Cashier, Tenancy, Nova actions, domain packs) | Infinite surface area |
| Company-specific districts | Private plugins / internal registries |
| Complementary integrations (Jira, Linear, Slack summaries—careful scope) | Adjacent workflows |
| Community visualization experiments | Innovation without core risk |
| Education packs / playbooks as plugins | Content + collectors hybrids |

### Jobs the marketplace serves

| Actor | Job |
|---|---|
| **App developer** | Find and install a trusted extension quickly |
| **Plugin author** | Publish once, reach Pulse users, optionally earn |
| **Core team** | Keep Pulse lean while ecosystem grows |
| **Security reviewer** | Enforce a quality and permission bar |
| **SaaS workspace admin** | Allowlist plugins for an org |

---

## Entry Gate

Marketplace work (beyond docs/samples) starts only when:

1. MVP Aha is stable
2. Version 2 collector contracts are versioned and documented
3. OpenAPI baselines for relevant surfaces exist
4. A first-party sample plugin is maintained as a reference implementation
5. Security review checklist for plugins is drafted
6. Naming/branding is stable enough for public package namespaces

### Anti-gates

- “We need marketplace revenue before v1”
- “We’ll stabilize APIs after third parties depend on them”
- “Paid plugins can replace open-source collectors”

Those paths are rejected.

---

## Definitions

| Term | Meaning |
|---|---|
| **Plugin** | A distributed package that extends Pulse through public contracts |
| **Collector plugin** | Emits or enriches structural/runtime signals Pulse can visualize |
| **Visualization plugin** | Adds city elements, panels, or render adapters for existing signals |
| **Integration plugin** | Connects Pulse artifacts to external systems without becoming monitoring |
| **Registry** | Indexed catalog of plugin metadata + install instructions (OSS-first) |
| **Marketplace** | Registry + UX + trust signals + optional commerce |
| **First-party plugin** | Maintained by Pulse core team |
| **Third-party plugin** | Maintained by community or vendors |
| **Private plugin** | Internal to a company; may use private registry |

---

## Plugin Types

### Type A — Collector plugins (primary)

Highest strategic value. Examples:

- Discover/map Laravel Sanctum token flows
- Cashier subscription lifecycle messengers
- Scout search index jobs
- Multi-tenancy boundary markers
- Domain pack for “Orders” bounded context conventions

**Requirement:** Must emit data that can be represented honestly in city/inspection models.

### Type B — Visualization plugins

Examples:

- Alternate district layouts for huge monoliths
- Specialized inspector panels for a collector’s payload schema
- Accessibility-focused render modes

**Requirement:** Cannot invent traffic. Can only render declared signal types.

### Type C — Integration plugins

Examples:

- Export a bookmarked path to Linear/Jira as a description attachment
- Webhook on pin created
- Slack message with share-link + redacted summary

**Requirement:** Stay complementary. No paging/on-call product surfaces disguised as plugins.

### Type D — Content / education plugins (careful)

Examples:

- Metaphor glossary packs
- Tutorial playlists packaged with demo collectors **clearly labeled as tutorial mode**

**Requirement:** Tutorial/demo mode must never silently mix into real-app mode.

### Type E — Theme packs (parked by default)

Allowed only if:

- metaphor meanings remain standard
- accuracy is unaffected
- themes cannot hide failure states

Otherwise themes stay PARK (as in Feature Brainstorm G7).

---

## Ecosystem Architecture (Product View)

```text
pulse-plugin-api (contracts)
        ↑
first-party collectors  |  third-party plugins  |  private plugins
        ↓
Pulse runtime (discovery, live, replay)
        ↓
City + inspectors
        ↓
Registry / Marketplace (discover, verify, install metadata)
        ↓
Optional: SaaS entitlements & org allowlists
```

### Distribution channels

| Channel | Use |
|---|---|
| **Composer packages** | Primary install mechanism for Laravel world |
| **Registry website** | Browse, search, docs, badges |
| **CLI helpers** | `pulse:plugin:list`, search, info (future) |
| **SaaS catalog** | Org-aware discovery + allowlisting |

Composer remains canonical for installation trust—marketplace does not invent a competing opaque binary installer for MVP marketplace.

---

## Developer Experience for Authors

### Author journey

```text
Read plugin docs
    ↓
Use plugin starter kit
    ↓
Implement contracts + tests
    ↓
Declare capabilities & permissions
    ↓
Publish Composer package
    ↓
Submit registry listing
    ↓
Pass automated + manual review gates
    ↓
Listed (free or paid)
```

### Author must provide

| Artifact | Why |
|---|---|
| Package name + semver | Installability |
| Pulse contract compatibility range | Prevent silent breaks |
| Capability manifest | What signals/UI it adds |
| Permission manifest | What data it can access |
| Overhead notes | Trust and ops honesty |
| README with screenshots/GIFs of real behavior | Users buy clarity |
| License | MIT-compatible preference for free listings; paid license clarity required |
| Support contact / security contact | Operations |

### Starter kit (first-party deliverable)

Before marketplace GA, core ships:

- `pulse-plugin-skeleton`
- example collector plugin
- contract test helpers
- CI template for authors

If authors cannot succeed with the skeleton, the marketplace is not ready.

---

## User Experience for Installers

### Installer journey

```text
Browse registry / marketplace
    ↓
Evaluate trust badges + permissions
    ↓
composer require vendor/pulse-plugin-x
    ↓
pulse:check shows plugin registered
    ↓
City/inspector gains truthful new capability
```

### UX requirements

1. **Permission transparency** before install (what data the plugin can see)
2. **One-command install** documentation (Composer)
3. **Disable without uninstall** support via collector flags where applicable
4. **Conflict detection** if two plugins claim the same signal type unsafely
5. **Version compatibility warnings** against installed Pulse core

### Failure UX

If a plugin crashes boot:

- fail the plugin, not the whole Pulse dashboard when isolation allows
- surface error in `pulse:check` and UI plugin panel
- document quarantine behavior

Isolation strength is an architecture topic; product requirement is: **plugin failure must not erase core Aha**.

---

## Trust, Safety, and Quality Bar

Marketplace identity is trust. A single malicious plugin can destroy Pulse’s reputation.

### Listing tiers

| Tier | Meaning |
|---|---|
| **Unlisted / private** | Not in public registry |
| **Community** | Meets basic automated checks |
| **Verified** | Manual review + maintained status + security contact |
| **First-party** | Core team maintained |

### Minimum automated checks

- Package exists and is installable on supported Pulse versions
- Manifest schema validates
- No undeclared network exfil APIs in static checks (best-effort)
- Declared permissions match code patterns where detectable
- License field present

### Manual review for Verified

- Permissions reasonable for stated purpose
- Docs quality and honesty (no fake demos mixed as real mode)
- Overhead claims reviewed
- Security contact exists
- Namespace ownership credible

### Permission categories (illustrative)

| Permission | Sensitivity |
|---|---|
| Read route structure | Low |
| Read event names | Low |
| Read redacted payloads | Medium |
| Read raw payloads | High (discouraged; justify) |
| Outbound HTTP | High |
| Persist files | Medium |
| Mutate app behavior | Forbidden by default |

### Hard product prohibitions for plugins

Plugins may not:

1. Fabricate runtime traffic
2. Bypass redaction defaults silently
3. Replace core city with deceptive overlays that imply false causality
4. Ship mandatory phone-home without disclosure
5. Require disabling core Pulse security gates to function

---

## Open Source, Paid Plugins, and Revenue Share

Aligned with Mission: MIT-friendly ecosystem; commercial plugins allowed without legal ambiguity.

### Free / open plugins

- Default path for community growth
- Preferred for educational and infrastructure-adjacent collectors
- Registry featuring should bias toward useful free tools early

### Paid plugins

Allowed when they provide genuine specialized value (deep vendor integrations, maintained enterprise connectors).

Rules:

1. Core Aha capabilities remain free forever in Pulse OSS
2. Paid plugins cannot be the only way to visualize requests/events/jobs
3. Pricing and refund/support terms must be disclosed on listing
4. Security bar for paid ≥ community bar

### Revenue share (directional)

Exact rates belong in Business Model. Product principles:

| Principle | Intent |
|---|---|
| Authors earn majority share | Attract quality maintainers |
| Platform take covers review + hosting + payments | Sustainability |
| SaaS entitlement delivery optional | Paid plugins work in OSS install path first |
| No exclusivity that kills Composer freedom | Users can install even if marketplace is down |

### No bait-and-switch via plugins

Pulse must not extract core collectors into paid plugins to manufacture revenue.

---

## Relationship to SaaS

From [Chapter 12](./SaaSFeatures.md): marketplace is adjacent, not buried inside billing.

| Layer | Responsibility |
|---|---|
| **OSS + Composer** | Always works for plugin install |
| **Public registry** | Discovery for everyone |
| **SaaS catalog** | Org allowlists, entitlement sync, hosted install guidance |
| **Billing provider** | Paid plugin settlement (later) |

### Org controls (SaaS)

- Allowlist plugins by tier
- Block high-permission plugins in production environments
- Audit plugin enable/disable events

SaaS must not become the only place a plugin can be discovered if it is a public Composer package. Discovery convenience yes; lock-in no.

---

## Seed Catalog

Marketplace launch should not be an empty mall. Seed a small, excellent catalog.

### First-party seeds (recommended)

| Plugin | Purpose |
|---|---|
| Reference Collector Skeleton demo | Teaching authors |
| Notifications district pack | Extends Version 2 literacy |
| Cache district pack | Same |
| HTTP Client outbound highway pack | External calls |
| Redaction assistant presets | Trust tooling |

### Community seeds (recruit early)

| Domain | Example |
|---|---|
| Cashier | Subscription lifecycle visualization |
| Scout | Search index job flows |
| Filament/Nova action tracing | Admin panel action paths |
| Tenancy | Tenant boundary visualization |
| Feature flags (Pennant) | Flag evaluation markers |

Seed quality > seed quantity. Ten trusted listings beat two hundred unbroken toys.

---

## Sequencing

### Stage P0 — Contracts & kit (Version 2)

- Versioned plugin API
- Skeleton + sample
- Contract tests
- Author docs

### Stage P1 — Public registry (OSS)

- Registry website (browse/search/metadata)
- Listing submission workflow
- Compatibility badges
- Security policy pages

### Stage P2 — Marketplace MVP

- Verified tier
- Reviews/stars (abuse-resistant, delayed if needed)
- Publisher profiles
- Featured collections (“Official”, “Performance literacy”, “Laravel ecosystem”)

### Stage P3 — Commerce

- Paid listings
- Payouts
- License key / entitlement checks (lightweight)
- SaaS org allowlists sync

### Stage P4 — Ecosystem maturity

- Secondary visualizations marketplace segment
- Private enterprise registries
- Partner certification program (careful; only when volume justifies)

```text
P0 Contracts
  ↓
P1 Registry
  ↓
P2 Marketplace UX + trust tiers
  ↓
P3 Commerce
  ↓
P4 Certification / private registries
```

Jumping to P3 before P1 is forbidden.

---

## Governance

### Core team responsibilities

- Maintain contracts with semver discipline
- Operate review for Verified tier (or delegate carefully)
- Keep first-party plugins as gold standards
- Deprecate insecure packages from featured surfaces

### Author responsibilities

- Respond to security reports
- Maintain compatibility windows
- Do not misrepresent capabilities

### Community responsibilities

- Report malicious behavior
- Contribute reviews grounded in real use
- Prefer complementary plugins over clones of core

### Conflict resolution

- Security issues: immediate delist capability
- API disputes: RFC / ADR process in architecture docs
- Trademark / naming abuse: registry policy enforcement

---

## Non-Goals

| Non-goal | Why |
|---|---|
| Becoming npm-scale everything-store on day one | Quality dilution |
| App runtime plugin execution marketplace (arbitrary PHP in prod without review) | Security nightmare framing—Pulse plugins are scoped extensions, not unconstrained app plugins |
| Alerting plugin category as a featured pillar | Category confusion with monitoring |
| Marketplace replacing Composer | Composer remains install substrate |
| Paid wall for core collectors | Mission violation |
| Theme-only marketplace identity | Accuracy first |

---

## Success Metrics

| Metric | Signal |
|---|---|
| Time for new author to ship sample plugin | Short and documented |
| # of Verified plugins after 6 months | Steady quality growth |
| Install success rate for top 20 plugins | High |
| Plugin-caused boot failure rate | Near zero critical |
| % users with ≥1 community plugin | Ecosystem adoption |
| Author retention (updates within 6 months) | Healthy maintenance |
| Security incidents from listed plugins | Zero tolerance aspiration |

An empty featured page with five thriving plugins beats a thousand abandoned listings.

---

## Risks

| Risk | Mitigation |
|---|---|
| Unstable contracts burn authors | Version early; migrate tooling; don’t freeze prematurely then break |
| Malicious plugin | Review tiers, permissions, delist authority, least privilege |
| Core team bottleneck on reviews | Automate heavily; limit Verified volume initially |
| Marketplace sucks focus from Aha | Entry gate + roadmap walls |
| Paid plugins echo SaaS bait fears | Soft-touch commerce; protect OSS core explicitly |
| Duplicate low-quality collectors | Featured curation; guidelines for overlapping signal types |
| Visualization plugins lie | Contract-level prohibition on fabricated events |

---

## Handoff

### To Open Source Strategy (Chapter 14)

Registry governance, contribution norms, and community plugin ethos align with OSS operating model.

### To Business Model

Paid plugin take-rates, partner programs, and accounting live there; this chapter constrains principles only.

### To Architecture volumes

Needs design for:

1. Capability & permission manifests
2. Plugin bootstrap/isolation strategy
3. Contract versioning and negotiation
4. Signal type registry (shared vocabulary for city rendering)
5. Safe outbound permission model

### To Final PRD

Marketplace appears as a **post-v1 ecosystem horizon**, dependent on Version 2 contracts—not an MVP feature.

### One-sentence freeze

> **Contracts create trust; the marketplace only amplifies what contracts make safe to share.**

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 12: SaaS Features](./SaaSFeatures.md) |
| **Next chapter** | [Chapter 14: Open Source Strategy](./OpenSourceStrategy.md) |
| **Related documents** | [Vision](./Vision.md) · [Mission](./Mission.md) · [Version 2](./Version2.md) · [SaaS Features](./SaaSFeatures.md) · [Feature Brainstorm](./FeatureBrainstorm.md) · [MVP](./MVP.md) · [Open Source Strategy](./OpenSourceStrategy.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | Contract breaks require major version + migration notes; marketplace policy changes require review + version increment |

---

*A marketplace is not a revenue hatch over an unfinished platform. It is the public square for a plugin economy that Pulse earns by making extension safe, documented, and honest.*
