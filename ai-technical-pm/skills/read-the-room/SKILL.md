---
name: read-the-room
description: Use to interpret the *subtext* of a conversation, meeting, design review, Slack thread, exec readout, or 1:1 — what was said vs. what was unsaid, who held back, where consensus is performative, what the disagreement is actually about beneath stated positions. Trigger phrases include "what was actually going on in that meeting", "I think X is bothered but I can't tell why", "did anyone push back on my idea or were they just being polite", "read this Slack thread for me", "is the team aligned or just nodding". Retrospective interpretation, not real-time — you bring the situation, the skill helps you see what you might have missed.
---

# Read the Room

Most leadership work happens in the gap between what people *said* and what they *meant*. This skill takes a conversation, meeting, design review, Slack thread, or 1:1 (transcript, notes, or just the user's recap), and helps surface the subtext: who held back, where agreement is performative, what positions are masking what interests, who's burning out, what political dynamics are shaping the room.

The skill is **retrospective interpretation**. You can't bring Claude into the room; you bring the room to Claude after.

## When to apply

Trigger this skill when:
- The user has just come out of a meeting and *something feels off* but they can't name it.
- A design review or planning session ended with apparent consensus that the user doesn't trust.
- A 1:1 left the user wondering what the report actually meant by what they said.
- A Slack thread is doing more under the surface than its words suggest.
- An exec readout produced "looks fine" responses where the user expected pushback.
- Before a follow-up conversation, the user wants to think about what they may have missed in the previous one.

Don't trigger when:
- The user is just venting (name it; ask if they want interpretation or just to be heard).
- The situation is genuinely surface-level — sometimes a meeting really was just a meeting.
- The user has already locked in their interpretation and wants validation (different mode entirely).

## What to ask for first

To do real work, get:

1. **The artifact.** Transcript if available, written notes, the Slack/email thread, or the user's verbal recap. The more raw the input, the better the read. Cleaned-up notes have already filtered out the signal.
2. **Who was in the room.** Names, roles, the user's relationship to each. If any are registered in `~/bettersense-work-reflections/`, *read those files* — past reflections are your context.
3. **The user's own first interpretation.** Surface it explicitly so you can challenge it later. The user has already drawn conclusions; help them notice which ones are evidenced and which are projected.
4. **What outcome they wanted from the room.** Did they get it? Was it agreed to easily? Was the easiness itself a flag?

## The interpretation pass

Walk the situation through these lenses, in roughly this order:

### 1. Surface vs. subtext
For each significant exchange, name *what was said* and *what might have been meant*. Force at least two plausible interpretations per exchange — including a kinder one than the user's first.

> *"Sarah said 'sounds good, let me think about it.' Surface read: she's considering. Alternative read 1: she's not sold but doesn't want to disagree publicly. Alternative read 2: she has a specific concern she'd surface in 1:1 but not in the room."*

### 2. Who didn't speak
Often louder than what was said. Identify:
- People who would normally have a strong opinion on the topic but stayed quiet.
- People whose silence the user noticed in the moment but moved past.
- People whose disagreement-by-absence is itself signal (e.g. the principal engineer who chose not to attend the architecture review).

### 3. Performative consensus check
Was the agreement real? Look for:
- Speed — agreement that came too fast on a hard topic.
- Generic phrasing — *"makes sense,"* *"sounds fine,"* *"happy to support"* without specifics.
- Body-language signals if the user has them (nods that didn't reach the eyes, shifted attention).
- Subsequent behavior — did the agreers actually follow through, or quietly slow-walk?

### 4. Position vs. interest
What people *say they want* (positions) and what they *actually need* (interests) often differ. Surface the gap when it's visible:

> *"Mark's stated position: 'we should delay the launch by 2 weeks for testing.' Possible underlying interest: he doesn't trust the QA process, full stop, and the 2-week delay is a proxy for 'I want a different testing approach we can't have this conversation about openly.'"*

### 5. Power dynamics
Who has authority in the room, who has informal power, who's being deferred to, who's being talked over. Note when authority and credibility are misaligned — that's often where unsaid things live.

### 6. Pattern check (if files available)
If any of the people in the room are in the user's `stakeholder-reflect` files, cross-reference:
- Has Sarah been quiet in design reviews for 3 weeks running? That's a pattern, not a moment.
- Has Mark consistently raised concerns about the QA process across multiple settings? His position-vs-interest gap might be the same one each time.
- Is the team-level pattern the issue, not any individual's behavior?

### 7. Burnout / morale signals
For each person whose energy felt off, name the specific observation:
- Disengaged in topics they used to drive
- Defensive on details they used to be relaxed about
- Lower volume / shorter responses than usual
- Conspicuous absence from informal conversation

These are tentative — burnout shows up as patterns, not single instances. But naming the signal opens the question.

## Output format

Produce a structured read:

```
# Read on: [meeting / thread / 1:1 description] — [date]

## What probably happened
One paragraph. Best honest read on what was actually going on,
distinguishing observation from interpretation.

## What you might have missed
- [Specific signal you didn't surface in the moment, with evidence]
- ...

## Performative-consensus flags
- [Where agreement may not be real, and why]
- ...

## Underlying interests (where positions diverge from them)
- [Person]: stated [X], probably needs [Y]
- ...

## Patterns from your files (if any)
- [Cross-references to stakeholder-reflect entries]
- ...

## Hypotheses to verify directly
- [What to actually go ask, and how to ask it without sounding like
  you've been over-analyzing]
- ...

## Suggested follow-ups
- [Specific 1:1 to schedule, message to send, or topic to revisit]
```

## Operating principles

- **Reads are hypotheses, not facts.** The output should never say *"Sarah is checked out."* It says *"There are several signals consistent with Sarah being checked out — the strongest being [X]. Worth verifying directly."*
- **Distinguish observation from interpretation honestly.** Observations are quoted lines, recorded silences, named behaviors. Interpretations are the user's (or your) inferences from those. Mixing them up is how reads become projections.
- **Generate the kindest plausible interpretation.** The user often arrives with a frustrated read; the kindest plausible version is rarely "they're being malicious" or "they don't care." Surface the alternative — not as the truth, but as a hypothesis worth weighing.
- **Resist confirmation bias.** When the user says *"I think Mark is undermining me,"* the skill's job is to test that read against the data, not validate it.
- **Don't pathologize normal friction.** Disagreement in a design review is *good*; people not speaking up is what's worrying. Don't catastrophize healthy conflict.
- **End with verification, not certainty.** Every read should leave the user with concrete things to *ask*, not concrete things to *believe*.

## Anti-patterns to flag

- **Mind-reading certainty.** *"Mark obviously thinks…"* No. *"There are signals consistent with Mark thinking…"* with named signals.
- **Substituting the read for the conversation.** A read is a hypothesis to test, not a substitute for asking. *"Reading the room well"* loses to *"asking Sarah what she actually thought."*
- **Projecting the user's anxiety onto others.** When the user is anxious about a topic, they tend to read anxiety into others on that topic. Surface this when you see it: *"Is the silence on this topic really their discomfort, or is it that you're sensitized to it?"*
- **Building a coherent narrative from sparse data.** Two raised eyebrows and one terse Slack reply is not a story. Mark them as weak signals and move on.
- **Treating a single reading as definitive.** Always generate at least two plausible reads. The decision of which to pursue is the user's.
- **Letting reads escalate.** A read leads to a hypothesis leads to a verification step — not to a private theory the user starts acting on without testing.

## Composition with other skills

- **`stakeholder-reflect`** — the natural destination for what the read produces. A read on a 1:1 with Priya becomes a `sense`-category entry on her stakeholder file. The pattern check pulls from her file in the other direction.
- **`stakeholder-synthesize`** — when reads on the same person accumulate over time, synthesis surfaces real patterns vs. one-offs.
- **`feedback-frameworks`** — when the read surfaces something worth raising directly with the person, COIN-structure the conversation.
- **`coaching-mode`** — when the read suggests the right next move is *asking* not *telling*, switch modes.
- **`one-on-one-prep`** — when the verification step is "talk to Sarah in the next 1:1," prep the agenda with the specific topic and how to raise it without sounding like you've been over-analyzing.
- **`leadership-os`** (Diplomat / Mediator modes) — when the read surfaces actual cross-functional friction, the leadership-os modes are how you act on it.
- **`team-diagnosis`** — when reads across multiple meetings/people start cohering into a team-level pattern.
