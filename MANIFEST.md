# Manifest — `bettersense`

This file lists every skill and agent that ships with this bundle. Use it to identify which items in `~/.claude/skills/` and `~/.claude/agents/` came from this repo (vs. skills you wrote yourself or installed from other sources).

The bundle contains **30 skills** and **22 agents**, all inside `plugin/`.

## How to identify bundle items in your Claude Code install

If you installed via `scripts/install.sh` (symlink-based — see `README.md`), every bundle item in `~/.claude/skills/` or `~/.claude/agents/` is a symlink pointing into this repo. To list them:

```bash
find ~/.claude/skills ~/.claude/agents -maxdepth 2 -type l -lname "*bettersense*"
```

If you installed via plain `cp` (the legacy install path), this manifest is your reference. Match folder/file names below against what you have in `~/.claude/`.

## Skills (30)

| Name | One-line description |
|---|---|
| `ai-pm-frameworks` | AI PM craft: build-vs-buy-vs-rule, eval design, model selection, guardrails. Prototyping stack read from user profile. |
| `coaching-mode` | Forcing function: ask-not-tell mode for development conversations. GROW frame. |
| `decision-log` | ADR-style capture of meaningful product/technical decisions. Especially for AI decisions tied to specific model versions. |
| `demo-prep` | Five-pass prep for high-stakes demos with extra hazard-handling for AI features. |
| `feedback-frameworks` | COIN structure + SOLID quality checklist for drafting and pressure-testing feedback. |
| `hiring-craft` | Interview loop design, behavioral-anchor rubrics, calibrated debrief discipline. |
| `influence-without-authority` | TPM/staff/IC influence craft: positions vs. interests, currencies model, coalition sequencing. Opinionated about the legitimacy line. |
| `leadership-os` | Managing up/down/across. Multiple sub-modes (Heat Shield, Career Architect, Diplomat, Triage Lead, etc.). |
| `metrics-design` | Four-layer metric tree (north star, leading, lagging, counter-metrics) for AI features. Counter-metrics first-class. |
| `one-on-one-prep` | 1:1 agendas matched to relationship type (manager→report, report→manager, peer, skip-level). |
| `patterns-watch` | Scheduled cross-cutting scan across the reflection ecosystem. Surfaces unsolicited patterns with citations; observation-not-prediction. |
| `performance-management` | Underperformance ladder: coaching → feedback → PIP → termination. The hardest skill in management. |
| `prioritization-frameworks` | Picks the right framework (RICE / ICE / WSJF / MoSCoW / Kano / Cost of Delay) for the situation. |
| `product-pulse` | Single-page dated pulse report on product health. Counter-metrics + AI-specific signals first-class. Privacy-first. |
| `pulse-synthesize` | Reads accumulated pulses, surfaces trends/anomalies/regime shifts with citations. Refuses to forecast. |
| `read-the-room` | Retrospective interpretation of meetings/threads/1:1s. Surfaces subtext as hypotheses, never facts. |
| `report-career-architect` | 12-18 month growth plans for direct reports with explicit "manager moves." |
| `report-promo-case` | Panel-ready promotion packets with cited evidence and calibrated solo-vs-shared credit. |
| `self-reflect` | Self-reflection on leadership, behavior under pressure, time/energy, fulfillment. |
| `stakeholder-due` | Computes overdue stakeholder reflections based on `suggested_freq`. Designed for `/schedule`. |
| `stakeholder-manage` | Lifecycle ops on registered stakeholders: list / edit / re-categorize / rename / archive / delete. |
| `stakeholder-reflect` | Guided reflection session on one stakeholder using a curated question library (ships in `questions.json`). |
| `stakeholder-register` | Register a new stakeholder. First-run setup of `~/bettersense-work-reflections/`. |
| `stakeholder-synthesize` | Cross-reflection synthesis for one stakeholder or category, with citation discipline. |
| `strategy-doc` | Interview-driven creation of `strategy/<area>.md`. Anchor read by spec-writer / prioritization / metrics-design / pulse skills. |
| `team-diagnosis` | Eight-dimension team health check with cited evidence and top-3 actionable risks. |
| `user-profile` | Anchor file (`profile.md`) capturing who you are. Read by 8 skills to tailor outputs. Inspired by SOUL.md. |
| `wins-curate` | Audience-specific artifact from the wins log: promo packet / interview stories / perf review / salary case / year-in-review. |
| `wins-due` | Weekly low-pressure nudge to surface forgotten wins, probing by category. |
| `wins-log` | Structured win capture (situation, action, impact, evidence, honest credit). |

