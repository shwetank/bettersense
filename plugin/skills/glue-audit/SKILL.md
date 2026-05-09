---
name: glue-audit
description: Use when the user wants to systematically identify, categorize, and quantify "glue work" (non-core technical activities like onboarding, documentation, unblocking, cross-team alignment, process improvement) on themselves or their team. Trigger phrases include "what glue work am I doing", "audit my glue work", "what non-promotable work is our team doing", "catalog our glue tasks", "how much time do we spend on glue", "map our glue work". Produces a structured inventory with time estimates, promotion-value assessment, and fairness analysis. Especially useful before promotion cycles, workload rebalancing, or role-transition decisions.
---

# Glue Work Audit

Identify, categorize, and make visible the glue work on a team or for an individual. Glue work is essential non-core technical work that makes projects succeed but is often invisible, uncounted, and non-promotable in traditional engineering ladders: onboarding, documentation, design review, unblocking teammates, cross-team alignment, process improvement, roadmap curation, incident coordination, mentorship, interviewing, and the endless coordination that holds complex projects together.

This skill produces a structured inventory suitable for:
- Promotion packet evidence (framing glue work as technical leadership)
- Workload equity analysis (fair distribution across team members)
- Managerial interventions (redistributing non-promotable work)
- Personal career decisions (understanding time allocation before role-change choices)

## When to apply

Trigger this skill when the user:
- Is preparing for a promotion cycle and needs to frame their glue work as promotable technical leadership.
- Manages a team and wants to audit who is doing what non-core work (to prevent burnout and unfair credit distribution).
- Feels they're doing "too much glue" and wants a quantified picture before a career conversation.
- Wants to understand the team's glue work profile before redistributing tasks.
- Is deciding whether to stay on the IC track or move to management/TPM and needs to see what skills they've actually built.
- Notices certain people (often junior, often women and underrepresented groups) consistently volunteering for non-promotable work.

Skip when:
- The user just wants to log a single win (use `wins-log` instead).
- The user is mid-crisis and needs tactical unblocking (this is strategic/reflective work).
- The team is clearly under-resourced and needs hiring, not rebalancing (but still run this first to make the case).

## The audit scope

The skill asks: **whose glue work?** Three modes:

- **Self-audit** — catalog your own glue tasks over the past 30–90 days.
- **Team audit** — map glue work across a team (requires the user to know or estimate team member activities).
- **Role-based audit** — "If I become a [manager/TPM/ staff engineer], how much of my current glue work becomes core vs. non-promotable?"

## Glue work taxonomy

Use Tanya Reilly's classic categories (from her "Glue Work" talk) as the primary classification:

1. **Onboarding & mentorship** — ramping new hires, pairing, docs, mentor matching
2. **Documentation** — ADRs, runbooks, architecture decision records, internal wikis, API docs
3. **Design review & quality gate** — catching handwaves, blur words, missing edge cases in design docs
4. **Cross-team alignment** — meetings that resolve ambiguity between teams, email chains of doom interruption, shared understanding emails
5. **Process improvement** — coding standards, testing guidelines, launch checklists, retrospectives that yield change
6. **Unblocking** — helping others get unstuck, finding information buried in Slack/email, breaking logjams
7. **Roadmap & planning** — keeping the roadmap current, scoping work, clarifying priorities
8. **Incident & postmortem coordination** — stabilization, blameless reviews, action item follow-through
9. **Stakeholder management** — customer support escalations, exec updates, status crafting
10. **Hiring & interviewing** — loops, debriefs, rubric design, calibration
11. **Team health & culture** — spotting burnout, facilitating retro, improving psychological safety
12. **Diversity, equity & inclusion work** — ERG leadership, inclusive hiring, Fair Chance initiatives (often invisible and extra)

## The interview flow

### 1. Set scope
- "Are we auditing you individually, the whole team, or a specific role/project?"
- "Time window: last 30 days, last quarter, or a specific project?"
- "Do you want time estimates (hours spent) or just a task inventory?"

### 2. Brainstorm tasks
Walk through a typical week/month and surface glue activities. Prompt by category:
- "Who's onboarding right now? What are you doing to help?"
- "What design reviews are you on? What do you actually contribute?"
- "How many Slack channels do you monitor for other people's blockers?"
- "What processes did you improve in the last quarter?"

