---
title: "Tutorial: The Friday leadership review"
description: A 15-minute weekly routine that surfaces wins, overdue reflections, and cross-cutting patterns before you close out the week.
---

**Time:** ~8 minutes to follow this tutorial; ~15 minutes per week once it's a habit  
**Skills used:** `wins-due` → `stakeholder-due` → `patterns-watch`  
**Who this is for:** EMs and PMs who already have the wins log and stakeholder files set up. If you haven't done those yet, start with [Set up your stakeholder radar](/tutorials/stakeholder-radar) and [Log a win and turn it into a story](/tutorials/log-a-win) first.

**You'll learn:**
- What each skill surfaces and in what order
- How the three skills compose into a single Friday scan
- How to set this up as a scheduled routine so you don't have to remember to run it

:::tip[One command]
This entire routine now ships as a single skill: run `/bettersense:weekly` and it walks the same loop — wins, most-overdue stakeholder, patterns, plus a pulse glance — as one guided session. This tutorial is still worth reading once to understand what each segment does under the hood.
:::

---

## The scenario

It's Friday afternoon. You're an EM. You have four direct reports, two active stakeholders you're managing across, and a manager you're managing up to. You've been logging wins and reflections intermittently — more consistently some weeks than others.

This is what a Friday review looks like after 6 weeks of using the system.

---

## Step 1: What did I accomplish this week?

```
What wins should I log this week?
```

`wins-due` doesn't wait for you to remember — it probes by category:

> *"Quick Friday check:*
>
> *— Any delivery this week? Something shipped, a milestone hit, a metric moved?*
> *— Any judgment calls? Something you chose not to do, a decision you made under uncertainty?*
> *— Any mentorship? A conversation that helped someone, feedback you gave, a 1:1 that went well?*
> *— Any recovery? Something that went sideways that you helped fix or contain?"*

You scan the week. You remember:
- A prod incident Monday that you helped contain (recovery)
- A conversation Thursday where you talked a junior engineer out of a risky design shortcut (mentorship)

You'd have logged neither without the probe. Both go into the log with `wins-log`, with the skill pushing you toward specificity on each.

Three minutes. Two entries you'd have forgotten by Sunday.

---

## Step 2: Who am I losing touch with?

```
Who's overdue for reflection?
```

`stakeholder-due` scans all your stakeholder files and surfaces:

```
Overdue (7+ days since last reflection):
  → Daniyar Seitkali (managing-up): "What does Daniyar seem to optimize for 
    that you haven't explicitly discussed?" — 12 days overdue

  → Mei-Lin Chou (managing-across): "Where have you and Mei-Lin agreed easily 
    — and what does that tell you?" — 9 days overdue

Coming up this week:
  → Reports (managing-down): "Who on your team is getting the most of your 
    attention right now — and who isn't?" — due in 3 days
```

You do the Daniyar reflection now — takes 8 minutes. The Mei-Lin question goes on Monday's list. The managing-down question you'll do in your next team 1:1 prep.

What you don't do: let a relationship drift for a month and then wonder why the next conversation felt harder than it should have.

---

## Step 3: What am I not seeing?

```
Any patterns worth noting this week?
```

`patterns-watch` scans across your wins log, stakeholder files, and self-reflection entries (if you have them) and surfaces what you didn't ask about:

> *"A few things across this week's data:*
>
> *— Your last four wins entries are all delivery or recovery. No judgment entries since early March. You have a promo cycle in 10 weeks — judgment is typically the thinnest dimension in promo packets for PMs. Worth probing this next week.*
>
> *— You've reflected on Daniyar three times this month. Mei-Lin hasn't had an entry in 19 days, and you're co-planning a launch with her team. Overdue cadence aside, this is a relationship that's changing fast — thin reflection coverage is a risk.*
>
> *— Your wins log mentions 'the platform incident' twice without a full entry. Either log it properly or note why it doesn't merit one."*

This is the part of the review that most surprises people the first time they see it. The scan doesn't just show you what you asked about — it shows you what you've been avoiding.

---

## Running it as one command

Once you're used to each step, you can run the full review in one prompt:

```
Friday review — wins due, stakeholders due, and any patterns.
```

All three skills chain in sequence. Total wall-clock time: 15 minutes, most of which is you thinking and typing.

---

## Setting it up as a scheduled routine

The best version of this review runs automatically. In Claude Code Desktop:

```
Every Friday at 4pm, run /bettersense:wins-due, then /bettersense:stakeholder-due, 
then /bettersense:patterns-watch, and post a summary.
```

Or with the schedule skill:

```
/schedule "Every Friday at 4pm: Friday leadership review 
— runs wins-due, stakeholder-due, and patterns-watch in sequence"
```

:::note[Scheduling works best with Claude Desktop]
Scheduled routines require Claude Code Desktop or OS-level scheduling. See [Scheduling routines](/guides/scheduling) for setup options including launchd (Mac), systemd (Linux), and Task Scheduler (Windows).
:::

After a month of Friday reviews, you'll have:
- A wins log dense enough to support a promo packet
- Stakeholder files with enough entries for synthesis to surface real patterns
- A pattern-watch history that shows how your attention has shifted over time

---

## Where to go next

- [Build a promotion case](/tutorials/promo-case) — when the wins log is dense enough to use
- [Scheduling routines](/guides/scheduling) — full setup guide for automated cadences
- [Cross-cutting skills](/skills/cross-cutting) — reference for `wins-due`, `stakeholder-due`, `patterns-watch`, and other cross-cutting skills
