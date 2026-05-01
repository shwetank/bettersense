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
│   │   ├── decision-log/SKILL.md
│   │   ├── demo-prep/SKILL.md
│   │   ├── feedback-frameworks/SKILL.md
│   │   ├── leadership-os/SKILL.md
│   │   ├── metrics-design/SKILL.md
│   │   ├── one-on-one-prep/SKILL.md
│   │   ├── prioritization-frameworks/SKILL.md
│   │   ├── self-reflect/SKILL.md
│   │   ├── stakeholder-due/SKILL.md
│   │   ├── stakeholder-reflect/
│   │   │   ├── SKILL.md
│   │   │   └── questions.json
│   │   ├── stakeholder-register/SKILL.md
│   │   └── stakeholder-synthesize/SKILL.md
│   └── agents/
│       ├── the-architect.md
│       ├── the-eval-designer.md
│       ├── the-explainer.md
│       ├── the-incident-responder.md
│       ├── the-prompt-critic.md
│       ├── the-red-teamer.md
│       ├── the-reducer.md
│       ├── the-research-synthesizer.md
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
| `decision-log` | Capturing meaningful product/technical decisions in an ADR-style format with reversibility, rationale, and revisit triggers. Especially load-bearing for AI decisions tied to specific model versions. |
| `demo-prep` | Five-pass prep for high-stakes demos: headline, audience, pre-mortem, script, and Q&A — with extra hazard-handling for AI-feature demos. |
| `feedback-frameworks` | Drafting and pressure-testing feedback for reports, peers, and stakeholders using the COIN structure (Connection → Observation → Impact → Next steps) and the SOLID quality checklist. |
| `leadership-os` | Managing up/down/across — 1:1s, performance reviews, stakeholder updates, post-mortems, cross-functional conflict. |
| `metrics-design` | Designs the metric tree for an AI feature — north star, leading/lagging, and the counter-metrics that catch Goodhart-style failures where you optimize the model into a worse product. |
| `one-on-one-prep` | Builds 1:1 agendas matched to the relationship (manager → report, report → manager, peer, skip-level) instead of generic templates. |
| `prioritization-frameworks` | Picks the right prioritization framework (RICE, ICE, WSJF, MoSCoW, Kano, Cost of Delay) for the situation, then forces hidden assumptions out into the open. |
| `self-reflect` | Self-reflection on leadership, behavior under pressure, time/energy, fulfillment, and advocating for yourself — captured chronologically in a private file so insight compounds over time. |
| `stakeholder-register` | Register a stakeholder (manager, peer, report, team) for ongoing reflection. Sets up a private folder at `~/voohy-work-reflections/` (configurable via `$VOOHY_WORK_REFLECTIONS_HOME`), creates a per-stakeholder file, and warns about privacy. |
| `stakeholder-reflect` | Guide a single reflection session about a registered stakeholder using a question library spanning *ask*, *sense*, and *ask-and-sense* lenses. Surfaces the question's `things_to_consider`, picks cadence-appropriate questions, and writes a dated entry back. |
| `stakeholder-due` | Scans your stakeholder files and surfaces which question × stakeholder pairs are overdue based on `suggested_freq`. Designed to be invoked on demand or fired weekly via `/schedule`. |
| `stakeholder-synthesize` | Synthesizes across accumulated reflections — patterns, contradictions, blind spots — with citations to specific dated entries. Never claims a pattern without evidence. |

### Subagents

| Agent | Operational mode |
|---|---|
| `the-reducer` | Early discovery. Reduces ambiguity. Pushes back on "AI problems" that are actually UI problems. |
| `the-research-synthesizer` | Clusters raw qualitative data — interview notes, support tickets, NPS verbatims — into themes, JTBDs, and product implications anchored to direct quotes. |
| `the-spec-writer` | Turns a validated problem into a decision-ready PRD with concrete success metrics, scoped non-goals, and named seams between probabilistic and deterministic logic. |
| `the-scientist` | Pre-development feasibility. Builds golden datasets and eval harnesses. Refuses to declare success on a single demo. |
| `the-eval-designer` | Designs the smallest eval system that would actually catch a regression — golden set, metric class, LLM-as-judge rubric, production sampling, ship/rollback bars. |
| `the-explainer` | Writes audience-calibrated how-it-works docs (customers, sales, support, execs, security/legal) covering capability, limitations, and the safety story — not marketing copy and not a research paper. |
| `the-prompt-critic` | Reviews production prompts the way a senior engineer reviews code: scoping, instruction order, output contract, injection resistance, drift hazards. |
| `the-architect` | Production hardening. Designs the input filter → LLM → output guardrail "safety sandwich." Separates probabilistic from deterministic logic. |
| `the-red-teamer` | Pre-launch and maintenance. Simulates prompt injection, exfiltration, jailbreaks, and out-of-distribution failures. |
| `the-incident-responder` | AI-feature incident lead — stabilization, technical investigation, blameless postmortems, and feeding failures back into the eval set. |
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

Verify with `/agents` inside Claude Code — the eleven subagents should appear. Skills auto-load when prompts match their `description`; you can also trigger them explicitly with `/<skill-name>` (e.g. `/ai-pm-frameworks`, `/decision-log`, `/leadership-os`, `/stakeholder-reflect`).

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
- *"Before my reports' performance reviews, what do I actually know about each of them?"* → `stakeholder-synthesize` reads the files and produces dated, citation-backed reads — patterns, contradictions, blind spots — for each.
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

### Things to know before adopting

- **The data lives outside the public repo.** The skill creates `~/voohy-work-reflections/` on first run, gitignores it, and warns you about privacy. The folder holds candid notes about real people — don't put it in Dropbox if you wouldn't put your journal there. Override the path with `$VOOHY_WORK_REFLECTIONS_HOME` if you want it on an encrypted volume or somewhere else.
- **Quality of synthesis depends on quality of input.** One-line entries produce shallow synthesis. The `things_to_consider` field is surfaced prominently to help — use it.
- **Synthesis is honest about its evidence.** `stakeholder-synthesize` will not claim a pattern without citing dated entries. If your file is sparse, the synthesis will be tentative; if it's rich, the synthesis will be sharp.

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
