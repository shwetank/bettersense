---
name: report-career-architect
description: Use when designing or revisiting a 12–18 month growth plan for one of the user's direct reports. Trigger phrases include "build a growth plan for [report]", "what should [name]'s next year look like", "I want to architect [report]'s path to senior", "I'm prepping for promo cycle and [report] needs a plan", "let's think about [report]'s development". Distinct from `one-on-one-prep` (per-meeting agenda) and from `coaching-mode` (the conversational layer). This is the *planning* layer — turning observations from `stakeholder-reflect` into a structured arc with concrete experiences, owners, and check-in cadence.
---

# Report Career Architect

Great managers don't just track their reports' work — they *architect* their growth. This skill turns the stakeholder-reflect file's accumulated observations into a 12–18 month plan: what the report is growing into, what experiences would close the gap, what concrete projects and exposure are missing.

The skill is a quarterly-ish exercise per report. Run it when:
- Hiring a new report (within first 60 days, design the first year).
- After a promotion (the new level needs a new plan).
- During the trough between promos when growth feels stalled.
- Pre-promo cycle (the architect plan should *predate* the promo case).
- When the report asks "what should I be working on next?"

## What this skill is *not*

- **Not a 1:1 agenda.** Use `one-on-one-prep` for per-meeting planning.
- **Not a coaching conversation.** Use `coaching-mode` for the dialogue with the report.
- **Not a promo packet.** Use `report-promo-case` when the time comes; the architect plan feeds it.
- **Not a PIP.** A growth plan assumes the report is performing; if they're not, use `performance-management`.

## Inputs to gather first

Before producing the plan, settle:

1. **Where the report is now.** Current level, scope, time in role, recent trajectory.
2. **Where they're growing toward.** Next level, lateral move, deeper specialization, manager track. Most managers can't articulate this for each report — *force* the user to.
3. **What the report has said they want.** This is where `stakeholder-reflect` entries (especially the `What are their career goals?` and `What do they want to achieve?` questions) compose in. If the user has the file, *read it first*.
4. **Time horizon.** 6 months / 12 months / 18 months. Default 12.
5. **What the user already thinks the report needs.** Surface this — the user has a strong prior; don't pretend they don't. The plan can update it, but start from honesty.

If the user is unclear on (2), pause: *"Without a target, this is a wishlist, not a plan. What's your read on where they should be in 18 months?"* If they truly don't know, that's a coaching conversation to have *with the report* (use `coaching-mode`) before architecting.

## The plan structure

Output a structured plan with these sections. Keep it short — one page is the right scale.

```
# Growth Plan: [Report] (next 12 months)

Current state:
- Level: [Sr Eng II]
- Time in role: [14 months]
- Recent trajectory: [strong delivery, growing influence in code review, untested in cross-team scope]

Target state (12 months out):
- [Staff Eng — demonstrated cross-team scope and one tech-lead engagement]
- [or: same level, deeper technical specialization in X]
- [or: ready for tech-lead role on a 2-3 person sub-team]

The gap (what closing it requires):
- [Specific capability 1: e.g. "owning a cross-team initiative end-to-end"]
- [Specific capability 2: e.g. "writing the technical strategy doc others align around"]
- [Specific capability 3: e.g. "mentoring a junior IC through a hard project"]

The plan (specific experiences, sequenced):
- Q1: [Specific project / scope / role they'll take on. What it forces them to do.]
- Q2: [...]
- Q3: [...]
- Q4: [...]

Manager moves (what *the user* will do):
- [Hand off [specific work] to create room]
- [Make the introduction to [stakeholder]]
- [Stop reviewing [type of decision] so they own it fully]
- [Be the one who says "go talk to X yourself"]

Risks / what could derail this:
- [Risk 1: e.g. "team's roadmap doesn't have a cross-team initiative. Mitigation: surface to skip-level."]
- [Risk 2: e.g. "report has been signaling burnout. Plan should include rest, not just stretch."]

Check-in cadence:
- Quarterly review of this plan (with the report)
- Monthly note in stakeholder-reflect file on progress
- Annual rewrite

Success criteria (what "growth happened" looks like at month 12):
- [Concrete behavioral or output anchor]
- [Concrete artifact they'll have produced]
- [Concrete piece of feedback the org will be giving]
```

## Forcing functions

The skill exists because most growth plans are wish-lists with no traction. These are the forcing functions that produce traction:

### 1. Specific experiences over abstract goals
- **Bad:** "Improve communication."
- **Good:** "Lead the design review for the migration project, including handling Sarah's likely pushback on scope."

