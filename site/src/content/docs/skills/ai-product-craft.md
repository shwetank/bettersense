---
title: AI product craft
description: Seven skills for AI PMs and technical leaders building and shipping AI features with rigor.
---

These skills encode the frameworks that distinguish disciplined AI product development from vibes-driven shipping: defaulting to "no AI," building evals before committing engineering, designing counter-metrics that catch Goodhart failures, and translating model behavior into business outcomes.

---

## `ai-pm-frameworks`

**Triggers:** "should we use AI for this?", "what AI approach fits here?", "help me scope this AI feature"

The core AI PM decision framework. Covers:

- **The default-to-no question.** Is this actually an AI problem, or a UI problem, a data problem, a rules problem? Forces this question before anything else.
- **Build vs. buy vs. rule.** When to use a pre-built API, when to fine-tune, when to write a rule instead.
- **Eval design.** Golden dataset structure, metric choices, the minimum viable eval before committing engineering resources.
- **Model selection.** How to match model capability, cost, and latency to the actual requirement — not the model that impressed in a demo.
- **Guardrail planning.** Safety sandwiches around LLM calls. What belongs in code vs. what belongs in the model.

Reads `profile.md` (for stack context) and `strategy/<area>.md` (for product context) when present.

---

## `metrics-design`

**Triggers:** "design the metrics for [feature]", "what should I measure?", "help me define success metrics"

Designs the full metric tree for an AI feature:

- **North star** — the one metric that, if it moves, you're confident the product is improving
- **Leading indicators** — what you can measure before the north star moves
- **Lagging indicators** — downstream outcomes you're ultimately optimizing for
- **Counter-metrics** — the signals that catch Goodhart-style failures (you optimized the thing you measured into a worse product)
- **Operational metrics** — latency, cost, error rate; the infra signals that keep the north star credible

Reads `strategy/<area>.md` when present — the strategy's key metrics become the north stars, and this skill expands them.

---

## `demo-prep`

**Triggers:** "help me prep for this demo", "I'm demoing [X] to [audience]", "prep a high-stakes demo"

Five-pass prep for high-stakes demos:

1. **Headline** — what single thing should the audience remember?
2. **Audience** — what do they already know, what do they care about, what will they push on?
3. **Pre-mortem** — what could go wrong? How do you handle each failure mode?
4. **Script** — the actual flow, with specific words for the hard transitions
5. **Q&A** — the questions they will ask, with prepared answers

Extra handling for **AI-feature demos**: behavioral uncertainty, "why did it do that" questions, confidence calibration, and the specific hazard of demos that work in practice but fail in front of audiences.

---

## `prioritization-frameworks`

**Triggers:** "help me prioritize this backlog", "should I pick X or Y?", "RICE vs ICE for this"

Picks the right prioritization framework for the situation:

| Framework | Best for |
|---|---|
| RICE | Large backlogs with heterogeneous items; teams that over-weight gut feel |
| ICE | Fast triage; smaller backlogs; when effort is hard to estimate |
| WSJF | Programs where cost of delay is the key variable; agile-at-scale |
| MoSCoW | Scope negotiation with stakeholders; fixed-deadline releases |
| Kano | Feature discovery; understanding which attributes delight vs. satisfy |
| Cost of Delay | When sequencing decisions need to be explained to executives |

Forces hidden assumptions into the open: who scored this, on what basis, what would change the ranking?

Reads `strategy/<area>.md` when present — backlog items are scored against strategic tracks, and items that don't fit any track are candidates for the "not working on" list.

---

## `decision-log`

**Triggers:** "log this decision", "document why we chose X", "ADR for [decision]"

Captures meaningful product/technical decisions in ADR format:

- **Decision:** what was chosen
- **Context:** what made this a real decision (not a default)
- **Alternatives considered:** what else was on the table
- **Rationale:** why this option
- **Reversibility:** easily reversible / reversible with effort / effectively irreversible
- **Revisit triggers:** what would make you revisit this?
- **Confidence:** high / medium / low at time of decision

Especially load-bearing for **AI decisions tied to specific model versions**. When you upgrade from Claude Sonnet 3.5 to 3.7, you want a record of why you chose the previous model and what the revisit criteria were.

---

## `self-reflect`

**Triggers:** "let me reflect on myself", "self-reflection session", "how am I doing as a leader?"

Guides reflection across five dimensions:

- Behavior under pressure (what triggers you, what you default to)
- Communication (how you're landing, what's not getting through)
- Time and energy (what you're giving energy to vs. what you wish you were)
- Fulfillment (what's meaningful, what's not)
- Advocating for yourself (are you making your work visible, are you asking for what you need?)

Writes dated entries to `~/bettersense-work-reflections/self/reflections.md`. The `patterns-watch` skill reads this alongside stakeholder and wins data.

---

## `patterns-watch`

**Triggers:** "anything notable across my reflections this week?", "Sunday evening check-in", "patterns across my work"

Cross-cutting scan across the entire reflection ecosystem (stakeholder + wins + self files). Surfaces unsolicited patterns:

- **Attention gaps** — stakeholders you haven't reflected on in a while
- **Contradictions** — stated focus vs. actual logged work
- **Trajectory shifts** — patterns that have changed direction
- **Type imbalances** — wins log skewed toward one type (e.g. all delivery, no mentorship)

Every observation is cited to specific dated entries. Never claims a pattern without evidence.

Most useful as a recurring scan:

```
/schedule "Every Sunday at 7pm, run /bettersense:patterns-watch"
```
