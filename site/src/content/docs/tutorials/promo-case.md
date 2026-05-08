---
title: "Tutorial: Build a promotion case"
description: Use report-career-architect and report-promo-case to build a panel-ready promotion packet for a direct report.
---

**Time:** ~12 minutes  
**Skills used:** `report-career-architect` → `wins-curate` → `report-promo-case`  
**Who this is for:** Engineering managers preparing a direct report for promotion.

**You'll learn:**
- How `report-career-architect` builds an honest gap analysis, not just a cheerleading doc
- How `wins-curate` translates a wins log into promotion-ready evidence
- What `report-promo-case` produces and where it pushes back before the panel sees it

**Prerequisites:** bettersense installed. The tutorial works without a wins log for the report, but if you've been logging their wins with `wins-log`, the output will be substantially richer.

---

## The scenario

You're an EM. One of your senior engineers — let's call him Kofi — has been at the senior level for 18 months. He's technically strong, runs projects well, and has started mentoring two junior engineers. You believe he's ready for staff. Promo cycle opens in six weeks.

You want to go into the submission process with something better than vibes.

---

## Step 1: Build the growth plan (even if late)

Even if the promo is imminent, start here. The growth plan isn't just forward-looking — it forces you to articulate the gap analysis honestly before writing the case.

```
Build a growth plan for Kofi. He's a senior engineer, 18 months at level. 
I think he's ready for staff.
```

`report-career-architect` doesn't start with strengths. It asks:

> *"To build this honestly, I need a read on where he actually is. A few questions:*
>
> *1. What has Kofi driven — vs. executed well — in the last 6 months? Staff-level is typically about driving, not just delivering.*
> *2. What's his current scope? Does he operate within a team boundary, or across multiple teams?*
> *3. What's the hardest technical or organizational problem he's solved in the last year, and how much of the solution was his?*
> *4. What's the most recent piece of feedback that surprised you about him — positive or critical?"*

You answer. The skill produces:

**Current state:**
- *Strong delivery on well-scoped projects. Owns the execution track end-to-end.*
- *Technical depth is real — two examples where he caught design issues senior engineers missed.*
- *Mentorship is consistent but informal — no structured approach yet.*

**Gaps for staff:**
- *Driving scope, not just executing it. The projects Kofi has run were defined for him. Staff engineers typically shape the problem before solving it.*
- *Organizational influence. Strong within his team; limited evidence of cross-team impact.*
- *Technical strategy. Kofi solves well; no evidence yet of him shaping how the team approaches a category of problems.*

**Manager moves:**
> *"For Kofi to demonstrate these at staff level, you'll need to create the conditions. Specifically: stop defining the scope for his next project — give him a problem statement and let him shape the approach. If you're still doing that for him, the panel will correctly infer that staff-level ownership is unproven."*

That last section — manager moves — is the part most managers skip. The skill won't let you.

---

## Step 2: Map the evidence

Six weeks from the promo cycle, you want to know what's already logged and where the gaps are.

```
Help me build a promo evidence map for Kofi. I want to know what I have and what I'm missing.
```

If you've been logging wins for Kofi (using `wins-log` on his behalf), `wins-curate` reads the entries and maps them to the staff promotion dimensions:

**What's there:**
- *Technical scope (strong):* Three entries on architecture decisions and design catches. One entry has quantified impact (reduced infrastructure cost 18%). Panel-ready.
- *Delivery (solid):* Two project completions, one under time pressure. Credit framing is honest — team execution, his leadership.
- *Mentorship (light but present):* One entry on the junior engineer pair. The impact is cited (both shipped their first solo PRs within 4 weeks). Specific enough.

**What's missing:**
- *Driving scope:* No entries where Kofi shaped the problem rather than executed a defined one. This is the primary staff gap — and it's also missing from the log.
- *Cross-team influence:* Nothing. If this is real, you need to find the evidence before the cycle closes.
- *Technical strategy:* No entries. If he's been shaping anything at a team level, it needs to be documented now.

You have four weeks. The gaps are named. You can either build the evidence (create the opportunities) or submit with honest calibration about what's proven vs. developing.

---

## Step 3: Build the packet

```
Build the promo case for Kofi — senior engineer to staff.
```

`report-promo-case` produces a panel-ready packet:

**Opening framing:**
> *"Kofi has been operating with senior-level ownership for 18 months and has demonstrated consistent readiness on technical depth and delivery. The case is strongest on craft and mentorship; cross-team scope is developing and is called out honestly below."*

**Per-dimension with cited evidence:**

*Technical scope:*
> *"The infrastructure cost reduction (18%) came from Kofi identifying an unnecessary indexing pattern across three services — a catch that wasn't on the sprint backlog, surfaced proactively. This is characteristic of engineer-driven scope expansion, not task execution."*

*Delivery:*
> *"Two consecutive project deliveries under time pressure, both with full team attribution. Kofi's role: technical lead and day-to-day risk manager."*

*Mentorship:*
> *"Informal mentorship of two junior engineers over 8 weeks. Both shipped solo PRs within 4 weeks of working with Kofi. Exec sponsor of one of the juniors confirmed the ramp was notably faster than expected."*

**Pre-empted objections:**
- *"Where's the cross-team impact?"* → *"Kofi's scope has been team-bounded. We're building this and it's not represented in this packet — we're submitting on the dimensions where he's proven, not on ones we expect."*
- *"Is the infrastructure catch a one-off or a pattern?"* → *"Two similar catches in a 6-month window. The log has both. It looks like a pattern."*

**Panel prep note:**
> *"The weakest section is cross-team influence. If the panel asks directly, don't reach for thin examples — name the gap and describe what you're building. Panels respond better to honest development framing than to evidence that doesn't land."*

---

## What you have now

- An honest gap analysis that you can share with Kofi in the next career conversation
- An evidence map that tells you what you have, what you're missing, and whether it matters
- A panel-ready packet with cited evidence, calibrated framing, and pre-empted objections

The packet took 12 minutes. The evidence took 18 months of showing up. One of those is in your control right now.

---

## Where to go next

- [Navigate an underperformance situation](/tutorials/underperformance) — the other end of the performance management spectrum
- [People leadership skills](/skills/people-leadership) — full reference for `report-career-architect`, `report-promo-case`, `coaching-mode`, and the rest of the leadership bundle
