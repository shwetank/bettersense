---
name: stakeholder-due
description: Use when the user wants to know which stakeholder reflections are overdue. Trigger phrases include "what's due", "who haven't I thought about lately", "what's on my plate this week for stakeholder reflection", "stakeholder check-in", or any Monday-morning planning moment. Scans `~/voohy-reflections/`, computes which question × stakeholder pairs are overdue based on `suggested_freq` and last entry date, and outputs a prioritized list. Designed to be invoked on demand or fired weekly via `/schedule`.
---

# Stakeholder Due

Compute and surface what's overdue for reflection. The output is a prioritized list of question × stakeholder pairs the user should consider tackling, plus quick links to start each.

## Inputs

Default: scan everything. The user can narrow:
- *"What's due in managing-up"* → filter to one category.
- *"What's due for John"* → filter to one stakeholder.
- *"What's due this week"* → filter to items overdue by ≤ 7 days from their cadence.

## Loading

1. Read `~/voohy-reflections/stakeholders.json` for the registered list.
2. Load `questions.json` from the `stakeholder-reflect` skill folder.
3. For each registered stakeholder, read their file. For each question whose `stakeholder_categories` matches the stakeholder's category, find the most recent dated entry under the matching `## <prompt>` heading.

## Computing overdueness

For each (stakeholder, question) pair:

- `cadence_days` = lookup of `suggested_freq`: weekly=7, biweekly=14, monthly=30, quarterly=90, biyearly=180.
- `last_entry_date` = most recent `### YYYY-MM-DD` under that question's heading. If never answered, treat as never.
- `days_since_last` = today − last_entry_date (or ∞ if never).
- `due_ratio` = days_since_last / cadence_days. (≥1.0 means due; ≥1.5 means notably overdue; ≥2.0 means very overdue.)

Honor `cadence_overrides` in the stakeholder file's frontmatter if present (per-question or per-stakeholder cadence).

## Prioritizing

Sort by `due_ratio` descending. Then apply two adjustments:

1. **Cap items per stakeholder.** Show at most 3 questions per stakeholder in the output — otherwise a single neglected stakeholder dominates and the user disengages.
2. **Cap total items.** Default 10. The user can ask for more, but starting with 10 keeps the list actionable.
3. **Surface "never answered" items distinctly.** These are not "overdue" in the usual sense — they're new commitments. Group them in a separate section so the user can decide if they want to take on a new question or stick to refreshing existing ones.

## Output format

```
Stakeholder reflections due (as of <today>)

🟥 Very overdue (≥2× cadence)
  • [John Adams · managing-up] What are their priorities, incentives and constraints?
    last logged 2026-02-15 · biweekly cadence · 11 weeks since
  • ...

🟧 Overdue (≥1.5× cadence)
  • [Jill Smith · managing-across] What's not going well?
    last logged 2026-04-08 · biweekly cadence · 23 days since
  • ...

🟨 Due (≥1× cadence)
  • ...

🆕 Never answered
  • [Client Delivery ABC · teams] Are goals clearly defined?
    quarterly cadence · never logged
  • ...

To pick one: "let me reflect on [stakeholder]" or run `stakeholder-reflect`.
```

Use the colored markers consistently. They make the output skim-able at a glance.

## When nothing is due

Say so plainly. Don't manufacture work.

> *"Nothing significant is overdue right now. Earliest item due is John's 'priorities, incentives and constraints' in 4 days. If you want to get ahead, that's the one."*

## Wiring to `/schedule`

When the user wants this to fire automatically, suggest:

> *To get a Monday-morning summary every week, run this once:*
> ```
> /schedule "Every Monday at 9am, run /stakeholder-due and post the list"
> ```

Don't run `/schedule` automatically — the user owns the cadence decision.

## Operating principles

- **The list is a menu, not an obligation.** Frame the output as "here's what you could pick up." Pressuring the user to clear all due items is how the practice dies.
- **Surface stakeholders the user has been avoiding.** If a stakeholder has had zero entries in 4+ weeks despite multiple due items, call that out gently in the output. Avoidance is itself signal.
- **Don't over-engineer the math.** Simple `days_since / cadence_days` is enough. Resist the temptation to add weights, recency bonuses, or "importance scores" — those make the output feel less like a real assessment.
- **Respect the user's "skip" or "not now" instinct.** If they consistently skip the same question for the same stakeholder, that's worth surfacing as an open question, not silently re-listing.

## Anti-patterns to flag

- **Outputting the same flat list every time.** If the user runs this daily, the list barely moves day-to-day. Suggest a less frequent cadence (weekly is the sweet spot).
- **Treating teams the same as individuals.** Teams often deserve a longer cadence (the situation moves slower). If `cadence_overrides` aren't set on a team, gently suggest setting one.
- **Listing 30 items.** A long list is a list nobody reads. Default to 10.
- **Sorting purely by date.** A weekly-cadence question 8 days late should rank above a quarterly-cadence question 30 days late. Always sort by `due_ratio`, not raw days.
