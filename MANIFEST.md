# Manifest — `awesome-skills-ai`

This file lists every skill and agent that ships with this bundle. Use it to identify which items in `~/.claude/skills/` and `~/.claude/agents/` came from this repo (vs. skills you wrote yourself or installed from other sources).

The bundle contains **30 skills** and **13 agents**. Both `ai-technical-pm/` and `ai-technical-pm-php/` variants ship the same set; the only difference is that the PHP variant adds a concrete prototyping stack (PHP 8 + FlightPHP + HTMX + Alpine.js + Tailwind CDN + ApexCharts) inside `ai-pm-frameworks`.

## How to identify bundle items in your Claude Code install

If you installed via `scripts/install.sh` (symlink-based — see `README.md`), every bundle item in `~/.claude/skills/` or `~/.claude/agents/` is a symlink pointing into this repo. To list them:

```bash
find ~/.claude/skills ~/.claude/agents -maxdepth 2 -type l -lname "*awesome-skills-ai*"
```

If you installed via plain `cp` (the legacy install path), this manifest is your reference. Match folder/file names below against what you have in `~/.claude/`.

## Skills (30)

| Name | One-line description |
|---|---|
| `ai-pm-frameworks` | AI PM craft: build-vs-buy-vs-rule, eval design, model selection, guardrails. The PHP variant adds the prototyping stack. |
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

## Agents (13)

| Name | One-line description |
|---|---|
| `the-architect` | Production hardening for AI features. Safety sandwich, fallback design, separation of probabilistic/deterministic logic. |
| `the-eval-designer` | Smallest eval system that catches a regression. Golden set, metric class, LLM-as-judge rubric, ship/rollback bars. |
| `the-explainer` | Audience-calibrated how-it-works docs. Capability + limitations + safety triad. |
| `the-incident-responder` | AI-feature incident lead. Stabilize, investigate, blameless postmortem, feed failures back into evals. |
| `the-program-manager` | Multi-team multi-month program management. Dependency mapping, risk gates, orphan adoption, escalation framing. |
| `the-prompt-critic` | Senior-engineer-style review of production prompts. Severity-ranked findings. |
| `the-red-teamer` | Adversarial pre-launch testing for AI features. Prompt injection, exfiltration, jailbreaks, OOD. |
| `the-reducer` | Early-discovery agent. Reduces ambiguity. Pushes back on "AI problems" that are actually UI problems. |
| `the-research-synthesizer` | Clusters raw qualitative data into themes / JTBDs / product implications anchored to direct quotes. |
| `the-rfc-reviewer` | Senior-staff-engineer-style review of engineering RFCs. Problem clarity through security. |
| `the-scientist` | Pre-development AI feasibility. Builds golden datasets and eval harnesses. Refuses single-demo success. |
| `the-spec-writer` | Validated problem → decision-ready PRD. Reads `profile.md` and `strategy.md` as anchors. |
| `the-translator` | Tech → business reframing for execs/stakeholders. Honest about both. |

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
