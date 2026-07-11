# Output-quality rubrics

Routing (does the right skill fire?) is only half of quality. The other half is whether the skill, once fired, produces output that actually embodies its opinion. These rubrics are the golden standard for the ten most load-bearing skills — the ones whose *forcing-function* value is the whole reason to install bettersense over plain Claude.

## How to use these

Each rubric is a checklist an **LLM-as-judge** (or a human reviewer) applies to a real transcript of the skill running against a realistic scenario. Score each item pass/fail; an **automatic-fail** item failing means the whole output fails regardless of the rest — these encode the skill's non-negotiable opinion.

A judge prompt looks like: *"Here is the [skill] rubric and a transcript of it running. For each checklist item, answer pass/fail with a one-line citation from the transcript. If any automatic-fail item fails, the overall verdict is FAIL."*

These are deliberately behavioral, not stylistic. We are not scoring prose; we are scoring whether the skill did the thing that makes it worth more than "just ask Claude."

---

## `the-reducer`

The whole point is to *not* helpfully build what was asked. A reducer that writes the memo is a failed reducer.

- **[auto-fail]** Does NOT endorse building the AI feature in its first response; interrogates the problem first.
- **[auto-fail]** Distinguishes whether this is an intelligence problem vs. a data / UI / rules problem.
- Asks who specifically is affected (segment), not "users" in the abstract.
- Asks what the current workaround / baseline is.
- Ends with a recommendation that could be "no AI" or "$0 fix first," not a foregone yes.

## `feedback-frameworks`

- **[auto-fail]** Rewrites any character label ("dismissive," "lazy," "not a team player") into a specific, observable behavior with a time/place.
- **[auto-fail]** Runs the SOLID pressure-test and drops or flags any secondhand / unverifiable incident.
- Produces the feedback in COIN order (Connection → Observation → Impact → Next).
- Impact is concrete to the work/team, not "it's bad for morale."
- If a stakeholder file exists, the Observation cites dated entries rather than "lately."

## `the-incident-responder`

- **[auto-fail]** Treats "we can't reproduce it" as an observability gap to investigate, not a reason to dismiss the report.
- Stabilization / mitigation is separated from root-cause investigation (doesn't conflate the two).
- Classifies the failure mode (hallucination / regression / guardrail bypass / cost-latency).
- Ends by feeding the failure back into the eval set (names the specific cases to add).
- Hands the human/comms side to the appropriate skill rather than doing everything.

## `metrics-design`

- **[auto-fail]** Includes at least one counter-metric that would catch "the model got optimized into a worse product."
- Separates north-star from leading and lagging indicators.
- Each metric is measurable with a named source, not aspirational.
- Distinguishes product-success metrics from model-quality metrics (defers the latter to `the-eval-designer`).

## `weekly`

- **[auto-fail]** Surfaces exactly ONE most-overdue stakeholder by default, not the full due list (overwhelm is the failure mode).
- Runs the segments in order (wins → stakeholder → patterns → pulse) and stays inside its time box.
- Accepts "nothing this week" for wins gracefully; does not manufacture positivity.
- Closes with the 3-line Captured / Noticed / Next summary.
- Any pattern claim cites dated entries; if nothing clears the bar, says so.

## `career-retro`

- **[auto-fail]** Frames growth as *deltas vs. a prior baseline*, not a point-in-time snapshot.
- **[auto-fail]** Every growth and gap claim cites specific dated entries on both ends of the comparison.
- Includes an honest gaps/weak-spots section (not all upward-and-to-the-right).
- Writes the dated retro to `self/retros/` so the next one can measure against it.
- Hands the audience-facing artifact (promo packet / self-eval) to `wins-curate`, doesn't pretend to be it.

## `one-on-one-prep`

- **[auto-fail]** If the person is a registered stakeholder, reads their reflection file before drafting (the agenda arrives pre-loaded, not blank).
- Surfaces open loops from past entries with dates.
- Matches the agenda to the relationship (manager→report vs. report→manager vs. peer vs. skip).
- Puts the report's agenda before the manager's status asks (for manager→report).

## `performance-management`

- **[auto-fail]** Forces the user to name which ladder stage this is, and surfaces when a Stage-3 problem is described in Stage-1 language.
- **[auto-fail]** Enforces write-back of each formal step to the documentation trail (dated, same day).
- Reads the documentation trail to correct recency bias if a stakeholder file exists.
- Keeps humanity and documentation both present at each stage; neither is dropped.

## `premortem`

- **[auto-fail]** Ends in an action plan with a SINGLE named owner and a deadline per top risk — not a brainstorm.
- Uses the three categories (Critical / Perceived / Undiscussed).
- Rates and force-ranks by impact × likelihood; doesn't leave everything at max.
- Explicitly lists accepted (un-mitigated) risks.

## `capture`

- **[auto-fail]** The drafted entry contains only what the conversation contained — no embellishment or upgraded impact claims.
- **[auto-fail]** Files into the correct target format (decision / win / stakeholder / self), indistinguishable from the native skill's structure.
- Shows the draft and gets approval before writing.
- Offers at most one proactive capture per conversation; doesn't nag.
