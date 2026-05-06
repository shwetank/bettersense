---
title: Stakeholder reflection — worked example
description: A full lifecycle walkthrough of the stakeholder-* skills, from first registration through synthesis.
---

The stakeholder bundle works best when you use it over time. Here's what the full cycle looks like in practice, from first setup through a synthesis session before a key meeting.

## The scenario

You're a PM or EM. You've just gotten a new manager — let's call them Trae. You want to build a real picture of this relationship over time, not just a vague sense of "things are fine."

---

## Step 1: Register

```
I just got a new manager. Add Trae North to managing-up.
```

`stakeholder-register` fires. It walks you through:

- **Name:** Trae North
- **Category:** managing-up
- **Role and context:** Director of Product, your skip-level is the VP of Product. Weekly 1:1s.
- **Initial notes:** New to the role (just promoted), still calibrating his style. Came from a strong IC background.

Confirms before writing: *"Here's the file I'll create at `~/bettersense-work-reflections/managing-up/trae-north.md`. Anything to change?"*

You confirm. File is created.

---

## Step 2: Reflect (weekly-ish)

Three weeks later:

```
Let me reflect on Trae.
```

`stakeholder-reflect` loads the file and picks 2-3 questions appropriate to the moment:

> *"You haven't answered 'What does [Trae] seem to be optimizing for that you haven't explicitly discussed?' yet. Worth exploring. Things to consider: their stated goals vs. what they're spending time on, what they escalate vs. let ride, how they respond when your priorities differ from theirs."*

You reflect for 10 minutes. The skill pushes back when you write "he's hard to read" — *"that's an observation about your experience, not about his behavior. What specifically is happening that makes him feel that way?"* — and helps you articulate:

> *"He asks detailed questions in 1:1s but rarely commits to a direction. In the last three 1:1s, he's asked me to 'keep thinking about it' rather than aligning."*

That's specific. The skill writes a dated entry with exactly that language.

---

## Step 3: Stay current

Six weeks in, Monday morning:

```
What's due this week?
```

`stakeholder-due` scans all your stakeholder files and surfaces:

```
Overdue (7+ days):
  → Trae North (managing-up): "What do I appreciate about how Trae works?" — 14 days overdue
  → Sahil Bhatia (managing-across): "What's one assumption I'm making about how Sahil sees my work?" — 9 days overdue

Coming up (due this week):
  → Yulia Krenkova (managing-down): "What's one thing I could do differently in our 1:1s?" — due in 2 days
```

You open `stakeholder-reflect` for Trae and answer the appreciation question. Turns out it's easier to answer than expected — there's real specificity there you hadn't articulated. It goes in the file.

---

## Step 4: Synthesize (before a big moment)

It's been three months. You have a skip-level with Trae's manager next week, and you want to brief yourself on where things stand.

```
Before my skip-level next week, synthesize what I know about Trae.
```

`stakeholder-synthesize` reads the file — 11 dated entries across 12 weeks — and produces:

**Patterns:**
- *Consistently asks clarifying questions before committing — 7 entries reference this. Hypothesis: decision-making style, not indecision. He's building a map before moving.*
- *Energy visibly higher in conversations about strategy and narrative than execution detail — 4 entries. Worth exploring whether he wants to be consulted on more upstream work.*

**Contradictions:**
- *Early entries describe him as "hard to read." Later entries have concrete observations. The gap may be relationship depth, not his style — worth checking if the pattern holds in new conversations.*

**Blind spots:**
- *No entries in the 'sense' category about how Trae is perceived by others. Only your direct experience. Useful to get a second view.*

**Suggested next:**
- *"What does Trae optimize for that you haven't explicitly discussed?" hasn't been fully answered — the entries circle it without landing. One conversation centered on that question could clarify a lot.*

That's the input you needed for the skip-level.

---

## What makes this work

- **Specificity compounds.** One-line entries produce shallow synthesis. Ten specific entries produce a 360-view you couldn't have assembled from memory.
- **The skill pushes toward specificity.** Every "he seems X" gets challenged: what specifically?
- **Synthesis is cited.** Every pattern in the output references specific dated entries — not a vibe, an artifact.
- **It composes.** After reading the synthesis, you can run:
  - `/bettersense:one-on-one-prep` — for the actual skip-level agenda
  - `/bettersense:feedback-frameworks` — if feedback emerges from the synthesis
  - `/bettersense:coaching-mode` — if a development conversation with a report is what the synthesis points to
