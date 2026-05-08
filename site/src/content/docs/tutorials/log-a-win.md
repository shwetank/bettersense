---
title: "Tutorial: Log a win and turn it into a story"
description: Capture a win the right way, then watch it become a STAR interview story or a promo-packet entry.
---

**Time:** ~8 minutes  
**Skills used:** `wins-log` → `wins-curate`  
**Who this is for:** Anyone. The wins system pays off most in promo cycles and interviews, but the benefit of logging in-week shows up much earlier.

**You'll learn:**
- How `wins-log` pushes you toward specificity (and why that matters)
- What a well-structured win entry looks like
- How `wins-curate` turns raw entries into something panel-ready

**Prerequisites:** bettersense installed.

---

## The scenario

You're a TPM. Last week you caught a critical dependency gap between two teams three weeks before a major launch — and brokered an agreement that resolved it. The launch went smoothly. You've already mentally moved on.

This tutorial shows you why that moment should be in a log, and what you can do with it later.

---

## Step 1: Log the win

In Claude Code, within a day or two of the event:

```
I want to log a win. I caught a dependency issue between the platform team and the data team three weeks before the Q2 launch, got both teams aligned on a workaround, and the launch went out on time.
```

`wins-log` doesn't just accept that. It asks:

> *"Good start. A few questions to make this entry useful later:*
>
> *1. What specifically did you notice, and how? (Proactive catch vs. it came to you?)*
> *2. What was the dependency gap — what would have happened if it wasn't caught?*
> *3. Who else was involved in the resolution, and what was your specific role vs. theirs?"*

You answer:

> *"I noticed it in a planning doc review — nobody had flagged it. The platform team was building an API that data team's pipeline depended on, but the platform team's timeline had slipped two weeks and nobody had told data. If it landed unresolved, data's pipeline would've had no endpoint to call at launch. I set up the alignment call, proposed the interim solution (a mock endpoint the data team could code against), and got sign-off from both leads."*

The skill writes the entry:

```
2026-05-01 — Caught cross-team API dependency gap, brokered Q2 launch workaround
  Type: judgment · Scope: quarter
  How caught: proactive, during doc review — not escalated to me
  What was at risk: data team pipeline had no endpoint at launch; slip was invisible to both leads
  Resolution: proposed mock-endpoint workaround; facilitated alignment call; got sign-off from both tech leads
  Solo vs. shared: my initiative + facilitation; execution by data and platform engineers
  Evidence: Slack thread, planning doc, launch postmortem
```

That's specific. A retroactive reconstruction three months from now would not have the "how caught" detail or the evidence pointers.

---

## Step 2: Log a second win (optional but useful)

One entry makes a log. Several entries make synthesis useful. Try logging one more:

```
Log a win: I mentored a new junior PM through her first exec briefing. She ran it solo and the VP called it one of the clearest briefings he'd seen from someone at her level.
```

`wins-log` will push for specificity again — what did you actually do in the mentoring (structured sessions? ad hoc feedback? doc review?), and what's the evidence for the VP's reaction (direct quote? heard secondhand?).

After answering: a second entry, different type.

---

## Step 3: Curate into a STAR story

Six weeks later, preparing for an interview:

```
I have a panel interview next week. Turn my dependency catch win into a STAR story.
```

`wins-curate` in STAR mode:

> **Situation:** *You were reviewing planning docs for a major quarterly launch when you spotted a cross-team dependency that had slipped through — a platform API that the data team's pipeline depended on, with an invisible two-week timeline gap.*
>
> **Task:** *Nobody had flagged it. It wasn't your responsibility to catch it, and the affected teams weren't aware of the risk.*
>
> **Action:** *You identified the gap proactively, assessed the blast radius (data pipeline would have had no endpoint at launch), proposed a mock-endpoint workaround the data team could code against, facilitated the alignment call between both tech leads, and drove sign-off.*
>
> **Result:** *Launch shipped on time. The workaround resolved the gap. The postmortem cited the catch as an example of cross-functional risk detection done right.*
>
> **Calibration note:** *The entry honestly attributes execution to the engineers. The story is yours because of initiative, diagnosis, and facilitation — make sure to draw that line explicitly if the interviewer asks who built the mock endpoint.*

That's a panel-ready story. The calibration note pre-empts the question that would otherwise catch you off guard.

---

## What you have now

- A structured log entry with specificity that fades fast if you wait
- A STAR-format interview story, cited and calibrated
- The foundation of a promo packet — run `wins-curate` in promo-packet mode when the cycle opens

:::tip[The Friday nudge]
The reason most wins logs stay empty: the wins feel small in the moment, or you forget. The `wins-due` skill, run on a Friday schedule, asks one category-probing question per week — *"any mentorship this week?"*, *"any judgment calls?"* — that surfaces entries you'd otherwise skip. See [Scheduling routines](/guides/scheduling) to set it up.
:::

---

## Where to go next

- [The Friday leadership review](/tutorials/friday-review) — the weekly routine that keeps the wins log current
- [Build a promotion case](/tutorials/promo-case) — taking the log through a full promo packet
- [Wins system skills](/skills/wins-system) — full reference for `wins-log`, `wins-due`, `wins-curate`
