---
name: team-charter
description: Use when forming a new team, resetting an existing team after a reorg, or when a team's goals/roles/norms are unclear and causing friction. Trigger phrases include "create a team charter", "align our team on goals roles norms", "reset the team operating model", "new team kickoff", "team alignment workshop". Facilitates explicit conversation on the three foundations from Mario Moussa's 3X3 framework (Goals, Roles, Norms) and produces a living charter document stored at ~/bettersense-work-reflections/team-charters/<team-slug>.md. Especially useful for new product teams, new management layers, or after major org changes.
---

# Team Charter

Create or refresh a team's explicit agreement on their **Goals, Roles, and Norms** — the three foundations Moussa identifies as necessary for high-performance teams. This skill facilitates the "Commit" step of the 3X3 cycle.

The output is a living `team-charter.md` file that serves as both a alignment artifact and a reference for future check-ins (via `team-check-in`). The charter is not a static document — it's revisited regularly to surface drift and course-correct.

## When to apply

Trigger this skill when:
- Forming a new team (new product, new group of people, new leader)
- Starting a new major initiative or project with a dedicated team
- The team is experiencing confusion about who does what, or decision rights are unclear
- Goals feel misaligned across team members
- Team norms are implicit, inconsistent, or causing friction (meeting etiquette, communication, decision-making)
- After a reorg — new members, new reporting lines, new scope
- Before a performance cycle or major review, to make expectations explicit
- The user says: *"We keep arguing about who owns X"* or *"I don't know what success looks like for this team"*

Skip when:
- The team is a brief, ad-hoc group completing a single very small task (charter overhead > task value)
- The team is in active crisis mode — stabilize first, charter later
- The user just wants a generic template without the facilitated conversation

## The 3X3 foundations

The skill walks the team through each foundation with structured questions, pushing for specificity and explicit trade-offs.

### Goals
- **What is the team's mandate?** One-sentence purpose statement
- **What are we trying to achieve?** 2–4 specific goals or outcomes (SMART if possible)
- **What does success look like in 3/6/12 months?**
- **What are we explicitly NOT working on?** (scope boundaries)
- **Who are our key stakeholders and what do they need from us?**
- **How will we measure our progress?** (leading/lagging indicators)

### Roles
For each role on the team (not just job titles — functional responsibilities):
- **Role name:** e.g., Tech Lead, Product Lead, PM, EM, TPM, Individual Contributors
- **Accountabilities:** What decisions does this role own? What outputs is this role responsible for?
- **Decision rights:** What decisions can this person make unilaterally? What requires consultation? What requires group agreement?
- **Dependencies:** What does this role need from others to succeed?
- **Escalation path:** When stuck, who does this role escalate to?

Crucial question: *"Is there any work that needs to be done that no one currently owns?"* — identify and assign.

### Norms
How the team works together:
- **Communication:** Preferred channels (Slack/email/meeting), response time expectations, meeting hygiene (agenda, notes, decisions)
- **Decision-making:** How are decisions made? (Consensus? Consultative? Decider after input?) What kinds of decisions are which type?
- **Conflict:** How do we handle disagreement? Is debate encouraged? How do we depersonalize conflict?
- **Meeting rhythms:** What recurring meetings exist? What's their purpose? Who must attend? What's the readahead?
- **Information sharing:** What gets shared with whom? Transparency expectations
- **Workload & availability:** How do we signal overload? How do we handle competing priorities?
- **Feedback:** How and when do we give each other feedback? Formal vs informal
- **Learning & growth:** How does the team support skill development? Pairing? Tech talks?

**Important:** The skill asks the team to explicitly name their norms rather than accept generic best practices. "We have a no-meeting Friday" is a norm. "We value transparency" is too vague — "We post major decisions in #team-updates within 24 hours" is concrete.

## The interview flow

The skill interviews the user (usually the team lead or manager) but designs the conversation for the whole team to participate.

### Phase 1: Context setting
- "What's the team's name and purpose?"
- "Who are the members? (names, roles, tenure)"
- "Is this a brand-new team, or are we refreshing an existing charter?"
- "What prompted this charter conversation now? (pain points to address)"

### Phase 2: Goals conversation
Prompt the user to gather input from all team members (the skill helps the user facilitate this):
- "Let's draft a one-sentence team purpose. What are 3–5 wording options? Which resonates?"
- "What are our top 2–3 goals this quarter? Make them specific and measurable."
- "What's in scope vs out of scope? What are we saying no to?"
- "How will we know we're succeeding? What metrics/outcomes?"
- "Who depends on us? Who do we depend on?"