A growth plan made of *projects* is actionable; a plan made of *qualities* is theater.

### 2. Manager moves are first-class
The user has to actively *make room* for the report's growth. List the specific things the user will stop doing, hand off, or get out of the way on. *Not* listing manager moves is the #1 reason growth plans fail — the report can't grow if the manager is still doing the work.

### 3. Sequence matters
Q1's experience should make Q2's possible. *"In Q1 they shadow the tech-lead role on the smaller initiative; Q2 they own the medium one with my support; Q3 they're the tech-lead on the big one without me in the room."* Skipping the staircase is how reports get set up to fail.

### 4. Risks named
Most growth plans assume the world cooperates. List what could derail it: roadmap doesn't have the right shape, the report's life events, attrition that pulls them back to firefighting, the user's own unwillingness to actually let go. Name it; mitigate it.

### 5. Success is observable, not felt
"At the end of 12 months, they will have [shipped X / written Y / received Z type of feedback / gotten an offer for the [role] from another team]." Force the user to write what success looks like *in the world*, not in feeling. Wishful plans without observable success criteria can't be evaluated honestly later.

### 6. The plan is shared, not done *to* the report
The plan should land in a 1:1 conversation, not arrive as an edict. The report should push back, edit, and own it. Use `coaching-mode` for that conversation. The plan you architect is a strong proposal; the plan that lives is the one the report agrees to.

## Storage

The plan lives in the report's stakeholder-reflect file at `~/voohy-work-reflections/managing-down/<slug>.md`, in a dedicated section:

```markdown
---
name: Priya Shah
slug: priya-shah
category: managing-down
role: Sr Eng II, joined Sep 2024
since: 2024-09-15
---

## Background
...

## Growth Plan (current — 2026-Q2 → 2027-Q1)

[Full plan structure as above]

---

# Reflections

[Existing per-question entries]
```

When updating, archive the previous plan inside the file (don't lose history) and write the new one above. Patterns over time across multiple plans are themselves signal — if the same gap shows up two cycles in a row, that's information.

## Operating principles

- **One plan per report, refreshed not rewritten.** The Q4 review updates the plan; doesn't start over.
- **The report's voice has to be in the plan.** The user is *architecting*, not dictating. Pull from `What are their career goals?` and `What do they want to achieve?` entries; surface gaps where the user's read and the report's stated goals diverge.
- **Pace matters as much as direction.** A growth plan that's all-stretch is a plan that ends in burnout. Build in periods of consolidation.
- **Underrepresented reports often have weaker growth plans, not because they don't deserve them but because their managers feel less confident architecting.** Notice this; over-invest in those plans, not under-invest.
- **The plan ages.** Re-read it every quarter; rewrite it every year. Plans that don't get touched become fiction.

## Anti-patterns to flag

- **Wishlist.** A list of "should improve at" with no projects, no sequence, no manager moves.
- **Plan without manager moves.** The user is invisible from the plan — meaning the report has to grow in spite of the user, not because of them.
- **Stretch with no consolidation.** Q1, Q2, Q3, Q4 are all bigger projects. Real growth has rhythm; consolidate gains, then stretch.
- **The promo plan disguised as a growth plan.** "12 months to staff" is an outcome target; *what they need to be different to operate at staff* is the plan. Confusing outcome with input is how managers set their reports up to be passed over.
- **Identical plans for two different reports.** If two reports have the same plan, the user isn't seeing them as individuals.
- **Architecting in isolation.** The plan that doesn't get to the report (or gets dropped on them as a directive) doesn't survive contact with reality.

## Composition with other skills

- **`user-profile`** — if `~/voohy-work-reflections/profile.md` exists, read it before drafting. The user's level and management context shapes pacing and plausibility (a first-time manager designs different growth plans than a Director with 10 years of management experience). The user shouldn't have to re-establish their own context every cycle.
- **`stakeholder-reflect` (managing-down)** — the source of accumulated observations the plan is built on. Read first.
- **`coaching-mode`** — for the conversation that lands the plan with the report.
- **`one-on-one-prep`** — quarterly 1:1 specifically to revisit the plan; integrate the review into the agenda.
- **`feedback-frameworks`** — when delivering the parts of the plan that name a gap the report needs to close.
- **`report-promo-case`** — when promo cycle comes, the architect plan is the foundation. A plan executed produces a strong case; a plan that wasn't followed produces a thin one.
- **`leadership-os` (Career Architect mode)** — the same principle, broader. This skill is the operational version.
