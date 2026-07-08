# Business Model

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 17 — Business Model  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Business Model Statement](#business-model-statement)
2. [Commercial Philosophy](#commercial-philosophy)
3. [Who Pays and Why](#who-pays-and-why)
4. [Value Creation and Capture](#value-creation-and-capture)
5. [Revenue Streams](#revenue-streams)
6. [Packaging and Pricing Hypothesis](#packaging-and-pricing-hypothesis)
7. [Go-to-Market Motion](#go-to-market-motion)
8. [Unit Economics (Directional)](#unit-economics-directional)
9. [Funding and Sustainability](#funding-and-sustainability)
10. [What We Will Not Monetize](#what-we-will-not-monetize)
11. [Sequencing Relative to Product](#sequencing-relative-to-product)
12. [Risks to the Model](#risks-to-the-model)
13. [Success Criteria for the Business](#success-criteria-for-the-business)
14. [Handoff](#handoff)

---

## Business Model Statement

**Pulse makes money by selling hosted team convenience, governance, and scale—while giving away the core visualization package that creates category love.**

The business model is **open-source product–led growth → optional Team/Enterprise SaaS → optional ecosystem commerce**, not license locks on Aha.

If commercial pressure ever requires removing local visualization from OSS, the business model has failed the Mission—even if revenue rises.

---

## Commercial Philosophy

| Principle | Meaning |
|---|---|
| **OSS earns trust; SaaS earns revenue** | Free core drives installs; cloud converts team pain |
| **No bait-and-switch** | See [SaaS Features](./SaaSFeatures.md) and [Open Source Strategy](./OpenSourceStrategy.md) |
| **Charge for coordination, not comprehension basics** | Seats, environments, retention, SSO—not “see requests” |
| **Price against developer time saved** | Not against Datadog SKUs |
| **Keep buying motion developer-friendly** | Self-serve Team before enterprise theater |
| **Revenue serves maintenance** | Commercial success should fund OSS stewardship |

---

## Who Pays and Why

### Economic buyers vs users

| Role | Relationship to money |
|---|---|
| **Daily user** (Maya/Aarav) | Loves OSS; may champion upgrade |
| **Tech lead / EM** (Rohan) | Feels onboarding/share pain; often approves Team |
| **Architect / security** | Needs governance; influences Enterprise |
| **Finance / procurement** | Enters at Scale/Enterprise |

### Willingness-to-pay triggers

Teams pay when:

1. Multiple engineers need shared history/pins/playlists
2. Remote staging/production visibility needs a control plane
3. Security blocks ad-hoc `/pulse` exposure and wants SSO/audit
4. Retention exceeds what self-hosting ops wants to run
5. Time spent syncing screenshots exceeds seat cost

Individuals debugging locally should succeed **without paying**.

---

## Value Creation and Capture

```text
Create value (OSS):
  faster debugging, onboarding, architecture truth

Capture value (Commercial):
  multiplayer + remote + retention + governance + time-saved ops
```

| Value created | Captured by |
|---|---|
| Personal Aha | OSS (capture = adoption, reputation, funnel) |
| Team shared comprehension | Team SaaS |
| Enterprise policy & scale | Enterprise SaaS |
| Niche vendor depth | Paid plugins (optional take-rate) |
| Maintainer continuity | Sponsorships / support (secondary) |

---

## Revenue Streams

### Primary (intended)

| Stream | Description | Horizon |
|---|---|---|
| **Team SaaS subscriptions** | Self-serve seats + hosted retention baseline | After OSS v1 credibility |
| **Scale / Enterprise subscriptions** | More envs, retention, SSO, audit, support | After Team GA |

### Secondary

| Stream | Description | Horizon |
|---|---|---|
| **Marketplace take-rate** | Paid plugin commerce | After registry trust |
| **Support / priority SLAs** | Optional on Enterprise | Selective |
| **Sponsors** | GitHub Sponsors / ecosystem sponsors | Ongoing soft |

### Explicitly avoided as primary

| Stream | Why avoided |
|---|---|
| Feature-gated OSS modules | Enclosure optics; Mission conflict |
| Forced cloud for local use | Destroys trust |
| Training lock-in for basic install | Antithetical to DX |
| Data resale | Forbidden |

---

## Packaging and Pricing Hypothesis

Directional only—validate with design partners. Numbers are planning placeholders, not commitments.

### Plan ladder

| Plan | Approx. buyer | Included (conceptually) | Price hypothesis |
|---|---|---|---|
| **OSS** | Individuals, self-hosters | Full local Aha + self-hosted history | $0 |
| **Team** | Small product eng teams | Workspace, shared pins/playlists, hosted retention baseline, limited envs | Seat-based, approachable (e.g. low tens of USD/seat/mo class) |
| **Scale** | Multi-env teams | Higher retention, more environments, SSO starting | Higher seat or small platform fee + seats |
| **Enterprise** | Security-sensitive orgs | SCIM, audit, residency options, support SLA, security reviews | Annual contract |

### Metering principles

| Prefer early | Avoid early |
|---|---|
| Seats | Punitive per-event billing that discourages visibility |
| Retention tier | Opaque overage surprises |
| Environment count | Metric soup |

If usage meters appear later (ingested GB, AI tokens), they must be **visible, predictable, and pauseable**.

### Trials

- Self-serve trial for Team
- Must reach hosted Aha / shared artifact value quickly
- No sales call required for Team trial start

---

## Go-to-Market Motion

### Phase 1 — Product-led OSS

- README + demo GIF + docs
- Composer install
- Community presence (honest, non-spam)
- Design partners for feedback—not revenue

**Success:** Time-to-Aha and Packagist adoption.

### Phase 2 — Team conversion

- In-product soft prompts only after share/playlist pain is real (never blocking OSS)
- Content: “Onboarding playlists for Laravel teams”
- Case studies of time saved—not vanity stars alone

**Success:** Team trials → paid with retention.

### Phase 3 — Enterprise expansion

- Security packet readiness
- SSO/audit as wedge
- Procurement-friendly packaging

**Success:** Expand within accounts without rewriting product identity.

### Channel notes

- Laravel ecosystem affinities (complement Telescope/Horizon narrative)
- Conference talks after MVP is real
- Avoid buying generic “APM competitor” ad keywords that mis-position Pulse

---

## Unit Economics (Directional)

Early SaaS must watch:

| Lever | Concern |
|---|---|
| **COGS** | Trace storage + egress + compute for replay |
| **Support cost** | Connector + redaction issues |
| **Gross margin** | Don’t promise infinite retention cheaply |
| **Magic number / payback** | Only after Team GA has data |

Mitigations already in product:

- Sampling and pause shipping
- Finite default retention
- Redaction reducing sensitive payload bulk
- Outbound connector simplicity lowering support

Exact financial model belongs in a later finance artifact; this chapter constrains product to remain margin-aware.

---

## Funding and Sustainability

### Sustainable loops

```text
OSS adoption
  → credibility
    → Team SaaS
      → funds maintainers + cloud
        → better OSS
```

### Acceptable capital

- Bootstrapped / lean as long as possible while proving Aha
- Sponsorships that don’t buy roadmap control
- Later institutional capital only if OSS contracts remain binding

### Unacceptable trades

- Enclosing core for fundraising narrative
- Security fixes for paying customers only
- Fake growth metrics for raise (stars as KPI theater)

---

## What We Will Not Monetize

1. Local live request/event/job visualization
2. Zero-config install path
3. Default redaction safety
4. Essential `pulse:check` diagnostics
5. Ability to self-host replay foundations from Version 2
6. Public plugin contracts

Monetizing these would violate Mission and destroy the funnel that makes SaaS possible.

---

## Sequencing Relative to Product

| Stage | Business focus |
|---|---|
| Pre-MVP / MVP | $0 focus; proof; naming |
| Version 2 | Still primarily OSS value; export/share may hint Team |
| v1 OSS credibility | Prepare billing foundations quietly |
| SaaS S1–S2 | Team revenue validation |
| Marketplace P3 | Secondary commerce |
| Enterprise | Expansion revenue |

Business milestones never reorder product entry gates.

---

## Risks to the Model

| Risk | Mitigation |
|---|---|
| Teams refuse to pay because OSS is “enough” | Acceptable—design Team for pains OSS doesn’t remove |
| Users accuse enclosure | Written contracts + dual-mode proof |
| Storage costs explode | Retention tiers, sampling |
| Enterprise demands APM features | Refuse; sell governance not alerts |
| Marketplace revenue distracts | Keep take-rate secondary |
| Pricing too high for Laravel indie teams | Keep Team approachable; Enterprise separate |

---

## Success Criteria for the Business

Healthy business looks like:

1. Growing OSS installs with strong Time-to-Aha
2. Team conversion without blocking OSS
3. Gross margin compatible with retention promises
4. Maintainer capacity funded without burnout
5. Zero Mission breaches for revenue

Unhealthy business looks like:

1. Stars ↑ while Aha ↓
2. Revenue ↑ while OSS core gutted
3. Support load from mis-positioned “APM buyers”

---

## Handoff

### To Competitive Analysis (Chapter 18)

Pricing/category boundaries vs Telescope, Horizon, APM, Ray.

### To Final PRD

Business model appears as horizon constraints—not MVP scope inflation.

### One-sentence freeze

> **We monetize multiplayer memory and governance—never the first breath of the living city.**

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 16: Risks](./Risks.md) |
| **Next chapter** | [Chapter 18: Competitive Analysis](./CompetitiveAnalysis.md) |
| **Related documents** | [Mission](./Mission.md) · [SaaS Features](./SaaSFeatures.md) · [Open Source Strategy](./OpenSourceStrategy.md) · [Plugin Marketplace](./PluginMarketplace.md) · [Success Metrics](./SuccessMetrics.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | Monetizing previously free Aha capabilities requires Mission-level rejection review; version increment on packaging changes |

---

*A good business model makes the open-source product stronger. A bad one eats it.*
