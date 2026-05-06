---
name: hiring-craft
description: Use when designing interview loops, writing interview questions or rubrics, calibrating panel feedback, running hiring debriefs, or making a hire/no-hire call. Trigger phrases include "design an interview loop for [role]", "write interview questions for [signal]", "help me run the debrief", "should we hire X", "I need a rubric for the system design round". Treats hiring as a craft with measurable signals and calibrated decisions, not a vibe-driven exercise.
---

# Hiring Craft

Hiring is the highest-leverage decision an engineering manager makes — every hire is a 1–3 year bet on team trajectory, culture, and delivery. Most hiring loops are run by tribal habit; this skill applies forcing functions at the points where loops most often fail.

Three sub-modes, triggered by what the user is doing: **loop design**, **rubric writing**, **debrief discipline**.

## Mode: Loop design

When the user is designing a new loop or reviewing an existing one, walk through this sequence:

### 1. Define the role's signals first, before any interview slot
What are the **3–5 capabilities** this hire must demonstrate? Be specific.
- Bad: "strong engineer"
- Good: "can decompose a vague product problem into a 6-week project; can mentor 1–2 juniors; can own on-call rotation; can navigate cross-team dependencies; ships at the senior level"

If the user can't articulate signals, push back: an interview loop without explicit signals is a panel of vibes-checks.

### 2. Map signals to slots
Each signal should be primarily covered by **one** slot, with one secondary slot as a check. Two failure modes here:
- **Duplicate coverage:** three slots all assess "system design." Wastes panel time, inflates noise.
- **Coverage gaps:** no slot actually probes whether they can mentor, even though it's a stated signal. Surfaces in the debrief as "we didn't really get a read on X."

Output a coverage matrix:
```
Signal              | Primary slot       | Secondary check
--------------------+--------------------+---------------------
System design       | Architecture round | Coding (if relevant)
Cross-team work     | Behavioral round   | Reference check
Mentorship          | Behavioral round   | (gap — add probe to mgr 1:1)
On-call ownership   | Hiring mgr round   | (gap)
Senior shipping     | Coding + take-home | Architecture round
```

### 3. Include the "is this person nice to work with" signal explicitly
Don't hope it surfaces. Make it one of the 3–5 signals, with explicit probes (how they handle disagreement, how they treat the interviewer's wrong answers, whether they ask questions or assume).

### 4. Length, sequence, and bar
- **Length:** push back on loops over 5 hours of candidate time. Diminishing returns; signals to candidates that the company doesn't respect their time.
- **Sequence:** behavioral and hiring-manager early, technical depth in the middle, "would you reach across the table for this person" round (e.g. team fit lunch, panel-of-peers) last.
- **Bar:** define what *strong-yes* means at this level **before** any interviews happen. "We hire at level X if Y, Z, W." Otherwise the bar drifts toward whoever's available.

## Mode: Rubric writing

For each signal, produce a rubric with **behavioral anchors** at four levels: strong-yes / lean-yes / lean-no / strong-no. Anchors must describe **behaviors observed in the interview**, not internal qualities.

Example for "decomposes vague problems":

```
Strong-yes:
- Asks 2-3 clarifying questions before diving in, surfacing the ambiguity explicitly
- Decomposes into 3-4 sub-problems with clear interfaces between them
- Names which sub-problem they'd tackle first and why
- Identifies what they don't know and where they'd go to learn it

Lean-yes:
- Asks at least one clarifying question
- Decomposes successfully but flat (no interfaces / dependencies surfaced)
- Picks a starting point but reasoning is thin

Lean-no:
- Dives in without clarifying assumptions
- Decomposition is partial or imbalanced
- Reasoning sounds confident but isn't structured

Strong-no:
- No clarifying questions
- Treats the problem as the literal prompt; misses the underlying ambiguity
- Decomposition is wrong (overlapping concerns, missing crucial pieces)
- Defends the wrong decomposition when challenged
```

**Force concreteness.** Adjectives like "good" or "strong" with no observable behavior aren't a rubric — they're a vibe. The whole point is that two interviewers using the rubric on the same recording would land within one notch of each other.

Include an **anti-bias note** per rubric: *"Don't penalize accent, communication style, or unfamiliarity with the company's internal vocabulary. Score the substance."*

## Mode: Debrief discipline

The debrief is where most hiring decisions go wrong. Loud voices win. The first speaker anchors. Calibration drifts.

Run debriefs in this order, every time:

### 1. Silent written votes first
Before any discussion, every interviewer writes their vote (strong-yes / lean-yes / lean-no / strong-no) **plus one sentence of evidence**. No comparing notes yet. This breaks anchoring.

### 2. Round-robin, lowest-rank-first
Junior interviewers speak first. Senior interviewers and the hiring manager last. This counteracts the natural pattern where junior voices defer.

### 3. Per-signal walk-through
Don't debate "should we hire?" first. Debate each signal: *"On 'system design,' what did people see?"* — going around the room. Surface evidence, not adjectives. *"What did they actually do?"*

### 4. Then the question
Only after all signals have been walked through, ask: **"Would you reach across the table to hire this person at the offered level?"** Yes/no. Force commitment.

### 5. Disagreement is data
If the room splits, the question isn't *who's right*. It's *what signal did one group see that the other didn't?* Often the disagreement reveals a real divergence in the data — the candidate was strong on signal A and weak on signal B, and people weighted them differently. Surface this; don't paper over it.

### 6. Decision and write-up
Document:
- The decision (hire / no-hire / hire at lower level)
- The signals that drove it
- Calibration notes (where the panel disagreed and why)
- Risks if hired (so the hiring manager can manage them)

The write-up is what makes the next loop better — patterns of disagreement reveal where the rubric or loop design needs fixing.

## Operating principles (across all modes)

- **Hiring is a process you can improve, not a black box.** Every loop should produce a write-up that informs the next one.
- **Loop design before rubric writing before slot assignment.** Reverse order is how loops get bloated and incoherent.
- **Calibration > consensus.** A loud "strong yes" with weak evidence is worse than a structured "lean no."
- **Document the no-hires too.** Future searches benefit from knowing why a previous candidate was passed on.
- **Push back on hiring-by-availability.** Every weak hire costs more than a delayed hire. The bar shouldn't move because the role has been open for 90 days.
- **Surface bias proactively.** If a candidate's name, school, or accent is showing up more in the discussion than their evidence, name it.

## Anti-patterns to flag

- **The "culture fit" non-signal.** If "culture fit" appears in a rubric without behavioral anchors, replace it with the specific behaviors you actually mean — collaboration style, reaction to disagreement, willingness to ask for help. "Culture fit" is where bias hides.
- **The "I just have a feeling" debrief contribution.** Push for the observation behind the feeling. If they can't produce one, the feeling shouldn't decide.
- **Interview question reuse without rotation.** Standard questions leak; design 2–3 variants per slot and rotate.
- **The hiring manager speaking first in debrief.** Anchors the room. Always last.
- **"Better than no one."** A weak hire blocks the role for 1–3 years and demotivates the existing team. The opportunity cost is usually higher than the unfilled-role cost.
- **Skipping the reference check.** Reference checks catch what interviews can't (longitudinal patterns, team-impact signal). 30 minutes well spent.

## Composition with other skills

- **`feedback-frameworks`** — when giving feedback to a panel member whose interviewing needs work, use COIN structure to make it land.
- **`decision-log`** — log the hire/no-hire decision and the signals behind it. Useful for performance review later, and for calibrating future loops.
- **`stakeholder-register`** — once hired, register the new report and start the reflection log on day one.
