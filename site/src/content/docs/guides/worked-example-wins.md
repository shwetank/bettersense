---
title: Wins curation — worked example
description: From first log entry through a promo-packet curate — what the wins system looks like in practice.
---

## The scenario

It's mid-Q3. You're an AI PM. You've been logging wins since the start of Q2 using `wins-log`, nudged by the Friday `wins-due` schedule. Promo cycle is in 8 weeks. You've never had a clean promo packet before — usually it's a frantic two-hour scramble the night before the deadline.

---

## What's in the log (8 wins over 14 weeks)

A mix of types:

```
2026-04-12 — Killed the LLM reranker proposal before engineering started
  Type: judgment · Scope: quarter
  Impact: avoided ~6 eng-weeks of work on a problem that was data quality, not intelligence

2026-04-28 — Onboarding completion +14pp in 6 weeks
  Type: delivery · Scope: quarter
  Solo vs. shared: led the experiment design; EM and 2 devs did execution

2026-05-09 — Coached Yulia through her first stakeholder presentation
  Type: mentorship · Scope: sprint
  Impact: she ran it solo, exec sponsor called it "unusually clear for an intern"

2026-05-23 — Recovered launch after CS reported wrong output
  Type: recovery · Scope: sprint
  Impact: 48-hour incident-to-resolution; no churn; built eval harness that caught 3 more cases

... 4 more entries
```

---

## Step 1: Curate for the promo packet

```
I have a promo cycle in 8 weeks. Help me build a promo packet.
```

`wins-curate` in `promo-packet` mode:

1. Reads the full log
2. Maps wins to the dimensions a panel cares about (scope, impact, judgment, leadership, growth)
3. Surfaces gaps before you're surprised by them

**What it produces:**

**Strengths from the log:**
- *Judgment (strong):* The LLM reranker kill is the clearest judgment entry. Scope is quarter-level. Impact is quantified. Solo credit is honest. Panel-ready.
- *Delivery (strong):* The onboarding +14pp. Well-framed solo/shared credit. Could use a stronger baseline (what was completion rate before?).
- *Recovery (solid):* The 48-hour incident recovery. Needs the scale added — how many customers affected? What was the revenue risk?
- *Mentorship (light):* One entry. A panel can accept one; more would be better if you have more. The Yulia entry is specific and outcome-cited, which helps.

**Gaps:**
- *Leadership:* No entries. For the PM→Senior PM bar, leadership (influencing without authority, driving cross-team alignment) is often a gap. Do you have examples not in the log? If so, they should be added before submission.
- *Range:* No entries. If you've done work outside your core PM scope (a strategy doc, a technical design review, a hiring loop), log it now — that's range.

**Pre-empted objections:**
- *"The onboarding metric could be seasonal."* The log entry doesn't address this. Add context: was Q2 a similar period last year? What controlled for seasonality?
- *"The LLM kill is judgment — what did you *build*?"* Useful to have a delivery win from this same period that's clearly yours.

---

## Step 2: Log the gaps before submission

Armed with the gap analysis, you run `wins-log` twice more:

```
I helped drive the architecture decision for the contract-summarization eval harness
→ wins-log: Type: judgment + craft. You push back on "helped drive" — what specifically did you do?
```

The skill pushes until you articulate: "I proposed the golden-dataset structure, ran the first labeling session, and got engineering to agree to a 200-case minimum before ship." That goes in the entry — specific, evidenced.

```
I ran the loop design for the intern hire last month
→ wins-log: Type: leadership + range. Scope: sprint. You write the signal map and the hiring rubric contribution.
```

Two new entries. Leadership gap partially filled. Range gap filled.

---

## Step 3: Curate again with the fuller log

```
Run the promo packet again with the new entries.
```

Updated assessment: leadership is now "light but present," range is covered, delivery and judgment are strong. The skill produces a citation-backed packet ready for the panel, with specific win references per section and the calibration notes already written in.

---

## What made this work

- **Logging in-week.** The incident recovery entry had the 48-hour timeline, the customer impact estimate, and the Slack thread as evidence — because it was logged that week. A retroactive entry wouldn't have that.
- **The Friday nudge.** The mentorship entry came from `wins-due` probing "any mentorship this week?" on a Friday when you would have said nothing notable. Yulia's presentation had been that Thursday.
- **The gap analysis.** Knowing eight weeks out that leadership was thin gave you time to log existing work and identify the intern hiring contribution you'd forgotten about.
- **Calibration.** The onboarding metric entry was honestly framed as shared credit from the start. The panel question ("was this seasonal?") was surfaced before the panel saw it — not after.
