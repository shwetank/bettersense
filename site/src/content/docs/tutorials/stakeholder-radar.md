---
title: "Tutorial: Set up your stakeholder radar"
description: Register your first stakeholders, run a reflection, and see what synthesis looks like — in under 10 minutes.
---

**Time:** ~10 minutes  
**Skills used:** `stakeholder-register` → `stakeholder-reflect` → `stakeholder-synthesize`  
**Who this is for:** Anyone new to bettersense — this is the most foundational skill in the bundle.

**You'll learn:**
- How to register a stakeholder and what gets written to disk
- What a reflection session actually feels like (including how the skill pushes back)
- What synthesis produces after just a few entries

**Prerequisites:** bettersense installed. If you haven't done [first run](/getting-started/first-run) yet, do that first — it sets up your profile and the private data directory.

---

## The scenario

You're an engineering manager. You've just started working with a new product partner — let's call her Priya. You've had two or three early conversations. Your instinct is "she's great, this is going to work," but you have no specifics yet.

This tutorial shows you how to build something real out of that instinct over time.

---

## Step 1: Register Priya

In Claude Code, type:

```
Add Priya Mehta to my stakeholders. She's a new product partner — managing across.
```

`stakeholder-register` fires. It asks for context:

> *"A few quick questions to set up Priya's file:*
> *1. What's her role and reporting line?*
> *2. How often do you interact — and in what format (1:1s, shared planning sessions, async)?*
> *3. Anything notable about the context — new team, new project, something you're trying to figure out about this relationship?"*

You answer:

> *"Senior PM, reports to a Director of Product. We have a weekly sync plus we're co-planning the H2 roadmap. She's new to the product area — came from the growth side of the org."*

The skill confirms before writing:

> *"I'll create `~/bettersense-work-reflections/managing-across/priya-mehta.md` with this context. Does that look right?"*

You confirm. File is created. One-time setup: done.

:::note[What's in the file]
The file is plain markdown — you can open and edit it directly. It has a header with context, a cadence block (which questions to ask over time and how often), and an empty entries section where reflections will accumulate.
:::

---

## Step 2: Your first reflection

A week later, after your first real co-planning session:

```
Let me reflect on Priya.
```

`stakeholder-reflect` loads her file and picks questions suited to an early relationship:

> *"A couple of questions for this early stage:*
>
> *1. What did you notice about how Priya makes decisions — or defers them? Any data from the planning session?*
> *2. What's one thing you assumed about how this partnership would work that you're now less sure about?"*

You answer the first question:

> *"She came in with a very clear point of view on prioritization — almost a finished answer. But when I pushed on the tradeoffs she hadn't mentioned, she updated quickly and seemed genuinely interested in the pushback."*

The skill pushes back on your second answer:

> *You wrote: "I assumed it would be collaborative but I'm not sure now."*
>
> *"That's still pretty vague. What specifically makes you less sure — something she said, something she didn't say, how she ran the meeting? The more specific the entry, the more useful synthesis becomes."*

You sharpen it:

> *"I assumed we'd be doing more joint prioritization, but she came in with a finished stack rank. She was open to adjusting, but the starting point was hers."*

Better. Both answers go into the file as a dated entry.

---

## Step 3: Two more reflections (fast-forward)

You come back two more times over the next three weeks. The skill rotates questions:

- *"What does Priya seem to optimize for that you haven't explicitly discussed?"*
- *"Where have you and Priya agreed easily — and what does that tell you?"*
- *"What's one thing you've changed about how you prepare for your syncs with her?"*

Each session is 10-15 minutes. Three entries now in the file.

---

## Step 4: Synthesize

Before a big quarterly planning meeting where Priya will be representing the team's priorities to her Director:

```
Synthesize what I know about Priya before the planning meeting.
```

`stakeholder-synthesize` reads all three entries and produces:

**Patterns:**
- *Priya arrives at meetings with a finished point of view (3 entries reference this). When pushed with specific tradeoffs, she updates — but the starting shape of decisions tends to be hers. Worth naming this dynamic explicitly rather than working around it.*
- *Your syncs have been most productive when you've pre-shared a question or framing before the meeting. Two entries note a contrast between "came prepared" sessions vs. not.*

**What's missing:**
- *No entries about how Priya navigates her own chain — her Director, or cross-functional partners outside your team. Her behavior with you may differ from how she operates in broader forums. Worth observing.*

**Suggested next:**
- *"What does Priya optimize for that you haven't explicitly discussed?" has a partial answer across entries but nothing definitive. The planning meeting is a good chance to test hypotheses.*

That's actionable input for a meeting you're walking into in an hour.

---

## What you have now

After 10 minutes of setup and three short reflection sessions:

- A structured, private file with dated observations about a key relationship
- Synthesis that cites your own words back to you, not a vibe
- A question to test in the next meeting

The value compounds. Six months in, `stakeholder-synthesize` has enough material to surface patterns you've genuinely forgotten — and to show you where your thinking has shifted.

---

## Where to go next

- [Log a win and turn it into a story](/tutorials/log-a-win) — the wins system, from capture to promo packet
- [The Friday leadership review](/tutorials/friday-review) — a weekly routine that uses `stakeholder-due` to keep reflections current
- [Stakeholder management skills](/skills/stakeholder-management) — full reference for all five stakeholder skills
