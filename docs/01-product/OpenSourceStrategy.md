# Open Source Strategy

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 14 — Open Source Strategy  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Strategy Statement](#strategy-statement)
2. [Why Open Source Is Non-Negotiable](#why-open-source-is-non-negotiable)
3. [License and IP](#license-and-ip)
4. [Repository and Presence Strategy](#repository-and-presence-strategy)
5. [What We Open Source](#what-we-open-source)
6. [Community Design](#community-design)
7. [Contribution Model](#contribution-model)
8. [Governance](#governance)
9. [Release and Versioning](#release-and-versioning)
10. [Communication and Transparency](#communication-and-transparency)
11. [Maintainer Health](#maintainer-health)
12. [Security Process](#security-process)
13. [Relationship to SaaS and Marketplace](#relationship-to-saas-and-marketplace)
14. [Brand and Naming Discipline](#brand-and-naming-discipline)
15. [Success Signals for OSS](#success-signals-for-oss)
16. [Anti-Patterns We Refuse](#anti-patterns-we-refuse)
17. [Handoff](#handoff)

---

## Strategy Statement

**Pulse is open source first because developer trust, adoption, and ecosystem growth for a category-defining Laravel tool cannot be rented behind a login wall.**

Open source is not a go-to-market tactic.  
It is the operating system of the product.

We ship documentation, contracts, collectors, and the city experience in the open. Commercial layers may follow as convenience—not as the only door to Aha.

---

## Why Open Source Is Non-Negotiable

| Reason | Implication |
|---|---|
| **Trust** | Developers install into real apps; they must inspect what they run |
| **Adoption** | Laravel ecosystems grow through Composer and README magic, not procurement first |
| **Correctness** | Visualization bugs die faster under community eyes |
| **Extensibility** | Plugins require public contracts |
| **Career-grade craft** | The repo itself is part of the product’s reputation |
| **Longevity** | Bus factor and succession require public knowledge |

Proprietary-only Pulse would contradict the Mission’s “open by default” and “no bait-and-switch” commitments.

---

## License and IP

| Decision | Choice | Rationale |
|---|---|---|
| Core license | **MIT** | Matches Laravel ecosystem norms; enables commercial use and SaaS unambiguously |
| Docs license | MIT or CC equivalent (document clearly) | Encourage sharing without friction |
| Contributor license | DCO or CLA-light (prefer DCO) | Keep contribution friction low while tracking provenance |
| Trademarks | Separate from code license | Name/logo protected even when code is free |

Copyright remains with contributors under MIT norms; governance defines who can publish official releases.

---

## Repository and Presence Strategy

### Day-one quality bar (premium OSS presence)

When public, repositories should present:

| Asset | Purpose |
|---|---|
| README with demo GIF | Instant Aha promise |
| Architecture overview | Seriousness signal |
| Getting Started | Chapter 7/8 contracts in practice |
| Roadmap | Public direction |
| Contributing guide | Entry path |
| Code of Conduct | Safety |
| Security policy | Trust |
| Good first issues | On-ramp |
| Examples | Reproducible proof |
| Discussions | Non-bug conversation space |

### Monorepo / multi-repo stance

Near term: **product monorepo or tight core + docs** is acceptable while architecture firms up.

Long term (from Vision): organization-style presence is valid:

```text
org/
  pulse (or renamed core)
  docs / engineering bible
  examples
  website
  plugin-api
  awesome-list
```

Strategy rule: **do not split repos until ownership and CI boundaries are clear.** Premature polyrepo fragments an unfinished story.

### Visibility channels

- GitHub (source of truth)
- Packagist (distribution)
- Docs site (later; start with `/docs` in repo)
- Laravel community spaces (respectful, non-spam participation)
- Conference talks / blog posts once MVP is real

---

## What We Open Source

### Always open

- Pulse core visualization engine
- Laravel integration package
- Default collectors
- Dashboard UI for core experience
- Plugin API / contracts
- Example apps
- Engineering documentation (Volumes 1+)

### May be commercial without closing core

- Hosted control plane
- Managed retention
- Org SSO/audit
- Paid third-party plugins (author-owned)
- Optional support SLAs

### Never closed for leverage

- Ability to see live requests/events/jobs on a local app
- Zero-config install path
- Redaction defaults
- Uninstall cleanliness

---

## Community Design

### The community we want

| Segment | What they do |
|---|---|
| **Users** | Install, dogfood, file issues, share GIFs |
| **Advocates** | Talks, blogs, examples |
| **Contributors** | PRs to docs, tests, collectors, UX |
| **Plugin authors** | Extend the ecosystem |
| **Maintainers** | Review, release, mentor |

### The community we do not optimize for first

- Drive-by entitlement without reproduction steps
- Feature bargaining that violates Aha veto
- “Make it like Datadog” pressure that changes category identity

Tone: welcoming, high-standard, mission-anchored.

---

## Contribution Model

### Contribution ladder

```text
Use Pulse
  → File excellent issues
    → Docs / typo / example PRs
      → Tests / small fixes
        → Collector / UI features
          → Plugin authorship
            → Maintainer track
```

### Before v0.1 public

Must exist:

1. `CONTRIBUTING.md`
2. Code of Conduct
3. Issue templates (bug, feature, security redirect)
4. PR template
5. Labels: `good first issue`, `docs`, `collector`, `ui`, `needs reproduction`
6. Branch / commit / semver conventions

### Review values

Inherited from Mission:

- Does it serve the mission?
- Does it respect non-goals?
- Is it understandable by the next contributor?
- Are tests present for behavior changes?
- Does it threaten Aha purity?

Style nits lose to architectural correctness—then both get raised to standard.

### Recognition

- Changelog credits
- Release notes shout-outs
- README contributors section as it grows
- Path to maintainership documented, not mysterious

---

## Governance

### Roles (initial)

| Role | Authority |
|---|---|
| **Project lead(s)** | Vision veto, release authority, Mission stewardship |
| **Maintainers** | Merge rights in scoped areas, review duty |
| **Committers / authors** | Trusted PR contributors |
| **Community** | Issues, discussions, proposals |

### Decision records

Material architecture/product decisions use ADRs / Engineering Bible chapters—public when possible.

### Conflict resolution

1. Attempt consensus in issue/discussion
2. Maintainer recommendation
3. Project lead Mission/Aha veto when category identity is at stake
4. Document outcome

### Benevolent clarity over fake democracy

Pulse starts small. Governance should be honest about authority while remaining open to persuasion via evidence and prototypes.

As maintainers grow, publish a governance doc upgrade path (not corporate theater prematurely).

---

## Release and Versioning

| Practice | Rule |
|---|---|
| Semver | Breaking = major; features = minor; fixes = patch |
| Conventional commits | Preferred for changelog automation |
| Changelog | Human-readable, user-impact first |
| Deprecation window | Announce before removal; migration notes required |
| Support window | Document which releases receive fixes |
| Pre-1.0 honesty | `0.x` may iterate faster; still no silent honesty violations (fake data, security defaults) |

### Release cadence (directional)

- MVP era: quality over calendar
- Post-v0.2: predictable minor cadence where possible
- Security fixes: as needed, always

---

## Communication and Transparency

### Public by default

- Roadmap themes
- Why non-goals remain non-goals
- Known limitations (overhead, large-app clustering)
- Incident/security disclosures for the project itself

### Not performatively public

- Private security reports until fixed windows
- Unreleased partner SaaS commercial terms
- Personal contributor data

### Roadmap shape

Publish themes, not fake Gantt certainty:

```text
Now: MVP Aha reliability
Next: Replay foundations
Later: Contracts → registry → SaaS convenience
```

Say “not yet” more often than “soon.”

---

## Maintainer Health

Open source dies from burnout more than from forks.

### Practices

- Limit review SLA promises to what humans can keep
- Use issue forms to reduce triage cost
- Close stale undiagnosable issues kindly
- Rotate focus areas
- Protect deep-work time from infinite Discussion threads
- Decline features that violate Mission even if popular

### Funding posture (strategic, not needy)

Acceptable later:

- Sponsorships
- Support contracts
- SaaS revenue supporting OSS maintenance

Unacceptable:

- Guilt-based funding messaging
- Holding security fixes for payers only

Details deferred to Business Model; principle: **commercial funding may sustain maintainers; it must not privatize core Aha.**

---

## Security Process

| Element | Requirement |
|---|---|
| `SECURITY.md` | How to report privately |
| Response target | Initial response within a published window (e.g. 48–72h aspirational) |
| Disclosure | Coordinated disclosure preferred |
| Dependency hygiene | Automated audits in CI |
| Plugin risk | Marketplace policies coordinate with Chapter 13 |

Security failures in a package installed into customer apps are existential. Treat them as P0 culture.

---

## Relationship to SaaS and Marketplace

```text
Open Source Core (always)
    ↓
Plugin contracts + registry (open)
    ↓
Marketplace commerce (optional)
    ↓
SaaS convenience (optional)
```

Rules:

1. Cloud login never required for local Aha
2. Paid plugins never replace default collectors
3. Enterprise features don’t rewrite history of OSS promises
4. Company usage of OSS is welcomed under MIT—including competitors—because excellence wins

---

## Brand and Naming Discipline

Risk already flagged: collision with official Laravel Pulse.

Open source strategy depends on clear identity:

| Need | Action |
|---|---|
| Distinguish category | Visualization twin / city—not metrics Pulse |
| Naming decision | Resolve before aggressive Packagist/GitHub marketing |
| Trademark hygiene | Avoid confusing README claims |
| Respect Laravel ecosystem | Complementary positioning in copy |

OSS growth without naming clarity produces adoption leaks and support noise.

---

## Success Signals for OSS

| Signal | Healthy reading |
|---|---|
| Stars | Trailing attention—not north star |
| Packagist installs | Adoption trending with quality |
| Issue quality | Reproductions > vague wishes |
| PR diversity | Docs + code from outsiders |
| Time-to-first-contribution | Onboarding works |
| Plugin sample clones | Extensibility understood |
| “I installed it on staging last week” stories | Real usage |

Success is when Pulse is referenced as **how Laravel apps are understood**, not only as a viral GIF.

---

## Anti-Patterns We Refuse

1. Open-core bait stripping Aha
2. Silent license changes toward enclosure
3. Ignoring contributors who did free labor
4. README vaporware screenshots unlike product
5. Infinite public roadmaps with zero shipping
6. Toxicity tolerated from high-status contributors
7. “It’s open source, fix it yourself” as first reply to good-faith users

---

## Handoff

### To Chapter 15 — Success Metrics

OSS vanity vs product metrics are separated carefully there.

### To Chapter 16 — Risks

Community, governance, and naming risks expand there.

### To Chapter 17 — Business Model

How SaaS/sponsors fund maintenance without betrayal.

### To Final PRD / Volume 9 OSS engineering docs

This chapter states strategy; later volumes specify templates, labels, CI, and release runbooks.

### One-sentence freeze

> **Pulse earns its ecosystem by being inspectable, contributable, and permanently free where Aha lives.**

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 13: Plugin Marketplace](./PluginMarketplace.md) |
| **Next chapter** | [Chapter 15: Success Metrics](./SuccessMetrics.md) |
| **Related documents** | [Mission](./Mission.md) · [Vision](./Vision.md) · [MVP](./MVP.md) · [SaaS Features](./SaaSFeatures.md) · [Plugin Marketplace](./PluginMarketplace.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | License or OSS↔commercial boundary changes require Mission-level review + version increment |

---

*Open source is how Pulse tells the truth in public. Strategy is how we keep that truth sustainable.*
