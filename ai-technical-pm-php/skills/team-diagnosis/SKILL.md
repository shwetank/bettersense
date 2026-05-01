---
name: team-diagnosis
description: Use when the user wants a structured read on the *health* of their team — beyond individual morale to delivery cadence, attrition risk, dependency tax, on-call burden, peer relationships, and cross-cutting patterns. Trigger phrases include "how is my team doing", "I want a team health check", "diagnose my team", "before my skip-level update, what should I flag", "is something off with the team that I'm missing". Reads the user's stakeholder-reflect entries on direct reports + team file + any inputs the user provides (recent retros, attrition events, eng survey scores), and produces a multi-dimensional diagnosis with patterns, risks, and concrete actions.
---

# Team Diagnosis

Individual reflection (via `stakeholder-reflect`) catches per-person signals. **Team health** is different — it shows up in patterns across people, in second-order signals (who's gone quiet, who's covering for whom), and in interactions between the team and its surroundings.

This skill produces a structured health check across the dimensions that usually go unexamined until something breaks.

## When to use

- **Quarterly cadence**, ideally before a skip-level update or planning round.
- **After a triggering event** — a surprise resignation, a missed delivery, an exec asking "is your team okay?", a retro that surfaced more than usual.
- **Before a hard decision** — reorg, headcount cut, role change — that needs a calibrated read on what the team can absorb.
- **When the user has a vague unease** but can't articulate why.

Don't trigger for: routine status updates, sprint-level operational reviews, individual performance concerns (use `performance-management` or `stakeholder-reflect` instead).

## Inputs to gather first

1. **The user's stakeholder-reflect files** for each direct report (`~/voohy-work-reflections/managing-down/<slug>.md`).
2. **The team file** if one exists (`~/voohy-work-reflections/teams/<slug>.md`).
3. **Recent retros** if the user has them or can summarize.
4. **Eng survey scores** or equivalent (manager satisfaction, psychological safety, etc.) if available.
5. **Recent attrition events** in the last 6–12 months.
6. **Delivery track record** — last 2–3 quarters, did they hit / miss / cancel commitments?

If the user has none of these except their own gut sense, the diagnosis will be qualitative — say so, and probe with the user's own observations.

## The eight dimensions

Walk through each, scoring **green / yellow / red** with evidence:

### 1. Delivery cadence
Are commitments being hit on the timelines committed? Or is "we'll get to it next sprint" the recurring chorus? Look for:
- Hit rate on quarterly goals (last 2–3 quarters)
- Drift between plan and actual (do projects routinely take 1.5x estimate?)
- Cancellations / re-prioritizations (signal of upstream chaos or unclear strategy)

### 2. Attrition risk
Who's flight risk, and why? Look for:
- Reports who've gone quiet in 1:1s
- Reports who've started talking about "growth" or "what's next" pointedly
- Reports who got passed over and haven't recalibrated
- Reports whose comp is materially below market
- Patterns of who's leaving competitor companies / accepting recruiter calls
- Surprise resignations in the last 12 months (each one is a signal you missed)

A team with 15%+ unwanted attrition over a year has a problem; you want to find the leading indicators before the next person quits.

### 3. Dependency tax
How much of the team's time is paying tax to other teams' dependencies, processes, or chaos? Look for:
- Standing meetings that exist because something else is broken
- Recurring "blocked on X team" patterns
- People privately complaining about specific cross-team friction

### 4. On-call burden
Who's bearing the weight, is it sustainable, is the team reducing pager load over time? Look for:
- Pages per week per oncall (trending up or down?)
- Concentration: is one person the de facto SME on too many systems?
- Toil ratio: how much oncall is "real incidents" vs. "papercut alerts that should be auto-resolved"

### 5. Peer relationships and cross-functional health
How does the team work *with* other teams? Look for:
- Are PMs frustrated with eng, or vice versa?
- Are there design or research partnerships that are underleveraged?
- Is there a peer team that resents this team for some reason (taking credit, pushing risk, etc.)?

### 6. Information flow
Does the right information reach the right people, on time? Look for:
- Surprises in skip-level meetings (information should have flowed up earlier)
- Decisions made without the people who needed to be in the room
- Repeated "I didn't know X was happening" moments

### 7. Technical health
Where is the codebase / infrastructure / ops health degrading? Look for:
- Test coverage trends
- Tech debt that gets discussed but not addressed
- Velocity slowing not because of people but because of system friction
- Specific systems people dread touching

### 8. Culture and norms
The hardest to measure but the highest-leverage. Look for:
- Are juniors getting their say? Or being talked over? (Compose with `stakeholder-reflect` team questions.)
- Is psychological safety present? (Are people raising risks, or burying them until they explode?)
- Is feedback flowing? (Do peers give peers honest signal, or is feedback only top-down?)
- Is the team curious and learning, or in execution-only mode?
- Is there gallows humor in retros that points at unsaid problems?

