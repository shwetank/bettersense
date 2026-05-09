---
name: team-check-in
description: Use when a team needs to regularly revisit their Goals/Roles/Norms foundation to surface drift and realign. Trigger phrases include "team check-in", "are we still aligned", "team retro on our operating model", "review our team charter", "3X3 check-in". Facilitates a structured conversation (30–90 min) that answers: Are we still committed to our stated goals/roles/norms? If not, what's the gap and how do we close it? The second step of Moussa's 3X3 framework. Works from an existing team charter (from team-charter) or surfaces foundations de novo if none exist.
---

# Team Check-In

Structured recurring conversation to revisit a team's **Goals, Roles, and Norms** — the three foundations from Moussa's 3X3 framework. Answers: Are we still committed to what we said? If not, what's the gap between what we say and what we do? (The "Check-In" step)

**Purpose:** Surface drift before it derails the team. Teams naturally diverge from their initial agreements due to new information, new members, changing priorities, or unexamined habits. Check-ins make drift visible and create space to course-correct.

## When to apply

Trigger this skill when:
- It's time for the team's regular alignment cadence (every 4–6 weeks)
- The team feels misaligned but can't pinpoint why
- New member joined — needs to understand the team's operating model
- Goals seem to be shifting without explicit conversation
- Someone raises: *"Wait, I thought you were doing that"* or *"That's not what we agreed"*
- After a major external change (org reorg, strategy pivot, product launch)
- The team charter exists but is stale

Skip when:
- The team meets for the first time (use `team-charter` first instead)
- The team is in active fire-fighting mode (use `incident-responder` type skills first)
- There are only 1–2 people on the "team" (overhead > value)

## The three-part agenda (3X3 check-in)

Total time: 60–90 minutes for a 6-person team. Shorter for smaller teams.

### Part 1: Review current state (15 min)
Start with reality, not aspiration.

- **Read the current charter** (if one exists). "When did we create this? What were we trying to do?"
- **Surface what's changed since then:**
  - New information learned
  - New constraints (budget, timeline, dependencies)
  - Team composition changes (joins, leaves, role shifts)
  - External environment shifts (market, competitive, org strategy)
- **Quick pulse check:** On a 1–5 scale, how aligned do we feel on:
  - Goals: Are we all pulling in the same direction?
  - Roles: Is ownership clear? Any duplication or gaps?
  - Norms: Are we working together effectively or fighting the process?

If scores are high (4–5) and no major changes, the check-in can be a brief sync (15 min). If scores are low (≤3) or changes are significant, proceed to full exploration.

### Part 2: Diagnose gaps (25–40 min)
For each of Goals, Roles, Norms, surface specific places where stated ≠ actual.

**Goals gap diagnosis:**
- "What are we actually spending time on? Does it match the stated goals?"
- "What's competing for our attention? Are those things in our goals?"
- "Are our metrics still the right ones? Are we optimizing for the wrong thing?"
- "Do we all agree on priority order? Or are we pulling in different directions?"

**Roles gap diagnosis:**
- "Where are we stepping on each other's toes?"
- "What work is falling through the cracks? Whose job should it be?"
- "Is anyone doing work outside their role without agreement?"
- "Are decisions getting made in the right places? Or bottlenecked?"
- "Are we using people's strengths appropriately?"

**Norms gap diagnosis:**
- "What's driving us crazy about how we work together?"
- "Which meetings feel wasteful? Which are missing?"
- "How are we handling conflict? Is it healthy or toxic?"
- "Are we sharing information enough? Too much?"
- "Are our communication expectations clear and followed?"

**Technique:** Anonymous input collection first (everyone writes 1–2 bullet points per foundation privately, then shares round-robin). Prevents the loudest voice setting the agenda.

### Part 3: Close the gaps (20–30 min)
For each identified gap, decide: **Do we fix it, or do we intentionally live with it?**

Not every gap needs closing. Some are unavoidable. But they must be *explicitly* accepted.

