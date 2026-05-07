---
name: strategy-doc
description: Use to create or update a product/area strategy document — target problem, approach, personas, key metrics (3-5 SMART), 2-4 multi-month strategic tracks, and an explicit "not working on" section. Trigger phrases include "draft a strategy doc for [product/area]", "I need a strategy.md for the platform team", "interview me about my strategy", "update my strategy doc", "what's in my strategy doc". Lives at `~/bettersense-work-reflections/strategy/<area-slug>.md` and is read as an anchor by `the-spec-writer`, `prioritization-frameworks`, `metrics-design`, `product-pulse`, and `pulse-synthesize`. Inspired by Every.to's `/ce:strategy` pattern but composes more deeply with the rest of the bundle and supports multiple products/areas.
---

# Strategy Doc

A product or area strategy is the load-bearing context for everything downstream — what specs get written, what gets prioritized, what counter-metrics matter, what the pulse should be watching. Most teams write a strategy doc once, then forget it exists. The skills in this bundle work better when there's a real one to anchor to.

This skill creates or updates the doc. It also makes the doc *useful* by ensuring other skills read it.

## Where it lives

`~/bettersense-work-reflections/strategy/<area-slug>.md` (configurable via `$BETTERSENSE_WORK_REFLECTIONS_HOME`).

For users running one product, `~/bettersense-work-reflections/strategy/default.md` is fine. For users running multiple lines (a PM with two product areas, a TPM coordinating across three programs, an EM whose team owns multiple services), one file per area. The directory structure mirrors the stakeholder bundle's per-category folders.

If `~/bettersense-work-reflections/` itself doesn't exist, hand off to `stakeholder-register` first — it owns the root setup and privacy warning.

## When to apply

Trigger this skill when:
- The user is starting a new project, role, or area and needs a strategic anchor.
- A quarterly planning round is coming and the existing strategy needs a refresh.
- The user notices other skills producing generic output ("the spec writer keeps assuming we're optimizing for engagement; we're actually optimizing for retention") — usually means the strategy isn't there or is stale.
- The user wants to see or review what's currently in their strategy.
- After a meaningful pivot (new market, new platform, new constraint), the strategy needs an update.

Skip when:
- The user just wants to write one spec or pick one prioritization. Strategy is the *anchor*, not the deliverable.
- The user can't yet articulate any of the structure (problem, approach, personas) — that's a coaching conversation first, then this skill.

## File format

Single markdown file with frontmatter + structured sections.

```markdown
---
area: [product or area name]
slug: [area-slug]
owner: [user's name or role]
last_updated: 2026-05-04
revisit_by: 2026-08-01
---

# [Area name] — Strategy

## Target problem
[2-3 sentences. Who hurts, what they're trying to do, what blocks them today,
and why now. State the *user/business* problem, not the *solution* you've
already decided on.]

## Approach
[2-3 sentences. How you're going to solve it, in plain terms. Not the spec —
the strategic shape of the answer. "Build a faster lane for X by reducing Y"
not "use Kafka for streaming."]

## Personas
[Who you're optimizing for, in priority order. 1-3 max. Be specific:
"Senior eng on a platform team in a 100-500 eng org" beats "engineers."]

## Key metrics (SMART)
[3-5. Each one specific, measurable, and time-bound.]
- [Metric 1: current baseline, target, by when]
- [Metric 2: ...]
- ...

## Strategic tracks (next 2 quarters)
[2-4 multi-month initiatives. Each track is a *theme*, not a feature. Specs
will live under tracks; tracks won't live under specs.]

### Track 1: [name]
**Why:** [1 sentence on why this track matters.]
**Bet:** [What you're claiming will be true if this track succeeds.]
**Inside scope:** [What this track covers.]
**Out of scope:** [What this track explicitly doesn't.]

### Track 2: ...

## Not working on (deliberate non-commitments)
[Things people will ask about that you've decided not to do this period —
with the reason. This section is as load-bearing as the tracks; it heads off
distraction.]
- [Thing X] — because [reason]
- ...

## Counter-metrics (what would tell us we're going wrong)
[Composes with `metrics-design`. What would make us doubt the strategy?
A signal that engagement is up but trust is down. A signal that customer N
is succeeding while customer N+1 isn't. Spell these out.]
- [Counter-metric 1]
- ...

## Open questions
[Things the strategy doesn't yet answer, with who could resolve them.]
- [Question]: [who/what would help]
- ...

## Cross-references
- Profile: `~/bettersense-work-reflections/profile.md`
- Pulses: `~/bettersense-work-reflections/pulses/<area-slug>/`
- Stakeholders connected to this area: [optional list with slug references]
```

