# bettersense

A growing collection of [Claude Code](https://claude.com/claude-code) **skills** and **subagents** for the people responsible for building and leading in the age of AI — AI Product Managers, Engineering Managers, TPMs, and senior ICs leading without authority.

These aren't generic productivity prompts. They encode the actual frameworks, mental models, and operational modes that technical leaders use day-to-day:

- **AI PMs**: deciding *whether* a problem deserves AI in the first place, building eval harnesses before committing engineering, designing safety sandwiches around LLM calls, red-teaming before launch, translating model metrics into business outcomes
- **Engineering managers**: coaching without prescribing, running performance conversations, building promotion cases, designing growth plans for reports, diagnosing team health
- **TPMs and senior ICs**: leading across teams that don't report to you, influencing without authority, managing multi-team programs, navigating stakeholder complexity
- **All of the above**: stakeholder reflection, wins logging, self-reflection, cadence-driven insight that accumulates over months

## Why this exists

Most "AI for technical leaders" tooling either over-promises ("AI writes your PRD!") or under-delivers (a chatbot that doesn't know what an eval harness is). This repo takes a different bet: give Claude Code a small, opinionated set of skills and subagents that match how working technical leaders actually think, and let the harness route to the right one automatically based on what you're doing.

Each skill is a reusable framework Claude consults when context matches. Each subagent is a focused operational mode you can invoke explicitly or let Claude delegate to.

## What's inside

```
bettersense/
├── plugin/
│   ├── monitors/
│   │   └── monitors.json
│   ├── bin/
│   │   └── check-wins-cadence
│   ├── skills/
│   │   ├── ai-pm-frameworks/SKILL.md
│   │   ├── capture/SKILL.md
│   │   ├── career-retro/SKILL.md
│   │   ├── coaching-mode/SKILL.md
│   │   ├── commitments/SKILL.md
│   │   ├── decision-log/SKILL.md
│   │   ├── demo-prep/SKILL.md
│   │   ├── doctor/SKILL.md
│   │   ├── engineering-health/SKILL.md
│   │   ├── exec-readout-prep/SKILL.md
│   │   ├── feedback-frameworks/SKILL.md
│   │   ├── glue-audit/SKILL.md
│   │   ├── hiring-craft/SKILL.md
│   │   ├── impact-audit/SKILL.md
│   │   ├── influence-without-authority/SKILL.md
│   │   ├── leadership-os/SKILL.md
│   │   ├── manage-glue-workers/SKILL.md
│   │   ├── metrics-design/SKILL.md
│   │   ├── model-migration-planner/SKILL.md
│   │   ├── one-on-one-prep/SKILL.md
│   │   ├── patterns-watch/SKILL.md
│   │   ├── performance-management/SKILL.md
│   │   ├── premortem/SKILL.md
│   │   ├── prioritization-frameworks/SKILL.md
│   │   ├── product-pulse/SKILL.md
│   │   ├── psychological-safety/SKILL.md
│   │   ├── promo-case-glue/SKILL.md
│   │   ├── pulse-synthesize/SKILL.md
│   │   ├── read-the-room/SKILL.md
│   │   ├── report-career-architect/SKILL.md
│   │   ├── report-promo-case/SKILL.md
│   │   ├── self-reflect/SKILL.md
│   │   ├── stakeholder-due/SKILL.md
│   │   ├── stakeholder-manage/SKILL.md
│   │   ├── stakeholder-reflect/
│   │   │   ├── SKILL.md
│   │   │   └── questions.json
│   │   ├── stakeholder-register/SKILL.md
│   │   ├── stakeholder-synthesize/SKILL.md
│   │   ├── start/SKILL.md
│   │   ├── strategy-doc/SKILL.md
│   │   ├── team-charter/SKILL.md
│   │   ├── team-check-in/SKILL.md
│   │   ├── team-close-gap/SKILL.md
│   │   ├── team-diagnosis/SKILL.md
│   │   ├── team-lifecycle/SKILL.md
│   │   ├── team-style-inventory/SKILL.md
│   │   ├── team-workspace/SKILL.md
│   │   ├── tech-strategy-writer/SKILL.md
│   │   ├── user-profile/SKILL.md
│   │   ├── visibility-sponsorship/SKILL.md
│   │   ├── weekly/SKILL.md
│   │   ├── wins-curate/SKILL.md
│   │   ├── wins-due/SKILL.md
│   │   ├── wins-log/SKILL.md
│   │   └── workload-equity/SKILL.md
│   └── agents/
│       ├── the-architect.md
│       ├── the-career-coach.md
│       ├── the-data-storyteller.md
│       ├── the-discovery-facilitator.md
│       ├── the-eval-designer.md
│       ├── the-explainer.md
│       ├── the-gtm-planner.md
│       ├── the-incident-responder.md
│       ├── the-postmortem-facilitator.md
│       ├── the-program-manager.md
│       ├── the-prompt-critic.md
│       ├── the-red-teamer.md
│       ├── the-reducer.md
│       ├── the-research-synthesizer.md
│       ├── the-retro-facilitator.md
│       ├── the-rfc-reviewer.md
│       ├── the-scientist.md
│       ├── the-slo-designer.md
│       ├── the-spec-writer.md
│       ├── the-status-crafter.md
│       ├── the-translator.md
│       └── the-vendor-evaluator.md
```

### Skills

| Skill | When it triggers |
|---|---|
| `ai-pm-frameworks` | Scoping AI features, build-vs-buy-vs-rule decisions, eval design, model selection, guardrail planning. |
| `capture` | Logs something from the current conversation into memory without re-typing — classifies it (decision / win / stakeholder observation / self-insight), drafts the entry from what was just said, and files it after approval. Closes the "great conversation, nothing written down" leak. |
| `career-retro` | Periodic (quarterly/annual) career retrospective that reads the *entire* memory — wins, all stakeholder reflections, self-reflections, pulses, team charters, ADRs — and produces a longitudinal self-assessment with growth deltas cited against your last retro. Persists to `self/retros/` so each cycle measures change. The payoff of a year of logging; feeds `wins-curate` and `report-promo-case`. |
| `coaching-mode` | Forcing function that flips the assistant into ask-not-tell mode for development conversations with reports. Stays in question-mode for at least 5 turns, applies the GROW frame, pushes back when the user tries to prescribe instead of helping the report work it out. |
| `commitments` | Ledger of what you've promised upward — log promises when made, review what's due or slipping, renegotiate early with a two-option script, and pressure-test new asks against current load before saying yes. The honest "no" as a prioritization question. |
| `decision-log` | Capturing meaningful product/technical decisions in an ADR-style format with reversibility, rationale, and revisit triggers. Especially load-bearing for AI decisions tied to specific model versions. |
| `demo-prep` | Five-pass prep for high-stakes demos: headline, audience, pre-mortem, script, and Q&A — with extra hazard-handling for AI-feature demos. Loads your strategy doc and latest pulse so the numbers match what the data said this week. |
| `doctor` | Health-check for the memory directory — stakeholders.json integrity, orphaned files, layout drift, privacy posture, backup status. Read-only by default; every fix needs explicit approval. Run it before machine migrations and whenever something feels off. |
| `engineering-health` | Assesses the engineering systems layer — SPACE-based productivity diagnostic, onboarding time as a leading indicator, developer experience friction identification, and making the case for platform investment. Designed to run alongside or after `team-diagnosis`. |
| `exec-readout-prep` | Prep for meetings where you need a decision from executives — the one-sentence falsifiable ask, room power map (reads your stakeholder reflections on the execs present), pre-wiring plan, decision-first material, and rehearsal of the hard five minutes. |
| `feedback-frameworks` | Drafting and pressure-testing feedback for reports, peers, and stakeholders using the COIN structure (Connection → Observation → Impact → Next steps) and the SOLID quality checklist. Pulls dated incidents from your stakeholder reflections as Observation evidence. |
| `glue-audit` | Systematically identifies, categorizes, and quantifies glue work (non-core technical activities like onboarding, documentation, unblocking, cross-team alignment) on a team or for an individual. Produces an inventory with time estimates, promotion-value assessment, and fairness analysis to diagnose workload distribution and support promotion cases for glue-heavy engineers. |
| `hiring-craft` | Treats hiring as craft, not vibes — designing interview loops with explicit signals, writing rubrics with behavioral anchors, and running calibrated debriefs (silent vote first, junior voices first, signal-by-signal walk-through). |
| `impact-audit` | Stress-tests whether a team's work is actually connected to something the business cares about — runs the budget test, death spiral check, and goal distance check. Designed to run before `strategy-doc` or `prioritization-frameworks`, when the question is "are we even pointed at the right thing?" |
| `influence-without-authority` | For TPMs, staff engineers, and senior ICs leading people who don't report to them. Diagnoses positions vs. interests, applies the currencies model, sequences coalitions, and is opinionated about legitimate vs. manipulative influence patterns. |
| `leadership-os` | Managing up/down/across — 1:1s, performance reviews, stakeholder updates, post-mortems, cross-functional conflict. |
| `manage-glue-workers` | Coaching, protecting, and developing engineers who consistently do glue work. Provides manager guidance on preventing burnout, ensuring visibility, redistributing non-promotable tasks fairly, and advocating for glue-heavy reports in promotion cycles against "not technical enough" bias. |
| `metrics-design` | Designs the metric tree for an AI feature — north star, leading/lagging, and the counter-metrics that catch Goodhart-style failures where you optimize the model into a worse product. |
| `model-migration-planner` | Plans moving a live AI feature between model versions — blast-radius inventory (pinned versions, tuned prompts, output contracts), eval-before-belief, revisiting decision-log entries tied to the old model, staged rollout with written rollback criteria. |
| `one-on-one-prep` | Builds 1:1 agendas matched to the relationship (manager → report, report → manager, peer, skip-level) instead of generic templates. Reads the stakeholder's reflection file first, so the agenda arrives pre-loaded with open loops and things worth raising. |
| `patterns-watch` | Scheduled cross-cutting scan across the reflection ecosystem (stakeholder, wins, self) — surfaces unsolicited patterns the user hasn't asked about: attention gaps, contradictions between stated focus and actual logged work, trajectory shifts. Citation-disciplined; observation-not-prediction. Designed for weekly `/schedule`. |
| `performance-management` | Walks the underperformance ladder deliberately — coaching → formalized feedback → PIP → termination — with documentation, calibrated conversations, and the brilliant-jerk pattern handled directly. The hardest skill in management. |
| `premortem` | Pre-mortem risk assessment using the three-category framework (Critical, Perceived, Undiscussed risks) to identify what could go wrong before committing to a plan. |
| `prioritization-frameworks` | Picks the right prioritization framework (RICE, ICE, WSJF, MoSCoW, Kano, Cost of Delay) for the situation, then forces hidden assumptions out into the open. |
| `product-pulse` | Single-page dated pulse report on product health — usage metrics, system performance, AI-feature signals (hallucination, refusal, eval drift), counter-metrics, follow-up investigation, provenance footer. Saves to `~/bettersense-work-reflections/pulses/<area-slug>/` so the folder accumulates into product memory. Privacy-first; designed for daily/weekly `/schedule`. |
| `psychological-safety` | Builds team psychological safety through concrete leader practices: modeling vulnerability, constructive response to upward speech, inclusive meeting facilitation, and rituals like pre-mortems and blameless post-mortems. Diagnoses safety level and prescribes actionable interventions. |
| `promo-case-glue` | Builds a promotion packet for engineers whose impact is primarily through glue work (onboarding, documentation, unblocking, process improvement). Translates glue tasks into technical leadership evidence, identifies artifacts, and provides manager talking points to counter "not technical enough" bias during calibration. |
| `pulse-synthesize` | Reads accumulated pulse reports for an area over a time window and surfaces trends, anomalies, regime shifts, and Goodhart-pattern warnings — with citations to specific dated pulses. Distinguishes trend from snapshot, refuses to forecast, surfaces coverage gaps honestly. |
| `read-the-room` | Retrospective interpretation of a meeting / Slack thread / 1:1 / design review — surfaces who held back, where consensus is performative, what positions are masking what interests, what burnout signals are present. Reads are hypotheses to verify, not facts to act on. |
| `report-career-architect` | Designs a 12–18 month growth plan for a direct report — target state, capability gaps, sequenced experiences, *manager moves* (what the user has to stop doing to make room), risks, and observable success criteria. |
| `report-promo-case` | Builds a panel-ready promotion packet for a direct report with cited evidence per dimension, calibrated solo-vs-shared credit, pre-empted objections, and gaps surfaced as pre-submission targets. The mirror image of `wins-curate` (which is for the user's own brag doc). |
| `self-reflect` | Self-reflection on leadership, behavior under pressure, time/energy, fulfillment, and advocating for yourself — captured chronologically in a private file so insight compounds over time. |
| `stakeholder-register` | Register a stakeholder (manager, peer, report, team) for ongoing reflection. Creates a per-stakeholder file at `~/bettersense-work-reflections/` (configurable via `$BETTERSENSE_WORK_REFLECTIONS_HOME`). |
| `stakeholder-manage` | Lifecycle operations on already-registered stakeholders: list / edit / re-categorize after a reorg / rename / archive when someone leaves / delete. Preserves reflection history aggressively; defaults toward archive over delete; routes by natural-language intent. |
| `stakeholder-reflect` | Guide a single reflection session about a registered stakeholder using a question library spanning *ask*, *sense*, and *ask-and-sense* lenses. Surfaces the question's `things_to_consider`, picks cadence-appropriate questions, and writes a dated entry back. |
| `stakeholder-due` | Scans your stakeholder files and surfaces which question × stakeholder pairs are overdue based on `suggested_freq`. Designed to be invoked on demand or fired weekly via `/schedule`. |
| `stakeholder-synthesize` | Synthesizes across accumulated reflections — patterns, contradictions, blind spots — with citations to specific dated entries. Never claims a pattern without evidence. |
| `start` | Entry point for new users — one-question branching into first-time setup (profile → persona starter kit → one registered stakeholder) or direct routing to the right skill for what they're working on. |
| `strategy-doc` | Interview-driven creation/update of a product/area strategy document — target problem, approach, personas, SMART metrics, 2-4 multi-month tracks, explicit "not working on" section, counter-metrics. Lives at `~/bettersense-work-reflections/strategy/<area-slug>.md` and is read as an anchor by `the-spec-writer`, `prioritization-frameworks`, `metrics-design`, `product-pulse`, and `pulse-synthesize`. Supports multiple products/areas. |
| `team-charter` | Facilitates explicit conversation on goals, roles, and norms for new or resetting teams. Produces a living charter at ~/bettersense-work-reflections/team-charters/<team>.md, serving as the baseline for recurring team check-ins and alignment. Foundation of the 3X3 team framework (Commit step). |
| `team-check-in` | Structured recurring conversation to revisit a team's goals/roles/norms foundation. Surfaces drift between stated commitments and actual behavior, then guides the team to close gaps through small steps. The Check-In step of Moussa's 3X3 framework. Works from an existing team charter. |
| `team-close-gap` | Turns identified alignment gaps into small, targeted behavioral changes with owners and environmental support. The Close step of Moussa's 3X3 framework: closes the saying-doing gap through realistic, tracked steps rather than grand resolutions. |
| `team-diagnosis` | Multi-dimensional team health check — delivery cadence, attrition risk, dependency tax, on-call burden, peer relationships, information flow, technical health, culture. Reads stakeholder files + retros + survey scores; produces a green/yellow/red read with cited evidence and top-3 risks worth acting on. |
| `team-lifecycle` | Guides a team through Tuckman's stages (forming, storming, norming, performing, adjourning) and resets after reorgs. Provides phase-specific interventions and leader actions to navigate transitions successfully. |
| `team-style-inventory` | Helps teams surface and align on working style preferences (communication, decision-making, conflict, meetings, work rhythms). Makes implicit norms explicit, accommodating style differences to reduce friction. |
| `team-workspace` | The multiplayer layer. Sets up a shared, git-backed team repo (`$BETTERSENSE_TEAM_HOME`, separate from your private reflections) for collaborative artifacts — charters, strategy docs, decision records — and enforces a hard privacy wall: stakeholder reflections, self-reflections, wins, retros, and commitments are never shareable. Scans artifacts for accidental personal content, drafts the branch/commit/PR, but leaves the push and PR to you. |
| `tech-strategy-writer` | Senior-IC technical strategy doc — diagnosis → direction → first moves → explicit "not doing" — saved to `strategy/tech-<area>.md`. The engineering-owned peer of `strategy-doc`; pressure-tested against the reversibility and absent-author checks before socializing. |
| `user-profile` | Anchor file for the bundle. Single private `~/bettersense-work-reflections/profile.md` capturing the user's role, level, communication style, current strategic focus, stack — read automatically by other skills so you never re-explain context. Inspired by the SOUL.md pattern. Supports multiple "hats" for users in mixed roles. |
| `visibility-sponsorship` | Deliberate, non-gross visibility building for ICs whose work outruns their reputation — the visibility map (who decides your career and what they can actually cite about you), the sponsor plan, and a sustainable amplification rhythm fed by `wins.md`. |
| `weekly` | The ~15-minute weekly ritual: wins capture, single most-overdue stakeholder reflection, cross-cutting patterns scan, pulse glance — composed from `wins-due`, `stakeholder-due`/`stakeholder-reflect`, and `patterns-watch` into one guided session with a stop-anytime exit. |
| `wins-log` | Capture a structured win at work — situation, action, impact, evidence, honest credit framing. Pushes back on vague impact claims and inflated solo claims. Front-of-funnel for the brag-doc / hype-doc bundle. |
| `wins-due` | Weekly low-pressure nudge to surface forgotten wins, probing by category (delivery / judgment / mentorship / recovery / range) because memory is selective. Accepts "honestly, nothing notable" without manufacturing fake wins. |
| `wins-curate` | Turn the wins log into an audience-specific artifact: promo packet, behavioral interview stories (STAR), perf-review self-eval, salary-negotiation case, or year-in-review. Never invents wins; cites log entries; surfaces gaps as prep targets. |
| `workload-equity` | Analyzes whether non-promotable (glue) work is fairly distributed across a team with attention to demographic and seniority patterns. Surfaces bias signals (gender, junior staff over-volunteering), identifies single-point dependencies, and recommends concrete rebalancing actions. Manager-facing skill for creating equitable promotion opportunities. |

### Subagents

| Agent | Operational mode |
|---|---|
| `the-discovery-facilitator` | Structured opportunity discovery before committing to build — separates validated user needs from assumed ones, maps evidence to gaps, and produces an informed conviction statement. Sits between the-reducer and the-spec-writer. |
| `the-reducer` | Early discovery. Reduces ambiguity. Pushes back on "AI problems" that are actually UI problems. |
| `the-research-synthesizer` | Clusters raw qualitative data — interview notes, support tickets, NPS verbatims — into themes, JTBDs, and product implications anchored to direct quotes. |
| `the-rfc-reviewer` | Reviews engineering RFCs / design docs / architecture proposals like a senior staff engineer — problem clarity, alternatives, trade-offs, failure modes, observability, scaling, security. Especially valuable for EMs whose technical depth is in a different domain than the proposal, or who need a credible second opinion before approving. |
| `the-slo-designer` | Defines reliability targets and error budgets for a service — SLOs grounded in user experience, instrumentation verification (queue entry vs. handler entry), error budget policy, and monitoring setup. Distinct from metrics-design (business metrics) and engineering-health (diagnosis). |
| `the-spec-writer` | Turns a validated problem into a decision-ready PRD with concrete success metrics, scoped non-goals, and named seams between probabilistic and deterministic logic. |
| `the-scientist` | Pre-development feasibility. Builds golden datasets and eval harnesses. Refuses to declare success on a single demo. |
| `the-eval-designer` | Designs the smallest eval system that would actually catch a regression — golden set, metric class, LLM-as-judge rubric, production sampling, ship/rollback bars. |
| `the-explainer` | Writes audience-calibrated how-it-works docs (customers, sales, support, execs, security/legal) covering capability, limitations, and the safety story — not marketing copy and not a research paper. |
| `the-prompt-critic` | Reviews production prompts the way a senior engineer reviews code: scoping, instruction order, output contract, injection resistance, drift hazards. |
| `the-architect` | Production hardening. Designs the input filter → LLM → output guardrail "safety sandwich." Separates probabilistic from deterministic logic. |
| `the-red-teamer` | Pre-launch and maintenance. Simulates prompt injection, exfiltration, jailbreaks, and out-of-distribution failures. |
| `the-incident-responder` | AI-feature incident lead — stabilization, technical investigation, blameless postmortems, and feeding failures back into the eval set. |
| `the-postmortem-facilitator` | Blameless postmortem facilitation after any engineering incident — timeline reconstruction, five-whys root cause analysis, systemic vs. individual distinction, and action item discipline. Distinct from the-incident-responder (real-time AI incidents); this is for after stabilization. |
| `the-program-manager` | Multi-team, multi-month program management: dependency mapping, risk gates per launch phase, orphaned-problem adoption, rollout coordination across teams, audience-calibrated status comms, escalation framing. Distinct from `the-spec-writer` (feature-level) and `prioritization-frameworks` (backlog-level). |
| `the-translator` | Stakeholder comms. Converts eval metrics and failure modes into honest business language without hype or false humility. |

## Install

Three install paths, in order of preference.

### Plugin marketplace (easiest)

**Claude Desktop app:**

1. Click **Customize** in the left sidebar
2. Click **+** next to "Personal plugins" → choose **Add marketplace**
3. Enter `shwetank/bettersense` and click **Sync**
4. Go to **Plugins → Code** tab, find Bettersense, and click **+** to install it

**Claude Code CLI (terminal):**

```
/plugin marketplace add shwetank/bettersense
/plugin install bettersense@bettersense
```

To update later: `/plugin marketplace update bettersense`

> **Note:** The `/plugin` commands only work in the terminal CLI. Pasting them into the Desktop app chat does nothing — use the GUI steps above instead.

Run `/bettersense:start` in a new chat to verify and get oriented.

### Symlink-based install (recommended for development / standalone)

**macOS / Linux / WSL:**

```bash
git clone https://github.com/shwetank/bettersense.git
cd bettersense

# Install at user scope (available in every project):
scripts/install.sh

# Project scope instead (just this repo):
scripts/install.sh --scope=project
```

**Windows (PowerShell):** Requires Developer Mode (Settings → System → Developer Mode) or admin elevation for symlink creation.

```powershell
git clone https://github.com/shwetank/bettersense.git
cd bettersense
.\scripts\install.ps1           # user scope
.\scripts\install.ps1 -Scope project
```

The script creates symlinks from `~/.claude/{skills,agents}/` (or `./.claude/...` for project scope) back into this repo. Three benefits:

1. **Updates are free** — `git pull` updates your installed skills automatically.
2. **You can identify bundle items at a glance** — macOS/Linux:
   ```bash
   find ~/.claude/skills ~/.claude/agents -maxdepth 2 -type l -lname "*bettersense*"
   ```
   Windows (PowerShell):
   ```powershell
   Get-ChildItem "$HOME\.claude\skills","$HOME\.claude\agents" | Where-Object { $_.LinkType -eq 'SymbolicLink' -and $_.Target -like '*bettersense*' }
   ```
3. **Clean uninstall** — `scripts/uninstall.sh` (or `uninstall.ps1` on Windows) removes only items that are symlinks into this repo. Skills you wrote yourself or installed from elsewhere are untouched.

The script will prompt before doing anything. Existing skills with the same name are skipped by default; pass `--force` (bash) or `-Force` (PowerShell) to overwrite.

### Alternative: manual copy

If you prefer copies over symlinks (no admin needed, frozen snapshot):

**macOS / Linux / WSL:**
```bash
cd bettersense/plugin
mkdir -p ~/.claude/skills ~/.claude/agents
cp -r skills/* ~/.claude/skills/
cp agents/*.md ~/.claude/agents/
```

**Windows (PowerShell):**
```powershell
cd bettersense\plugin
New-Item -ItemType Directory -Force "$HOME\.claude\skills","$HOME\.claude\agents"
Copy-Item -Recurse skills\* "$HOME\.claude\skills\"
Copy-Item agents\*.md "$HOME\.claude\agents\"
```

Tradeoff: no automatic updates, and identifying bundle items later requires consulting [`MANIFEST.md`](MANIFEST.md) at the repo root.

### Identifying bundle items

The repo root [`MANIFEST.md`](MANIFEST.md) lists every skill and agent in the bundle by name with a one-line description. Use it as your reference for "is this skill mine, or part of this bundle?" — especially useful if you installed via `cp` and don't have the symlink trail to follow.

### Verifying

Verify with `/agents` inside Claude Code — the 22 subagents should appear. Skills auto-load when prompts match their `description`; you can also trigger them explicitly with `/<skill-name>` (e.g. `/ai-pm-frameworks`, `/decision-log`, `/leadership-os`, `/stakeholder-reflect`, `/wins-log`, `/coaching-mode`, `/read-the-room`, `/user-profile`, `/strategy-doc`, `/product-pulse`).

### Updating skills after changes

Two layers — disk and runtime — and they have different answers.

**On disk:**
- **Symlink install:** changes are instant. The file Claude Code reads from `~/.claude/skills/<name>/SKILL.md` is the same file as `<repo>/.../skills/<name>/SKILL.md`. Edit the repo, no re-install step needed. `git pull` to take upstream updates.
- **Manual `cp` install:** you copied the file once; subsequent repo edits don't propagate. Either re-copy manually, or — better — run `scripts/install.sh <variant> --force` to replace copies with symlinks and switch to the auto-update path going forward.

**Inside Claude Code (the runtime layer):**
The harness's caching semantics aren't comprehensively documented. Best working model:

- **Editing the body of an existing skill** (operating principles, examples, etc.) — usually picked up on the next invocation, since Claude reads the skill file when it routes into or runs the skill.
- **Changing the `description` in frontmatter** — may or may not affect auto-routing within an active session. The routing layer may have loaded the old description at session start. New sessions definitely see the update.
- **Adding a new skill** — the routing layer needs to discover it. Reliable in new sessions; may not be in your current one.
- **Removing a skill, renaming it, or changing the `name` field** — needs a restart. The routing layer carries stale state otherwise.

**Safe rule:** start a new Claude Code session after any non-trivial change. Cheapest way to guarantee the routing layer is fresh.

**Verifying a change actually took effect:** add a unique visible marker temporarily in the skill's operating principles, e.g.:

```markdown
- **ALWAYS PREFIX YOUR FIRST RESPONSE WITH "TESTMARKER-2026-05-04"**
```

Invoke the skill; if you see the marker, the change is live. Remove it once confirmed.

**Practical rhythm:**
1. Install once via `scripts/install.sh` (symlinks).
2. Edit skills in the repo whenever you want to tune them.
3. Start a new Claude Code session after non-trivial edits.
4. `git pull` to take upstream updates — instant, since you're on symlinks.

### Uninstall

**macOS / Linux / WSL:**
```bash
scripts/uninstall.sh                  # removes symlinks from ~/.claude/
scripts/uninstall.sh --scope=project  # removes from ./.claude/ instead
scripts/uninstall.sh --dry-run        # preview without removing
scripts/uninstall.sh --hard-uninstall # also offer to remove copies (one prompt per item)
```

**Windows (PowerShell):**
```powershell
.\scripts\uninstall.ps1
.\scripts\uninstall.ps1 -Scope project
.\scripts\uninstall.ps1 -WhatIf        # preview without removing
.\scripts\uninstall.ps1 -HardUninstall # also offer to remove copies
```

Your reflection data at `~/bettersense-work-reflections/` (or `$HOME\bettersense-work-reflections\` on Windows) is **not** touched by uninstall. The data is yours; remove it manually if you want.

## Setup: data directory, environment, and scheduling

The basic Install above gets the skills loaded. This section covers everything else: where private data lives, how the cadence-driven skills (`stakeholder-due`, `wins-due`, `self-reflect`, `team-diagnosis`) get wired to actually fire on schedule, and how to pair Claude Code's `/schedule` with your existing reminder system to make the cadence reliable.

### Best experience: Claude Code Desktop app

The cadence-driven skills (`stakeholder-due`, `wins-due`, `self-reflect`, `patterns-watch`, `product-pulse`) give you their full value only when they run on a schedule — and the **Claude Code Desktop app** is the easiest way to set that up. Desktop Routines run on your machine, have full access to `~/bettersense-work-reflections/`, and persist indefinitely with no expiry.

If you use Claude Code in the terminal instead, OS-level scheduling (cron / launchd / Task Scheduler) works just as well but requires more setup. Cloud routines cannot access your local files and will not work with bettersense. See [§5 Wire up scheduled skills](#5-wire-up-scheduled-skills) for details.

### Quick setup checklist (5 minutes)

```
☐ Skills installed (see Install section above)
☐ Decide on data location: default ~/bettersense-work-reflections/ or set $BETTERSENSE_WORK_REFLECTIONS_HOME
☐ Run /user-profile once → creates the data directory + privacy notice + "who you are" anchor file
☐ Run /stakeholder-register once → registers your first stakeholder
☐ Run /strategy-doc once per product/area → creates the "what you're building" anchor (optional)
☐ Wire up the recurring schedules below (or skip if you only want on-demand use)
☐ Add matching calendar reminders so you actually see the scheduled output
☐ Verify with /agents and /schedule list (or by triggering one skill manually)
```

The rest of this section walks through each step with the exact commands.

### 1. Set up your profile

Start here. `user-profile` does two things in one step: it creates `~/bettersense-work-reflections/` (your private local data directory) and produces `profile.md` — the anchor file that tells other skills who you are so you never re-explain context.

```
set up my profile
```

A 5-10 minute interview capturing your role, level, company context, communication style, current strategic focus, and (optionally) stack. The skill shows you a one-time privacy notice and confirms before writing anything. Update on real role changes, not every week. Supports "alternate hats" for users with mixed roles (PM + EM, TPM + IC); the skill only asks if you bring it up.

Skills that read `profile.md` automatically: `the-spec-writer`, `the-translator`, `the-explainer`, `report-promo-case`, `report-career-architect`, `metrics-design`, `coaching-mode`, `feedback-frameworks`.

**If you want the data directory somewhere other than `~/bettersense-work-reflections/`**, set `$BETTERSENSE_WORK_REFLECTIONS_HOME` before running `user-profile`:

**macOS / Linux / WSL:**
```bash
export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-work-reflections"
# Persist: add to ~/.zshrc (macOS) or ~/.bashrc (Linux)
```

**Windows (PowerShell):**
```powershell
$env:BETTERSENSE_WORK_REFLECTIONS_HOME = "$HOME\Encrypted\bettersense-work-reflections"
# Persist: [System.Environment]::SetEnvironmentVariable('BETTERSENSE_WORK_REFLECTIONS_HOME', "$HOME\Encrypted\bettersense-work-reflections", 'User')
```

### 2. Strategy doc (optional)

The second anchor file — `~/bettersense-work-reflections/strategy/<area-slug>.md` — captures the strategic context for a product, area, or program: target problem, approach, personas, SMART metrics, 2-4 multi-month tracks, explicit "not working on" section, counter-metrics.

Skills that read it: `the-spec-writer`, `prioritization-frameworks`, `metrics-design`, `product-pulse`, `pulse-synthesize`.

#### `strategy/<area-slug>.md` — *what you're building*

`~/bettersense-work-reflections/strategy/<area-slug>.md` captures the strategic anchor for a product, area, or program: target problem, approach, personas, SMART metrics, 2-4 multi-month tracks, explicit "not working on" section, counter-metrics.

Skills that read it: `the-spec-writer`, `prioritization-frameworks`, `metrics-design`, `product-pulse`, `pulse-synthesize`.

**You never need to invent a slug.** Just describe your area in plain language when you invoke the skill — Claude generates the slug from what you say. For example:

| What you say | File created |
|---|---|
| *"the onboarding flow"* | `strategy/onboarding.md` |
| *"the platform team's services"* | `strategy/platform.md` |
| *"our mobile app"* | `strategy/mobile-app.md` |
| *"the checkout redesign"* | `strategy/checkout.md` |
| *"the search feature"* | `strategy/search.md` |
| *"growth and acquisition"* | `strategy/growth.md` |
| *"developer experience"* | `strategy/developer-experience.md` |
| *"the AI features we're shipping this half"* | `strategy/ai-features.md` |

The skill always confirms the slug with you before writing — one quick confirmation prevents a month of pulse reports accumulating in the wrong folder. And if a file already exists for that slug, the skill surfaces it first and asks whether you want to refresh it or create a separate file for a genuinely different area. It never silently overwrites.

For single-product users, one file at `strategy/default.md` is fine. For users running multiple lines (PM with two products, TPM coordinating across three programs, EM owning multiple services), one file per area.

To create:

```
draft a strategy doc for [area name]
```

Triggers `strategy-doc` — interview-driven, refusable on weak inputs ("vague metrics aren't ready"). Refresh on real triggers (planning round, missed bet, market shift), not on schedule.

If the strategy file is missing, the relevant skills work without it — outputs are just more generic. The skills won't pester you to set it up unless you raise the question.

### 3. Background monitor (zero-config wins cadence)

bettersense ships a background monitor that nudges you to log wins without any scheduling setup. It runs automatically whenever the plugin is active — no Desktop Routines, no cron, no `/schedule`.

**What it does:** At the start of each Claude Code session, `check-wins-cadence` checks `wins.md` for the last entry date. If more than 14 days have passed (configurable) and you haven't been nudged within that same window, Claude gets a single notification: *"No wins logged in N days. Run /bettersense:wins-log to capture recent work before the details fade."* One nudge per cooldown window, then silence.

**Nothing to configure.** The monitor is declared in `plugin/monitors/monitors.json` and the script lives in `plugin/bin/check-wins-cadence` (added to PATH when the plugin is active). It respects `$BETTERSENSE_WORK_REFLECTIONS_HOME` and is silent until `wins.md` exists (i.e., until you've run `/wins-log` at least once).

**To adjust the cadence**, set `WINS_NUDGE_THRESHOLD_DAYS` in your shell environment before launching Claude Code:

```bash
# Nudge every 4 weeks instead of 2
export WINS_NUDGE_THRESHOLD_DAYS=28
```

The cooldown is keyed to the same threshold, so a 28-day setting nudges at most once per 28-day window.

### 4. The cadence story (read this once)

Claude Code skills are *stateless guides*. They fire when you invoke them — either by typing something that matches their description, or by name. Cadence requires wiring them to a scheduler.

**There are three schedulers — only two work for bettersense:**

**❌ Cloud routines** run on Anthropic's servers with no access to your local files. If Claude asks you to "push the bettersense-work-reflections directory to a GitHub remote" when you try to schedule something, that's the cloud path — stop and use one of the local options below instead.

**✅ Desktop scheduled tasks** (best option) — created in the **Claude Code Desktop app** via Routines → New routine → Local. These run on your machine, have full access to `~/bettersense-work-reflections/`, persist indefinitely with no expiry, and support any cadence (daily, weekly, biweekly, monthly, quarterly). They fire while the Desktop app is open. Requires the Desktop app.

**✅ OS-level scheduling** (cron / launchd / Task Scheduler) — works on any version, fires whether or not Claude Code is open, supports any cadence. Best for monthly and quarterly cadences or if you use Claude Code in the terminal rather than the Desktop app. See *OS-level scheduling fallback* below.

**⚠️ Session-scoped tasks** (created by asking Claude to schedule something in a terminal/CLI session) have a hard **7-day expiry**. A biweekly task expires before its second firing. A monthly task expires before it ever fires. Don't use these for bettersense cadences.

**`/loop`** is for active work sessions — polling a build, watching a PR — not weekly cadences.

Three honest constraints regardless of which local approach you use:

- **Output lives inside Claude Code or a log file.** No mobile push, no email, no SMS — Claude Code is desktop/CLI/IDE.
- **Desktop tasks only fire while Claude Code is running.** If you close it Friday afternoon and don't reopen until Tuesday, the Friday task fires when you next resume that session (or not at all if the session expired).
- **Cadence reliability scales with how often you open Claude Code.** Daily users get the full benefit. Weekly users see things drift. Monthly users should treat the skills as on-demand only.

The fix for users who don't live in Claude Code: **pair every scheduled task with a calendar reminder** in the system you actually check. The calendar grabs your attention; Claude Code does the work.

### 5. Wire up scheduled skills

Use the **Claude Code Desktop app** for these. In the sidebar, click **Routines → New routine → Local**. Give it a name, write the instructions (what Claude should do when it fires), and set the schedule. The Desktop app offers Daily, Weekdays, and Weekly presets; for biweekly, monthly, or quarterly, just ask Claude in a Desktop session in plain language and it will set the cron expression.

If you use Claude Code in the terminal rather than the Desktop app, skip to the OS-level scheduling section below — that's the reliable fallback for any cadence.

Pick the routines that fit your workflow — none are required:

| Routine | When | Instructions to paste |
|---|---|---|
| Wins nudge | Weekly, Friday 4pm | `Run /wins-due and show me the list` |
| Stakeholder due-list | Weekly, Monday 9am | `Run /stakeholder-due and show me the list` |
| Self-reflection | Monthly, first Monday 10am | `Run /self-reflect` |
| Patterns watch | Weekly, Sunday 6pm | `Run /patterns-watch` |
| Product pulse | Weekly or daily, Monday 8am | `Run /product-pulse for the default area` |
| Pulse synthesis | Monthly, first Monday 11am | `Run /pulse-synthesize over the last 30 days for the default area` |
| Team health diagnosis | Quarterly, first Monday 10am | `Run /team-diagnosis` |
| Growth plan review | Quarterly, first Monday 11am | `Run /report-career-architect for each report and surface the plan review prompts` |
| Managing-down synthesis | Monthly, 15th 10am | `Run /stakeholder-synthesize over managing-down for the last 30 days` |

**Note on plugin namespace:** If you installed via `--plugin-dir`, skill names need the `bettersense:` prefix — e.g. `/bettersense:wins-due`. Adjust accordingly.

Pair each routine with a calendar reminder in whatever system you actually check. The calendar grabs your attention; Claude Code does the work.

### 6. OS-level scheduling fallback (no `/schedule` required)

If you don't have the `/schedule` skill installed and don't want to add it, OS-level scheduling works on every platform. You invoke `claude` headlessly with the skill as a prompt, and redirect output to a log file you can check later.

Create the log directory first:

```bash
# macOS / Linux / WSL
mkdir -p ~/bettersense-logs

# Windows (PowerShell)
New-Item -ItemType Directory -Force "$HOME\bettersense-logs"
```

---

**macOS / Linux / WSL — cron:**

```bash
# Edit your crontab
crontab -e

# Friday 4pm — wins nudge
0 16 * * 5  claude -p "run /bettersense:wins-due" >> ~/bettersense-logs/wins-due.log 2>&1

# Monday 9am — stakeholder due-list
0 9  * * 1  claude -p "run /bettersense:stakeholder-due" >> ~/bettersense-logs/stakeholder-due.log 2>&1

# Sunday 6pm — patterns watch
0 18 * * 0  claude -p "run /bettersense:patterns-watch" >> ~/bettersense-logs/patterns-watch.log 2>&1

# Monday 8am — product pulse (default area)
0 8  * * 1  claude -p "run /bettersense:product-pulse" >> ~/bettersense-logs/product-pulse.log 2>&1
```

If `claude` isn't found by cron, use the absolute path: run `which claude` in your terminal and substitute (e.g. `/usr/local/bin/claude`).

---

**macOS — launchd (alternative to cron):**

launchd survives sleep/wake cycles and respects login sessions better than cron. Create a `.plist` at `~/Library/LaunchAgents/ai.bettersense.wins-due.plist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>ai.bettersense.wins-due</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/local/bin/claude</string>
    <string>-p</string>
    <string>run /bettersense:wins-due</string>
  </array>
  <key>StartCalendarInterval</key>
  <dict>
    <key>Weekday</key><integer>5</integer>
    <key>Hour</key><integer>16</integer>
    <key>Minute</key><integer>0</integer>
  </dict>
  <key>StandardOutPath</key>
  <string>/Users/YOUR_USERNAME/bettersense-logs/wins-due.log</string>
  <key>RunAtLoad</key><false/>
</dict>
</plist>
```

Replace `/usr/local/bin/claude` with `which claude` output and `YOUR_USERNAME` with your macOS username. Load it:

```bash
launchctl load ~/Library/LaunchAgents/ai.bettersense.wins-due.plist
launchctl list | grep bettersense  # verify
```

Duplicate the file for each skill, changing the `Label`, `ProgramArguments`, `StartCalendarInterval`, and `StandardOutPath` fields.

---

**Linux — systemd user timers (alternative to cron):**

More observable than cron — you can check status, last run time, and logs.

Create `~/.config/systemd/user/bettersense-wins.service`:

```ini
[Unit]
Description=bettersense wins nudge

[Service]
Type=oneshot
ExecStart=/usr/local/bin/claude -p "run /bettersense:wins-due"
StandardOutput=append:%h/bettersense-logs/wins-due.log
StandardError=append:%h/bettersense-logs/wins-due.log
```

Create `~/.config/systemd/user/bettersense-wins.timer`:

```ini
[Unit]
Description=Run bettersense wins nudge every Friday

[Timer]
OnCalendar=Fri *-*-* 16:00:00
Persistent=true

[Install]
WantedBy=timers.target
```

Enable and start:

```bash
systemctl --user daemon-reload
systemctl --user enable --now bettersense-wins.timer
systemctl --user list-timers  # verify
```

Use `%h` (expands to home directory) rather than `~` inside systemd unit files.

---

**Windows — Task Scheduler (PowerShell):**

```powershell
$action = New-ScheduledTaskAction `
    -Execute "claude" `
    -Argument "-p `"run /bettersense:wins-due`""

$trigger = New-ScheduledTaskTrigger `
    -Weekly -DaysOfWeek Friday -At "4:00PM"

$settings = New-ScheduledTaskSettingsSet `
    -StartWhenAvailable -RunOnlyIfNetworkAvailable

Register-ScheduledTask `
    -TaskName "bettersense-wins-due" `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Description "bettersense weekly wins nudge"
```

Repeat for each skill, changing `-TaskName`, `-Argument`, and `-Trigger`. To list all registered bettersense tasks:

```powershell
Get-ScheduledTask | Where-Object { $_.TaskName -like 'bettersense*' }
```

Prefer Task Scheduler over Windows Subsystem for Linux scheduling if you installed Claude Code natively on Windows. If you're running everything inside WSL, use the cron/systemd instructions above inside your WSL environment.

---

**Caveats that apply to all platforms:**

- **Verify the headless flag.** `claude -p "<prompt>"` is the non-interactive invocation. Run `claude --help` to confirm. If headless isn't supported, OS-level scheduling won't work — use the `/schedule` skill or on-demand-only.
- **Authentication.** If `claude -p` requires you to be logged in, scheduled runs need a valid session token. May fail silently if the token has expired.
- **Debugging cron:** `grep CRON /var/log/syslog` (Linux) or `log show --predicate 'process == "cron"'` (macOS). PATH issues are common — cron runs with a minimal environment.

OS-level scheduling is less integrated than `/schedule` (no `/schedule list` to manage routines inside Claude Code) but works without any extra plugin and is portable across machines.

### 6. Listing and managing your schedules

Inside Claude Code:

```
/schedule list
```

Shows all routines you've created. To remove one:

```
/schedule delete <id-or-description>
```

You can also edit a routine to change its cadence — see the `/schedule` skill's own help for specifics.

### 7. External reminder pairing (recommended)

The single best thing you can do to make cadence reliable is to add **one recurring calendar event per `/schedule` routine** in the calendar / task system you actually check. The pattern:

- The calendar event grabs your attention at the right moment.
- The event's body says: *"Open Claude Code → /<skill-name>"*.
- Claude Code already has the scheduled output ready when you open it.

This is the closest you can get to the Voohy app's mobile-push experience, while still doing the depth work in Claude Code.

### 8. Cadence cheat sheet

| When | What fires (in Claude Code) | What you should pair externally |
|---|---|---|
| Every Friday, 4pm | `/wins-due` — surface forgotten wins from the week | Friday 4pm calendar block: *"Log wins"* |
| Every Monday, 9am | `/stakeholder-due` — overdue stakeholder reflections | Monday 9am calendar block: *"Stakeholder reviews"* |
| First Monday monthly | `/self-reflect` — leadership / behavior / energy | Monthly self-reflection time block |
| First Monday quarterly | `/team-diagnosis` — team health check | Pre-OKR-planning week reminder |
| First Monday quarterly | Growth-plan review per report | Per-report 1:1 in the plan-review week |
| Mid-month monthly (optional) | `/stakeholder-synthesize` over managing-down | Mid-month management reading time |
| Every Sunday, 6pm | `/patterns-watch` — cross-cutting scan across all reflection files | Sunday 6pm block: *"Review weekly patterns"* |
| Weekly Monday, 8am (or daily) | `/product-pulse` — single-page dated product health report | Monday 8am block: *"Read this week's pulse"* |
| First Monday monthly | `/pulse-synthesize` — trends/anomalies across the month of pulses | Pre-readout / planning reading time |

Skills not in this table are on-demand only — they fire when you describe a situation that matches them (a hire decision, a hard 1:1 prep, a new spec, a demo, a customer interview synthesis, an RFC review, etc.).

### 9. Stakeholder lifecycle (after the initial register)

Reorgs happen, people change roles, colleagues leave. The `stakeholder-manage` skill handles every lifecycle operation after the initial `stakeholder-register`. It routes by natural language — there's no syntax to memorize. Some examples:

| What you say | What happens |
|---|---|
| *"list my stakeholders"* | Shows all active stakeholders grouped by category, with last-reflected dates and ⚠ flags on anyone neglected for 14+ days. *"show archived"* extends the list. |
| *"update Jill's role to Staff Eng II"* | In-place frontmatter edit. Adds a one-line audit note. |
| *"Jill is my manager now"* | Re-categorizes. Moves the file across category folders. **All reflection history is preserved.** Captures a one-sentence reason for the audit log. The question pool shifts to managing-up on the next reflection. |
| *"Jill changed her name to Jill Brown"* | Rename. Updates filename, frontmatter, registry. You choose whether the slug changes too. |
| *"Draymond left for Stripe"* | Archive. File moves to `~/bettersense-work-reflections/archive/managing-down/draymond-young.md`. Active reflection skills no longer surface them. You can still synthesize over the archive when retrospecting. |
| *"delete Sam — registered them by mistake"* | Two-step confirmation. The skill strongly recommends archive first; if you persist, asks you to type the name to confirm. Used rarely. |

Two design opinions worth knowing before you use it:

- **Archive ≠ delete.** Most "remove" requests are actually archive. The skill defaults to archive and requires explicit override. Reflection history about a former colleague is often the most valuable record you'll have when calibrating future hires, references, or working with their replacement.
- **Re-categorize preserves history.** When a peer becomes your manager, you don't restart the file. The 18 months of accumulated reflections are *more* relevant in the new relationship, not less. The audit log explains the transition; the entries underneath stay intact.

The audit log lives in each stakeholder file as a `## Audit log` section between Background and Reflections. You can hand-edit it; the skill doesn't enforce.

### 10. Verify the setup

Run each of these to confirm:

```bash
# Skills installed?
ls ~/.claude/skills/        # or .claude/skills/ for project-scope

# Agents installed?
ls ~/.claude/agents/

# Data directory exists with privacy README?
ls -la ~/bettersense-work-reflections/
cat ~/bettersense-work-reflections/README.md
```

Inside Claude Code:

```
/agents               # 22 subagents should appear
/schedule list        # your routines should appear here
```

Trigger a skill manually as a smoke test:

```
let me reflect on my manager
```

…should auto-route to `stakeholder-reflect` (or to `stakeholder-register` if you haven't registered the manager yet).

### 11. Maintenance

The system is low-maintenance but not no-maintenance. Once a quarter:

- Skim `~/bettersense-work-reflections/` — anything stale, anyone you've stopped tracking actively, anyone you should have added?
- Run `/schedule list` and prune routines you're no longer reading.
- Run `/stakeholder-synthesize` once over your full file to look for patterns you've missed.
- Re-read the question library at `~/.claude/skills/stakeholder-reflect/questions.json` — the prompts that landed for you 6 months ago may not be the ones that land now.

If a `/schedule` cadence keeps producing output you ignore, kill it and re-think. A nudge you've stopped acting on is worse than no nudge — it teaches you to ignore the system.

## How it's meant to be used

Drop into Claude Code and describe what you're working on the way you'd describe it to a teammate. The harness routes:

- *"Users keep complaining the search results feel off — should we add an LLM reranker?"* → `the-reducer` runs first, asks whether this is genuinely an AI problem.
- *"Here are 40 customer interviews. What does this tell us?"* → `the-research-synthesizer` finds themes, jobs, and contradictions, anchored to direct quotes.
- *"Draft a PRD for the contract-summarization feature."* → `the-spec-writer` produces a decision-ready spec with success metrics and scoped non-goals.
- *"How do I know if this prototype is good enough to ship?"* → `the-eval-designer` designs the golden set, rubric, and ship/rollback bars; `the-scientist` runs it.
- *"Can you review this system prompt before we ship?"* → `the-prompt-critic` walks through it like a senior engineer in a code review.
- *"We're putting this in front of paying customers next week."* → `the-architect` designs guardrails; `the-red-teamer` finds what breaks; `demo-prep` skill scripts the launch readout.
- *"The model's hallucination rate just spiked in production."* → `the-incident-responder` stabilizes, investigates, writes the blameless postmortem; `the-translator` handles the customer comms.
- *"What should we measure to know this AI feature is actually working?"* → `metrics-design` builds the four-layer tree with counter-metrics that catch the "engagement up, product worse" trap.
- *"Sales needs a one-pager on how this works that won't oversell."* → `the-explainer` writes audience-calibrated capability + limitations + safety, with a what-to-say / what-not-to-say guide.
- *"Help me reflect on my new manager so I actually know what they need from me."* → `stakeholder-register` sets up the file, `stakeholder-reflect` guides the first session, `stakeholder-due` surfaces what to revisit weekly.
- *"Reorg happened — Jill is my manager now, and Draymond left for Stripe."* → `stakeholder-manage` re-categorizes Jill across folders (history preserved) and archives Draymond (file kept for retrospection, no longer surfaced in active reflections).
- *"Before my reports' performance reviews, what do I actually know about each of them?"* → `stakeholder-synthesize` reads the files and produces dated, citation-backed reads — patterns, contradictions, blind spots — for each.
- *"I just shipped contract-summarization to GA — log it before I forget."* → `wins-log` captures it structurally (situation, action, impact, evidence, honest credit) and pushes back if the impact framing is vague.
- *"Friday afternoon — did I do anything notable this week?"* → `wins-due` probes by category (judgment, recovery, mentorship, range) because the generic question gets blank stares.
- *"I have a behavioral interview Tuesday. Build me 5 STAR stories from my wins log."* → `wins-curate` (interview-stories mode) picks story-shaped wins with real conflict, drafts 90-second answers, and flags likely follow-ups.
- *"We're opening a Staff Eng req — design the loop and the rubric."* → `hiring-craft` walks signals → slot mapping → rubric with behavioral anchors → debrief discipline.
- *"I have a report who's been underperforming for three months and I've been avoiding it."* → `performance-management` diagnoses the stage (coachable gap vs. PIP-territory), structures the conversation, and walks through the documentation discipline.
- *"Help me coach Priya through whether to take the staff role — without telling her what to do."* → `coaching-mode` flips into ask-not-tell, applies GROW, and pushes back when the user catches themselves prescribing.
- *"Build me a 12-month growth plan for Draymond."* → `report-career-architect` reads the stakeholder-reflect file and produces a sequenced plan with manager moves, risks, and observable success criteria.
- *"Promo cycle — draft the case for Michelle."* → `report-promo-case` produces a panel-ready packet with cited evidence, calibrated solo-vs-shared credit, and gaps surfaced as pre-submission targets.
- *"Before my skip-level update, give me a structured read on team health."* → `team-diagnosis` produces a green/yellow/red across eight dimensions with cited evidence and top-3 risks worth acting on.
- *"My team submitted an RFC for a new event-streaming layer — give me a senior-engineer read before I approve."* → `the-rfc-reviewer` walks the doc through problem clarity, alternatives, trade-offs, failure modes, observability, and security with severity-ranked findings.
- *"That meeting ended with everyone nodding but I don't trust it. Help me read it."* → `read-the-room` interprets subtext (who held back, where consensus is performative, what positions are masking what interests) and produces hypotheses to verify directly — never claims as fact.
- *"I need to drive an architecture change owned by the platform team without going to their VP. How?"* → `influence-without-authority` diagnoses positions vs. interests, suggests sequencing the coalition (early believers first, decider last), and stays opinionated about the legitimacy line between influence and manipulation.
- *"I'm running a multi-team program with a Q3 launch — map dependencies, design the gates, and draft the escalation if Platform slips."* → `the-program-manager` produces the dependency map, gates per phase with explicit criteria, and escalation framing pre-loaded with a recommendation.
- *"Set up my profile so I stop re-explaining who I am every session."* → `user-profile` interviews you for role / level / strategic focus / communication style, drafts the anchor file, and other skills (spec writer, translator, explainer, promo case, career architect, metrics design, coaching, feedback) start reading it automatically.
- *"Sunday evening — anything notable across all my reflections this week?"* → `patterns-watch` scans stakeholder + wins + self files, surfaces unsolicited patterns (attention gaps, contradictions between stated focus and actual logged work, trajectory shifts) with citations to specific dated entries.
- *"Draft a strategy doc for the platform area I just took over."* → `strategy-doc` interviews you on target problem, approach, personas, SMART metrics, multi-month tracks, and (load-bearing) what you're explicitly *not* working on. Lives at `~/bettersense-work-reflections/strategy/platform.md` and starts being read by spec writer / prioritization / metrics-design / pulse skills.
- *"Run my Monday product pulse."* → `product-pulse` queries connected MCPs (PostHog, Datadog, Stripe), produces a one-page dated report with usage metrics, counter-metrics, AI-specific signals (hallucination/refusal/eval drift), and ≤3 follow-up investigations. Saves to the pulses folder for that area.
- *"Before my exec readout, what's the trajectory across the last 8 weeks of pulses?"* → `pulse-synthesize` reads the folder and surfaces trends, anomalies, regime shifts — with citations to specific dated pulses. Refuses to forecast; calls out coverage gaps.
- *"I need to brief the CEO on why our accuracy regressed."* → `the-translator` reframes the numbers.
- *"Help me cut this 30-item backlog to what we can ship this quarter."* → `prioritization-frameworks` skill picks the right method and pressure-tests scoring assumptions.
- *"Document why we picked Sonnet over Opus for this feature."* → `decision-log` skill captures it in a format that survives the next model migration.
- *"I have a hard 1:1 with a struggling engineer tomorrow."* → `one-on-one-prep` builds the agenda; `feedback-frameworks` drafts the conversation.
- *"My senior engineer keeps shutting down juniors in standup."* → `leadership-os` (the `Mirror` mode) gives you the conversation script.

## Stakeholder reflection: a worked example

The four `stakeholder-*` skills and `self-reflect` are a tighter system than the rest of the bundle — they share private data at `~/bettersense-work-reflections/` (configurable via `$BETTERSENSE_WORK_REFLECTIONS_HOME`) and are designed to be used together over months.

### A note on origins

This was originally a feature inside the [Voohy](https://voohy.com) app — the same idea: register your stakeholders by category, answer cadence-driven reflection questions, accumulate insight over time. The Claude Code version is a deliberate revamp, and on balance it works *better* in this shape than as in-app screens, because the reflection sessions can lean on the rest of the skills bundle. A reflection naturally hands off to `feedback-frameworks` when feedback emerges, to `one-on-one-prep` when a 1:1 is coming up, to `decision-log` when a relationship-shaping decision gets made. None of those compositions were possible inside an app's bounded UX. The honest tradeoff: a CLI/IDE tool has more friction than a mobile app, so expect weekly or bi-weekly use, not daily.

### File layout

```
~/bettersense-work-reflections/             # private, gitignored, on your local machine only
├── stakeholders.json
├── managing-up/
│   └── john-adams.md
├── managing-across/
│   ├── jill-smith.md
│   └── trae-green.md
├── managing-down/
│   ├── draymond-young.md
│   └── michelle-chang.md
├── teams/
│   └── client-delivery-abc.md
└── self/
    └── reflections.md
```

### A typical lifecycle

1. **Register.** *"I just got a new VP. Add John Adams to managing-up."* → `stakeholder-register` creates `~/bettersense-work-reflections/managing-up/john-adams.md` with frontmatter and waits to confirm before writing.
2. **Reflect, weekly-ish.** *"Let me reflect on John."* → `stakeholder-reflect` loads the file, picks 2–3 questions appropriate to the moment (cadence-aware, balancing *ask* and *sense* lenses), surfaces the prompt's `things_to_consider`, and walks through a real conversation. Pushes back on one-line answers and identity-level labels. Writes a dated entry per question.
3. **Stay current.** *"What's due this week?"* → `stakeholder-due` lists the overdue question × stakeholder pairs sorted by `due_ratio` (days_since / cadence). Or run it once via `/schedule "Every Monday at 9am, run /stakeholder-due"` to get a Monday-morning surfacing.
4. **Synthesize, periodically.** *"Before John's quarterly skip-level, what do I know?"* → `stakeholder-synthesize` reads the file, produces patterns / contradictions / blind spots / suggested next conversations, with every claim cited to specific dated entries. Hands off to `feedback-frameworks` or `one-on-one-prep` when a natural next step appears.
5. **Self.** Same shape, aimed at you. `self-reflect` covers behavior under pressure, communication, time/energy, fulfillment, advocating for yourself.
6. **Maintain.** *"Jill is my manager now"* / *"Draymond left for Stripe"* / *"list my stakeholders"* → `stakeholder-manage` handles the lifecycle: re-categorize across folders (history preserved), archive when someone leaves (file kept for retrospection), edit roles, list, rename. Defaults toward archive over delete.

### Things to know before adopting

- **The data lives outside the public repo.** `user-profile` creates `~/bettersense-work-reflections/` on first run, gitignores it, and shows you a one-time privacy notice. The folder holds candid notes about real people — don't put it in Dropbox if you wouldn't put your journal there. Override the path with `$BETTERSENSE_WORK_REFLECTIONS_HOME` if you want it on an encrypted volume or somewhere else.
- **Quality of synthesis depends on quality of input.** One-line entries produce shallow synthesis. The `things_to_consider` field is surfaced prominently to help — use it.
- **Synthesis is honest about its evidence.** `stakeholder-synthesize` will not claim a pattern without citing dated entries. If your file is sparse, the synthesis will be tentative; if it's rich, the synthesis will be sharp.

## Wins log: a worked example

The three `wins-*` skills are a parallel system to the stakeholder bundle — same data root, same shape, but the subject is *you*. They cover the "hype doc" / "brag document" / "win log" pattern: capture wins as they happen so you can remix them into a promo packet, behavioral interview answers, perf-review self-eval, or salary case when the moment comes.

### A note on origins

This was originally a "Wins at Work" feature inside the [Voohy](https://voohy.com) app, since sunsetted. The Claude Code rebuild gains the same composition advantage as the stakeholder bundle: a wins entry can hand off to `decision-log` when it captures a judgment, to `feedback-frameworks` when it came from feedback work, to `stakeholder-reflect` when it was driven by a relationship. And `wins-curate` can compose with `stakeholder-synthesize` and `self-reflect` for a perf-review self-eval that draws from all three sources at once.

### File layout

```
~/bettersense-work-reflections/
├── stakeholders.json
├── managing-up/...
├── managing-across/...
├── managing-down/...
├── teams/...
├── self/reflections.md
└── wins.md                          # newest entry on top
```

### A typical lifecycle

1. **Capture.** *"I just shipped contract-summarization to GA. Log it."* → `wins-log` walks through the structured capture: type tags, scope, collaborators, honest credit framing, situation, action, quantified impact, evidence. Pushes back hard on vague impact and inflated solo claims.
2. **Friday nudge.** Wired via `/schedule "Every Friday at 4pm, run /wins-due"`. Each Friday, `wins-due` checks the file and probes by category — judgment, recovery, mentorship, range — because *"anything notable this week?"* gets blank stares while *"did you say a useful no?"* gets memory hits. Accepts "honestly, nothing notable" without manufacturing wins.
3. **Curate when it matters.** *"I have a promo case in two weeks."* → `wins-curate` in `promo-packet` mode reads the log, maps wins to the dimensions a panel cares about (scope, impact, judgment, leadership, growth), produces a citation-backed packet, and surfaces gaps as prep targets ("`judgment` is thin in your log — strongest available is X, but a panel may want more"). For interviews, `interview-stories` mode picks story-shaped wins (recovery, judgment, range) and drafts 90-second STAR answers with anticipated follow-ups.

### Things to know before adopting

- **The "log it later" decay is real.** Friday nudges help but won't fully prevent it. The wins captured weeks after the fact are usually thinner than wins captured in-week.
- **The skill defaults to *probing*, not cheerleading.** Self-promotion friction varies a lot by user — `wins-log` is calibrated for users who tend to undercount. If it pushes too hard for you, say so and it'll dial back.
- **Calibration is non-negotiable for external artifacts.** A promo packet that overclaims solo credit on team work hurts the case more than a thinner-but-honest one. The curate skill enforces this.
- **Composes naturally with perf-review prep.** `wins-curate (perf-review)` reads `wins.md` *plus* `self-reflect`'s growth language *plus* `stakeholder-synthesize`'s relationship signals — the three together produce a self-eval that has both delivery breadth and relational depth.

## For engineering managers: the management-craft bundle

Seven skills (`hiring-craft`, `performance-management`, `coaching-mode`, `report-career-architect`, `report-promo-case`, `team-diagnosis`, `engineering-health`) and one agent (`the-rfc-reviewer`) form a tighter system aimed at the highest-stakes work an engineering manager does — the work most managers do loosely because nobody handed them a forcing function for it.

These compose with the rest of the bundle but earn their keep on their own. The premise is simple: world-class EMs do a few things deliberately that average ones do by tribal habit. Hiring is a craft, not a vibes-check. Performance management has a ladder, not a single mode of "give more feedback." Coaching is asking, not telling. Promotions are panel-ready written cases, not pitches. Team health is multi-dimensional, not a vibe. And design-doc reviews can be rigorous without the user being a senior staff engineer themselves.

### A typical year in the lifecycle

1. **Hiring season.** *"We're opening a Staff Eng req."* → `hiring-craft` (loop design mode) maps signals to slots, writes the rubric with behavioral anchors, and structures the debrief discipline. Six weeks later: *"Help me run the debrief."* → same skill, debrief mode, with silent-vote-first and round-robin structure. After hire: `stakeholder-register` brings the new report into the reflection system from day one.
2. **Onboarding into growth.** First 60 days: *"Build a 12-month growth plan for the new hire."* → `report-career-architect` reads what's accumulated in `stakeholder-reflect`, asks where they're growing toward, produces a sequenced plan with the *manager moves* (what the user has to stop doing) named explicitly.
3. **Quarterly health check.** *"Before my skip-level update, give me a structured read on the team."* → `team-diagnosis` walks eight dimensions (delivery, attrition, dependency tax, on-call, peers, info flow, technical health, culture) with cited evidence and top-3 actionable risks. When the diagnosis flags technical health as red, `engineering-health` goes deeper: SPACE-based productivity diagnostic, onboarding time as a leading indicator, developer experience friction, and how to make the case for platform investment.
4. **The hard conversation.** *"I have a report who's been underperforming for three months."* → `performance-management` diagnoses the stage on the ladder, distinguishes coachable gap from PIP-territory, walks through the documentation discipline and the conversation script — composes with `feedback-frameworks` for the COIN delivery.
5. **The development conversation.** *"Help me coach my report through whether to take the staff role."* → `coaching-mode` flips to ask-not-tell, applies GROW, pushes back when the user prescribes through leading questions.
6. **Promo cycle.** *"Submit Draymond for staff this cycle."* → `report-promo-case` reads the year of stakeholder-reflect entries plus the executed growth plan, produces a panel-ready written case with cited evidence per dimension, surfaces gaps as pre-submission targets, pre-empts likely objections.
7. **The doc on your desk.** *"My team submitted an RFC; I need a credible read."* → `the-rfc-reviewer` walks the doc through problem clarity, alternatives, trade-offs, failure modes, observability, scaling, and security — severity-ranked findings, calibrated to your confidence in the domain.

### Things to know

- **The skills compose tightly with the stakeholder bundle.** `report-career-architect` reads from `stakeholder-reflect` (managing-down). `report-promo-case` reads from both. `team-diagnosis` aggregates across the whole managing-down folder. `performance-management`'s documentation discipline is the same documentation discipline `stakeholder-reflect` was already producing.
- **The opinionation is real.** `performance-management` will not let the user describe a Stage 3 problem in Stage 1 language. `coaching-mode` will not let the user prescribe in the first 5 turns. `hiring-craft` will not let the user run a debrief without silent votes first. If the forcing functions feel pushy, the principles section in each skill is the easy place to soften.
- **`the-rfc-reviewer` is the only agent in the management-craft set.** RFC review benefits from a fresh context window — the doc is long, the review is multi-pass — which is what agents do better than skills.
- **Underrepresented reports often get worse promo packets and weaker growth plans not because they don't deserve them, but because their managers feel less confident advocating with the same volume.** Several skills (`report-promo-case`, `report-career-architect`) call this out explicitly. Notice it; over-invest where you'd otherwise drift.

## For TPMs and senior ICs leading without authority

Two skills (`read-the-room`, `influence-without-authority`) and one agent (`the-program-manager`) form a tighter set aimed at the work TPMs, staff engineers, and senior ICs do daily — moving outcomes through people who don't report to them, navigating cross-team programs, and reading the politics that determine whether anything actually ships. Inspired by the kinds of moves Eduardo Bouças and others have written about as the irreplaceable core of the TPM role.

Most of the bundle assumes the user has authority somewhere — a manager over a team, a PM over a roadmap. This set assumes the opposite: you're leading because the work needs leading, not because the org chart says so.

### A typical week in the lifecycle

1. **The cross-team program kickoff.** *"I'm running a multi-team program — map dependencies and design the launch gates."* → `the-program-manager` produces the dependency map, surfaces orphaned dependencies, and gates each launch phase with explicit criteria (not vibes).
2. **The orphaned problem.** *"Two teams are pointing at each other on this issue and it's blocking the program. Should I adopt it?"* → `the-program-manager` (orphan-adoption mode) walks through whether it's actually orphaned, why, and what boundaries to set before taking it on.
3. **The skeptical principal engineer.** *"I need Mark's blessing on this approach but he's not sold and I can't go around him."* → `influence-without-authority` diagnoses Mark's stated position vs. underlying interest, designs a listening-conversation-first approach, and stays opinionated about the line between legitimate currencies (real reciprocity, real scarcity, real expertise) and manipulation (manufactured urgency, fake reciprocity).
4. **The meeting that ended too smoothly.** *"Everyone agreed in the design review and I don't trust it."* → `read-the-room` interprets the subtext (who didn't speak, where consensus was performative, what positions might mask what interests), produces hypotheses to verify directly, and refuses to claim certainty.
5. **The escalation framing.** *"Platform is going to slip and I need to escalate to the VP."* → `the-program-manager` (escalation mode) drafts the writeup with TL;DR, options, recommendation, cost-of-not-deciding, and "what I've already tried" — so the exec arrives with the work half done.
6. **The cross-functional status update.** *"I need to write the same week's status for engineering, the cross-functional partners, and the exec sponsor."* → `the-program-manager` produces three differently-framed versions; composes with `the-translator` for the exec layer.

### Things to know

- **`read-the-room` is necessarily retrospective.** You bring the meeting to Claude after; the skill helps you see what you might have missed. It does *not* replace asking the person directly — every output ends with "hypotheses to verify."
- **`influence-without-authority` is opinionated about manipulation.** It refuses to teach manufactured urgency, staged consensus, and fake reciprocity even when they'd "work." The premise is that all influence work is iterated and the cost-to-trust of manipulative tactics outpaces the short-term gain. If you want a tactically harder edge, the principles section is where to soften.
- **`the-program-manager` is an agent, not a skill.** Programs carry a lot of state (dependencies, gates, risks, comms, escalations) and benefit from a fresh context window per invocation rather than competing with whatever else is in your session.
- **The TPM set composes tightly with the stakeholder bundle.** A `read-the-room` output drops naturally into a `stakeholder-reflect` `sense`-category entry. An `influence-without-authority` move benefits from reading the target's stakeholder file first. `the-program-manager` composes with `team-diagnosis` (cross-team health), `decision-log` (program ADRs), and `the-rfc-reviewer` (constituent-team docs).

## What these skills actually add over plain Claude

A reasonable question: *why install a skill when I could just ask Claude directly?* Two mechanical things, both of which matter most under pressure:

1. **Auto-routing.** You describe the situation in your own words. Claude pulls in the right framework without you remembering its name or formatting your prompt for it. When your VP messages you at 4:47pm Friday, you won't remember to ask for "COIN feedback structure with a SOLID quality check." The skill triggers on the situation, not on the keyword.
2. **Forcing functions.** A well-written skill *pushes back* on bad framing. Plain Claude tends to be helpful in the direction you point it, even if the direction is wrong. A skill bakes in an opinion that interrupts you — "is this actually an AI problem?", "where's the eval coverage for this case?", "that's a character label, not a behavior."

### Three real scenarios

**Friday-at-4:47pm: "Can we throw an LLM at search?"**
Your VP slacks: *"Customers keep saying search sucks. Can we add an LLM reranker? Want a recommendation by Monday."* Without the skill, your weekend is a half-hedged memo recommending the reranker because that's what was asked. Engineering spends two weeks on it. Three weeks later, you discover the actual issue was that the indexer was missing 30% of the catalog — you shipped an LLM solution to a data problem.

With the skills, you paste the Slack thread into Claude. `the-reducer` fires automatically and refuses to answer the surface question. It walks you through who's complaining (enterprise, not free — different problem), what the workaround is today, whether this is an intelligence problem or a data problem. You go look at search analytics, find the indexer issue, and ship a Monday memo recommending a $0 fix with AI as a follow-on. The reducer's opinionatedness ("default to no AI") is doing the work — Claude on its own would have helpfully written the memo you asked for.

**Tuesday before launch: the model said something wrong.**
Customer Success forwards a screenshot at 11am. Your contract-summarization feature said the contract had a 90-day termination clause; it's actually 30. Launch is Friday. Engineering says "the model just hallucinated, we can't reproduce it." Without the skill, you write some version of "we're investigating, we think it's fine," ship Friday, and find out two weeks later it's a P0 with a paying customer.

With the skills, `the-incident-responder` walks you through reproduction (forces you to confront "we can't reproduce" as evidence that observability is broken, not a reason to dismiss the case), classifies the failure mode, and chains in `the-eval-designer` to ask if your golden set covers contracts with non-standard termination language. It doesn't. *That's* the gap. The output is a postmortem-style writeup that turns the unanswerable "is it fine?" into a real decision: add 20 cases to the eval and re-validate before Friday, or delay a week. The structure under panic is the value — you're not going to remember a six-step incident framework on Tuesday morning when your Slack is on fire.

**The 1:1 you've been avoiding for three weeks.**
A senior engineer keeps cutting off juniors in standup. You've noticed for a month. Every Sunday you think "I'll bring it up Monday." You don't. Eventually you say something rushed in a hallway, it lands wrong, and now you have a relationship problem on top of a behavior problem.

With the skills, you type one paragraph on Sunday night. `one-on-one-prep` fires first and pushes you to book the time properly instead of ambushing him. `feedback-frameworks` then walks you through COIN: when you write "you've been dismissive," it pushes back — that's a character label, not a behavior. You rewrite as "on Tuesday and Thursday, when Priya and Alex were sharing approaches, you cut in within seconds with 'that won't work.'" When you say the impact is "bad for the team," it pushes back: be specific. You realize Priya's approach was the one the architect later recommended. *That's* the impact. SOLID then runs over the draft and catches that one of your incidents is secondhand — drop it. You walk into Monday's 1:1 with a script that lands. The senior engineer doesn't go defensive because you didn't call him dismissive — you described what he did and what it cost. The skill is the difference between *avoiding* the conversation indefinitely and *having* it.

### Where these skills don't help

Honest counterpoints:

- **If you don't already use Claude as part of your workflow, none of this matters.** A skill inside an app you don't open is worthless.
- **For routine work, they're overkill.** Writing a normal status update? Don't summon a framework. The skills earn their keep at decision points and high-stakes moments — not everywhere.
- **They don't replace judgment.** `the-spec-writer` will produce a beautifully structured spec for a terrible idea. The skills make you faster and more rigorous; they don't make the underlying call for you.
- **Some are stronger than others.** `prioritization-frameworks` is closer to a high-quality reference card — useful, but you could get most of the value by reading one blog post once. `the-reducer`, `the-incident-responder`, and `feedback-frameworks` are the ones whose opinionatedness genuinely changes what you do.
- **Cross-skill composition is informational, not executional.** When `coaching-mode` says *"composes with `feedback-frameworks`"*, that's a signpost — not an auto-load. Inside one skill's session, Claude knows the other skill exists and can mimic its structure approximately, but it does not actually load the other skill's body. To get the full discipline of the second skill (forcing functions, anti-pattern checks, the entire structure), you need to **explicitly invoke it** in a new turn (`/bettersense:feedback-frameworks` if you installed via plugin, `/feedback-frameworks` if standalone). What you get inside the original skill is a reasonable shorthand; what you get from explicit invocation is the full treatment. This is true under both plugin and standalone install — it's how Claude Code's skill system works in practice.

The test for whether this collection is right for you: do you currently open Claude when you face these situations, and do you wish your version of Claude already knew the framework you'd want to apply? If yes, the skill format pays for itself by removing the prompt-engineering tax every time. If you're unsure, start with `the-reducer` and `feedback-frameworks` — see whether they actually change your behavior before installing the rest.

## Philosophy

A few opinions baked into how these are written:

- **Default to "no AI."** Most problems framed as AI problems are UI problems, rules problems, or data problems. The skills push back hard before greenlighting an LLM.
- **Evals before vibes.** No feature ships on demo-day feel. Every flow assumes a golden dataset and a metric, even a small one.
- **Probabilistic in, deterministic out.** Business rules live in code; the model proposes, the system disposes.
- **Clarity is kindness.** This applies to both stakeholder comms and how the agents themselves write — short, specific, no hedging.

## Contributing

Skills and agents are intentionally small and composable. If you have a mode that's been missing from your workflow — a procurement-savvy `the-vendor-evaluator`, a `the-rollout-planner` for staged launches, an EM-focused `the-team-health-monitor`, etc. — open a PR. Each new agent should be one file with proper frontmatter (`name`, `description`, `tools`) and a tightly scoped system prompt.

## License

[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) — Creative Commons Attribution-ShareAlike 4.0 International.

Copyright © 2025 Shwetank Dixit / [bettersense.ai](https://bettersense.ai)

**You can:** use, share, and adapt this material for any purpose, including commercially.  
**You must:** credit the author and link to the original, and release any derivative works under the same CC BY-SA 4.0 license.

Pull requests welcome. Contributors agree their submissions are licensed under CC BY-SA 4.0. The maintainer retains the right to accept, reject, or modify contributions at their discretion. See [`LICENSE`](./LICENSE) for the full text.