## Agents (22)

| Name | One-line description |
|---|---|
| `the-architect` | Production hardening for AI features. Safety sandwich, fallback design, separation of probabilistic/deterministic logic. |
| `the-discovery-facilitator` | Structured opportunity discovery before committing to build — separates validated user needs from assumed ones, maps evidence to gaps, produces an informed conviction statement. |
| `the-eval-designer` | Smallest eval system that catches a regression — golden set, metric class, LLM-as-judge rubric, ship/rollback bars. |
| `the-explainer` | Audience-calibrated how-it-works docs — capability, limitations, safety story for customers, sales, support, execs, security/legal. |
| `the-incident-responder` | AI-feature incident lead — stabilization, technical investigation, blameless postmortems, feeding failures back into the eval set. |
| `the-postmortem-facilitator` | Blameless postmortem facilitation after any engineering incident — timeline reconstruction, five-whys root cause analysis, systemic vs. individual distinction, action item discipline. |
| `the-program-manager` | Multi-team, multi-month program management — dependency mapping, risk gates per launch phase, orphaned-problem adoption, rollout coordination, escalation framing. |
| `the-prompt-critic` | Senior-engineer-style review of production prompts — scoping, instruction order, output contract, injection resistance, drift hazards. |
| `the-red-teamer` | Adversarial pre-launch testing for AI features — prompt injection, exfiltration, jailbreaks, out-of-distribution failures. |
| `the-reducer` | Early-discovery agent — reduces ambiguity, pushes back on "AI problems" that are actually UI or data problems, defaults to "no AI" stance. |
| `the-research-synthesizer` | Clusters raw qualitative data — interview notes, support tickets, NPS verbatims — into themes, JTBDs, and product implications anchored to direct quotes. |
| `the-rfc-reviewer` | Senior-staff-engineer-style review of engineering RFCs/design docs — problem clarity, alternatives, trade-offs, failure modes, observability, scaling, security. |
| `the-scientist` | Pre-development feasibility — builds golden datasets and eval harnesses, refuses to declare success on a single demo. |
| `the-slo-designer` | Defines reliability targets and error budgets for a service — SLOs grounded in user experience, instrumentation verification, error budget policy, monitoring setup. |
| `the-spec-writer` | Turns a validated problem into a decision-ready PRD with concrete success metrics, scoped non-goals, and named seams between probabilistic and deterministic logic. |
| `the-translator` | Converts eval metrics and failure modes into honest business language for executives, stakeholders, or investor demos without hype or false humility. |
| `the-vendor-evaluator` | Systematic third-party AI tool/platform evaluation — testing on real data, TCO analysis, integration cost assessment, exit-strategy planning. |
| `the-gtm-planner` | Go-to-market launch strategy for AI features — trust-gap assessment, phased rollout cohorts, audience-calibrated messaging, AI-specific readiness gates. |
| `the-retro-facilitator` | Structured team retrospectives that produce actionable items — format selection, system diagnosis, SMART action items, psychological safety maintenance. |
| `the-data-storyteller` | Translates metrics and data into compelling narratives — insight identification, story archetype selection, narrative arc construction, action-driven conclusions. |
| `the-status-crafter` | Recurring operational status reporting — signal over noise, audience-specific framing, metrics-first presentation, decisions and risks explicitly surfaced. |
| `the-career-coach` | Individual contributor career development coaching — stage diagnosis, promotion-readiness mapping, skill-gap-to-project conversion, growth plan crafting. |

## Data the bundle creates (outside the repo)

The reflection-ecosystem skills create and maintain a private folder on the user's machine. These are user data, not bundle artifacts — keeping for reference:

- `~/bettersense-work-reflections/` (configurable via `$BETTERSENSE_WORK_REFLECTIONS_HOME`)
  - `profile.md` — created by `user-profile`
  - `strategy/<area-slug>.md` — created by `strategy-doc`
  - `stakeholders.json`, `managing-{up,across,down}/<slug>.md`, `teams/<slug>.md`, `archive/<category>/<slug>.md` — managed by the stakeholder skills
  - `self/reflections.md` — created by `self-reflect`
  - `wins.md` — created by `wins-log`
  - `pulses/<area-slug>/pulse-YYYY-MM-DD.md` — created by `product-pulse`

Uninstalling the bundle does **not** touch this folder. The data is the user's; only they decide when (or whether) to remove it.
