---
name: impact-audit
description: Use when a PM or team wants to stress-test whether their work is actually connected to something the business cares about. Runs before strategy-doc or prioritization-frameworks — it answers "are we even pointed at the right thing?" Trigger phrases include "are we doing the right work?", "I'm worried my team isn't driving real impact", "help me check if my team is aligned", "I'm worried about layoffs", or any moment of doubt about whether the team's work would survive scrutiny.
---

# Impact Audit

This skill runs a diagnostic on whether a team's work is genuinely connected to business outcomes. It is not about *how* to build things — that's `prioritization-frameworks`, `strategy-doc`, and `metrics-design`. This runs *before* those, when the question is whether the team is pointed at the right thing at all.

Inspired by Matt LeMay's *Impact First Product Teams* framework.

## The audit: three questions

Run these in order. Each one builds on the previous. Stop and work through whatever surfaces — don't rush to the next question.

---

### Question 1: The budget stress test

> "If the person who controls your team's budget had to justify it from scratch today, could they? Would they?"

Ask the user to answer this honestly, not optimistically. Watch for hedged answers: "I think so," "probably," "yeah, I mean…" — these are the signal. A confident yes means move on. Anything less means spend time here.

Useful follow-ups:
- "What would you point to as the clearest evidence that this team is a good investment?"
- "If your team disappeared tomorrow, what would the business noticeably lose?"

*(In large orgs — Microsoft, Google, Philips-scale — substitute "the exec who controls your budget" for "CEO." The principle is the same: someone with authority should be able to justify the team without hesitation.)*

---

### Question 2: The death spiral check

Teams fall into low-impact work gradually. It starts with small, safe additions — features that won't break anything, cosmetic improvements, work that invites no scrutiny. Over time this compounds: the product gets crowded, internal complexity grows, and doing anything high-impact gets harder. The safer the work feels, the more of it accumulates.

Ask the user: **"What would you say your team has shipped in the last two quarters? Would those things be missed if they hadn't been built?"**

Listen for:
- Work that was "requested" but where the business impact is unclear
- Features that shipped but no one tracked the outcome
- A roadmap driven by stakeholder asks rather than a business goal
- A sense that the team is busy but not sure it matters

If the work feels more like decorating than engine work, name it directly. The point isn't blame — it's that this pattern is self-reinforcing and the way out is deliberate.

---

### Question 3: The goal distance check

> "Can you state your team's primary goal and connect it to a real business outcome in one step?"

One step means one mathematical operator: a conversion rate, a multiplier, a percentage of a larger number. Examples of what this looks like:

- "We convert single-product users to multi-product — each conversion is worth £X in lifetime value, so our goal contributes £Y to the business." ✓
- "We're the growth team, and the company's growth goal is 1M users — we own 100K of that." ✓
- "We improve the onboarding experience which improves retention which improves revenue." ✗ (too many steps, too many assumptions baked in)

*(In large orgs, "real business outcome" doesn't have to be the top-line company goal — it should be the nearest goal that has genuine budget authority behind it. A platform team's one step might be to the consuming team's goal.)*

If the user can't state this cleanly, that's the work. Don't move past it.

---

## If the audit surfaces problems

If one or more questions landed poorly, work through the following with the user. These are Matt LeMay's three steps to becoming an impact-first team:

**Step 1: Set team goals no more than one step from the nearest meaningful business goal.**
Don't cascade goals down through five layers until the connection to anything real is invisible. Find the goal that the budget holder cares about and connect to it directly. If you can't, change the goal.

**Step 2: Keep impact first at every stage, not just at goal-setting.**
It's easy to set an impact-connected goal in January and lose sight of it by March. When writing epics, scoping sprints, or reviewing priorities — keep asking: how does this connect to the goal? If the answer gets fuzzy, stop.

**Step 3: Express impact in the same unit as your goal.**
When prioritizing work, don't use abstract scores. If the goal is users converted, estimate impact in users converted. If the goal is revenue, estimate in revenue. Rough estimates are fine — the point is to maintain the connection to what actually matters, not to be precise.

---

## A note on practice-level alibi progress

The three questions above focus on whether the *work* is aligned. There's a related check worth running occasionally on the *practices themselves* — the rituals, ceremonies, and frameworks a team runs.

Ask: for each regular practice (OKR cycle, sprint reviews, discovery sessions, roadmap presentations), what problem is it solving, and for whom? Would the team notice if it disappeared?

If the answer to "would we miss it?" is no, that's worth naming. A practice being done correctly is not the same as a practice being worth doing. Teams can run textbook OKR seasons that produce goals nobody looks at, or discovery rituals that generate insights that never inform a decision. The form is right; the value isn't there.

This doesn't mean abandoning the practice — it means being honest about whether it's earning its place.

## Composition with other skills

Run this skill *before*:
- `strategy-doc` — if the audit reveals misalignment, fix the goal first, then write the strategy
- `prioritization-frameworks` — if impact estimates aren't in the same unit as the team goal, the scores will be meaningless
- `metrics-design` — the north star should be the goal that passed the one-step test

If the user is already using those skills and something still feels disconnected, this skill is the right diagnostic to run.

## Anti-patterns to flag

- **Confident answers that don't hold up under one follow-up question.** Push gently.
- **Blaming the org.** "We'd do better work if leadership had a clearer strategy." Maybe. But the audit is about what the team can do from where they sit — not waiting for the org to get better first.
- **Confusing busyness with impact.** A team shipping every sprint can still be in the death spiral.
- **Treating this as a one-time exercise.** Run it when something feels off, when the business environment changes, or when layoffs are in the air. It's a check, not a certification.
