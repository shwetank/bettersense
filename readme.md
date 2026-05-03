# awesome-skills-ai

A growing collection of [Claude Code](https://claude.com/claude-code) **skills** and **subagents** designed for AI Product Managers — the people responsible for shipping reliable, useful products on top of probabilistic systems.

These aren't generic productivity prompts. They encode the actual frameworks, mental models, and operational modes an AI PM uses day-to-day: deciding *whether* a problem deserves AI in the first place, building eval harnesses before committing engineering, designing safety sandwiches around LLM calls, red-teaming before launch, and translating model metrics into business outcomes — alongside a leadership operating system for managing up, down, and across.

## Why this exists

Most "AI for PMs" tooling either over-promises ("AI writes your PRD!") or under-delivers (a chatbot that doesn't know what an eval harness is). This repo takes a different bet: give Claude Code a small, opinionated set of skills and subagents that match how a working AI PM actually thinks, and let the harness route to the right one automatically based on what you're doing.

Each skill is a reusable framework Claude consults when context matches. Each subagent is a focused operational mode you can invoke explicitly or let Claude delegate to.

## What's inside

The repo currently ships two bundles. They share the same conceptual structure; the `-php` variant adds a concrete prototyping stack (PHP 8 + FlightPHP + HTMX + Alpine.js + Tailwind CDN + ApexCharts) so generated prototypes are runnable.

```
awesome-skills-ai/
├── ai-technical-pm/          # Stack-agnostic version
│   ├── skills/
│   │   ├── ai-pm-frameworks/SKILL.md
│   │   ├── coaching-mode/SKILL.md
│   │   ├── decision-log/SKILL.md
│   │   ├── demo-prep/SKILL.md
│   │   ├── feedback-frameworks/SKILL.md
│   │   ├── hiring-craft/SKILL.md
│   │   ├── influence-without-authority/SKILL.md
│   │   ├── leadership-os/SKILL.md
│   │   ├── metrics-design/SKILL.md
│   │   ├── one-on-one-prep/SKILL.md
│   │   ├── patterns-watch/SKILL.md
│   │   ├── performance-management/SKILL.md
│   │   ├── prioritization-frameworks/SKILL.md
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
│   │   ├── team-diagnosis/SKILL.md
│   │   ├── user-profile/SKILL.md
│   │   ├── wins-curate/SKILL.md
│   │   ├── wins-due/SKILL.md
│   │   └── wins-log/SKILL.md
│   └── agents/
│       ├── the-architect.md
│       ├── the-eval-designer.md
│       ├── the-explainer.md
│       ├── the-incident-responder.md
│       ├── the-program-manager.md
│       ├── the-prompt-critic.md
│       ├── the-red-teamer.md
│       ├── the-reducer.md
│       ├── the-research-synthesizer.md
│       ├── the-rfc-reviewer.md
│       ├── the-scientist.md
│       ├── the-spec-writer.md
│       └── the-translator.md
└── ai-technical-pm-php/      # Same skills + agents, with a PHP prototyping stack baked in
    └── ...
```

### Skills

| Skill | When it triggers |
|---|---|
| `ai-pm-frameworks` | Scoping AI features, build-vs-buy-vs-rule decisions, eval design, model selection, guardrail planning. |
| `coaching-mode` | Forcing function that flips the assistant into ask-not-tell mode for development conversations with reports. Stays in question-mode for at least 5 turns, applies the GROW frame, pushes back when the user tries to prescribe instead of helping the report work it out. |
| `decision-log` | Capturing meaningful product/technical decisions in an ADR-style format with reversibility, rationale, and revisit triggers. Especially load-bearing for AI decisions tied to specific model versions. |
| `demo-prep` | Five-pass prep for high-stakes demos: headline, audience, pre-mortem, script, and Q&A — with extra hazard-handling for AI-feature demos. |
| `feedback-frameworks` | Drafting and pressure-testing feedback for reports, peers, and stakeholders using the COIN structure (Connection → Observation → Impact → Next steps) and the SOLID quality checklist. |
| `hiring-craft` | Treats hiring as craft, not vibes — designing interview loops with explicit signals, writing rubrics with behavioral anchors, and running calibrated debriefs (silent vote first, junior voices first, signal-by-signal walk-through). |
| `influence-without-authority` | For TPMs, staff engineers, and senior ICs leading people who don't report to them. Diagnoses positions vs. interests, applies the currencies model, sequences coalitions, and is opinionated about legitimate vs. manipulative influence patterns. |
| `leadership-os` | Managing up/down/across — 1:1s, performance reviews, stakeholder updates, post-mortems, cross-functional conflict. |
| `metrics-design` | Designs the metric tree for an AI feature — north star, leading/lagging, and the counter-metrics that catch Goodhart-style failures where you optimize the model into a worse product. |
| `one-on-one-prep` | Builds 1:1 agendas matched to the relationship (manager → report, report → manager, peer, skip-level) instead of generic templates. |
| `patterns-watch` | Scheduled cross-cutting scan across the reflection ecosystem (stakeholder, wins, self) — surfaces unsolicited patterns the user hasn't asked about: attention gaps, contradictions between stated focus and actual logged work, trajectory shifts. Citation-disciplined; observation-not-prediction. Designed for weekly `/schedule`. |
| `performance-management` | Walks the underperformance ladder deliberately — coaching → formalized feedback → PIP → termination — with documentation, calibrated conversations, and the brilliant-jerk pattern handled directly. The hardest skill in management. |
| `prioritization-frameworks` | Picks the right prioritization framework (RICE, ICE, WSJF, MoSCoW, Kano, Cost of Delay) for the situation, then forces hidden assumptions out into the open. |
| `read-the-room` | Retrospective interpretation of a meeting / Slack thread / 1:1 / design review — surfaces who held back, where consensus is performative, what positions are masking what interests, what burnout signals are present. Reads are hypotheses to verify, not facts to act on. |
| `report-career-architect` | Designs a 12–18 month growth plan for a direct report — target state, capability gaps, sequenced experiences, *manager moves* (what the user has to stop doing to make room), risks, and observable success criteria. |
| `report-promo-case` | Builds a panel-ready promotion packet for a direct report with cited evidence per dimension, calibrated solo-vs-shared credit, pre-empted objections, and gaps surfaced as pre-submission targets. The mirror image of `wins-curate` (which is for the user's own brag doc). |
| `self-reflect` | Self-reflection on leadership, behavior under pressure, time/energy, fulfillment, and advocating for yourself — captured chronologically in a private file so insight compounds over time. |
| `stakeholder-register` | Register a stakeholder (manager, peer, report, team) for ongoing reflection. Sets up a private folder at `~/voohy-work-reflections/` (configurable via `$VOOHY_WORK_REFLECTIONS_HOME`), creates a per-stakeholder file, and warns about privacy. |
| `stakeholder-manage` | Lifecycle operations on already-registered stakeholders: list / edit / re-categorize after a reorg / rename / archive when someone leaves / delete. Preserves reflection history aggressively; defaults toward archive over delete; routes by natural-language intent. |
| `stakeholder-reflect` | Guide a single reflection session about a registered stakeholder using a question library spanning *ask*, *sense*, and *ask-and-sense* lenses. Surfaces the question's `things_to_consider`, picks cadence-appropriate questions, and writes a dated entry back. |
| `stakeholder-due` | Scans your stakeholder files and surfaces which question × stakeholder pairs are overdue based on `suggested_freq`. Designed to be invoked on demand or fired weekly via `/schedule`. |
| `stakeholder-synthesize` | Synthesizes across accumulated reflections — patterns, contradictions, blind spots — with citations to specific dated entries. Never claims a pattern without evidence. |
| `team-diagnosis` | Multi-dimensional team health check — delivery cadence, attrition risk, dependency tax, on-call burden, peer relationships, information flow, technical health, culture. Reads stakeholder files + retros + survey scores; produces a green/yellow/red read with cited evidence and top-3 risks worth acting on. |
| `user-profile` | Anchor file for the bundle. Single private `~/voohy-work-reflections/profile.md` capturing the user's role, level, communication style, current strategic focus, stack — read automatically by other skills so you never re-explain context. Inspired by the SOUL.md pattern. Supports multiple "hats" for users in mixed roles. |
| `wins-log` | Capture a structured win at work — situation, action, impact, evidence, honest credit framing. Pushes back on vague impact claims and inflated solo claims. Front-of-funnel for the brag-doc / hype-doc bundle. |
| `wins-due` | Weekly low-pressure nudge to surface forgotten wins, probing by category (delivery / judgment / mentorship / recovery / range) because memory is selective. Accepts "honestly, nothing notable" without manufacturing fake wins. |
| `wins-curate` | Turn the wins log into an audience-specific artifact: promo packet, behavioral interview stories (STAR), perf-review self-eval, salary-negotiation case, or year-in-review. Never invents wins; cites log entries; surfaces gaps as prep targets. |

### Subagents

| Agent | Operational mode |
|---|---|
| `the-reducer` | Early discovery. Reduces ambiguity. Pushes back on "AI problems" that are actually UI problems. |
| `the-research-synthesizer` | Clusters raw qualitative data — interview notes, support tickets, NPS verbatims — into themes, JTBDs, and product implications anchored to direct quotes. |
| `the-rfc-reviewer` | Reviews engineering RFCs / design docs / architecture proposals like a senior staff engineer — problem clarity, alternatives, trade-offs, failure modes, observability, scaling, security. Especially valuable for EMs whose technical depth is in a different domain than the proposal, or who need a credible second opinion before approving. |
| `the-spec-writer` | Turns a validated problem into a decision-ready PRD with concrete success metrics, scoped non-goals, and named seams between probabilistic and deterministic logic. |
| `the-scientist` | Pre-development feasibility. Builds golden datasets and eval harnesses. Refuses to declare success on a single demo. |
| `the-eval-designer` | Designs the smallest eval system that would actually catch a regression — golden set, metric class, LLM-as-judge rubric, production sampling, ship/rollback bars. |
| `the-explainer` | Writes audience-calibrated how-it-works docs (customers, sales, support, execs, security/legal) covering capability, limitations, and the safety story — not marketing copy and not a research paper. |
| `the-prompt-critic` | Reviews production prompts the way a senior engineer reviews code: scoping, instruction order, output contract, injection resistance, drift hazards. |
| `the-architect` | Production hardening. Designs the input filter → LLM → output guardrail "safety sandwich." Separates probabilistic from deterministic logic. |
| `the-red-teamer` | Pre-launch and maintenance. Simulates prompt injection, exfiltration, jailbreaks, and out-of-distribution failures. |
| `the-incident-responder` | AI-feature incident lead — stabilization, technical investigation, blameless postmortems, and feeding failures back into the eval set. |
| `the-program-manager` | Multi-team, multi-month program management: dependency mapping, risk gates per launch phase, orphaned-problem adoption, rollout coordination across teams, audience-calibrated status comms, escalation framing. Distinct from `the-spec-writer` (feature-level) and `prioritization-frameworks` (backlog-level). |
| `the-translator` | Stakeholder comms. Converts eval metrics and failure modes into honest business language without hype or false humility. |

## Install

Pick the variant that fits your stack, then install at user scope (available in every project) or project scope.

**User-level:**
```bash
git clone https://github.com/<your-handle>/awesome-skills-ai.git
cd awesome-skills-ai/ai-technical-pm-php   # or ai-technical-pm

mkdir -p ~/.claude/skills ~/.claude/agents
cp -r skills/* ~/.claude/skills/
cp agents/*.md ~/.claude/agents/
```

**Project-level** — from the repo you want to use them in:
```bash
mkdir -p .claude/skills .claude/agents
cp -r /path/to/awesome-skills-ai/ai-technical-pm-php/skills/* .claude/skills/
cp /path/to/awesome-skills-ai/ai-technical-pm-php/agents/*.md .claude/agents/
```

Verify with `/agents` inside Claude Code — the thirteen subagents should appear. Skills auto-load when prompts match their `description`; you can also trigger them explicitly with `/<skill-name>` (e.g. `/ai-pm-frameworks`, `/decision-log`, `/leadership-os`, `/stakeholder-reflect`, `/wins-log`, `/coaching-mode`, `/read-the-room`, `/user-profile`).

## Setup: data directory, environment, and scheduling

The basic Install above gets the skills loaded. This section covers everything else: where private data lives, how the cadence-driven skills (`stakeholder-due`, `wins-due`, `self-reflect`, `team-diagnosis`) get wired to actually fire on schedule, and how to pair Claude Code's `/schedule` with your existing reminder system to make the cadence reliable.

### Quick setup checklist (5 minutes)

```
☐ Skills installed (see Install section above)
☐ Decide on data location: default ~/voohy-work-reflections/ or set $VOOHY_WORK_REFLECTIONS_HOME
☐ Run /stakeholder-register once → creates the data directory + privacy README + .gitignore
☐ Run /user-profile once → creates the anchor file other skills read for context
☐ Wire up the recurring schedules below (or skip if you only want on-demand use)
☐ Add matching calendar reminders so you actually see the scheduled output
☐ Verify with /agents and /schedule list (or by triggering one skill manually)
```

The rest of this section walks through each step with the exact commands.

### 1. Data directory

By default, all reflection data lives at `~/voohy-work-reflections/` — outside any repo, on your local machine only, gitignored by the skill on first run. Override with the env var if you want:

```bash
# Optional: choose a different location (e.g., an encrypted volume)
export VOOHY_WORK_REFLECTIONS_HOME="$HOME/Encrypted/voohy-work-reflections"

# Persist for future shells
echo 'export VOOHY_WORK_REFLECTIONS_HOME="$HOME/Encrypted/voohy-work-reflections"' >> ~/.zshrc
```

You don't need to create the directory yourself — `stakeholder-register` does it on first run, with a privacy `README.md` and `.gitignore` inside. Just open Claude Code and:

```
register a stakeholder
```

That triggers `stakeholder-register`, which sets up the directory and walks you through your first registration.

### 2. The anchor file (`profile.md`)

The bundle has one **anchor file** — `~/voohy-work-reflections/profile.md` — that captures who you are: role, level, company context, communication style, current strategic focus, and (if relevant) stack. It's a single short file you create once.

The point: skills in the bundle that benefit from knowing you (`the-spec-writer`, `the-translator`, `the-explainer`, `report-promo-case`, `report-career-architect`, `metrics-design`, `coaching-mode`, `feedback-frameworks`) **read this file automatically when present** and tailor their outputs accordingly. You stop re-establishing context every session.

To create it:

```
set up my profile
```

That triggers the `user-profile` skill, which interviews you (5–10 minutes), drafts the file, and confirms before writing. Update it on real role changes — not every week.

If you wear multiple hats (e.g. PM and EM, or TPM during programs and IC otherwise), the file supports an "alternate hats" section. The skill will only ask about hats if you bring them up.

If `profile.md` is missing, the skills work without it — outputs are just more generic. They won't pester you to set it up unless you raise the question.

### 3. The cadence story (read this once)

Claude Code skills are *stateless guides*. They fire when the user types something matching their `description`, or when explicitly invoked. Cadence — running a skill *automatically* every Monday or every Friday — is handled by Claude Code's `/schedule` skill, which creates routines that execute on a cron schedule.

Three honest constraints to set expectations:

- **Output of a scheduled run lives inside Claude Code.** When `/schedule` fires `/wins-due`, the output goes to a Claude Code session/artifact. You see it the next time you open Claude Code.
- **No mobile push, no email, no SMS.** Claude Code is desktop / CLI / IDE. If you close Claude Code Friday afternoon and don't open it until Tuesday, the Friday `wins-due` output sits unread.
- **The cadence is reliable in proportion to how often you open Claude Code.** Daily users get the full benefit. Weekly users see things drift. Monthly users should treat the skills as on-demand only.

The fix for users who don't already live in Claude Code: pair every `/schedule` cadence with a calendar reminder in the system you *do* check (Google Calendar, Apple Reminders, etc.). The calendar grabs your attention; Claude Code does the work.

### 4. Wire up scheduled skills

Below are the skills that genuinely benefit from running on a schedule, with the exact commands to run *once* in Claude Code. Pick the ones that fit your workflow — none are required.

#### Weekly Friday — wins nudge

```
/schedule "Every Friday at 4pm, run /wins-due and post the list"
```

Pair with a Friday 4pm calendar event titled **"Open Claude Code → log this week's wins"**. Together, they catch most weeks.

#### Weekly Monday — stakeholder due-list

```
/schedule "Every Monday at 9am, run /stakeholder-due and post the list"
```

Pair with a Monday 9am calendar block (or recurring task in your task manager) titled **"Open Claude Code → review stakeholder due-list"**.

#### Monthly first-of-the-month — self-reflection

```
/schedule "On the first Monday of every month at 10am, run /self-reflect"
```

Pair with a recurring monthly calendar event. `self-reflect` will pick a few cadence-appropriate questions and walk through them. If you skip a month, no harm done — the next run picks up.

#### Quarterly — team health diagnosis

```
/schedule "On the first Monday of every quarter at 10am, run /team-diagnosis"
```

Pair with a quarterly OKR-planning week. Run this *before* you draft the next quarter's plan — the diagnosis often surfaces what the plan should address.

#### Quarterly — review report growth plans

```
/schedule "On the first Monday of every quarter at 11am, run /report-career-architect for each report and surface the plan review prompts"
```

Less natural-language-flexible than the others; you may need to adjust the phrasing or run a more general "review growth plans" prompt. The point is the *quarterly recurrence*, not the exact format.

#### Optional: Monthly — synthesize across managing-down

```
/schedule "On the 15th of every month at 10am, run /stakeholder-synthesize over managing-down for the last 30 days"
```

Useful if you manage 3+ reports — surfaces patterns across the team that no individual 1:1 would catch.

#### Weekly Sunday — cross-cutting patterns watch

```
/schedule "Every Sunday at 6pm, run /patterns-watch"
```

Scans across the whole reflection ecosystem (stakeholder, wins, self) and surfaces patterns you haven't asked about — attention gaps, contradictions between stated focus and actual logged work, trajectory shifts. Citation-disciplined; observation-not-prediction. Pair with a Sunday 6pm calendar block titled *"Open Claude Code → review weekly patterns"*. Most useful after you've been logging for 4+ weeks (patterns need volume).

### 5. Listing and managing your schedules

Inside Claude Code:

```
/schedule list
```

Shows all routines you've created. To remove one:

```
/schedule delete <id-or-description>
```

You can also edit a routine to change its cadence — see the `/schedule` skill's own help for specifics.

### 6. External reminder pairing (recommended)

The single best thing you can do to make cadence reliable is to add **one recurring calendar event per `/schedule` routine** in the calendar / task system you actually check. The pattern:

- The calendar event grabs your attention at the right moment.
- The event's body says: *"Open Claude Code → /<skill-name>"*.
- Claude Code already has the scheduled output ready when you open it.

This is the closest you can get to the Voohy app's mobile-push experience, while still doing the depth work in Claude Code.

### 7. Cadence cheat sheet

| When | What fires (in Claude Code) | What you should pair externally |
|---|---|---|
| Every Friday, 4pm | `/wins-due` — surface forgotten wins from the week | Friday 4pm calendar block: *"Log wins"* |
| Every Monday, 9am | `/stakeholder-due` — overdue stakeholder reflections | Monday 9am calendar block: *"Stakeholder reviews"* |
| First Monday monthly | `/self-reflect` — leadership / behavior / energy | Monthly self-reflection time block |
| First Monday quarterly | `/team-diagnosis` — team health check | Pre-OKR-planning week reminder |
| First Monday quarterly | Growth-plan review per report | Per-report 1:1 in the plan-review week |
| Mid-month monthly (optional) | `/stakeholder-synthesize` over managing-down | Mid-month management reading time |
| Every Sunday, 6pm | `/patterns-watch` — cross-cutting scan across all reflection files | Sunday 6pm block: *"Review weekly patterns"* |

Skills not in this table are on-demand only — they fire when you describe a situation that matches them (a hire decision, a hard 1:1 prep, a new spec, a demo, a customer interview synthesis, an RFC review, etc.).

### 8. Stakeholder lifecycle (after the initial register)

Reorgs happen, people change roles, colleagues leave. The `stakeholder-manage` skill handles every lifecycle operation after the initial `stakeholder-register`. It routes by natural language — there's no syntax to memorize. Some examples:

| What you say | What happens |
|---|---|
| *"list my stakeholders"* | Shows all active stakeholders grouped by category, with last-reflected dates and ⚠ flags on anyone neglected for 14+ days. *"show archived"* extends the list. |
| *"update Jill's role to Staff Eng II"* | In-place frontmatter edit. Adds a one-line audit note. |
| *"Jill is my manager now"* | Re-categorizes. Moves the file across category folders. **All reflection history is preserved.** Captures a one-sentence reason for the audit log. The question pool shifts to managing-up on the next reflection. |
| *"Jill changed her name to Jill Brown"* | Rename. Updates filename, frontmatter, registry. You choose whether the slug changes too. |
| *"Draymond left for Stripe"* | Archive. File moves to `~/voohy-work-reflections/archive/managing-down/draymond-young.md`. Active reflection skills no longer surface them. You can still synthesize over the archive when retrospecting. |
| *"delete Sam — registered them by mistake"* | Two-step confirmation. The skill strongly recommends archive first; if you persist, asks you to type the name to confirm. Used rarely. |

Two design opinions worth knowing before you use it:

- **Archive ≠ delete.** Most "remove" requests are actually archive. The skill defaults to archive and requires explicit override. Reflection history about a former colleague is often the most valuable record you'll have when calibrating future hires, references, or working with their replacement.
- **Re-categorize preserves history.** When a peer becomes your manager, you don't restart the file. The 18 months of accumulated reflections are *more* relevant in the new relationship, not less. The audit log explains the transition; the entries underneath stay intact.

The audit log lives in each stakeholder file as a `## Audit log` section between Background and Reflections. You can hand-edit it; the skill doesn't enforce.

### 9. Verify the setup

Run each of these to confirm:

```bash
# Skills installed?
ls ~/.claude/skills/        # or .claude/skills/ for project-scope

# Agents installed?
ls ~/.claude/agents/

# Data directory exists with privacy README?
ls -la ~/voohy-work-reflections/
cat ~/voohy-work-reflections/README.md
```

Inside Claude Code:

```
/agents               # twelve subagents should appear
/schedule list        # your routines should appear here
```

Trigger a skill manually as a smoke test:

```
let me reflect on my manager
```

…should auto-route to `stakeholder-reflect` (or to `stakeholder-register` if you haven't registered the manager yet).

### 10. Maintenance

The system is low-maintenance but not no-maintenance. Once a quarter:

- Skim `~/voohy-work-reflections/` — anything stale, anyone you've stopped tracking actively, anyone you should have added?
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
- *"I need to brief the CEO on why our accuracy regressed."* → `the-translator` reframes the numbers.
- *"Help me cut this 30-item backlog to what we can ship this quarter."* → `prioritization-frameworks` skill picks the right method and pressure-tests scoring assumptions.
- *"Document why we picked Sonnet over Opus for this feature."* → `decision-log` skill captures it in a format that survives the next model migration.
- *"I have a hard 1:1 with a struggling engineer tomorrow."* → `one-on-one-prep` builds the agenda; `feedback-frameworks` drafts the conversation.
- *"My senior engineer keeps shutting down juniors in standup."* → `leadership-os` (the `Mirror` mode) gives you the conversation script.

## Stakeholder reflection: a worked example

The four `stakeholder-*` skills and `self-reflect` are a tighter system than the rest of the bundle — they share private data at `~/voohy-work-reflections/` (configurable via `$VOOHY_WORK_REFLECTIONS_HOME`) and are designed to be used together over months.

### A note on origins

This was originally a feature inside the [Voohy](https://voohy.com) app — the same idea: register your stakeholders by category, answer cadence-driven reflection questions, accumulate insight over time. The Claude Code version is a deliberate revamp, and on balance it works *better* in this shape than as in-app screens, because the reflection sessions can lean on the rest of the skills bundle. A reflection naturally hands off to `feedback-frameworks` when feedback emerges, to `one-on-one-prep` when a 1:1 is coming up, to `decision-log` when a relationship-shaping decision gets made. None of those compositions were possible inside an app's bounded UX. The honest tradeoff: a CLI/IDE tool has more friction than a mobile app, so expect weekly or bi-weekly use, not daily.

### File layout

```
~/voohy-work-reflections/             # private, gitignored, on your local machine only
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

1. **Register.** *"I just got a new VP. Add John Adams to managing-up."* → `stakeholder-register` creates `~/voohy-work-reflections/managing-up/john-adams.md` with frontmatter and waits to confirm before writing.
2. **Reflect, weekly-ish.** *"Let me reflect on John."* → `stakeholder-reflect` loads the file, picks 2–3 questions appropriate to the moment (cadence-aware, balancing *ask* and *sense* lenses), surfaces the prompt's `things_to_consider`, and walks through a real conversation. Pushes back on one-line answers and identity-level labels. Writes a dated entry per question.
3. **Stay current.** *"What's due this week?"* → `stakeholder-due` lists the overdue question × stakeholder pairs sorted by `due_ratio` (days_since / cadence). Or run it once via `/schedule "Every Monday at 9am, run /stakeholder-due"` to get a Monday-morning surfacing.
4. **Synthesize, periodically.** *"Before John's quarterly skip-level, what do I know?"* → `stakeholder-synthesize` reads the file, produces patterns / contradictions / blind spots / suggested next conversations, with every claim cited to specific dated entries. Hands off to `feedback-frameworks` or `one-on-one-prep` when a natural next step appears.
5. **Self.** Same shape, aimed at you. `self-reflect` covers behavior under pressure, communication, time/energy, fulfillment, advocating for yourself.
6. **Maintain.** *"Jill is my manager now"* / *"Draymond left for Stripe"* / *"list my stakeholders"* → `stakeholder-manage` handles the lifecycle: re-categorize across folders (history preserved), archive when someone leaves (file kept for retrospection), edit roles, list, rename. Defaults toward archive over delete.

### Things to know before adopting

- **The data lives outside the public repo.** The skill creates `~/voohy-work-reflections/` on first run, gitignores it, and warns you about privacy. The folder holds candid notes about real people — don't put it in Dropbox if you wouldn't put your journal there. Override the path with `$VOOHY_WORK_REFLECTIONS_HOME` if you want it on an encrypted volume or somewhere else.
- **Quality of synthesis depends on quality of input.** One-line entries produce shallow synthesis. The `things_to_consider` field is surfaced prominently to help — use it.
- **Synthesis is honest about its evidence.** `stakeholder-synthesize` will not claim a pattern without citing dated entries. If your file is sparse, the synthesis will be tentative; if it's rich, the synthesis will be sharp.

## Wins log: a worked example

The three `wins-*` skills are a parallel system to the stakeholder bundle — same data root, same shape, but the subject is *you*. They cover the "hype doc" / "brag document" / "win log" pattern: capture wins as they happen so you can remix them into a promo packet, behavioral interview answers, perf-review self-eval, or salary case when the moment comes.

### A note on origins

This was originally a "Wins at Work" feature inside the [Voohy](https://voohy.com) app, since sunsetted. The Claude Code rebuild gains the same composition advantage as the stakeholder bundle: a wins entry can hand off to `decision-log` when it captures a judgment, to `feedback-frameworks` when it came from feedback work, to `stakeholder-reflect` when it was driven by a relationship. And `wins-curate` can compose with `stakeholder-synthesize` and `self-reflect` for a perf-review self-eval that draws from all three sources at once.

### File layout

```
~/voohy-work-reflections/
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

Six skills (`hiring-craft`, `performance-management`, `coaching-mode`, `report-career-architect`, `report-promo-case`, `team-diagnosis`) and one agent (`the-rfc-reviewer`) form a tighter system aimed at the highest-stakes work an engineering manager does — the work most managers do loosely because nobody handed them a forcing function for it.

These compose with the rest of the bundle but earn their keep on their own. The premise is simple: world-class EMs do a few things deliberately that average ones do by tribal habit. Hiring is a craft, not a vibes-check. Performance management has a ladder, not a single mode of "give more feedback." Coaching is asking, not telling. Promotions are panel-ready written cases, not pitches. Team health is multi-dimensional, not a vibe. And design-doc reviews can be rigorous without the user being a senior staff engineer themselves.

### A typical year in the lifecycle

1. **Hiring season.** *"We're opening a Staff Eng req."* → `hiring-craft` (loop design mode) maps signals to slots, writes the rubric with behavioral anchors, and structures the debrief discipline. Six weeks later: *"Help me run the debrief."* → same skill, debrief mode, with silent-vote-first and round-robin structure. After hire: `stakeholder-register` brings the new report into the reflection system from day one.
2. **Onboarding into growth.** First 60 days: *"Build a 12-month growth plan for the new hire."* → `report-career-architect` reads what's accumulated in `stakeholder-reflect`, asks where they're growing toward, produces a sequenced plan with the *manager moves* (what the user has to stop doing) named explicitly.
3. **Quarterly health check.** *"Before my skip-level update, give me a structured read on the team."* → `team-diagnosis` walks eight dimensions (delivery, attrition, dependency tax, on-call, peers, info flow, technical health, culture) with cited evidence and top-3 actionable risks.
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

The test for whether this collection is right for you: do you currently open Claude when you face these situations, and do you wish your version of Claude already knew the framework you'd want to apply? If yes, the skill format pays for itself by removing the prompt-engineering tax every time. If you're unsure, start with `the-reducer` and `feedback-frameworks` — see whether they actually change your behavior before installing the rest.

## Philosophy

A few opinions baked into how these are written:

- **Default to "no AI."** Most problems framed as AI problems are UI problems, rules problems, or data problems. The skills push back hard before greenlighting an LLM.
- **Evals before vibes.** No feature ships on demo-day feel. Every flow assumes a golden dataset and a metric, even a small one.
- **Probabilistic in, deterministic out.** Business rules live in code; the model proposes, the system disposes.
- **Clarity is kindness.** This applies to both stakeholder comms and how the agents themselves write — short, specific, no hedging.

## Contributing

Skills and agents are intentionally small and composable. If you have a mode that's been missing from your own AI PM workflow — a procurement-savvy `the-vendor-evaluator`, a `the-rollout-planner` for staged launches, etc. — open a PR. Each new agent should be one file with proper frontmatter (`name`, `description`, `tools`) and a tightly scoped system prompt.

## License

MIT.
