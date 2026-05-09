---
name: team-close-gap
description: Use when a team has identified a gap between stated goals/roles/norms and actual behavior, and needs concrete, small-step action plans to close it. Trigger phrases include "close the saying-doing gap", "how do we actually change our behavior", "action plan for team norm change", "small steps to improve team work", "bridge the intention-behavior gap". The third step of Moussa's 3X3 framework: closes the gap between what the team says it wants to do and what it actually does, through targeted small steps with environmental support. Works best after a team-check-in or team-charter session that has surfaced specific gaps.
---

# Team Close the Gap

Help a team translate identified alignment gaps (from goals, roles, or norms) into **small, targeted behavioral changes** with clear owners, environmental support, and progress tracking. This is the "Close" step in Moussa's 3X3 framework.

## Key insight from the research

High-performing teams don't close gaps through grand resolutions or sweeping changes. They close them through **small, targeted steps** that are:
- **Specific:** What exactly changes? (behavior, not aspiration)
- **Small:** One change at a time; doable in 2–3 weeks
- **Environmental:** The team changes its surroundings to support the new behavior (removing friction, adding cues)
- **Realistic:** Based on current capacity, not ideal future state
- **Tracked:** Progress is visible; success is measurable

The skill embodies the "realistic optimist" mindset: think ahead about what can get in the way, and design the environment to make the new behavior easier than the old.

## When to apply

Trigger this skill when:
- A team check-in or charter session has surfaced 1–3 specific gaps ("We communicate poorly," "Decisions bottleneck at Alice," "We don't follow through on commitments")
- The team has committed to change but keeps falling back into old patterns
- A new norm or process was introduced but adoption is uneven
- The team complains about a problem but no one takes action to fix it
- A manager wants to move the team from discussion to execution on cultural/operational change
- The user says: *"We keep saying we'll do X but we never actually do"*