### Phase 3: Roles conversation
- "List each role on the team. For each: what are the top 3 accountabilities?"
- "Are there decision rights that are ambiguous? Map: who decides what?"
- "What work is falling through the cracks? Who needs to own it?"
- "Are there role overlaps causing conflict? Clarify boundaries."
- "Is anyone doing work that isn't in their role but should be documented as a responsibility?"

### Phase 4: Norms conversation
Present a menu of common norm categories and have the team choose which to specify:
- Meeting norms (agendas, decisions in writing, camera-on policy)
- Communication norms (Slack response time, email vs. meeting)
- Decision rights (what needs consensus vs. leader-calls)
- Incident/urgent handling (who declares, who responds)
- Learning norms (pairing, tech talks, conference sharing)
- Workload visibility (capacity tracking, WIP limits)

Push each norm from vague to behavioral: *"We communicate openly"* → *"We voice disagreement in meetings, not after in Slack"* → *"In design reviews, we specifically ask 'what are we missing?' and wait for at least two responses"*

### Phase 5: Review and commit
- Review the full draft with the team
- "What needs to change before we commit to this?"
- "Who disagrees with anything? What's missing?"
- "How will we store this? (link to file)"
- "How often will we review it? (default: every 6 weeks via `team-check-in`)"

## File format and location

`~/bettersense-work-reflections/team-charters/<team-slug>.md`

```markdown
---
team: [team name]
team_slug: [slugified]
charter_version: 1
created_date: YYYY-MM-DD
last_updated: YYYY-MM-DD
members:
  - name: [name]
    role: [role title]
    responsibilities: [bullet list]
  - ...
---

# [Team Name] Charter

## Purpose
One-sentence mission: [what value does the team create?]

## Goals
### Goal 1: [specific measurable goal]
- Owner: [name]
- Success metrics: [how measured?]
- Target date: [date]

### Goal 2: [...]

## Roles & Responsibilities
### Role: Technical Lead — [name]
- Accountabilities: [what decisions, what outputs]
- Decision rights: [unilateral vs consultative]
- Dependencies: [what needed from others]

### Role: Product Manager — [name]
...

## Norms
### Communication
- [Behavioral statement]

### Meetings
- [Behavioral statement]

### Decisions
- [Behavioral statement]

### Conflict
- [Behavioral statement]

## Review cadence
We will review this charter every [6] weeks via `team-check-in`. Last review: [date]. Next review: [date].

## Changelog
- v1 (2026-05-09): Initial charter created
```

## Operating principles

- **Explicit, not implied.** The goal is to make implicit assumptions explicit. "We all know Alice decides infrastructure" → document it.
- **Specific behaviors, not values.** "Respect" is a value. "We ask before giving feedback" is a behavioral norm.
- **Facilitated, not imposed.** The skill guides conversation; the team owns the content.
- **Living, not archival.** Charter is referenced in meetings and check-ins; stale charters are worse than none.
- **Concise enough to read in 5 minutes.** Avoid essays; aim for two pages max.
- **Assign owners for gaps.** Every responsibility needs an owner; every goal needs a driver.
- **Review cadence built in.** Link to `team-check-in` for recurring review.

## Composition with other skills

- **`team-check-in`** — uses the charter as the baseline; charter review is the first agenda item of any check-in
- **`team-diagnosis`** — the charter provides context for diagnosis (e.g., "conflict high — what norms are missing or unclear?")
- **`stakeholder-register`** — if the team's key stakeholders are individuals, register them for ongoing reflection
- **`strategy-doc`** — if the team owns a product area, link the team goals to the product strategy
- **`user-profile`** — if the user is the team lead, their leadership preferences can shape norms discussions (direct vs. consensus, meeting style)

## Anti-patterns to flag

- **Generic platitudes.** "We communicate openly" — meaningless without behavioral specification
- **No decision matrix.** Unclear who decides what → endless debates or unilateral overreach
- **No owner.** Goals without drivers are fantasies; roles without accountabilities are titles
- **Set-and-forget.** Charter created then ignored → drift accelerates
- **Leader-imposed.** Real buy-in requires team conversation; top-down charter fails
- **Too detailed.** Charters should be principles + allocations, not procedures manual
- **Ignoring scope boundaries.** Not saying "no" to non-goals leads to diffuse focus
