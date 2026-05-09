---
title: Skills overview
description: The full skill catalog organized by category, plus the anchor-file pattern that makes skills compound over time.
---

bettersense has **37 skills** organized into five categories. Skills auto-load when your prompt matches their description, or you can invoke them explicitly with `/bettersense:<skill-name>`.

## The anchor-file pattern

Two files dramatically improve output quality across the whole bundle:

- **`profile.md`** — *who you are.* Role, level, company context, communication style, current focus, stack. Created by `user-profile`. Read by 8+ skills automatically.
- **`strategy/<area>.md`** — *what you're building.* Target problem, approach, SMART metrics, tracks, "not working on" section. Created by `strategy-doc`. Read by 5 skills automatically.

Neither is required. Skills work without them — outputs are just more generic and harder to defend. See [Profile & strategy](/guides/profile-and-strategy) for the full setup.

---

## Skills by category

### Stakeholder management (5 skills)

| Skill | What it does |
|---|---|
| `stakeholder-register` | Register a new stakeholder (manager, peer, report, team). |
| `stakeholder-reflect` | Guided reflection on a registered stakeholder — question library, cadence-aware, dates entries. |
| `stakeholder-due` | Scan all stakeholder files and surface which question × stakeholder pairs are overdue. |
| `stakeholder-synthesize` | Read accumulated reflections for a stakeholder and surface patterns, contradictions, blind spots — with citations. |
| `stakeholder-manage` | Lifecycle ops: list / edit / re-categorize / archive / rename stakeholders. |

[Full stakeholder management docs →](/skills/stakeholder-management)

---

### Wins system (3 skills)

| Skill | What it does |
|---|---|
| `wins-log` | Capture a structured win — type, scope, collaborators, credit framing, situation, action, impact, evidence. Pushes back on vague impact. |
| `wins-due` | Weekly nudge to surface forgotten wins, probing by category (judgment, recovery, mentorship, range). |
| `wins-curate` | Turn the wins log into an artifact: promo packet, STAR interview stories, perf-review self-eval, salary case, year-in-review. |

[Full wins system docs →](/skills/wins-system)

---

### Strategy (5 skills)

| Skill | What it does |
|---|---|
| `strategy-doc` | Interview-driven strategy doc — target problem, personas, SMART metrics, tracks, "not working on", counter-metrics. |
| `impact-audit` | Stress-test whether a team's work is connected to something the business cares about — budget test, death spiral check, goal distance check. Run before strategy-doc or prioritization. |
| `product-pulse` | Dated one-page pulse report — usage, system health, AI signals, counter-metrics, ≤3 follow-up investigations. |
| `pulse-synthesize` | Read accumulated pulse reports over a time window and surface trends, anomalies, regime shifts — with citations. |
| `user-profile` | Anchor file — who you are. Created once, read automatically by 8+ skills. |

[Full strategy docs →](/skills/strategy)

---

### AI product craft (7 skills)

| Skill | What it does |
|---|---|
| `ai-pm-frameworks` | Scoping AI features, build-vs-buy-vs-rule, eval design, model selection, guardrail planning. |
| `metrics-design` | Design the metric tree for an AI feature — north star, leading/lagging, counter-metrics. |
| `demo-prep` | Five-pass prep for high-stakes demos: headline, audience, pre-mortem, script, Q&A. Extra handling for AI-feature demos. |
| `prioritization-frameworks` | Pick the right framework (RICE, ICE, WSJF, MoSCoW, Kano, Cost of Delay) and force hidden assumptions out. |
| `decision-log` | Capture decisions in ADR format with reversibility, rationale, and revisit triggers. Load-bearing for AI decisions tied to model versions. |
| `self-reflect` | Self-reflection on leadership, behavior under pressure, time/energy, fulfillment — chronological private file. |
| `patterns-watch` | Scheduled scan across stakeholder + wins + self files. Surfaces unsolicited patterns with citations. |

[Full AI product craft docs →](/skills/ai-product-craft)

---

### People leadership (12 skills)

| Skill | What it does |
|---|---|
| `coaching-mode` | Ask-not-tell mode for development conversations. GROW frame. Pushes back when you catch yourself prescribing. |
| `feedback-frameworks` | Draft and pressure-test feedback using COIN (Connection → Observation → Impact → Next) + SOLID quality checklist. |
| `one-on-one-prep` | Build 1:1 agendas matched to the relationship type (manager→report, peer, skip-level). |
| `performance-management` | Underperformance ladder — coaching → formalized feedback → PIP — with documentation and conversation scripting. |
| `hiring-craft` | Loop design, rubric-writing with behavioral anchors, structured debrief discipline. |
| `report-career-architect` | 12–18 month growth plan for a report — gaps, sequenced experiences, manager moves, risks. |
| `report-promo-case` | Panel-ready promotion packet with cited evidence, calibrated solo/shared credit, pre-empted objections. |
| `promo-case-glue` | Build promotion packets for glue-heavy engineers; translates glue tasks into technical leadership evidence with manager talking points. |
| `team-diagnosis` | Multi-dimensional team health check across eight dimensions — green/yellow/red with cited evidence and top-3 risks. |
| `workload-equity` | Diagnoses fairness of non-promotable work distribution; surfaces bias signals, single-point dependencies, and rebalancing recommendations. |
| `engineering-health` | Engineering systems diagnostic — SPACE-based productivity read, onboarding time as leading indicator, DevEx friction, platform investment case. |
| `manage-glue-workers` | Coaching & protecting glue-heavy engineers: credit amplification, workload rebalancing, promotion advocacy, skill development. |

[Full people leadership docs →](/skills/people-leadership)

---

### Cross-cutting (5 skills)

| Skill | What it does |
|---|---|
| `glue-audit` | Catalog and quantify non-core (glue) work on yourself or team — time estimates, promotion-value, fairness analysis. |
| `read-the-room` | Retrospective interpretation of a meeting or thread — who held back, performative consensus, subtext. Produces hypotheses, not claims. |
| `influence-without-authority` | Coalition-building, positions vs. interests, sequencing moves. Opinionated about the legitimacy line. |
| `leadership-os` | Managing up/down/across — 1:1s, performance reviews, stakeholder updates, post-mortems, cross-functional conflict. |
| `premortem` | Pre-mortem risk assessment using Critical/Perceived/Undiscussed categories to anticipate failure before it happens. |

[Full cross-cutting docs →](/skills/cross-cutting)

---

## All 23 agents

Agents are different from skills: they run in a focused context window, useful for tasks that carry a lot of state or span multiple steps.

[Browse the agent catalog →](/agents/catalog)