## Slug confirmation and collision detection

Before writing anything, always tell the user what file you're about to create or update. This prevents silent overwrites and ambiguity between areas with similar names.

The flow:
1. Infer the slug from what the user said (e.g. "the onboarding flow" → `onboarding`, "enterprise onboarding" → `onboarding-enterprise`).
2. Check whether `strategy/<slug>.md` already exists.
   - **Exists:** Surface the file briefly — area name, `last_updated`, one-line summary of the target problem. Then ask: *"There's already a strategy doc for [area] (last updated [date]). Do you want to refresh it, update a specific section, or is this a genuinely different area I should create a new file for?"* Wait for the answer before proceeding.
   - **Doesn't exist:** Confirm the slug before starting the interview: *"I'll create `strategy/onboarding.md` — sound right?"* One quick confirm prevents a month of pulses building up in the wrong folder.

This matters because slugs propagate: `product-pulse` saves to `pulses/<slug>/`, `pulse-synthesize` reads from there, and getting the slug wrong on day one silently forks your product memory.

## The interview flow (for a new strategy)

When invoked for first-run creation, walk through these in order. Push for specificity at each step — vague strategy is worse than no strategy.

1. **Area name and slug** — confirm the slug (as above) before continuing.
2. **Target problem** — *"In one paragraph: who's hurting, what they're trying to do, what's blocking them, and why now?"* Push back on solution-first framing.
3. **Approach** — *"Strategic shape of the answer, not the spec. What's the bet?"*
4. **Personas** — *"Who specifically are you optimizing for? In priority order. 1-3 max."* Force specificity.
5. **Key metrics** — *"3-5 SMART metrics. What number, what baseline, what target, by when?"* Don't accept vanity metrics; compose with `metrics-design` if the user is unsure. For each metric, also ask: *"What is the nearest business goal this connects to, and can you state the link in one step?"* If they can't — e.g. if the chain requires two or three intermediate goals before it reaches something real — the metric isn't anchored yet.
6. **Strategic tracks** — *"What are the 2-4 multi-month bets you're making? Not features — themes."*
7. **Not working on** — *"What will people ask you about that you've decided not to do? Include the reason."* This section is the user's spine.
8. **Counter-metrics** — *"What would make you doubt the strategy is working, even if the headline metrics look good?"* Composes with `metrics-design`'s counter-metric discipline.
9. **Open questions** — *"What does this strategy not yet answer, and who could help resolve it?"*

After capture, write the file. Confirm with the user before writing — show them the rendered strategy and ask if anything is off.

## The update flow (for an existing strategy)

When invoked for an existing file, three sub-modes:

- **Show** — dump the current strategy. Useful before planning rounds or hard conversations.
- **Edit a specific section** — let the user say *"update my tracks for next quarter"* and edit just that section. Append a one-line audit note at the bottom.
- **Refresh entirely** — re-run the interview pre-populated from the existing file; user confirms / edits each step. Update `last_updated` and `revisit_by`.

If `revisit_by` has passed, surface that on any invocation: *"Your strategy was last refreshed 2026-02-14, with revisit-by 2026-05-01. Worth a refresh now?"*

## How other skills should use this

The convention (also documented in the README):

> **If `~/bettersense-work-reflections/strategy/<area-slug>.md` exists, read it before doing your work.** Use the target problem, approach, personas, metrics, and tracks to anchor your output. If multiple strategy files exist, ask the user which area applies (or default to the one matching their current focus).