Skip when:
- The gap is a one-time missed deliverable (that's a delivery issue, not a behavioral norm issue)
- The team is unwilling to admit the gap exists (requires buy-in first)
- The gap requires major structural change (role re-org, significant process overhaul) — those are projects, not small steps

## The closure process

### Step 1: Gap specification (5–10 min)
Convert vague gap ("our communication is bad") into a specific, testable statement.

**From vague to specific:**
- Vague: "We need better communication"
- Specific: "We need to reduce repeat questions in Slack by centralizing project updates in one channel"

**Template for each gap:**
```
Current state: [observable behavior today]
Desired state: [observable behavior we want]
Gap: [what's different?]
```

Example:
- Current: Design decisions made in side conversations, then presented as fait accompli in team meeting
- Desired: All design decisions discussed in the dedicated design-review channel first, with explicit DRI
- Gap: No shared visibility into decisions before they're announced; limited opportunity for input

### Step 2: Identify the smallest possible change (10–15 min)
Ask: *"What's the smallest thing we could do that would move us from current to desired?"*

Rules for small steps:
- **One behavior change per step** (not three)
- **Observable and binary** (either it happened or it didn't)
- **Time-bound** (try it for 2–3 weeks, then review)
- **Reversible** if it doesn't work (easy to stop)

Examples:
- Not: "Improve meeting quality" (too big)
- Instead: "All recurring meetings will post an agenda 24h in advance" (one behavior, clear yes/no)
- Not: "Be better about documentation"
- Instead: "The DRI for each project updates the project doc every Friday by 4pm" (one behavior, clear owner, clear cadence)

### Step 3: Environmental design (10–15 min)
What in the environment enables the old behavior and disables the new? Change the environment to support the new norm.

**Environmental levers:**
- **Remove friction from new behavior:** Template, automation, default locations
- **Add friction to old behavior:** Remove shortcuts, require extra steps to continue old way
- **Add cues/reminders:** Calendar event, Slack reminder, checklist item
- **Change physical/virtual layout:** Move channels, rename folders, change meeting titles
- **Social proof:** Public commitment, visible tracker, team sign-off

Example:
- Gap: "Decisions made in private, then announced"
- Small step: "All design discussions happen in #design-review channel, not DMs"
- Environmental support: Create the channel if it doesn't exist; post a pinned message explaining the norm; manager periodically scans for side-channel design discussions and redirects them to the channel

### Step 4: Owner and success criteria (5 min)
- **Owner:** Single named person accountable for the change (not "the team")
- **Success criterion:** How will we know after 2–3 weeks that this worked? What evidence?
  - Binary: "100% of recurring meetings had agenda 24h in advance"
  - Metric: "Average time from decision to documentation drops from 3 days to same-day"
  - Qualitative: "Retro survey shows 80%+ team feels 'more in the loop'"

### Step 5: 2-week follow-up plan (5 min)
- **Check-in date:** Mark calendar for 2 weeks from now
- **Quick pulse:** At check-in, ask: "Did the change happen? Was it helpful? Adjust or adopt?"
- **If failed:** Diagnose why — was the step too big? Environment still favors old behavior? Owner blocked? Then design a smaller step or better environmental support.
- **If successful:** Make it permanent. Consider adding a second small step to deepen the change.

## Output format

The skill produces a `team-gap-closure-plan.md` (or appends to the team charter's changelog):

```markdown
## Gap closure plan — [date]
**Gap:** [specific gap statement]

**Small step (next 2–3 weeks):**
- [single, observable behavior change]

**Environmental support:**
- [how we'll make this easier than the old way]

**Owner:** [name]
**Success criterion:** [how we'll know it worked]
**Review date:** YYYY-MM-DD
**Status:** in-progress | done | failed | adopted
```

Multiple gaps = multiple such blocks, but limit to 2–3 concurrent changes max.

## The realistic optimist approach

The skill constantly checks optimism with reality:
- **What could get in the way?** (Ask the team to name obstacles before starting)
- **Is this step small enough that failure is unlikely?** If not, break it down further
- **Does the owner have capacity?** If they're overloaded, re-assign or defer
- **Is the environment actually changing?** If not, the old behavior will persist

If a step fails, the skill doesn't let the team blame the owner. Instead: *"What about the environment or the step design made this hard? How can we adjust?"*

## Examples from the field

**Gap:** "We don't follow our own decision-making process"
- **Current:** Decisions made in DMs, announced in meetings
- **Desired:** All decisions have a proposal doc, comments collected, decision recorded
- **Small step:** "For the next 2 weeks, every decision must have a 1-paragraph proposal posted in #decisions at least 24h before it's announced"
- **Environmental support:** Create #decisions channel, pin guidance, manager monitors and redirects non-compliant decisions
- **Owner:** EM
- **Success:** 8/10 decisions in the period follow the pattern

**Gap:** "People interrupt each other in meetings"
- **Current:** Dominant voices talk over others, quieter people shut down
- **Desired:** Everyone gets airtime; debate is structured
- **Small step:** "In weekly team meeting, use raised-hand feature in video call; facilitator calls on people in order"
- **Environmental support:** Update meeting template to include hand-raising protocol; assign rotating facilitator
- **Owner:** rotating facilitator role
- **Success:** No interruptions observed in 3 consecutive meetings (retrospective check)

**Gap:** "Design reviews are superficial"
- **Current:** Reviews rubber-stamp; big issues found after build
- **Desired:** Deep design critique before implementation
- **Small step:** "All design docs must have at least 2 explicit 'questions for reviewers' listed; reviewers must answer at least one"
- **Environmental support:** Template update; design doc submission blocked without questions section
- **Owner:** Tech Lead
- **Success:** Every design doc has questions section; at least one substantive comment per reviewer

## Relationship to other skills

- **Preceded by:** `team-check-in` (diagnoses the gap) or `team-charter` (sets initial targets)
- **Followed by:** Another `team-check-in` in 2–3 weeks to review the closure attempt
- **Connected to:** `wins-log` — successful gap closures are team-level wins worth capturing
- **Contrast with:** `performance-management` (individual behavior change) vs. this skill (team/system behavioral change)

## Anti-patterns to flag

- **Too many changes at once.** Limit to 1–3 concurrent gap closures per team
- **Vague success criteria.** "Better communication" can't be measured; require specific behavioral evidence
- **Ownerless changes.** "The team will..." → no accountability
- **Ignoring environment.** Trying to change behavior without changing the enabling/impeding conditions
- **One-and-done.** No follow-up check — change doesn't stick without reinforcement
- **Grandiose steps.** "Revamp our entire design process" — that's a project, not a small step
- **Blaming after failure.** Focus on "what about the step or environment was wrong" not "who failed"
