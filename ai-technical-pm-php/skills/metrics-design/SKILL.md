---
name: metrics-design
description: Use when the user is designing the metric tree for a feature (especially an AI feature) — picking a north star, leading and lagging indicators, quality metrics, and counter-metrics. Trigger phrases include "what should we measure for…", "how do we know if this is working?", "I need to define success for…", or any spec where the success metrics section is fuzzy. Distinct from `the-eval-designer`, which measures model quality; this skill measures business success and guards against optimizing the model into a worse product.
---

# Metrics Design

Design the metric tree for a feature so it can be steered in production, not just declared successful at launch. Especially load-bearing for AI features, where it's easy to ship something that "improves engagement" while quietly making the product worse.

## When to apply

Trigger on:
- A spec or PRD where "success metrics" is one fuzzy line.
- A new AI feature about to ship — *before* it ships.
- A retro on a feature where "we hit the metric but the product feels worse" — diagnose what was missing.
- Quarterly planning where the team is being asked to commit to outcomes.

Skip for: trivially measurable A/B tests on a single button, or features whose entire purpose is one metric (a checkout improvement targeting conversion rate).

## The four-layer metric tree

Every meaningful feature should be measurable across four layers. If you can't fill all four, the feature isn't ready to ship.

### 1. North Star (1 metric)
The single number that, if it moves, you'd say the feature *worked*. Properties:
- An **outcome**, not an output. "Documents summarized" is an output. "Time-to-decision on contracts reduced from 4h to 30min" is an outcome.
- **User-centric.** Phrased from the user's perspective, not the company's. (Revenue is downstream of the user winning.)
- **Defendable in a hostile room.** If a skeptic asked "couldn't this go up while the product gets worse?", you should have an answer.

### 2. Lagging indicators (2–3 metrics)
The business outcomes downstream of the north star. Revenue, retention, NPS, expansion, support ticket volume.
- **Slow to move** — these are the truth, but you'll learn it in months, not days.
- **Use them to validate** the north star is the right one, not to steer the feature.

### 3. Leading indicators (3–5 metrics)
The early signals that move within days/weeks of release. Adoption rate, time-to-first-value, repeat-use rate within N days, depth-of-use.
- **Move fast enough to act on.** If you can't observe a change within 2 weeks, it's not a leading indicator, it's a lagging one mislabeled.
- **Specific to the feature.** "MAU" is not a leading indicator for a contract summarization feature; "% of users who open the summary panel within first 3 sessions" is.

### 4. Counter-metrics (2–4 metrics) — *the section most teams skip*
What you do **not** want to go up — explicitly named, monitored, and treated as a launch blocker if they breach. This is the section that catches Goodhart's-law failures, where you optimize the official metric while degrading the product.

For AI features, mandatory counter-metrics include:
- **Quality metric (eval score).** Connect to `the-eval-designer`'s output. If quality drops, success on every other metric is a lie.
- **Hallucination rate / wrongness rate** in production traffic.
- **Trust signals** — thumbs-down rate, copy-edit rate (% of generations users edit before using), regenerate rate.
- **Cost per successful interaction** — not just total cost, but cost amortized across interactions that actually delivered value. AI features can quietly become unprofitable.
- **Latency at p95/p99** — average latency hides the worst experiences, which are the ones that drive churn.

For any feature, also consider:
- **Cannibalization** — usage of feature X going up while usage of related feature Y collapses.
- **Support load** — tickets mentioning the feature.
- **Time-on-task** — sometimes engagement going *up* means users are confused.

### Anti-metrics: what *would* make us roll back?
A subset of counter-metrics with explicit thresholds: "if hallucination rate > 5%, we roll back." Pair with `decision-log` to capture these commitments durably.

## AI-specific patterns to watch

- **The "engagement looks great" trap.** LLM features can drive up session length and message count by being verbose, confusing, or argumentative. Always pair engagement metrics with a *task completion* or *trust* counter-metric.
- **The selection-bias trap.** Early adopters of an AI feature are not the median user. Don't generalize from week-1 metrics. Stratify by user segment and tenure.
- **The novelty curve.** AI features get a usage spike that decays over 4–6 weeks. Set the bar based on week-6 retention, not week-1 adoption.
- **The "AI assist" measurement problem.** When AI suggests and a human accepts/edits, attribution is murky. Define upfront: are you measuring suggestion acceptance? Edited-acceptance? Human time saved? Pick one as the headline.
- **Quality regressions hide in averages.** A model can improve on common cases while regressing on rare-but-important ones, and the average will look fine. Stratify quality metrics by input segment, not just overall.

## How to help the user

When they ask for a metric tree:

1. **Force the north-star sentence first.** Get them to write one sentence: "If this feature works, [user] will be able to [outcome] [measurable change]." Push back on outputs disguised as outcomes.
2. **Build the tree top-down,** but verify it bottom-up: would the leading indicators actually predict the lagging ones? Is there a plausible mechanism?
3. **Insist on counter-metrics.** If the user offers none, name three from the list above and ask which apply. Don't let this section be skipped.
4. **Set thresholds.** For each metric: "what's a win," "what's neutral," "what triggers a rollback or rethink." Vague thresholds invite revisionism.
5. **Specify the cadence.** Daily / weekly / monthly review for each. Metrics nobody reviews on a schedule are theater.
6. **Name the instrumentation gap.** What's *not* currently logged that you'd need? This is usually the bottleneck — design the logging plan as part of the metric plan.

## Output format

Produce a one-page metric plan:

```
Feature: [name]
Owner: [PM name]
Review cadence: [weekly / bi-weekly]

NORTH STAR
  [metric] — currently [baseline], target [N] by [date]

LAGGING (3-month validation)
  - [metric, target, threshold]
  - ...

LEADING (acted-on weekly)
  - [metric, target, threshold]
  - ...

COUNTER-METRICS (must not breach)
  - [metric, threshold, rollback action if breached]
  - ...

INSTRUMENTATION GAPS
  - [what we need to start logging before launch]

OPEN QUESTIONS
  - [things we don't know how to measure yet]
```

## Anti-patterns to flag

- **One metric.** A single metric is a recipe for Goodhart's law. Insist on the tree.
- **Vanity metrics.** Total signups, total messages, total impressions — these go up over time mechanically. Use rates and per-user metrics.
- **No counter-metrics.** This is the most common and most expensive omission. Push back hard.
- **Unowned metrics.** Each metric should have a name next to it — who watches it, who acts on it.
- **"We'll figure out instrumentation later."** Means you'll launch blind. Convert to an open question with a deadline.
- **Confusing the eval score with success.** A high eval score on a feature nobody adopts is failure. Eval is a counter-metric, not the north star.
