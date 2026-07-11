---
name: patterns-watch
description: Use to surface unsolicited patterns the user hasn't explicitly asked about — across stakeholder reflections, wins log, self-reflect entries, and (eventually) pulse reports. Trigger phrases include "what patterns am I missing", "anything notable across my files", "scan my reflections for things I should know", "weekly cross-cutting check". Designed to be invoked on demand or fired on a weekly Desktop scheduled task (not cloud routines — those cannot access local files). Distinct from `stakeholder-synthesize` (user-driven, scoped to one person/category) — this is unsolicited, cross-cutting, and surfaces what the user hasn't thought to look at. Citation-disciplined: every pattern claim cites specific dated entries.
---

# Patterns Watch

Most signals the user needs are already in their files. They just haven't gone looking. This skill scans the whole reflection ecosystem on a cadence and surfaces patterns the user hasn't asked about — gaps in attention, trends across people, contradictions between stated focus and actual logged work.

Inspired by the "agent that watches your data" pattern from systems like Hermes, but with two key differences: every pattern claim **cites the specific entries** that support it, and the skill **refuses to predict** ("you'll skip Friday too") — it observes and asks ("here's what I noticed; what do you want to do about it?").

## When to apply

Trigger on:
- The user explicitly asks for a cross-cutting scan.
- Wired to `/schedule` for weekly Sunday-evening surfacing — designed for this case.
- Before a quarter close, year-end review, or reorg planning, when patterns across the year matter more than the daily snapshot.

Skip when:
- The user wants a focused synthesis of one stakeholder or one topic — use `stakeholder-synthesize` instead.
- The user has been logging actively for less than 4 weeks. Patterns need volume to be honest.

## What it scans

The full reflection ecosystem at `~/bettersense-work-reflections/` (or `$BETTERSENSE_WORK_REFLECTIONS_HOME`):

- `profile.md` (if present) — for the user's stated current strategic focus, growth area, communication style
- `managing-up/<*>.md` — all active stakeholder files in this category
- `managing-across/<*>.md`
- `managing-down/<*>.md`
- `teams/<*>.md`
- `self/reflections.md`
- `wins.md`
- `pulses/` — if the user has set up product pulse (future)

Reads entries from the last **12 weeks** by default (configurable when invoked). Older patterns are usually too stale to be actionable.

## What it looks for

Five lenses, applied across the corpus:

### 1. Attention gaps
- Stakeholders with zero entries in 4+ weeks despite due items
- Categories of question (especially `compensation`, `feedback`, `morale`) consistently skipped across multiple stakeholders
- Self-reflection topics the user hasn't touched in 6+ weeks
- Wins-log gaps that don't match the user's actual delivery (entries on `judgment` and `mentorship` types may be undercounted relative to the work the user is actually doing)

### 2. Cross-stakeholder patterns
- The same theme surfacing in multiple stakeholders' files independently (*"three reports independently mentioned X is hard to work with this quarter — sources: ..."*)
- Consistent feedback the user is receiving from multiple managing-up stakeholders that hasn't yet been internalized
- Team-level signals that show up in individual files before they show up in `team-diagnosis`

### 3. Contradictions
- Stated focus in `profile.md` vs. actual logged work over the period (*"profile says focus is X; 80% of recent wins are on Y"* — usually means either the focus is wrong or the work is drifting)
- Said vs. observed on the same person (`ask` entries say one thing; `sense` entries say another — usually means the person is masking)
- Self-reflection commitments not followed through (*"in 2026-02-04 self-reflect, you wrote you'd delegate the Q2 architecture review; the wins log shows you owned it anyway"*)

### 4. Trajectory shifts
- A stakeholder whose entries trended green for months and recently turned yellow
- A pattern of growing or shrinking entries on a topic (volume itself is signal)
- Self-reflection entries where the same theme keeps recurring (often where the actual personal-growth work needs to focus)

### 5. Avoidance signals
- Topics the user starts but doesn't finish (incomplete entries, deferred conversations marked "to do" that don't get done)
- Stakeholders whose files have many `ask`-category open questions that never get answered
- Hard topics the user circles around (e.g. multiple recent self-reflect entries adjacent to a topic without addressing it directly)

## Output format

Produce a one-page-ish summary, structured for skim-ability:

```
# Patterns this week — 2026-05-03

## Attention gaps
- [Specific gap, with citation: "no entries on John Adams in 5 weeks despite weekly cadence; last entry 2026-03-29"]
- ...

## Cross-stakeholder patterns
- [Pattern with sources: "three reports (Priya, Draymond, Michelle) independently mentioned tooling friction in their last reflection (2026-04-22, 2026-04-25, 2026-04-30). Possible team-level signal worth raising in the next staff meeting."]
- ...

## Contradictions
- [Specific contradiction with sources]

## Trajectory shifts
- [Trend with citations]

## Avoidance signals (gentle)
- [Pattern with citations, framed as observation]

## What you might want to do
- [3 concrete options the user could take, ranked by leverage. Includes "do nothing" if appropriate.]
```

Every pattern under every section must cite specific files and dates. If you can't cite, don't claim.

## Honest discipline (the load-bearing part)

