---
name: prioritization-frameworks
description: Use when the user is prioritizing a backlog, building a roadmap, cutting scope, or arguing about what to build next. Trigger phrases include "what should we build first?", "help me cut this list", "I need to defend my roadmap", "should we do X or Y?". Surfaces the right framework (RICE, ICE, WSJF, MoSCoW, Kano, Cost of Delay) for the situation and forces the underlying assumptions out into the open.
---

# Prioritization Frameworks

Use this when the user has more potential work than capacity and needs to decide what to do next. The point of any framework here is **not the score** — it's that the framework forces hidden assumptions into a place where they can be challenged.

**Strategy doc:** If `~/voohy-work-reflections/strategy/<area-slug>.md` exists for the relevant area, read it before scoring. Items that fit a strategic track score one way; items that don't fit any track are candidates for the "not working on" list, not for the backlog. Ranking against tracks beats ranking against impact-confidence-effort in isolation.

## Pick the right framework first

Don't reflexively reach for RICE. Match the framework to the situation:

| Situation | Best fit | Why |
|---|---|---|
| Mixed backlog of features for one team | **RICE** | Balances reach, impact, confidence, effort. Default for product backlogs. |
| Same as above but you're moving fast / low rigor | **ICE** | RICE without Reach — quicker, more subjective. |
| Engineering-heavy backlog with cost-of-delay variance | **WSJF** (Weighted Shortest Job First) | Captures urgency and cost of delay, not just impact. |
| Need to communicate cuts to stakeholders | **MoSCoW** (Must / Should / Could / Won't) | Optimized for negotiation, not analysis. |
| Feature ideation, asking "what would users love?" | **Kano** | Distinguishes basic, performance, and delight features. |
| Time-sensitive features (launches, market windows) | **Cost of Delay** | Quantifies the cost of *not* shipping by date. |
| Two-option fork (A vs B) | **Pros/cons + reversibility** | Frameworks are overkill for binary calls. |

If the user starts with "let's RICE the backlog" before defining the situation, push back: which framework actually fits?

## The frameworks

### RICE

`Score = (Reach × Impact × Confidence) / Effort`

- **Reach:** How many users/customers, in what time window. Be concrete: "users per quarter", not "lots."
- **Impact:** Per-user effect on the goal. Use a fixed scale (e.g., 3 = massive, 2 = high, 1 = medium, 0.5 = low, 0.25 = minimal). Tie to a north-star metric, not "value."
- **Confidence:** As a percentage (100% / 80% / 50%). Below 50%, you're guessing — go run a test instead of scoring.
- **Effort:** Person-months. Round up; estimates are wrong on the optimistic side by default.

Trap: **scoring inflation.** When everything is a 3, the framework adds nothing. Force a distribution.

### ICE

`Score = Impact × Confidence × Ease` (each 1–10).

Faster than RICE, more subjective. Good for early-stage triage. Bad for defending a roadmap to stakeholders — too easy to challenge any individual score.

### WSJF (Weighted Shortest Job First)

`WSJF = Cost of Delay / Job Size`

Where Cost of Delay = User/Business Value + Time Criticality + Risk Reduction & Opportunity Enablement.

Use when items have very different urgency profiles — e.g., a compliance deadline competing with a discovery initiative. WSJF will (correctly) prioritize the small urgent thing.

### MoSCoW

Sort items into **Must**, **Should**, **Could**, **Won't (this round)**. Constraint: capacity for "Must" should be ≤60% of total capacity; if more, you have a strategy problem, not a prioritization problem. The "Won't" column is the most valuable — it's where commitments not to do things live.

### Kano

Classify features as:
- **Basic (Must-be):** Absence causes dissatisfaction; presence is invisible. Don't celebrate building these.
- **Performance:** More is better, linearly. Most "improvement" work.
- **Delight (Attractive):** Absence is fine; presence creates loyalty. Differentiation lives here.
- **Indifferent / Reverse:** Watch out — easy to over-invest in.

Particularly useful for AI features: most LLM "wow" features start as Delight and decay into Performance, then Basic, fast. Plan for that decay.

### Cost of Delay

For each item, estimate: *if we ship this one week later, what does it cost us?* In dollars, lost users, missed deadline, competitor advantage. Items with steep CoD curves (or hard cliffs at a date) jump the queue.

Especially useful when arguing against a "fair queue" mentality — not all delays are equal.

## How to help the user

1. **Pick the framework.** Use the table above. State the choice and why.
2. **Force assumptions out.** For every score, ask the source. "Reach = 5,000/quarter — is that from analytics, a guess, or a sales request?" Confidence drops fast under questioning, which is the point.
3. **Run the math, but argue the result.** A score is a starting point for a conversation, not a verdict. If the top-scored item *feels* wrong, the framework is missing a dimension — usually strategic alignment, technical sequencing, or political reality. Add a column for it explicitly rather than fudging the existing scores.
4. **Insist on a "Won't this round" list.** What's getting cut, and what's the cost of cutting it. This is what stakeholders actually need to see.
5. **Write it down.** Pair this with the `decision-log` skill if the prioritization decision is one the team will revisit (it always is). The framework score *is* the rationale.

## Anti-patterns to flag

- **Score everything to one decimal place.** False precision. RICE scores within 20% of each other are tied — break ties with judgment.
- **Optimize for the framework, not the goal.** If the framework keeps producing answers that feel wrong, something is missing from the inputs.
- **Single-axis prioritization.** "Highest revenue impact wins" misses risk, sequencing, team morale. Use multiple frameworks for high-stakes decisions.
- **Frameworks as politics shields.** "The framework said so" is a dodge. Own the call.
- **No re-prioritization cadence.** Backlogs go stale. Whatever was true two months ago about reach and confidence is probably wrong now.
