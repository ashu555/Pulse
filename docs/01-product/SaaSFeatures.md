# SaaS Features

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 12 — SaaS Features  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [SaaS Statement](#saas-statement)
2. [Open Source ↔ SaaS Contract](#open-source--saas-contract)
3. [Why SaaS Exists](#why-saas-exists)
4. [Entry Gate](#entry-gate)
5. [SaaS Thesis and Anti-Thesis](#saas-thesis-and-anti-thesis)
6. [Primary Jobs SaaS Must Serve](#primary-jobs-saas-must-serve)
7. [Product Surface Map](#product-surface-map)
8. [Feature Set by Domain](#feature-set-by-domain)
9. [Packaging and Plans (Directional)](#packaging-and-plans-directional)
10. [Sequencing](#sequencing)
11. [Security, Privacy, and Trust](#security-privacy-and-trust)
12. [Explicit Non-Goals](#explicit-non-goals)
13. [Success Metrics](#success-metrics)
14. [Risks](#risks)
15. [Handoff](#handoff)

---

## SaaS Statement

**Pulse SaaS is the hosted collaboration and convenience layer for teams that want shared cities, remote environments, longer retention, and org controls—without giving up the open-source package that remains fully capable for local and self-hosted use.**

SaaS is not “Pulse, but you pay to unlock visualization.”  
SaaS is “Pulse for teams and remote contexts, operated for you.”

---

## Open Source ↔ SaaS Contract

This contract is binding and inherits [Mission](./Mission.md) commitments.

### What stays open source forever

| Capability class | Examples |
|---|---|
| Core comprehension | Discovery, city, live request/event/job visualization, inspection |
| Local developer loop | Package install, local dashboard, polling/realtime against your app |
| Replay foundations | Local/self-hosted history as designed in Version 2 |
| Extension contracts | Collector APIs, OpenAPI baselines |

### What SaaS may add (convenience, not amputation)

| SaaS-only or SaaS-strengthened | Why it belongs in hosted product |
|---|---|
| Multi-user workspaces & RBAC | Org identity, invites, roles |
| Hosted control plane | Project registry, environment connections |
| Managed retention at scale | Storage/ops cost beyond laptop defaults |
| Share links with org policy | Auth, expiry, audit |
| SSO / SCIM / compliance exports | Enterprise buying motion |
| Billing, seats, invoices | Commercial layer |
| Hosted AI proxy (optional) | Key management, usage metering—with OSS AI-disable still valid |

### Hard rule — no bait-and-switch

> If a capability exists only to make the open-source product artificially incomplete so customers must pay, it is rejected.

SaaS wins on **team, remote, retention, governance, and time-saved ops**—not by removing the Aha from OSS.

---

## Why SaaS Exists

Open-source Pulse wins individual and small-team adoption. SaaS becomes valuable when friction shifts from “can I see?” to “can we operate this together across environments?”

### High-signal SaaS triggers

| Trigger | Pain without SaaS |
|---|---|
| Multiple engineers need the same city/history | Local dashboards don’t sync |
| Staging/production comprehension is needed remotely | SSH tunnels / VPN / “works on my machine” drama |
| Onboarding across many new hires | Playlists and pins need a shared home |
| Security wants access control & audit | Ad-hoc `/pulse` exposure is unacceptable |
| Leadership wants retention beyond local defaults | Laptops and single servers aren’t org memory |
| Team wants shareable artifacts with policy | Screenshot culture doesn’t scale |

### Personas SaaS especially serves

| Persona | SaaS value |
|---|---|
| **Rohan** | Org onboarding, access, shared assets |
| **Neha** | Environment-scoped architecture evidence |
| **Maya / Aarav** | Remote staging traces + shared bookmarks |
| **Company evaluators** | Procurement-ready controls |

P1 individual debugging still begins in OSS. SaaS amplifies team loops.

---

## Entry Gate

Do not build SaaS as a shortcut around open-source excellence.

### Required before SaaS beta

1. MVP double Aha is stable ([Chapter 10](./MVP.md))
2. Version 2 replay/export foundations are trustworthy ([Chapter 11](./Version2.md))
3. Naming/branding collision risk is resolved for public GTM
4. OSS package remains independently valuable in demos without cloud login
5. Security review of telemetry/redaction model exists
6. Clear pricing hypothesis exists (detail in Business Model chapter later)

### Explicit anti-gate

“We need revenue” is not sufficient to start SaaS if OSS Aha regresses or requires cloud accounts for local use.

---

## SaaS Thesis and Anti-Thesis

### Thesis

Teams will pay for Pulse when hosted product makes **shared comprehension** cheaper and safer than each engineer running disconnected local dashboards—especially across remote environments.

### Anti-thesis

Pulse SaaS will not succeed by:

- becoming Datadog with buildings
- requiring cloud for every local debugging session
- blocking OSS features behind paywalls
- selling alerts as the primary product
- confusing “visualization” with “observability suite”

---

## Primary Jobs SaaS Must Serve

| Job | Outcome |
|---|---|
| **Connect** | Attach one or more app environments to a workspace |
| **Share** | Let teammates view the same city/trace under access control |
| **Retain** | Keep history longer than local defaults without DIY ops |
| **Govern** | Roles, SSO, audit, data retention policies |
| **Operate** | Managed uptime for control plane + storage |
| **Expand** | Seats, projects, environments as the team grows |

---

## Product Surface Map

```text
Open-source Pulse package (in customer app)
        ↓  secure shipper / agent / outbound connector
Pulse Cloud control plane
        ↓
Workspace → Projects → Environments
        ↓
Hosted city + replay + collaboration features
```

### Critical design principle

The **package remains the source of truth for application behavior**.  
The **cloud stores and serves authorized views** of shipped traces/metadata—not a re-imagined fake app.

If the connector is down, OSS local mode still works. Cloud is additive.

---

## Feature Set by Domain

## A. Identity & Workspaces

| Feature | Priority | Notes |
|---|---|---|
| User accounts | P0 | Email/OAuth baseline |
| Workspaces (teams/orgs) | P0 | Multi-tenant root |
| Invites | P0 | |
| Roles (Owner, Admin, Member, Viewer) | P0 | Start simple |
| SSO (SAML/OIDC) | P1 | Enterprise plan bias |
| SCIM provisioning | P2 | Later enterprise |
| Session management / forced logout | P1 | Security basics |

## B. Projects & Environments

| Feature | Priority | Notes |
|---|---|---|
| Projects mapped to applications | P0 | |
| Environments (local-link, staging, production) | P0 | Labels + policy |
| Environment connection status | P0 | Healthy / degraded / disconnected |
| Multiple environments per project | P0 | |
| Environment-scoped retention settings | P1 | |
| Production connect requires explicit enable + warnings | P0 | Aligns with OSS caution |

## C. Secure Ingestion / Connector

| Feature | Priority | Notes |
|---|---|---|
| Outbound connector from app → cloud | P0 | Prefer outbound-only; avoid inbound firewall pain |
| Workspace/project credentials or install tokens | P0 | Rotatable |
| Payload redaction before leave-app (default strict) | P0 | Trust gate |
| Sampling controls for cloud ship | P0 | Overhead + cost |
| Pause shipping without uninstalling package | P0 | Safety valve |
| Region selection | P1 | Data residency early signal |

**Non-goal:** Requiring customers to expose their app dashboard publicly to the internet as the primary cloud model.

## D. Hosted Comprehension Surfaces

| Feature | Priority | Notes |
|---|---|---|
| Hosted city for connected environments | P0 | Same metaphor as OSS |
| Live tail (when connected) | P0 | |
| Hosted replay/history at plan retention | P0 | Builds on Version 2 models |
| Cross-user presence (“Maya is viewing OrderCreated path”) | P2 | Collaboration nicety |
| Multi-project switcher | P0 | |

Hosted UI must not invent a second metaphor system. One city language everywhere.

## E. Collaboration Features

| Feature | Priority | Notes |
|---|---|---|
| Shared bookmarks / pinned traces | P0 | |
| Share links with expiry + permission | P0 | |
| Comments on a trace/path | P1 | |
| Onboarding playlists shared at workspace level | P0 | Amplifies Version 2 E5 |
| Spaces for architecture review packets | P1 | Neha/Rohan |
| Activity feed of shared artifacts | P2 | Avoid becoming social network |

## F. Governance, Security, Compliance

| Feature | Priority | Notes |
|---|---|---|
| Audit log of access/share/export | P1 | |
| Retention policies by environment | P0 | |
| Legal/GDPR deletion tooling | P1 | |
| IP allowlists | P2 | |
| Customer-managed encryption keys | P2 | Enterprise |
| SOC2-oriented controls roadmap | P1 | Process + product |

## G. Billing & Packaging Plumbing

| Feature | Priority | Notes |
|---|---|---|
| Plans & seats | P0 | |
| Usage meters (retained GB / events shipped / AI tokens) | P1 | Prefer simple early |
| Trial experience | P0 | Must show value fast |
| Self-serve upgrade/downgrade | P1 | |
| Invoices & tax basics | P1 | |
| Marketplace billing later | — | Chapter 13 |

## H. Optional Cloud AI

| Feature | Priority | Notes |
|---|---|---|
| Explain path with hosted model | P2 | Optional add-on |
| Workspace AI disable | P0 | Always |
| Bring-your-own-key option | P2 | Privacy-sensitive teams |

AI rules from product philosophy still hold in SaaS.

## I. Admin Experience

| Feature | Priority | Notes |
|---|---|---|
| Workspace settings | P0 | |
| Connector health dashboard | P0 | |
| Member management | P0 | |
| Cost/usage visibility | P1 | Prevent bill shock |
| Status page for Pulse Cloud | P1 | Trust |

---

## Packaging and Plans (Directional)

Detailed pricing belongs in Business Model. Feature packaging hypotheses for planning:

| Plan | Intended buyer | Differentiator |
|---|---|---|
| **OSS** | Individuals, power users, self-hosters | Full local Aha + self-hosted history |
| **Team** | Small engineering teams | Workspaces, shared pins/playlists, hosted retention baseline |
| **Scale** | Larger teams / multi-env | More environments, longer retention, SSO starting tier |
| **Enterprise** | Security-sensitive orgs | SSO/SCIM, audit, residency, support SLAs, CMEK later |

### Trial design principle

Trial must reach hosted double Aha (or replay of a shipped path) quickly—same emotional gate as OSS first session, adapted for connected staging where possible.

Do not gate trial behind sales calls if Team plan is self-serve.

---

## Sequencing

### Phase S0 — Foundations (pre-public)

- Tenancy model (workspace/project/environment)
- Auth + roles
- Outbound connector MVP
- Hosted city read-path for one environment
- Billing skeleton (even if private beta complimentary)

### Phase S1 — Private beta

- Invite-only teams
- Shared bookmarks + expiring share links
- Retention defaults + pause shipping
- Redaction review with design partners
- Prove “OSS still works offline” in every demo

### Phase S2 — Team GA

- Self-serve Team plan
- Playlists at workspace level
- Usage visibility
- Support pathways

### Phase S3 — Scale / Enterprise wedge

- SSO
- Audit logs
- Higher retention / more environments
- Security questionnaire readiness

### Phase S4 — Ecosystem adjacency

- Hosted surfaces that consume plugin marketplace (Chapter 13)
- Optional AI add-on
- Deeper collaboration

```text
OSS v1 credibility
    ↓
S0 foundations
    ↓
S1 private beta (design partners)
    ↓
S2 Team GA
    ↓
S3 enterprise controls
    ↓
S4 ecosystem + AI add-ons
```

---

## Security, Privacy, and Trust

SaaS increases data gravity. Trust is the product.

### Principles

1. **Least data necessary** — prefer metadata and redacted payloads
2. **Customer control** — pause, purge, retention, disable AI
3. **Outbound-first connectivity** — reduce network exposure
4. **Environment awareness** — production shipping is explicit, not accidental
5. **Transparent retention** — users always know what is stored and for how long
6. **Separation** — compromise of one workspace must not expose another

### Threat accents unique to SaaS

| Threat | Mitigation direction |
|---|---|
| Token leakage → trace exfiltration | Rotatable tokens, scoped credentials, anomaly cues |
| Over-collection of secrets | Default redaction + deny lists + tests |
| Share link sprawl | Expiry defaults, revoke, auth-required options |
| Insider access | Audit logs, least-privilege operator access |
| Tenant isolation bugs | Hard tenancy tests in CI |

Security deep-dives continue in architecture/security volumes; this chapter sets product requirements.

---

## Explicit Non-Goals

Pulse SaaS will not position or build as:

| Non-goal | Why |
|---|---|
| Full APM / metrics / alerting suite | Violates product non-goals |
| Log aggregation platform | Wrong category |
| Requiring cloud login for local OSS use | Bait-and-switch / anti-developer |
| Replacing on-call tooling | Not our mission |
| Hosting customer application runtimes | We visualize apps; we don’t run them |
| Selling fake demo traffic as “sample city” inside paid plans | Honesty rule still applies |

Complement positioning remains: Pulse sits beside Datadog/Telescope/Horizon—SaaS doesn’t change that.

---

## Success Metrics

| Metric | Intent |
|---|---|
| Time-to-first-hosted-Aha in trial | Same emotional discipline as OSS |
| Activating connector success rate | Installation quality for cloud path |
| Weekly shared artifact usage (pins/shares/playlists) | Collaboration value |
| Retention of Team accounts past 90 days | Habit beyond novelty |
| Support burden per workspace | Operability |
| % of SaaS users who still use OSS locally | Healthy dual-mode adoption (good sign) |
| Security incident count | Must trend at zero critical |

Vanity MRR without connector reliability or redaction trust is false success.

---

## Risks

| Risk | Mitigation |
|---|---|
| Building SaaS too early | Entry gate enforcement |
| Feature-stripping OSS accidentally | OSS↔SaaS contract reviews each release |
| Becoming “monitoring” in marketing | Message reviews against non-goals |
| Data liability from payloads | Redaction-first; minimize defaults |
| Connector complexity kills install | Outbound-only; excellent `pulse:check` cloud mode |
| Pricing on wrong meter | Start simple seats + retention; revisit meters carefully |
| Dual UI divergence | Shared design system / metaphor bible |
| Enterprise sales hijacking roadmap | Keep Team self-serve Aha sacred |

---

## Handoff

### To Chapter 13 — Plugin Marketplace

SaaS may host discovery/install for plugins later, but marketplace entitlements and community plugins are a separate product surface. Do not bury marketplace MVP inside billing hacks.

### To Business Model chapter

Plans, price points, gross margin assumptions, and sales motion details land there. This chapter only defines feature packaging direction.

### To Architecture / DevOps volumes

SaaS forces design for:

1. Multi-tenant control plane
2. Secure ingestion pipeline
3. Retention/storage tiers
4. Identity providers
5. Regionality
6. Abuse controls and rate limits

### To Final PRD

SaaS features in PRD should appear as a **later horizon section**, not dilute MVP/Version 2 acceptance criteria.

### One-sentence freeze

> **Cloud adds teammates, environments, and memory at scale—never a locked door on the open-source Aha.**

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 11: Version 2](./Version2.md) |
| **Next chapter** | [Chapter 13: Plugin Marketplace](./PluginMarketplace.md) |
| **Related documents** | [Vision](./Vision.md) · [Mission](./Mission.md) · [MVP](./MVP.md) · [Version 2](./Version2.md) · [Feature Brainstorm](./FeatureBrainstorm.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | Changes that move OSS capabilities behind paywall require explicit Mission review + version increment |

---

*SaaS is how Pulse becomes a team habit without betraying the package that made it loved. Host the collaboration—leave the Aha free.*
