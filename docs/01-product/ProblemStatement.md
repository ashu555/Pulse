# Problem Statement

**Project:** Pulse (working name)  
**Tagline:** *See your Laravel application breathe.*  
**Document:** Chapter 3 — Problem Statement  
**Version:** 1.0  
**Status:** Approved for planning  
**Last updated:** July 2026

> **Naming note:** *Pulse* is a temporary working title and may change before public release. All references in this document use the working name until a final brand decision is made.

---

## Table of Contents

1. [Problem Summary](#problem-summary)
2. [The Core Problem](#the-core-problem)
3. [Who Experiences This Problem](#who-experiences-this-problem)
4. [When the Problem Manifests](#when-the-problem-manifests)
5. [A Day in the Life: Before Pulse](#a-day-in-the-life-before-pulse)
6. [How Developers Cope Today](#how-developers-cope-today)
7. [Why Current Tools Do Not Solve It](#why-current-tools-do-not-solve-it)
8. [Root Causes](#root-causes)
9. [The Cost of Invisibility](#the-cost-of-invisibility)
10. [Why This Problem Is Getting Worse](#why-this-problem-is-getting-worse)
11. [The Gap](#the-gap)
12. [What "Solved" Looks Like](#what-solved-looks-like)
13. [Problem Validation](#problem-validation)
14. [Scope of This Problem](#scope-of-this-problem)

---

## Problem Summary

**Laravel developers cannot see how their applications behave at runtime.**

They build sophisticated systems—layered services, event-driven workflows, queued jobs, real-time broadcasts—and then operate those systems blind. Understanding what happens when a user clicks a button requires mentally reconstructing behavior from log files, stack traces, database queries, and outdated architecture diagrams scattered across disconnected tools.

No existing product provides a unified, spatial, real-time view of application execution. The result is slow debugging, expensive onboarding, architectural decisions made on assumptions, and knowledge trapped in the heads of senior engineers.

**Pulse exists to solve this problem: make application behavior visible, accurate, and immediate.**

---

## The Core Problem

### Software is invisible

When a developer runs a Laravel application, they see output—not behavior.

A successful HTTP response confirms that *something* worked. It does not reveal:

- Which middleware ran, in what order, and how long each step took
- Which services were invoked and how data flowed between layers
- Which domain events fired and which listeners handled them
- Which queue jobs were dispatched, when they executed, and whether they succeeded
- Which database queries ran, whether they were necessary, and whether they created contention
- Which cache layers were hit or missed
- Which external APIs were called and how long they blocked the request

All of this activity happens silently. The developer's entire mental model of the application is **inferred**, never **observed**.

### Complexity has outpaced comprehension tools

A modern Laravel application is not a simple request-response loop. Consider what happens when a user clicks "Place Order":

```
HTTP Request
    → Authentication middleware
    → Authorization policy check
    → Route resolution
    → Controller action
    → Form request validation
    → Service layer orchestration
    → Repository / Eloquent queries
    → Database transaction commit
    → OrderCreated domain event
        → Inventory listener
        → Analytics listener
        → Notification listener
    → DispatchInvoiceJob (queued)
    → DispatchEmailJob (queued)
    → Cache invalidation
    → HTTP Response
```

The developer sees: `{ "status": "success", "order_id": 4821 }`.

Everything between the click and the response is invisible. The developer must *imagine* this flow—or reconstruct it after the fact from forensic evidence.

### The question no tool answers

Every developer, at some point, asks the same question:

> **"What is happening in my application right now—and how does everything connect?"**

Not *"What failed?"* (logs answer that.)  
Not *"Is latency high?"* (APM answers that.)  
Not *"What queries ran on this request?"* (Telescope answers that.)

The unanswered question is holistic, spatial, and temporal: **What is the living behavior of this system, and how do its parts relate?**

No existing tool was designed to answer it.

---

## Who Experiences This Problem

The invisibility of software behavior affects everyone who builds, maintains, or depends on Laravel applications—but in different ways.

### Primary sufferers

| Persona | How they experience the problem |
|---|---|
| **New team members** | Spend days or weeks building a mental model of the codebase through code reading, pair programming, and trial-and-error. Cannot "see" the application until they have internalized its structure. |
| **Debugging developers** | When a request fails or performs poorly, they grep logs, open Telescope, check Horizon, read stack traces, and query the database—piecing together a timeline manually. Hours spent reconstructing what should take seconds to observe. |
| **Senior engineers** | Carry the full mental model in their heads. Become bottlenecks for architectural questions. Their knowledge does not scale and does not survive their departure. |
| **Software architects** | Design systems on paper (or in Confluence) that may or may not match runtime reality. Have no tool to validate whether the implemented architecture matches the intended architecture. |
| **Engineering managers** | Cannot visually communicate system behavior to non-specialists. Onboarding timelines are unpredictable. Incident post-mortems rely on verbal reconstruction. |

### Secondary sufferers

| Persona | How they experience the problem |
|---|---|
| **Students learning Laravel** | Read documentation about events, queues, and middleware but cannot *see* them interact in a real application. Abstraction remains abstract. |
| **Technical interviewers** | Evaluate candidates on system design without tools that make design tangible. Portfolio projects are judged by code quality, not by demonstrable understanding of runtime behavior. |
| **Open-source contributors** | Clone an unfamiliar repository and face a wall of files. No instant map of how the application is structured or how it behaves. Contribution requires extensive exploration before the first pull request. |
| **DevOps / platform engineers** | Deploy applications they did not build. When incidents occur, they depend on application developers to explain behavior that should be self-evident. |

---

## When the Problem Manifests

The problem is not constant—it surfaces at specific, high-cost moments.

### 1. Onboarding

**Trigger:** A developer joins a team or inherits a codebase.

**Experience:** They clone the repository. They read the README. They trace routes in `web.php`. They grep for model names. They ask a senior engineer, *"What happens when a user registers?"* The senior engineer explains from memory. The new developer takes notes. Three days later, they still have not seen the application *behave*—only read about how it is structured.

**Cost:** 1–4 weeks of reduced productivity per new hire.

### 2. Debugging

**Trigger:** A request is slow, a job fails silently, or an event does not fire.

**Experience:** The developer opens Telescope and filters by request. They switch to Horizon to check queue status. They tail the log file. They add `Log::debug()` statements. They redeploy. They wait. They repeat. Each tool shows one slice of the problem. No tool shows the full journey.

**Cost:** 2–8 hours per non-trivial bug. Multiplied across every developer, every week.

### 3. Architectural review

**Trigger:** A team plans a refactor, evaluates a new service extraction, or reviews a pull request that changes execution flow.

**Experience:** Someone draws a diagram in a whiteboarding tool. The diagram represents intent, not reality. No one can confirm whether the current system actually behaves as drawn. Debates are based on assumptions. The refactor ships and introduces unexpected side effects because the actual execution paths were never observed.

**Cost:** Rework cycles, production incidents, eroded team confidence in architectural decisions.

### 4. Performance investigation

**Trigger:** A page loads slowly or a queue backs up.

**Experience:** The developer opens an APM dashboard and sees that "the database is slow." They do not see *which* queries, triggered by *which* service calls, during *which* part of the request lifecycle, affecting *which* downstream jobs. They optimize the wrong layer because they cannot see the full execution graph.

**Cost:** Days of optimization on the wrong bottleneck. Premature infrastructure scaling.

### 5. Teaching and learning

**Trigger:** A developer tries to understand Laravel internals—how events propagate, how middleware chains execute, how queues process jobs.

**Experience:** They read the documentation. They write a toy application. They `dd()` their way through a request. They never see a real, production-scale application behave as a connected system. Framework concepts remain theoretical.

**Cost:** Shallow understanding. Developers who can use Laravel but cannot reason about it under load.

### 6. Incident response

**Trigger:** Production is degraded. Users report errors. The on-call engineer needs to understand what changed.

**Experience:** They check monitoring alerts (something is slow). They read error logs (something failed). They cannot see the cascade: Request A triggered Event B, which dispatched Job C, which failed and retried three times, blocking Worker D. The root cause is three hops away from where the alert fired.

**Cost:** Extended mean time to resolution (MTTR). Customer impact. Engineer burnout.

---

## A Day in the Life: Before Pulse

Meet **Alex**, a mid-level Laravel developer who joined a team maintaining a multi-service e-commerce application two weeks ago.

### 9:00 AM — A bug report arrives

> "Checkout sometimes fails for users with saved payment methods."

Alex opens Telescope. Filters requests by route `POST /checkout`. Finds a failed request from yesterday. Sees a 500 error and a stack trace pointing to `PaymentService::charge()`. Opens the file. Reads the code. Adds a `Log::info()` call. Commits. Waits for the next failure.

**Time spent:** 45 minutes. **Understanding gained:** One failure point in one request. The full checkout flow remains invisible.

### 11:00 AM — A performance complaint

> "The product listing page is slow."

Alex opens Debugbar in the browser. Sees 47 database queries. Opens Laravel Pint—no, wrong tool—opens the query log. Identifies N+1 queries on the `Product` model. Fixes eager loading. Page is faster.

But Alex cannot see that the listing page also fires a `ProductListed` event that dispatches three queue jobs, one of which calls an external API. That job is not the bottleneck today—but it will be at scale. Alex does not know it exists in the request path.

**Time spent:** 2 hours. **Understanding gained:** Query optimization only. Event and job side effects remain invisible.

### 2:00 PM — A new feature request

> "Add a 'notify me when back in stock' feature."

Alex needs to understand how the existing notification system works. Asks in Slack. A senior engineer explains: *"When inventory changes, we fire `InventoryUpdated`, the `NotificationListener` picks it up, and dispatches `SendNotificationJob to the notifications queue."*

Alex takes notes. Sketches a diagram. Implements the feature. Ships it. The feature works—but Alex still has not *seen* the notification flow execute. If a listener is added or a queue changes, Alex will not know until something breaks.

**Time spent:** 1 day. **Understanding gained:** Secondhand knowledge of one event path. No visual or experiential confirmation.

### 5:00 PM — Reflection

Alex spent the entire day working on the application without ever *seeing* it behave. Every insight came from reading code, grepping logs, or asking colleagues. Alex is productive—but operating blind.

**This is the problem Pulse solves.**

---

## How Developers Cope Today

Developers have developed workflows to compensate for the invisibility of software. These workflows work—but they are slow, fragile, and do not scale.

### Compensation strategy 1: Mental models in senior engineers' heads

The most experienced developer on the team carries a complete mental map of how the application behaves. New team members ask them questions. This works until:

- The senior engineer is on vacation
- The senior engineer leaves the company
- The application changes and the mental model drifts
- The team grows beyond what one person can support

**Failure mode:** Knowledge silo. Bus factor of one.

### Compensation strategy 2: Log archaeology

Developers sprinkle `Log::info()`, `Log::debug()`, and `ray()` calls throughout the codebase. When something goes wrong, they tail log files and reconstruct timelines.

This works for known-unknowns (you suspected where the problem was and logged accordingly). It fails for unknown-unknowns (you did not know to log that section).

**Failure mode:** Log pollution. Performance overhead. Still reconstructive, not observational.

### Compensation strategy 3: Tool hopping

For a single debugging session, a developer may use:

| Step | Tool | What they learn |
|---|---|---|
| 1 | Browser DevTools | Network timing |
| 2 | Laravel Debugbar | Queries and views for one request |
| 3 | Telescope | Request details, jobs, events (after the fact) |
| 4 | Horizon | Queue status and throughput |
| 5 | `php artisan tinker` | Manual model inspection |
| 6 | Database client | Raw data state |
| 7 | Log files | Error messages and custom debug output |
| 8 | Confluence / Notion | Architecture diagrams (possibly outdated) |

Each tool provides a slice. The developer assembles the slices mentally. Context-switching between tools costs cognitive load and time.

**Failure mode:** Fragmented understanding. No single source of truth.

### Compensation strategy 4: Documentation and diagrams

Teams maintain architecture diagrams, sequence diagrams, and README files describing how the system works. These are valuable—and invariably outdated. The moment code merges, the diagram lies.

**Failure mode:** False confidence. Decisions based on documentation that does not match reality.

### Compensation strategy 5: Pair programming and walkthroughs

Senior engineers walk new team members through the codebase verbally. This is the most effective compensation strategy—and the least scalable. It requires synchronous time from the most expensive resource on the team.

**Failure mode:** Does not scale. Not repeatable. Not available on demand.

---

## Why Current Tools Do Not Solve It

Existing tools are excellent within their domains. The problem is that **no domain covers unified, spatial, real-time application comprehension.**

### Tool-by-tool analysis

| Tool | Domain | What it answers | Why it fails to solve the core problem |
|---|---|---|---|
| **Laravel Telescope** | Request introspection | "What happened on this specific request?" | Tabular, retrospective, per-request. No spatial model. No real-time city. No cross-request patterns visible at a glance. |
| **Laravel Horizon** | Queue management | "What is the state of my queues?" | Queues only. No connection to the HTTP request that dispatched the job. No visualization of the full execution graph. |
| **Laravel Debugbar** | In-request debugging | "What happened during this page load?" | Dies when the request ends. Browser-only. No events, no queued jobs, no cross-request view. |
| **Spatie Ray** | Ad-hoc debugging | "What is the value of this variable right now?" | Point-in-time dumps. Developer must know where to look. No system-level view. |
| **Grafana / Datadog** | Infrastructure monitoring | "Is the system healthy? What are the trends?" | Aggregate metrics. Charts and graphs. Optimized for SREs, not for developers understanding application logic. |
| **ELK / Loki** | Log aggregation | "What do the logs say?" | Text reconstruction. No spatial relationships. No real-time visualization. |
| **Confluence / Mermaid** | Documentation | "What was the intended design?" | Static. Drifts from reality. Not connected to runtime behavior. |
| **Xdebug / Step debugger** | Line-by-line execution | "What is happening on this line?" | Halts execution. Single-threaded. Cannot observe concurrent requests, queued jobs, or event propagation. |

### The categorical gap

```
┌─────────────────────────────────────────────────────────────┐
│                    WHAT TOOLS COVER                         │
│                                                             │
│   Logs ─── Metrics ─── Queries ─── Queues ─── Events       │
│     │         │          │          │          │            │
│     └─────────┴──────────┴──────────┴──────────┘            │
│                         │                                   │
│                   Each tool covers                          │
│                   ONE dimension                             │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│                    WHAT NO TOOL COVERS                      │
│                                                             │
│         Unified, spatial, real-time comprehension           │
│         of how ALL dimensions connect during execution      │
│                                                             │
│                    ┌───────────┐                            │
│                    │   PULSE   │                            │
│                    └───────────┘                            │
└─────────────────────────────────────────────────────────────┘
```

Pulse does not replace these tools. Pulse fills the space none of them occupy.

---

## Root Causes

The problem is not a missing feature in an existing tool. It is structural.

### Root cause 1: Software was designed to be executed, not observed

Programming languages, frameworks, and runtimes optimize for execution speed, correctness, and developer ergonomics—not for observability of the developer's own comprehension. Laravel gives you excellent tools to *build* applications. It does not give you a way to *see* them run.

### Root cause 2: Observability tooling was built for operations, not development

APM, logging, and monitoring platforms were designed for production operations teams answering *"Is the system up?"* and *"What broke?"* They were not designed for development teams answering *"How does this system work?"* and *"What is it doing right now?"*

### Root cause 3: Abstraction hides behavior by design

Laravel's elegance is built on abstraction—middleware pipelines, service containers, event dispatchers, queue workers. Each abstraction layer simplifies development but adds a layer of invisibility. The more elegant the framework, the less visible the execution.

### Root cause 4: No spatial paradigm exists for backend systems

Frontend developers have browser DevTools—a visual, interactive, real-time representation of DOM, network, and performance. Backend developers have text. There is no equivalent spatial interface for server-side execution. The city metaphor does not exist in any product.

### Root cause 5: Knowledge does not persist or transfer

When a developer debugs a problem and understands the flow, that understanding lives in their head. It is not captured, visualized, or shareable. The next developer who encounters the same area starts from zero.

---

## The Cost of Invisibility

### Developer time

| Activity | Estimated time without Pulse | Estimated time with Pulse | Savings |
|---|---|---|---|
| Onboarding to basic comprehension | 1–4 weeks | 1–3 days | 80–90% |
| Debugging a non-trivial issue | 2–8 hours | 15–60 minutes | 75–90% |
| Understanding a new feature area | 4–8 hours | 30–60 minutes | 85–90% |
| Architectural review preparation | 2–4 hours | 30 minutes | 75–85% |
| Explaining system behavior to a colleague | 30–60 minutes (synchronous) | Self-serve (asynchronous) | 100% of sync time |

These are estimates based on common Laravel team workflows. Actual savings depend on application complexity and team size. Even conservative estimates represent **hours per developer per week** recovered.

### Organizational cost

| Impact | Consequence |
|---|---|
| **Slow onboarding** | New hires reach full productivity weeks later than necessary. Salary cost of reduced output. |
| **Knowledge silos** | Senior engineers become bottlenecks. Team velocity capped by one person's availability. |
| **Wrong optimizations** | Developers optimize layers they can see (queries) while invisible layers (events, jobs) become the real bottleneck at scale. |
| **Incident MTTR** | Longer resolution times mean longer customer impact and higher engineer stress. |
| **Architectural drift** | Intended design and actual behavior diverge silently. Refactors introduce regressions. |
| **Contributor friction** | Open-source projects with complex architectures attract fewer contributors because the barrier to understanding is too high. |

### Intangible cost

- **Confidence.** Developers who cannot see their application behave are less confident in their changes.
- **Joy.** Debugging by log archaeology is not why people became developers.
- **Craft.** Senior engineers spend time explaining instead of building.
- **Learning.** Students and junior developers learn Laravel mechanics without ever seeing them compose into a living system.

---

## Why This Problem Is Getting Worse

The problem of software invisibility is not static—it accelerates with three trends.

### Trend 1: Applications are growing more event-driven

Modern Laravel applications increasingly rely on domain events, listeners, and observers. A single user action can trigger dozens of downstream effects across synchronous and asynchronous boundaries. Each event adds a layer of invisibility.

### Trend 2: Queue-heavy architectures are standard

Background job processing is no longer optional—it is how Laravel applications handle email, notifications, image processing, report generation, and third-party integrations. Jobs execute in separate processes, on separate timelines, with separate failure modes. The gap between "the request completed" and "the work is done" grows wider.

### Trend 3: Service-oriented internal architecture

Even within a monolithic Laravel application, teams increasingly adopt service layers, action classes, DTOs, and repository patterns. The number of layers a request passes through grows. Each layer is a building block the developer cannot see.

### The compounding effect

```
2020 Laravel app:  Route → Controller → Model → Response
2026 Laravel app:  Route → Middleware → Controller → FormRequest → Service →
                   Repository → Model → Event → Listeners → Jobs → Notifications →
                   Cache → Response

Layers in 2020: 4
Layers in 2026: 12+

Visibility tools in 2020: Same as 2026
```

The framework evolved. The comprehension tools did not.

---

## The Gap

Between what developers need and what tools provide, there is a clear, unoccupied gap.

### What developers need

| Need | Description |
|---|---|
| **Unified view** | One interface showing requests, events, jobs, and services together—not scattered across five tools |
| **Spatial representation** | Components and their relationships rendered visually, not as text tables |
| **Real-time observation** | Behavior visible as it happens, not reconstructed after the fact |
| **Zero-config discovery** | The tool learns the application structure automatically, without manual mapping |
| **Inspectable detail** | Click any element to see what happened inside—payloads, timing, errors |
| **Accurate representation** | Every visual element maps to real execution data—nothing simulated |
| **Non-invasive installation** | A package that installs without modifying application code |

### What exists today

| Exists | Does not exist |
|---|---|
| Per-request introspection (Telescope) | Unified cross-cutting visualization |
| Queue monitoring (Horizon) | Spatial representation of architecture |
| In-browser debugging (Debugbar) | Real-time multi-component animation |
| Aggregate metrics (Datadog) | Zero-config auto-discovery |
| Ad-hoc variable dumps (Ray) | Inspectable city with click-to-detail |
| Static diagrams (Confluence) | Living diagram that reflects actual behavior |
| Log reconstruction | Watch-the-system-breathe observation |

### The gap, stated simply

> Developers need to **see** their application.  
> Today's tools let them **read about** their application.  
> Nobody lets them **watch** their application.

That is the gap Pulse fills.

---

## What "Solved" Looks Like

The problem is solved when a Laravel developer can:

1. **Install Pulse** with `composer require` and see their application rendered as a city within sixty seconds—no configuration, no manual mapping.

2. **Trigger any action** in their application and watch the request move through the city in real time—past buildings (controllers), along roads (middleware), carrying messengers (events), dispatching trains (jobs).

3. **Click any element** in the city to inspect what happened—payloads, timing, errors, relationships—without switching to another tool.

4. **Onboard to a new codebase** by exploring its city instead of reading its files—understanding architecture through observation, not archaeology.

5. **Debug an issue** by watching where the flow stalls, diverges, or fails—instead of reconstructing the timeline from logs.

6. **Explain system behavior** to a colleague by sharing the city view—replacing thirty-minute verbal walkthroughs with self-serve exploration.

7. **Trust what they see** because every pixel represents real execution data—nothing simulated, nothing decorative.

### Success criteria

| Criterion | Measure |
|---|---|
| Time from install to comprehension | < 60 seconds to see the city; < 5 minutes to understand a request flow |
| Tool-switching during debugging | Zero—Pulse is the single interface |
| Onboarding time to basic architectural understanding | Reduced by 80%+ vs. code-reading alone |
| Developer sentiment | "I cannot imagine working on a Laravel app without Pulse" |
| Accuracy | 100% of visualized elements map to real execution data |

---

## Problem Validation

### Evidence this problem is real

| Signal | Evidence |
|---|---|
| **Telescope has 5M+ downloads** | Developers desperately want to see inside their applications—Telescope proves demand for observability |
| **Horizon is standard in production** | Queue visibility is a recognized need—but it covers only one dimension |
| **Ray is commercially successful** | Developers pay for better debugging—proving willingness to invest in comprehension tools |
| **"How does this app work?" is the #1 question new hires ask** | Universal onboarding pain across every Laravel team |
| **Architecture diagrams are always outdated** | Teams try to solve the spatial problem manually and fail to maintain it |
| **Log-driven debugging is the default workflow** | Developers compensate for invisibility with `Log::debug()` because they have no alternative |
| **Frontend has DevTools; backend has nothing equivalent** | The asymmetry is recognized but unaddressed in the Laravel ecosystem |

### What would disprove this problem

Pulse's thesis is falsifiable. The problem statement would be wrong if:

- Developers routinely understand new codebases within hours without assistance (they do not)
- Existing tools already provide unified, spatial, real-time visualization (they do not)
- The "Aha!" moment does not resonate with target users (to be validated in beta)
- The overhead of observation outweighs the comprehension benefit (to be benchmarked)

We proceed because the evidence strongly supports the problem—and no existing product addresses it.

---

## Scope of This Problem

### In scope

This problem statement covers the comprehension gap for **Laravel application runtime behavior**—how requests, events, jobs, and services execute and interact in development and staging environments.

### Out of scope

| Area | Why it is out of scope |
|---|---|
| Production monitoring and alerting | Operations problem, not comprehension problem. Covered by Datadog, New Relic, etc. |
| Log aggregation and search | Forensics problem. Covered by ELK, Loki, etc. |
| Infrastructure monitoring | Server/network problem. Covered by Grafana, Prometheus, etc. |
| Code quality and static analysis | Pre-runtime problem. Covered by PHPStan, Larastan, Pint, etc. |
| Non-Laravel frameworks (v1) | Same problem exists, but Pulse v1 focuses on Laravel. Future adapters address other frameworks. |

### Boundary principle

Pulse solves the **comprehension** problem. It does not solve the **operations**, **forensics**, or **quality** problems. Clear boundaries prevent scope creep and keep the mission focused.

---

## Document Governance

| Field | Value |
|---|---|
| **Author** | Pulse Engineering Team |
| **Reviewers** | CTO, Staff Engineer, Product Architect |
| **Previous chapter** | [Chapter 2: Mission](./Mission.md) |
| **Next chapter** | [Chapter 4: Target Audience](./TargetAudience.md) |
| **Related documents** | [Vision](./Vision.md) · [Mission](./Mission.md) · [Target Audience](./TargetAudience.md) · [PROJECT_SPEC.md](../../PROJECT_SPEC.md) |
| **Change process** | All changes require review. Version increment on material changes. |

---

*A problem well stated is half solved. This document defines the problem Pulse exists to solve. Every feature, design decision, and architectural choice must trace back to closing this gap.*