For gaps to close:
- **Define the specific behavior change.** "We should communicate better" → "We will post project status updates in #proj-updates every Friday by 3pm."
- **Assign an owner.** Every action item gets a single named owner.
- **Set a target date.** Small steps, not revolutions.
- **Keep it small.** One concrete change per gap, not five. Better to change one thing fully than five partially.
- **Make it observable.** "Improve meeting quality" → "All recurring meetings will have an agenda posted 24h in advance and decisions documented in the meeting notes."

For gaps to live with:
- Name the trade-off: *"We're not documenting everything because speed matters more than completeness right now. We accept that tax."*
- Set a review date: *"We'll revisit this in 3 months and see if it's still the right trade-off."*

**Output:** A short list of action items (2–4 items max), each with:
- What change
- Who owns it
- By when
- How we'll know it's done

These action items are tracked separately (could go into a team action tracker or the wins log for the team lead).

## Running the check-in

The skill provides:
- **Sample agenda** with timings
- **Anonymous input template** (for teams that prefer written first)
- **Follow-up email template** summarizing decisions and action items
- **Escalation guidance** if the team can't agree on a fix

### Suggested cadence
- **New teams:** every 2 weeks for first 2 months, then monthly
- **Stable teams:** every 6 weeks
- **High-change teams:** every 2–4 weeks
- Link to `/schedule` to automate reminders

### Virtual teams adaptation
For distributed teams, emphasize:
- Async input collection (everyone contributes before the call)
- Video on for relationship building
- Shared doc for real-time note-taking
- Extra time for reading the room (no body language cues)

## Facilitation tips the skill gives

- **Start with appreciation:** "What's going well?" before diving into gaps — sets constructive tone
- **Name the pattern, not the person:** "We're not posting meeting notes" not "You never post notes"
- **Timebox each section:** Use a timer; avoid over-discussing minor issues
- **End with clear action items and owners:** No meeting without clear next steps
- **Rotate facilitator:** If possible, rotate who runs the check-in to build ownership
- **Archive decisions:** Keep a changes log in the charter file

## Operating principles

- **Small steps, not revolution.** Close one gap at a time; iterative improvement compounds
- **Data-informed, not opinion-only.** Look at actual behavior (meeting attendance, Slack activity, PR patterns) before diagnosing
- **Owners, not just agreements.** Every change needs a single named owner (not "the team")
- **Link to the charter.** Always reference the written charter; if it's wrong, update it
- **Psychological safety prerequisite.** If team members fear speaking honestly, fix safety first (see `psychological-safety` skill)
- **Not a retrospective.** Retros look back at past work; check-ins look forward at team health and alignment
- **Not a status meeting.** This is about *how* the team works, not *what* the team is doing

## Composition with other skills

- **`team-charter`** — prerequisite for teams that have never done this; check-in reads charter each time
- **`team-diagnosis`** — complement: diagnosis gives quantitative read; check-in gives qualitative narrative
- **`read-the-room`** — use after check-in if subtext revealed: "Why did Alice go quiet when we discussed roles?"
- **`coaching-mode`** — if the team leader needs to coach a member on their role or behavior post-check-in
- **`psychological-safety`** — if check-in reveals safety issues, run this skill to address them
- **`stakeholder-reflect`** — if the check-in surfaces issues with external stakeholders, log them individually

## Anti-patterns to flag

- **Checking in without a charter.** "What are our goals?" every meeting is exhausting. Charter first.
- **Going deep on one foundation, ignoring others.** Balance all three in each check-in, even if briefly.
- **No follow-through.** Action items assigned but not tracked → trust erosion
- **Leader dominates.** Manager sets all goals/roles/norms alone → no buy-in
- **Infrequent cadence.** "We'll check in quarterly" → drift goes unchecked for months
- **Treating it as a performance review.** Check-in is about system health, not individual performance evaluation
- **Acquiescing to loudest voice.** Use structured round-robin or anonymous input to ensure all voices

## Trigger phrases the skill recognizes

- "Let's do a team check-in"
- "Are we still aligned on goals/roles/norms?"
- "We need to reset how we work together"
- "Our team charter is stale"
- "Let's review our operating agreement"
- "3X3 framework check-in"
- "Team alignment meeting"