## Output format

Produce a team health one-pager:

```
# Team Diagnosis: [team] — [date]

## Top-line read
One paragraph: the most important thing the user should walk away knowing.
What's quietly fine, what's quietly degrading, what's flat-out broken.

## Dimensions (G/Y/R, with evidence)
| Dimension | Status | Evidence |
|-----------|--------|----------|
| Delivery cadence | 🟨 | [cite specific entries / events] |
| Attrition risk | 🟥 | [cite] |
| Dependency tax | 🟩 | [cite] |
| On-call burden | 🟨 | [cite] |
| Peer relationships | 🟩 | [cite] |
| Information flow | 🟨 | [cite] |
| Technical health | 🟥 | [cite] |
| Culture and norms | 🟩 | [cite] |

## Patterns
[Cross-cutting signals across people / dimensions. Often where the real diagnosis lives.]
- **[Pattern]** — what you're seeing across multiple dimensions / people. (Sources: ...)

## Top-3 risks worth acting on
[Specific, with the action and the owner.]

## What's working that you should protect
[Don't only diagnose problems. Name what's load-bearing and could be lost in a reorg or change.]

## Open questions
[Where the data is too thin to call. Often the most important section — surfaces what to investigate before next quarter's diagnosis.]
```

## Forcing functions

### Cite, don't claim
Same discipline as `stakeholder-synthesize`. Every claim cites specific entries or events. *"Three people independently mentioned X is hard to work with this quarter (cited: 2026-03-12 entry on Priya, 2026-04-02 on Sam, 2026-04-18 on Nina)."*

### Patterns over people
The most useful insights aren't "Priya is unhappy" — they're "three of my reports independently described the same external blocker." Diagnose at the *team* layer, not just sum up individuals.

### Surface what you're avoiding
Most managers have a quiet sense of where the problem is and avoid looking at it directly. The skill should ask: *"What dimension are you most reluctant to look at right now? Why?"* Often the avoidance is the diagnosis.

### Name protective work
Diagnose-and-improve culture optimizes for finding problems and underweights *protecting what works*. A team's strong code review culture, or a specific senior's mentorship pattern, or a peer relationship that's load-bearing — those need naming so they don't get reorged away accidentally.

### Honest about confidence
Rate each dimension's confidence: are you reading from real signal or guessing? Low-confidence reds and greens should both be marked — they're prep targets for the next month of observation.

## Operating principles

- **Diagnosis without action is theater.** The output's value is what gets done after — the top-3 risks worth acting on with owners and dates.
- **The user is in the team's culture, not outside it.** A diagnosis should ask whether the user is part of the pattern being diagnosed. (Are they the bottleneck on information flow? Are they the source of pressure that's eroding psychological safety?)
- **Patterns reveal blind spots.** If a pattern keeps showing up across reflections but never shows up in retros, the team has a topic they're not safe raising. That's signal.
- **A green dimension isn't "no work needed."** Sometimes it's "we got lucky this quarter." Distinguish robust health from temporary calm.
- **Don't over-diagnose.** A team showing 3 yellows and 5 greens is doing well. Resist the urge to find a problem in everything.

## Anti-patterns to flag

- **Diagnosis as venting.** If the output reads as "my team is failing in X ways," step back — that's frustration, not diagnosis. Real diagnosis is calibrated.
- **Aggregating individual problems into team problems prematurely.** One unhappy report is not a team morale issue.
- **Conflating people problems with system problems.** If three people leave because their manager is failing them, that's a system problem (the manager) not "attrition risk." The fix is different.
- **Skipping "what's working."** A diagnosis with no greens is wrong; some things are working, even on troubled teams.
- **Action items without owners or dates.** "We should improve information flow" is not an action item.
- **Treating eng survey scores as ground truth.** They're one data point. A team can score green on the survey and be quietly burning out, and vice versa.

## Composition with other skills

- **`stakeholder-reflect` (managing-down + teams)** — primary source. The longitudinal entries on individuals and the team file are what the diagnosis is built on.
- **`stakeholder-synthesize`** — for the per-individual lens before zooming out to team patterns. They compose: synthesize first, then diagnose.
- **`leadership-os` (Heat Shield, Diplomat, Triage Lead modes)** — for the conversations that follow the diagnosis. The diagnosis is the artifact; leadership-os is the action.
- **`performance-management`** — when the diagnosis surfaces an individual underperformance issue, switch tools.
- **`one-on-one-prep`** — top-3 risks identified should land in specific 1:1 conversations.
- **`decision-log`** — log significant decisions arising from the diagnosis (e.g. "decided not to pursue X reorg because of Y dimension's fragility").
- **`the-research-synthesizer`** — useful as a parallel discipline for processing the team's qualitative data (retros, surveys) the way a research synthesizer would.
