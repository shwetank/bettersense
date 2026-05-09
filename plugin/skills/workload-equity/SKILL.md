---
name: workload-equity
description: Use when the user wants to analyze whether non-promotable (glue) work is fairly distributed across their team, with attention to demographic and seniority patterns. Trigger phrases include "is our glue work fair", "who does the non-promotable work on our team", "audit workload distribution", "are women doing more glue work", "workload equity analysis", "non-promotable work allocation". Produces a fairness diagnosis with evidence, bias signals, and concrete redistribution recommendations. Manager-facing skill with sensitivity to privacy and psychological safety.
---

# Workload Equity Analysis

Diagnose whether non-promotable (glue) work is distributed fairly across a team, with attention to demographic patterns (gender, seniority, tenure) and role boundaries. This skill combines Tanya Reilly's "glue work" framework with the HBR research on volunteerism bias (women volunteer 48% more often for non-promotable tasks; managers ask women 44% more often) to surface equity risks and recommend concrete rebalancing actions.

**Output:** a private diagnostic report (`~/bettersense-work-reflections/workload-equity/<date>-team-<team>.md`) suitable for:
- Manager self-reflection before calibration/promotion cycles
- DEI committee review (anonymized)
- One-on-One discussions about role clarity and expectations
- Process design to make glue work visible and shared

## When to apply

Trigger this skill when:
- The manager suspects certain team members (often junior, often women/underrepresented) are over-volunteering for non-promotable work.
- Preparing for promotion Calibration and wanting to check whether glue credit is distributed fairly.
- Noticing that some engineers never get asked to do cross-team coordination, even though it's senior-level work.
- hearing complaints about "some people always take meeting notes" or "the same people always onboard hires."
- The team has high attrition among junior engineers who seem to get stuck doing only support tasks.
- The user wants to proactively audit before problems surface.

Skip when:
- The team is too small (< 4 people) — patterns are obvious without a formal audit.
- The team is in active crisis mode — address the fire first, equity later.
- The user has no visibility into team workload distribution (individual contributor without management scope).

## Prerequisites

Requires either:
- The user has already run `glue-audit` on the team (provides baseline inventory)
- OR the user has sufficient observational data to estimate team member activities (the skill will help gather it)

The skill will interview the user as a proxy observer; it does not directly access individual calendars or task systems.

## The interview flow

### 1. Scope definition
- "Which team are we analyzing? (Team name, size)"
- "Time period: last sprint, last quarter, or a specific project?"
- "Do you want team-wide patterns, or drill into a specific individual's workload?"
- "Anonymity preference: should names be redacted in the final report?"