This is the same discipline as `stakeholder-synthesize` — pattern detection across personal data is *easy to do badly*. The risk is producing confident-sounding noise that the user starts acting on.

**Rules:**

1. **Minimum threshold for "pattern".** At least 3 entries over at least 2 weeks. Two adjacent entries is a moment, not a trend.
2. **Cite or strike.** Every claim has a source. No exceptions.
3. **No predictions.** Hermes' "you'll skip Friday too" is a claim the data can't actually make. Ours says: *"you skipped 6 of the last 8 Mondays; Mondays may be a recurring constraint worth examining"* — observation + question, not forecast.
4. **Distinguish `ask` from `sense` entries.** What people *said* and what the user *observed* are different evidence types. A pattern on `ask` entries is "what they're telling me." A pattern on `sense` entries is "what I keep noticing." Mixing them produces false certainty.
5. **Surface the kindest plausible interpretation alongside the user's likely first read.** If three reports' files mention the user being "hard to read," the kindest plausible reading is the one to surface alongside the harshest.
6. **Don't pathologize attention gaps.** A 5-week gap on a stakeholder might be avoidance. It might also be that the stakeholder genuinely needs less attention right now. Surface; don't accuse.
7. **Quantify scope honestly.** *"Across 4 entries over 6 weeks"* is honest; *"consistently"* is loaded.
8. **End with options, not orders.** The output is observation; the action is the user's. Always end with 2-3 things they *could* do, including "do nothing if I'm reading this wrong."

## Wiring to a schedule

Designed for weekly cadence. Guide the user based on what they're using:

**Claude Code Desktop app (recommended):** Go to Routines → New routine → Local. Set the schedule to Weekly, Sunday, and use these instructions: `Run /patterns-watch`. Desktop Routines have full local file access, persist indefinitely, and support any cadence.

**Terminal / CLI users:** Use OS-level scheduling (cron on macOS/Linux, Task Scheduler on Windows). Session-scoped tasks created by asking Claude in the terminal expire after 7 days and are unsuitable for weekly cadences.

**Never suggest cloud routines** — they run on Anthropic's servers and cannot read `~/bettersense-work-reflections/`.

Pair with a Sunday-evening calendar block ("Open Claude Code → review weekly patterns") so the output gets seen.

For users who'd rather pull than push, on-demand works too. Run before a planning week, before a perf cycle, before a 1:1 with a manager who'll ask hard questions.

## Operating principles

- **Observation, not prescription.** This skill is a mirror, not a coach. Action is downstream of observation; don't conflate them.
- **Lower confidence is honest.** *"Possible signal"* / *"may be a pattern worth examining"* is more honest than *"clear pattern."* The user is closer to the data than the skill.
- **Compose with the rest of the bundle.** A cross-stakeholder pattern surfaces and routes naturally to `team-diagnosis` if it's team-level, to `feedback-frameworks` if a conversation is the next move, to `coaching-mode` if the next conversation is coaching, to `decision-log` if it surfaces a decision the user is implicitly making.
- **Don't be the thirteenth thing the user reads on Sunday evening.** Keep the output tight. Six bullets the user actually reads beats sixty they skim.
- **Honest about volume requirements.** With 2 stakeholders and 4 weeks of data, the patterns will be thin. Say so. The skill earns its keep at scale.

## Anti-patterns to flag

- **Predictive language.** *"You'll skip Friday too"* / *"this report will leave."* Refuse. Observe; don't forecast.
- **Pattern-of-one.** A single anomalous entry isn't a pattern. Mark as "weak signal" or skip.
- **Confirmation of the user's prior interpretation.** When the user has a frustration about a stakeholder, the skill is biased toward finding evidence for it. Counterweight with the kindest plausible read.
- **Pathologizing healthy gaps.** A user who didn't reflect on a stakeholder for 4 weeks because that stakeholder was doing fine isn't avoiding — they're calibrating. Don't accuse.
- **Long output the user won't read.** Hard cap on length; if there's nothing significant, say so plainly. *"Nothing significant cross-cutting this week. Strongest signal: [one thing]. Otherwise quiet."*
- **Ranking patterns by drama.** The most actionable pattern usually isn't the most dramatic one. Rank by leverage, not by how alarming the framing sounds.

## Composition with other skills

- **`stakeholder-synthesize`** — when patterns-watch surfaces something on a specific stakeholder, the user can drill in with synthesize for the deep cut.
- **`team-diagnosis`** — when patterns-watch surfaces a team-level signal, route to team-diagnosis for the structured eight-dimension read.
- **`self-reflect`** — when a personal-growth pattern emerges across self entries, surface it.
- **`feedback-frameworks`** — when a cross-stakeholder pattern points at feedback the user has been deferring.
- **`decision-log`** — when patterns-watch surfaces an implicit decision the user is making (e.g., "you've been deprioritizing X for 6 weeks running"), suggest logging it explicitly.
- **`user-profile`** — patterns-watch reads the profile's "current strategic focus" as one input. If the actual logged work diverges from stated focus, surface that contradiction.

## The weekly ritual

This skill is one segment of the `weekly` skill — a single ~15-minute session that runs wins capture, the most-overdue stakeholder reflection, and a patterns scan together. When the user wants the recurring ritual rather than this one piece, route to `/bettersense:weekly`.
