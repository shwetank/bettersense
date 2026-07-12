---
name: career-retro
description: Use for a periodic (quarterly / annual) career retrospective across the ENTIRE bettersense memory — producing a longitudinal self-assessment with cited growth deltas since the last retro and the honest gaps to work on next. Trigger phrases include "run my career retro", "where am I in my career", "annual self-assessment", "how have I grown this year", "it's review season, take stock of everything". Reads wins, all stakeholder reflections, self-reflections, pulses, and charters; writes a dated retro to self/retros/ so the next one can measure change. Distinct from wins-curate (which builds one audience-facing artifact like a promo packet) and self-reflect (a single in-the-moment entry). The meta-synthesis whose output compounds over years.
---

# Career Retro

This is the payoff moment for a year of logging. Every other skill in the reflection system deposits into the memory — stakeholder reflections, wins, self-reflections, pulses. This skill withdraws the accumulated interest: it reads all of it at once and answers the question no single entry can: *who have I become, and is it who I meant to become?*

Its most important property is that **it writes its own output and reads the previous one.** The first retro is a snapshot. The second is a story — because it can say what changed. The value grows with every cycle, which is exactly the moat plain Claude can't replicate.

## Distinguish the ask first

- *"I need to hand in my self-eval / build my promo packet"* → that's an **audience-facing artifact**; hand off to `wins-curate` (perf-review / promo-packet mode) or `report-promo-case`. This skill can feed them, but it is not the submission document.
- *"Let me reflect on how I handled last week"* → a single entry; that's `self-reflect`.
- *"Where am I in my career, honestly, across everything"* → **this skill.**

If the user wants both, run the retro first (it produces the honest internal picture), then offer to spin the relevant slice into the external artifact.

## Loading — read broadly, cite specifically

Set the period first (default: since the last retro, or 12 months if none). Then read everything under `$BETTERSENSE_WORK_REFLECTIONS_HOME` (default `~/bettersense-work-reflections/`) that falls in the window:

1. **The previous retro** — `self/retros/retro-*.md`, most recent. This is the baseline for every delta. If none exists, say so: this first retro sets the baseline for all future ones.
2. **`profile.md`** — the stated role, level, and strategic focus. The retro's sharpest question is often the gap between stated focus and where the evidence shows the time actually went.
3. **`wins.md`** — the impact record, already dated and structured.
4. **`self/reflections.md`** — the user's own read on themselves over the period; trajectory of mood, energy, fulfillment.
5. **All stakeholder files** (`<category>/*.md` via `stakeholders.json`) — how the user's relationships and management evolved. Growth as a leader lives here more than in wins.
6. **`pulses/`** and **`team-charters/`** — product and team arcs the user drove.
7. **ADRs / decision logs** — `decision-log` stores these in the code repo, not here; ask the user to point at `docs/decisions/` if they want decisions folded in. Don't fabricate their absence into a weakness.

**Citation discipline (inherited from the synthesize skills):** every claim about growth or a gap cites specific dated entries. "You got better at hard conversations" is worthless; *"in March you logged avoiding the feedback conversation with Alex for three weeks; by September you logged delivering same-week feedback to two reports (wins 2026-09-04, 2026-09-19)"* is the product. Never assert a trajectory you can't cite.

## The retro structure

Write it to `self/retros/retro-YYYY-MM-DD.md`. Structure:

```markdown
# Career Retro — [period, e.g. 2026 H1] — generated YYYY-MM-DD
baseline: [previous retro date, or "first retro"]

## The one-line arc
[If you had to describe this period's growth in a sentence, cited. The thing you'd want a sponsor to know.]

## Deltas since last retro
[The heart of the document. For each dimension, what CHANGED, with citations on both ends.]
| Dimension | Then | Now | Evidence |
|---|---|---|---|
| Scope / impact | ... | ... | wins 2026-... |
| Leadership / people | ... | ... | stakeholder entries ... |
| Technical / craft | ... | ... | ... |
| Judgment | ... | ... | ... |
| Visibility / influence | ... | ... | ... |
[First retro: replace "Then" with the baseline you're establishing now.]

## Evidence highlights
[3–6 strongest cited moments of the period — the ones that would anchor a promo case.]

## Gaps and honest weak spots
[Cited. Where the evidence is thin, where a pattern repeats, where stated focus and actual work diverged.
This is the section that earns the user's trust — no retro is all growth.]

## Trajectory read
[Is the arc pointing where the profile says it should? Toward the next level, or plateauing? Name it.]

## Focus for next period
[2–4 concrete, evidence-driven priorities. These become next retro's things-to-measure-against.]
```

## Operating principles

- **Longitudinal, not point-in-time.** The question is always "compared to when," and the answer must be cited on both sides. A retro that reads like a single self-reflection has failed.
- **Honest gaps are the credibility.** A retro that's all upward-and-to-the-right reads as marketing. Surface the plateau, the repeated pattern, the divergence between what the profile claims and what the log shows.
- **Never invent evidence.** Same rule as `stakeholder-synthesize` and `pulse-synthesize` — if the memory is thin in an area, say the memory is thin (and note it as a logging gap to close before the next retro), don't manufacture a narrative.
- **Persist, always.** Writing the dated file is not optional bookkeeping — it *is* the feature. The delta only exists because last time's file exists.

## Composition

- Reads the output of: `wins-log`, `stakeholder-reflect`, `self-reflect`, `product-pulse`, `team-charter`
- Feeds into: `wins-curate` (turn the retro's evidence highlights into a promo packet / self-eval), `report-promo-case` (if the user manages people, the same lens on a report)
- Pairs with: `weekly` (the weekly ritual keeps the memory fed; the retro is what that feeding was for)
- If a gap surfaces that's really a direction question, hand to `the-career-coach`