### 2. Team roster
List team members with:
- Name (or pseudonym if anonymized)
- Level (junior, mid, senior, staff)
- Gender (user's perception; only if the user knows and is comfortable sharing — needed for bias signal)
- Tenure on team
- Role classification (IC, EM, TPM if applicable)

### 3. Glue work inventory per person
For each team member (or for the team as a whole if doing aggregate), prompt:
- "What glue tasks has [person] done in the last [period]?"
- Use the glue-audit taxonomy categories as prompts.
- Estimate frequency/time: "Roughly how many hours per week did they spend on each?"
- "Was this task officially part of their role, or extra?"

If the user doesn't know exact numbers, the skill accepts estimates: "high/medium/low" or "many/some/few."

### 4. Core work check
For comparison, ask:
- "What are each person's *core* deliverables in this period? (Features shipped, projects completed, code written)"
- This contrast is critical: glue looks bad if the person is also neglecting core work; glue looks like exploitation if core work is strong.

### 5. Visibility & credit
For each glue item, ask:
- "Who knows this person did this work? (Just the recipient? Their manager? The team?)"
- "Was this work called out in performance reviews, team retros, or promotion packets?"
- "If this work stopped, who would notice?"

### 6. Volunteering vs. assignment
For tasks that recur:
- "Did [person] volunteer, or were they asked/assigned?"
- Capture narrative examples: *"In the April retro, who said 'I'll take the onboarding' vs. 'We need someone to own onboarding — [person], can you?'"*

### 7. Fairness signals
The skill looks for red flags:
- **Single-point dependency:** One person is the only one who knows X (bus factor 1 on glue).
- **Task ghettoization:** Certain tasks (note-taking, admin logistics) always fall to the same person(s).
- **Credit mismatch:** Person does the work, someone else gets visibility/credit.
- **Career penalty risk:** Person doing glue has slower code output or missed promotion.
- **Demographic clustering:** Women/junior staff disproportionately doing support/coordination.

### 8. Optional: one-on-one reflection check
If the user is the manager of these folks, prompt:
- "What have you asked each person to do in the last quarter?"
- "What have you *not* asked certain people to do, even though it's senior-level work?"
- "Have you explicitly said 'this is not your job' to glue requests landing in someone's Slack?"

## Output structure

```markdown
---
team: [team name]
period: [date range]
analyst: [user name, role]
anonymized: true | false
---

# Workload Equity Audit — [Team]

## Executive summary
- Team size: N
- Glue work distribution: [description]
- Notable patterns: [e.g., "Women do 62% of team glue; men do 38%"]
- Risk level: low / medium / high
- Top 3 redistribution opportunities

## Per-person breakdown

| Person | Level | Gender | Core work (output) | Glue hrs/wk | Glue type | Visibility | Promotion risk |
|---|---|---|---|---|---|---|---|
| Alice | Senior F | F | Shipped auth service | 12 | onboarding, design review | team | Medium (glue not counted) |
| Bob | Senior M | M | Shipped billing pipeline | 2 | occasional PR review | high | Low (code counts) |
| ... | ... | ... | ... | ... | ... | ... | ... |

## Patterns identified

### Pattern 1: [Name, e.g., "Women over-volunteer"]
- **Evidence:** Alice (F, Sr), Carol (F, Mid), Dana (F, Jr) collectively 68% of team glue hours.
- **Possible drivers:** April retro: "We need someone to take onboarding" → Alice immediately said "I'll do it." No men volunteered. HBR study shows this pattern普遍存在.
- **Risk:** These engineers may stall at promotion because glue work crowds out core work and is undervalued.

### Pattern 2: [Name, e.g., "Single-point dependency glue"]
- **Evidence:** Only Alice knows the onboarding process; only Bob knows the deployment rollback procedure (but that's core infra).
- **Risk:** Bus factor; burnout; unfair if Alice leaves, team struggles.

### Pattern 3: [Name, e.g., "Seniors avoid process glue"]
- **Evidence:** Senior men do almost no "process improvement" or "team health" tasks; those fall to junior women.
- **Risk:** Senior work not modeled as ownership; culture work invisible in promotions.

### Pattern 4: [Name, e.g., "Glue not counted in promotions"]
- **Evidence:** Last promotion packet for senior engineer emphasized code output; design review and mentorship mentioned but down-weighted.
- **Risk:** System reinforces code-only path; glue-doers penalized.

## Recommendations

### Immediate (this sprint)
- **Rotate onboarding:** Assign next new hire to Bob (Senior M) with Alice as backup; Alice's time freed → 8 hrs/week for core project
- **Public credit:** Call out design-review contributions in team meeting; link to incident avoidance
- **Task assignment protocol:** For any non-trivial glue task, manager explicitly assigns rather than waiting for volunteers

### Short-term (next quarter)
- **Update team working agreement:** "Glue work is real work; we track it in our project board"
- **Promotion rubric alignment:** Ladder dimension "Team Multiplier" explicitly includes onboarding, design review, mentorship
- **Calendar protection:** Block recurring glue time (e.g., "design review block" Tuesdays 10–12) so it's visible and bounded

### Long-term (6 months)
- **Glue rotation schedule:** Create a shared ownership model; no one owns a glue category exclusively
- **Promotion packet examples:** Collect successful promo cases where glue work was central; share with team
- **Manager bias check:** Before asking someone to take a glue task, ask: "Would I ask a man/white engineer/ senior person to do this?"

**If the user is the glue overload person themselves (self-audit revealed they're the sole owner of 3 categories):**
- Immediate plan: Declare a "glue holiday" for 2 weeks — do not volunteer for any non-core task; let gaps surface
- Schedule a 1:1 with manager: present audit findings, request explicit reassignment of at least 2 glue categories to others
- Set calendar: "Core work blocks" protected; auto-decline meeting invites during those blocks

## Manager guidance section

[Separate section addressed to the user in their manager capacity]
- Psychological safety: this analysis is for system improvement, not individual performance review
- How to present findings to the team without shaming
- How to introduce "glue work is work" into team rituals (retro, planning)
- Rebalancing as career development: giving junior engineers leadership opportunities through structured glue ownership
- Tracking: add glue tasks to project management board like any other work item

## Operating principles

- **Privacy-protective.** Anonymized mode by default if shared; named only if user opts in.
- **Bias-aware but not accusatory.** Surface patterns as "system signal" not "person fault."
- **Action-oriented.** Diagnosis without redistribution plan is just guilt. Always include specific next steps.
- **Link to promotion.** The equity argument is stronger when tied to career impact: "Alice's glue work is senior-level, but our ladder doesn't recognize it — that's a ladder problem or a redistribution problem."
- **Respect core work.** Glue is valuable, but if a person's primary deliverables are suffering, redistribution may need to include offloading, not just sharing.

## Composition with other skills

- **`glue-audit`** — uses its inventory as raw input
- **`promo-case-glue`** — shares artifacts; equity diagnosis supports promotion narrative
- **`manage-glue-workers`** — the redistribution plan becomes the execution instruction for that skill
- **`team-diagnosis`** — this skill is a focused input into that broader health check

## Anti-patterns to flag

- **Naming and shaming.** Never recommend publishing named individual data without explicit opt-in. Use pseudonyms initially.
- **Ignoring core work.** An equitable distribution of glue is meaningless if the team misses all its deliverables. Balance.
- **Assuming intent.** Don't accuse managers of bias; present the pattern and ask if they want to investigate drivers.
- **One-and-done.** Equity is ongoing; recommend quarterly re-audit cadence.
- **Over-counting.** Some glue is genuinely promotable; don't treat all non-code work as "trash." Quality of glue matters (strategic alignment matters more than scheduling meetings).
