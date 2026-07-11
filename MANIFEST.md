# Manifest — `bettersense`

This file lists every skill and agent that ships with this bundle. Use it to identify which items in `~/.claude/skills/` and `~/.claude/agents/` came from this repo (vs. skills you wrote yourself or installed from other sources).

The bundle contains **54 skills** and **22 agents**, all inside `plugin/`.

## How to identify bundle items in your Claude Code install

If you installed via `scripts/install.sh` (symlink-based — see `README.md`), every bundle item in `~/.claude/skills/` or `~/.claude/agents/` is a symlink pointing into this repo. To list them:

```bash
find ~/.claude/skills ~/.claude/agents -maxdepth 2 -type l -lname "*bettersense*"
```

If you installed via plain `cp` (the legacy install path), this manifest is your reference. Match folder/file names below against what you have in `~/.claude/`.

## Skills (54)

| Name | One-line description |
|---|---|
| `ai-pm-frameworks` | AI PM craft: build-vs-buy-vs-rule, eval design, model selection, guardrails. Prototyping stack read from user profile. |
| `capture` | Logs something from the current conversation into memory without re-typing — drafts the decision / win / stakeholder entry from what was just said, files it after approval. |
| `career-retro` | Periodic longitudinal career retrospective — reads the entire memory (wins, reflections, pulses, charters, ADRs), produces a cited self-assessment with growth deltas vs. the last retro, writes to `self/retros/`. The compounding payoff of a year of logging. |
| `coaching-mode` | Forcing function: ask-not-tell mode for development conversations. GROW frame. |
| `commitments` | Ledger of what you've promised upward (`commitments.md`) — log promises, review what's slipping, renegotiate early with a script, pressure-test new asks before saying yes. |
| `decision-log` | ADR-style capture of meaningful product/technical decisions. Especially for AI decisions tied to specific model versions. |
| `demo-prep` | Five-pass prep for high-stakes demos with extra hazard-handling for AI features. |
| `doctor` | Health-check for the memory directory — registry integrity, orphaned files, layout drift, privacy posture, backup status. Read-only by default. |
| `engineering-health` | Assesses the engineering systems layer — SPACE-based productivity diagnostic, onboarding time as leading indicator, DevEx friction, platform investment case. |
| `exec-readout-prep` | Prep for decision-seeking exec meetings — the one-sentence ask, room power map, pre-wiring, decision-first material, objection rehearsal. |
| `feedback-frameworks` | COIN structure + SOLID quality checklist for drafting and pressure-testing feedback. |
| `glue-audit` | Systematically identifies, categorizes, and quantifies glue work (non-core technical activities like onboarding, documentation, unblocking, cross-team alignment) on a team or for an individual. Produces an inventory with time estimates, promotion-value assessment, and fairness analysis. |
| `hiring-craft` | Interview loop design, behavioral-anchor rubrics, calibrated debrief discipline. |
| `impact-audit` | Stress-tests whether a team's work is connected to something the business cares about — budget test, death spiral check, goal distance check. Runs before strategy-doc or prioritization. |
| `influence-without-authority` | TPM/staff/IC influence craft: positions vs. interests, currencies model, coalition sequencing. Opinionated about the legitimacy line. |
| `leadership-os` | Managing up/down/across. Multiple sub-modes (Heat Shield, Career Architect, Diplomat, Triage Lead, etc.). |
| `manage-glue-workers` | Coaching, protecting, and developing glue-heavy engineers. Provides manager guidance on preventing burnout, ensuring visibility, redistributing non-promotable tasks fairly, and advocating against "not technical enough" bias. |
| `metrics-design` | Four-layer metric tree (north star, leading, lagging, counter-metrics) for AI features. Counter-metrics first-class. |
| `model-migration-planner` | Plans moving a live AI feature between model versions — blast-radius inventory, eval-before-belief, decision-log revisits, staged rollout with rollback criteria. |
| `one-on-one-prep` | 1:1 agendas matched to relationship type (manager→report, report→manager, peer, skip-level). Reads the stakeholder's reflection file so the agenda arrives pre-loaded. |
| `patterns-watch` | Scheduled cross-cutting scan across the reflection ecosystem. Surfaces unsolicited patterns with citations; observation-not-prediction. |
| `performance-management` | Underperformance ladder: coaching → feedback → PIP → termination. The hardest skill in management. |
| `premortem` | Pre-mortem risk assessment using Critical/Perceived/Undiscussed categories to anticipate failure before it happens. |
| `prioritization-frameworks` | Picks the right framework (RICE / ICE / WSJF / MoSCoW / Kano / Cost of Delay) for the situation. |
| `product-pulse` | Single-page dated pulse report on product health. Counter-metrics + AI-specific signals first-class. Privacy-first. |
| `psychological-safety` | Builds psychological safety on a team through concrete leader practices: vulnerability modeling, constructive response to upward speech, inclusive meeting facilitation, and rituals like pre-mortems. Diagnoses safety level and prescribes interventions. |
| `promo-case-glue` | Builds promotion packets for glue-heavy engineers. Translates glue tasks into technical leadership evidence, identifies artifacts, and provides manager talking points to counter "not technical enough" bias during calibration. |
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
| `start` | Entry point for new users — one-question branching into first-time setup (profile → persona starter kit → one stakeholder) or direct routing to the right skill. |
| `strategy-doc` | Interview-driven creation of `strategy/<area>.md`. Anchor read by spec-writer / prioritization / metrics-design / pulse skills. |
| `team-charter` | Facilitates explicit goals/roles/norms conversation for new/resetting teams. Produces living charter at `team-charters/<slug>.md`, baseline for team check-ins. The Commit step of 3X3. |
| `team-check-in` | Structured recurring conversation to revisit goals/roles/norms. Surfaces drift and guides course-correction. The Check-In step of 3X3. Works from existing charter. |
| `team-close-gap` | Turns alignment gaps into small, targeted behavioral changes with owners and environmental support. The Close step of 3X3: closes the saying-doing gap through realistic, tracked steps. |
| `team-diagnosis` | Eight-dimension team health check with cited evidence and top-3 actionable risks. |
| `team-lifecycle` | Guides teams through Tuckman's stages (forming, storming, norming, performing, adjourning) and resets after reorgs. Provides phase-specific leader interventions. |
| `team-style-inventory` | Helps teams surface and align on working style preferences (communication, decisions, conflict, meetings). Makes implicit norms explicit, accommodates differences. |
| `team-workspace` | Shared git-backed team workspace for collaborative artifacts (charters, strategy, decisions) in a separate `$BETTERSENSE_TEAM_HOME` repo. Hard privacy wall: personal reflections/wins/retros never shared. Drafts the branch/commit/PR; never pushes or publishes on your behalf. |
| `tech-strategy-writer` | Senior-IC technical strategy doc (diagnosis → direction → first moves → not doing) saved to `strategy/tech-<area>.md`. The staff+ direction-setting artifact. |
| `user-profile` | Anchor file (`profile.md`) capturing who you are. Read by 8 skills to tailor outputs. Inspired by SOUL.md. |
| `visibility-sponsorship` | Deliberate, non-gross visibility building — the visibility map, sponsor plan, and amplification rhythm that gets logged wins known before the promo moment. |
| `weekly` | The ~15-minute weekly ritual — wins capture, most-overdue stakeholder reflection, patterns scan, pulse glance, composed into one guided session. |
| `wins-curate` | Audience-specific artifact from the wins log: promo packet / interview stories / perf review / salary case / year-in-review. |
| `wins-due` | Weekly low-pressure nudge to surface forgotten wins, probing by category. |
| `wins-log` | Structured win capture (situation, action, impact, evidence, honest credit). |
| `workload-equity` | Analyzes whether non-promotable (glue) work is fairly distributed across a team with attention to demographic and seniority patterns. Surfaces bias signals and recommends rebalancing actions. |

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
