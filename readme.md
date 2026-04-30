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
│   │   ├── feedback-frameworks/SKILL.md
│   │   └── leadership-os/SKILL.md
│   └── agents/
│       ├── the-reducer.md
│       ├── the-scientist.md
│       ├── the-architect.md
│       ├── the-red-teamer.md
│       └── the-translator.md
└── ai-technical-pm-php/      # Same skills + agents, with a PHP prototyping stack baked in
    └── ...
```

### Skills

| Skill | When it triggers |
|---|---|
| `ai-pm-frameworks` | Scoping AI features, build-vs-buy-vs-rule decisions, eval design, model selection, guardrail planning. |
| `feedback-frameworks` | Drafting and pressure-testing feedback for reports, peers, and stakeholders using the COIN structure (Connection → Observation → Impact → Next steps) and the SOLID quality checklist. |
| `leadership-os` | Managing up/down/across — 1:1s, performance reviews, stakeholder updates, post-mortems, cross-functional conflict. |

### Subagents

| Agent | Operational mode |
|---|---|
| `the-reducer` | Early discovery. Reduces ambiguity. Pushes back on "AI problems" that are actually UI problems. |
| `the-scientist` | Pre-development feasibility. Builds golden datasets and eval harnesses. Refuses to declare success on a single demo. |
| `the-architect` | Production hardening. Designs the input filter → LLM → output guardrail "safety sandwich." Separates probabilistic from deterministic logic. |
| `the-red-teamer` | Pre-launch and maintenance. Simulates prompt injection, exfiltration, jailbreaks, and out-of-distribution failures. |
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

Verify with `/agents` inside Claude Code — the five subagents should appear. Skills auto-load when prompts match their `description`; you can also trigger them explicitly with `/ai-pm-frameworks` or `/leadership-os`.

## How it's meant to be used

Drop into Claude Code and describe what you're working on the way you'd describe it to a teammate. The harness routes:

- *"Users keep complaining the search results feel off — should we add an LLM reranker?"* → `the-reducer` runs first, asks whether this is genuinely an AI problem.
- *"I've got a prototype that summarizes contracts. How do I know if it's good enough to ship?"* → `the-scientist` builds the eval scaffolding.
- *"We're putting this in front of paying customers next week."* → `the-architect` designs guardrails; `the-red-teamer` finds what breaks.
- *"I need to brief the CEO on why our accuracy regressed."* → `the-translator` reframes the numbers.
- *"My senior engineer keeps shutting down juniors in standup."* → `leadership-os` (the `Mirror` mode) gives you the conversation script.

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