Skills currently designed to read strategy when present:
- **`the-spec-writer`** — specs anchor to a strategic track, not free-floating
- **`prioritization-frameworks`** — backlog ranks against strategic tracks; "not working on" section heads off out-of-scope items
- **`metrics-design`** — north star comes from strategy's key metrics; counter-metrics compose
- **`product-pulse`** — what to watch each cycle is determined by strategy + counter-metrics
- **`pulse-synthesize`** — interpreting signals against strategy's tracks (is this signal hitting Track 2 or unrelated?)

When in doubt about whether to use it: yes, and tailor the output to the strategic frame.

If no strategy doc exists, the skills work without it — the outputs will just be more generic and harder to defend in a planning conversation. Don't pester the user to set it up unless they raise the question.

## Operating principles

- **The doc is the anchor; it's not the work.** A great strategy doc that nobody references doesn't matter. The point of this skill is to make a doc *other skills will read*.
- **Specificity over comprehensiveness.** A 1-page strategy with sharp specifics beats a 5-page strategy hedging everything. If you can't make the metrics SMART, the metrics aren't ready.
- **The "not working on" section is the spine.** Most strategies fail at execution because *nobody decided what not to do.* Push hardest on this section.
- **Counter-metrics are first-class.** Composes with `metrics-design`'s opinionation. A strategy without counter-metrics will optimize itself into a worse product (the Goodhart trap).
- **Multiple areas, separate files.** Don't combine. A PM with two product lines should have two strategy files. The composition with downstream skills works better when each is bounded.
- **Refresh on real triggers, not schedule.** Quarterly planning, post-mortem of a missed bet, market shift, reorg, leadership change. Not "it's been 90 days, time to refresh." Refresh when the strategy stops matching reality.
- **Honest about confidence.** If the user is genuinely uncertain about the personas or the approach, write *"Hypothesis (low confidence) — to test by [date]"* rather than asserting. The doc should reflect what's known vs. what's still being figured out.

## Anti-patterns to flag

- **Solution-first strategy.** *"We're going to build X."* That's a roadmap, not a strategy. The strategy is the problem and the bet, not the deliverables.
- **5+ tracks.** A strategy with 5+ tracks isn't focused; it's a wishlist. Force consolidation.
- **No "not working on" section.** Means the user hasn't actually decided what to drop. Surface this before letting the doc be written.
- **Vague metrics.** *"Improve engagement"* is not a metric. *"Weekly active engineers ≥ 1200 by Q3 end"* is. Push.
- **Metrics disconnected from any business goal.** A metric that doesn't trace back to something the business actually cares about — in one step — is floating. Ask what real goal it connects to and how. If the answer takes more than one sentence, the connection is too tenuous.
- **Personas that are everyone.** *"Optimizing for all engineers"* is the same as optimizing for none. Force ranked specificity.
- **Marketing-tone language.** *"Empower transformative…"* is signaling. The strategy is for internal use; write it like you'd talk to a senior peer who'd push back on hand-waving.
- **Updating the strategy doc to reflect what you've shipped.** Reverse causality. The strategy declares intent; the strategy doesn't get retconned to match execution. If execution diverges, that's the conversation.

## Composition with other skills

- **`user-profile`** — profile is *who you are*; strategy is *what you're building*. Together they let other skills produce contextual output.
- **`the-spec-writer`** — every spec lives under a strategic track. The spec writer should ask which track if not stated; refuse to write specs that don't anchor.
- **`prioritization-frameworks`** — backlog items are scored against tracks. Items that don't fit any track are candidates for the "not working on" list.
- **`metrics-design`** — the strategy's key metrics are the north stars; this skill expands them into the full metric tree with leading/lagging/counter-metrics.
- **`product-pulse`** — pulse reports are scoped per area, anchored to the strategy. Each pulse evaluates progress against tracks.
- **`pulse-synthesize`** — synthesis interprets signals through the strategic lens. A pulse anomaly on Track 2 means something different from one on a non-strategic dimension.
- **`patterns-watch`** — composes naturally; when the user's logged work over time diverges from the strategy's tracks, that's a pattern worth surfacing.
- **`decision-log`** — strategic decisions (track scope changes, persona reordering, metric pivots) belong as ADRs.