If team audit: ask for each teammate's likely glue allocation.

### 3. Categorize & tag each item
For each task, capture:
- **Name** (short, specific)
- **Category** (from taxonomy above)
- **Frequency** (daily/weekly/one-off)
- **Time estimate** (hours per week, or rough fraction: 10%, 20%)
- **Core vs. glue** — is this part of the user's *official* job description and promotion rubric? Or is it "above and beyond"?
- **Visibility** — who knows this work happens? (manager, team, org, only the recipient)
- **Promotable?** — does the company's engineering ladder recognize this as senior/staff-level work? (T/F/partial)

### 4. Quantify & surface patterns
- Total hours/week spent on glue vs. core
- Distribution across team members (for team audits)
- Which categories dominate
- Visibility gaps (high-impact glue nobody sees)
- Gender/junior bias markers (if user admits to patterns: "women always take meeting notes")

### 5. Output structure

The skill writes `~/bettersense-work-reflections/glue-audits/<date>-<scope>.md` with:

```markdown
---
subject: glue audit
scope: self | team | role
auditee: [name or team name]
period: [date range]
---

# Glue Work Audit — [scope description]

## Summary
- Core work time: ~X hrs/week (X%)
- Glue work time: ~Y hrs/week (Y%)
- Top glue categories: [list ranked]
- High-visibility glue: [items]
- Invisible glue: [items]
- Promotable fraction: [estimate]

## Inventory

| Task | Category | Freq | Hours/wk | Core? | Visible? | Promotable? |
|---|---|---|---|---|---|---|
| Onboarding new hire Priya | Onboarding | one-off | 8 | no | team | partial |
| Weekly design reviews | Design review | weekly | 4 | no | team | yes |
| Cross-team alignment email threads | Cross-team | daily | 3 | no | low | no |
| ... | ... | ... | ... | ... | ... | ... |

## Patterns & flags
- [Concern: X spends 40% on glue, all invisible]
- [Opportunity: move Y's onboarding task to team rotation]
- [Bias signal: all women on team do the meeting notes]
- [Promotion risk: Z's glue is mostly non-promotable by current ladder]

## Manager actions suggested
- [Specific redistribution ideas]
- [Visibility amplification: what to highlight in review]
- [Ladder update needed: add X as senior-level behavior]
```

## Operating principles

- **Quantify, don't just list.** A list feels qualitative; hours/week forces honest accounting.
- **Separate "should" from "is."** Don't moralize; just describe. This is a diagnostic, not a judgment.
- **Name invisible work.** The point is to surface the tasks nobody notices.
- **Fairness lens.** If certain people routinely take non-promotable work, surface it as an equity risk.
- **Tie to promotion criteria explicitly.** "Promotable?" must reference the user's actual company ladder (available in the user profile if they filled it).
- **Respect privacy.** The audit file is saved privately like other reflection files — not for sharing unless the user chooses.
- **User owns the output.** The skill generates the structure; the user populates it from memory/observation. Don't invent numbers.

## Composition with other skills

- **`report-promo-case`** — once an audit is done, feed the "glue inventory" section as evidence; link both files.
- **`manage-glue-workers`** — the audit is the diagnostic input; manage-glue-workers prescribes interventions.
- **`user-profile`** — read the user's role/level to evaluate "core vs. glue" and "promotable?" fields accurately against the right ladder.
- **`wins-log`** — glue tasks that produced visible outcomes should be logged as wins with the "leadership" or "impact" type.

## Anti-patterns to flag

- **Audit as weapon.** Don't use this to shame people for "not doing enough glue." The point is system fairness, not individual blame.
- **Rigid definitions.** If the user's company officially counts design review as core work, respect that — the "core vs glue" question is organization-specific.
- **Analysis paralysis.** Users can spend weeks perfecting the audit; prod them to act on it within a sprint of finishing.
- **Sharing without consent.** Never suggest posting team audit results publicly without explicit user permission — it could single people out.
- **Expecting perfect data.** Estimates are fine. The skill's value is directional, not forensic.
