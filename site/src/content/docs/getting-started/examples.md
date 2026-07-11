---
title: See it in action
description: Four real (anonymized) bettersense outputs — a reducer pushback, a feedback rewrite, a product pulse, and a career-retro excerpt. What a Tuesday actually looks like.
---

Tables of skills tell you what exists. These show you what comes out. Each is a lightly anonymized example of a skill doing the thing that makes it worth more than a blank Claude prompt.

---

## `the-reducer` refuses the question you asked

**You paste a Slack thread from your VP:** *"Customers keep saying search sucks. Can we add an LLM reranker? Want a recommendation by Monday."*

> Before I help you recommend a reranker, I want to make sure we're solving the right problem — because "search feels off" has at least four different causes and only one of them is a model problem.
>
> A few questions:
> - **Who's complaining?** Enterprise or free tier? "Search sucks" from a 5-seat trial and from your biggest account are different problems with different fixes.
> - **What's the failure they actually hit?** No results? Wrong results? Right results in the wrong order? Only the last one is a reranking problem.
> - **Have you looked at index coverage?** If the index is missing documents, a reranker reorders results that were never going to contain the answer. That's an LLM solution to a data problem — expensive, slow, and it won't work.
>
> My default here is *no AI until we've ruled out the data and UX explanations.* Can you pull the last 20 complaints and check whether the expected result was even in the index? If it was and the ordering was bad, the reranker case gets much stronger and I'll help you build it.

The reducer's opinion — *default to no AI* — is the whole value. Plain Claude would have helpfully drafted the reranker memo you asked for.

---

## `feedback-frameworks` turns a label into something you can say

**You type:** *"I need to tell my senior engineer he's been dismissive in standups."*

The skill won't let "dismissive" through — that's a character judgment, and it triggers defensiveness without changing behavior. It pushes you to the observable facts, then rebuilds the message in COIN order:

```
❌ Your first draft:  "You've been really dismissive of the team lately."

✅ Rebuilt (COIN):
  Connection:   "I want to talk about standup — you've got the most context
                 on the migration and I want that to land well."
  Observation:  "On Tuesday and Thursday, when Priya and Alex were walking
                 through their approaches, you cut in within a few seconds
                 with 'that won't work.'"
  Impact:       "Priya's approach on Thursday was actually the one the
                 architect recommended the next day. When it gets shut down
                 fast, we lose the idea and she stops offering them."
  Next:         "Can we try letting people finish before responding? I'll
                 help by holding space for it in the room."
```

> **SOLID check flagged one thing:** your third example was secondhand — you heard about the Monday incident, you didn't see it. Dropped it. Two firsthand, dated examples are stronger than three where one is hearsay.

If you'd logged reflections on this engineer, the Observation would arrive already cited with dates — that's the [memory system](/skills/overview#the-anchor-file-pattern) paying off.

---

## `product-pulse` — one page, dated, honest

Run on a schedule, this accumulates into product memory. A single week's report:

```markdown
# Product Pulse — Contract Summarization — 2026-07-09

## Headline
Adoption up, but a quiet quality regression on non-standard contracts.

## Usage
- Weekly active teams: 142 → 158 (+11%)
- Summaries generated: 3,410 (prev 3,090)
- Median time-to-summary: 4.2s (flat)

## AI-feature signals
- Eval pass rate (golden set): 91% → 87%  ⚠️
- Refusal rate: 2.1% (flat)
- Hallucination-flag rate (sampled): 3.9% → 5.2%  ⚠️

## Counter-metrics
- Edit-after-generate rate: 18% → 26%  ⚠️  ← users fixing output more
- "Summary was wrong" support tickets: 4 → 11

## Follow-up (max 3)
1. The eval drop + edit-rate rise both point at non-standard termination
   clauses. Pull 20 recent edited summaries and check. (owner: you)
2. Confirm the model version didn't change under us this week.

## Provenance
Aggregated, redacted. Source: analytics MCP + eval harness, 2026-07-02→09.
```

The counter-metrics are the point: usage went *up* the same week quality went *down*. A dashboard that only tracked adoption would have called this a good week.

---

## `career-retro` — the payoff of a year of logging

Run at review season, it reads everything you've logged and measures you against your *last* retro — growth as deltas, cited on both ends:

```markdown
# Career Retro — 2026 H1 — generated 2026-07-01
baseline: 2025-12-20

## The one-line arc
Moved from executing well within your team to setting technical direction
across three — with the visibility still lagging the work.

## Deltas since last retro
| Dimension     | Then (Dec)              | Now (Jul)                        | Evidence |
| Scope         | Led features on your    | Owned the pipeline-split         | wins 2026-03-11, 2026-06-02 |
|               | own squad               | strategy across 3 squads         | |
| Leadership    | Avoided the hard        | Delivered same-week feedback     | self 2026-02-14 → |
|               | feedback conversation   | to two reports                   | wins 2026-09-04 |
| Visibility    | Known within team       | Still known within team ⚠️        | (gap — see below) |

## Honest gaps
- Visibility hasn't moved with scope. You did staff-level work (the strategy
  doc, wins 2026-06-02) but no sponsor outside your team can cite it.
  → next-period focus, and exactly what `visibility-sponsorship` is for.

## Focus for next period
1. Get the pipeline-split strategy in front of the platform staff eng.
2. Present the eval-framework pattern at guild (turns work into reputation).
```

The first retro is a snapshot. The second is a *story*, because it can say what changed. Nothing "just ask Claude" can do that — it requires the year of memory underneath.

---

Ready to generate your own? [Install in 60 seconds](/getting-started/install), then run `/bettersense:start`.
