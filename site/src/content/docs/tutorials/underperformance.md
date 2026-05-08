---
title: "Tutorial: Navigate an underperformance situation"
description: Work through coaching-mode, performance-management, and feedback-frameworks on a real underperformance scenario without skipping stages.
---

**Time:** ~10 minutes  
**Skills used:** `coaching-mode` → `performance-management` → `feedback-frameworks`  
**Who this is for:** Engineering managers dealing with a direct report who isn't meeting expectations.

**You'll learn:**
- How `coaching-mode` prevents you from prescribing before you understand
- How `performance-management` names the stage you're actually in — and won't let you skip ahead
- How `feedback-frameworks` turns your instincts into something you can actually say out loud

**Prerequisites:** bettersense installed.

**A note before you start:** This tutorial covers real management territory. The scenarios are realistic, including the parts that are uncomfortable. The skills are opinionated because the stakes are high.

---

## The scenario

You're an EM. One of your engineers — let's call her Selin — has been on the team for eight months. Her first six months were strong. In the last two months, her output has dropped. PRs take longer. She's missing small commitments. In the last 1:1, she said everything was fine.

Your instinct is to have a "direct conversation" about expectations. This tutorial shows what the skills do with that instinct.

---

## Step 1: Check your framing first

Before any conversation with Selin, you run:

```
Help me coach Selin. She's been underperforming for two months — slower PRs, 
missing commitments. I want to have a direct conversation about expectations.
```

`coaching-mode` doesn't give you a script. It pushes back on the framing:

> *"Before writing the conversation: what do you know about why this is happening? You've described the behavior — slower PRs, missed commitments. What's your hypothesis about the cause?*
>
> *There's a significant difference between:*
> *— A skill gap (she can't do the thing)*
> *— A clarity gap (she doesn't know what's expected)*
> *— A motivation or engagement gap (she could do it but isn't)*
> *— Something external (health, personal circumstances, something at work outside her control)*
>
> *A 'direct conversation about expectations' lands differently depending on which one this is. Which do you think it is?"*

You sit with it. Her first six months were strong, which rules out skill gap. You haven't changed the expectations explicitly, but the scope of her projects has grown. There might be a clarity gap you've missed.

> *"That's useful. Have you asked her directly what's making the work feel harder right now — not 'how are things going' but a specific, non-evaluative question about the work itself?"*

You haven't. The skill surfaces one:

> *"Try this in the next 1:1: 'I've noticed the last few projects have taken longer than you'd estimated. I want to understand what's getting in the way — is there something about how they're scoped, or dependencies you're hitting, or something else?' Don't lead with evaluation. Lead with curiosity."*

That's the coaching step. You haven't labeled it as underperformance yet. You've asked a real question first.

---

## Step 2: Name the stage you're in

Two weeks later. The 1:1 conversation revealed: Selin didn't realize the expectations had shifted as her project scope grew. But even after you clarified, the pattern continued for another two weeks.

```
I've been coaching Selin for a month. I've had two 1:1 conversations about 
expectations, named what I'm seeing, and the pattern hasn't changed. 
What stage am I in?
```

`performance-management` assesses:

> *"Based on what you've described: you're at the boundary between Stage 1 (coaching) and Stage 2 (formalized feedback). Here's why:*
>
> *— You've named the pattern: yes*
> *— Expectations are clear: yes, as of two weeks ago*
> *— You've given her time to respond: two weeks — that's a short window*
> *— The pattern has continued: yes*
>
> *You're not at Stage 2 yet. Stage 2 requires written documentation of the gap and improvement criteria, and typically follows at least 3-4 weeks of a clearly-stated, unmet expectation. You're at 2 weeks.*
>
> *What you should do now: run one more explicit conversation — this time with documentation. You say what you're seeing (specific behavior), what needs to change (specific standard), and what you'll do if it doesn't (move to formalized feedback). Write it down. Date it. Tell her you're doing that.*
>
> *This isn't a PIP. This is the last coaching step before you formalize. Don't skip it — if this ever goes further, the documentation of this conversation is what you'll need."*

This is the forcing function. The skill won't let you treat a two-week window as a failed performance plan.

---

## Step 3: Draft the conversation

```
Help me draft the feedback conversation for Selin — the one that names the gap 
explicitly and sets clear expectations before I move to formalized feedback.
```

`feedback-frameworks` builds the conversation in COIN structure:

**Connection:**
> *"I want to have a direct conversation about how the last few weeks are going. This builds on what we talked about two weeks ago."*

**Observation (specific behavior, not character):**
> *"In the last three sprints, you've missed your stated completion targets on four tickets — not by a lot, but consistently. In the last two PRs, review turnaround has been 5-7 days on your end, against a team norm of 2-3 days. I'm seeing a pattern."*

**Impact (specific, not vague):**
> *"When tickets slip, the team's planning gets harder — we've had two sprint planning sessions where we had to re-scope because work we expected to carry over didn't close. PR turnaround affects the engineers waiting on unblocking reviews."*

**Next steps (clear, not punitive):**
> *"Here's what I need to see in the next 4 weeks: tickets completed within estimate, or flagged to me at least 3 days before the sprint ends if that's at risk. PR reviews turned around within 48 hours for anything that's blocking someone. I'll check in at our 1:1s. If we're not there in 4 weeks, I'll move to a formalized feedback process."*

The skill flags two things before you deliver:

> *"One: 'not by a lot, but consistently' — remove 'not by a lot.' It undercuts the observation. The pattern matters regardless of magnitude.*
>
> *Two: make sure the next steps are things Selin can control. 'Flag to me 3 days before the sprint ends' — is that a reasonable ask given how she gets her work? If she doesn't control her own ticket scope, this needs to account for that."*

You revise. The conversation is ready.

---

## What you have now

- A coaching conversation that diagnosed the cause before labeling it
- A clear stage assessment — you're not on a PIP timeline, you're on a coaching-to-documentation timeline
- A drafted feedback conversation that's specific, impact-linked, and ready to deliver

The skills won't let you rush this. That's intentional. Moving too fast through stages damages the relationship and, if it ever goes further, weakens your documentation. Moving too slow is also a failure mode — the skills call that out too.

---

## A note on documentation

Throughout this process, keep a running note of:
- What you said, in what 1:1, and on what date
- What the response was
- What the next step you agreed on was

If this ever goes to Stage 3 (PIP) or beyond, this log is what separates a clean process from one that gets challenged. `performance-management` will remind you at each step. The note doesn't need to be formal — a dated entry in your notes app is fine. What matters is that it exists.

---

## Where to go next

- [Build a promotion case](/tutorials/promo-case) — the other end of the performance spectrum
- [People leadership skills](/skills/people-leadership) — full reference for `coaching-mode`, `performance-management`, `feedback-frameworks`, and the rest of the bundle
