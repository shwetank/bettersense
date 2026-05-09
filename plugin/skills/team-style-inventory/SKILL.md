---
name: team-style-inventory
description: Use when a team wants to understand and discuss their collective working style preferences — communication, decision-making, conflict, meeting effectiveness, and information sharing — to reduce friction and increase intentionality. Trigger phrases include "team work style assessment", "how does our team prefer to work together", "team style inventory", "understand our team dynamics", "communication preferences survey". Based on the insight from Moussa that team performance depends on paying attention to "how you talk to each other." Produces a shared understanding of the team's style profile, surface mismatches, and norms adjustments. Precedes or complements team-charter and team-check-in.
---

# Team Style Inventory

Help a team surface, discuss, and align on their collective **working style preferences** — how they prefer to communicate, make decisions, handle conflict, and structure work. Named after the insight from Mario Moussa's 3X3 that *"paying attention to how you talk to each other"* is essential for team performance.

**Problem:** Teams implicitly assume everyone prefers the same style. In reality, extroverts vs. introverts, conflict-lovers vs. conflict-avoiders, synchronous vs. asynchronous communicators all share the same space without understanding each other's defaults, leading to frustration: *"Why doesn't Alice just Slack me?"* / *"Why does Bob schedule a meeting for everything?"*

**Solution:** Make style preferences explicit, discuss trade-offs, and adjust team norms (via `team-charter` or `team-check-in`) to accommodate differences. The output is a **Team Style Profile** — a shared reference that explains how the team prefers to operate and where they've agreed to accommodate variation.

## When to apply

Trigger this skill when:
- A new team forms and needs to establish operating norms
- A team reports friction: *"Our meetings are terrible"* or *"No one responds to my messages"*
- New members join from different company cultures (e.g., remote-first vs. in-office)
- There's visible frustration around communication styles (meeting overload, Slack anxiety, email vs. chat)
- The team wants to do a "team health" activity
- The manager suspects hidden style conflict (some dominating, some withdrawing)
- Before running `team-charter` to ground the norms conversation in reality

Skip when:
- The team already has a well-functioning, documented norm set they're happy with
- The team is in crisis and needs tactical coordination first
- The user just wants a generic personality test (this is about *team* style, not individual MBTI)

## The inventory categories

The skill walks the team through five style dimensions. For each, the team discusses:
1. **What do we naturally prefer?** (individual preferences gathered privately first)
2. **What have we implicitly agreed as a team?** (current de facto norms)
3. **What do we want to codify as our team style?** (explicit, negotiated norms)

### 1. Communication style
- **Synchronous vs. asynchronous:** Do we expect quick Slack responses, or is it okay to process for hours/days?
- **Written vs. verbal:** Do we prefer documented proposals or talk-it-out meetings?
- **Channel selection:** When do we use Slack vs. email vs. meeting vs. document comment?
- **Meeting pre-work:** Agendas and readahead required, or we'll figure it out live?
- **Response time expectations:** What's our SLA on Slack? On email?

### 2. Decision-making style
- **Consensus vs. consultative vs. directive:** 
  - Consensus: everyone must agree (slow, high buy-in)
  - Consultative: leader decides after input (balanced)
  - Directive: leader decides alone (fast, lower buy-in)
- **When decisions are escalated:** What threshold requires manager involvement?
- **How disagreements are resolved:** Debate until consensus? Decider after discussion? Vote? Seniority call?
- **Decision documentation:** Do we record decisions and rationale? Where?

### 3. Conflict style
- **Comfort with disagreement:** Is debate encouraged or avoided?
- **Conflict target:** Idea-focused (challenge the proposal) or person-focused (challenge the person)?
- **Public vs. private pushback:** Is it okay to dissent in a meeting, or better 1:1?
- **Emotional expression:** Passionate argument acceptable? Or stay calm and data-driven?
- **Resolution mechanism:** How do we know conflict is resolved? Who declares closure?

### 4. Meeting style
- **Meeting necessity:** Can this be async? What's our bar for calling a meeting?
- **Meeting structure:** Strict agenda with timeboxes, or free-flowing?
- **Participation style:** Round-robin input, or open discussion?
- **Attendance:** Who must be there? Who's optional?
- **Camera policy:** On or off for remote participants?
- **Facilitation:** Rotating? Always the same person? Neutral?

### 5. Work styles
- **Focus time protection:** Do we block calendar for deep work? How do we signal "do not interrupt"?
- **Work hours expectations:** Core hours?async ok? Weekend silence?
- **Workload visibility:** How do we know if someone is overloaded? Stand-ups? Capacity tracking?
- **Information sharing:** Default to open? Need-to-know basis?
- **Learning mode:** Pairing? Tech talks? Conference sharing? Learning time protection?

## The inventory process (60–90 min team session)

### Phase 1: Individual preferences (15 min, async or silent)
Each team member privately answers for each dimension: *"My natural preference is..."*

Example output format:
```
Communication: I prefer async written (Slack/docs) over meetings. I like 24h to respond to non-urgent messages.
Decisions: I prefer consultative — give me context, then I'm okay if you decide.
Conflict: I'm comfortable with idea conflict but uncomfortable with personal criticism. I prefer to debate in public, resolve in private.
Meetings: I like structured agendas with clear decisions needed. I dislike meetings without purpose.
Work style: I need 2–3 hour focus blocks; I schedule "office hours" for interruptions.
```

### Phase 2: Team current state (20 min)
Facilitated discussion (round-robin sharing):
- "What do you see as our team's actual current style? Not what we wish, but what is?"
- "What's working well about our current style?"
- "What's painful or inefficient?"

Record on shared screen or whiteboard under each dimension.

### Phase 3: Desired team style (20 min)
For each dimension where current ≠ ideal, discuss: *"What should our team norm be?"*

Rules:
- **Not consensus on everything.** The team agrees on a *default* style, but individuals can opt-out with notice.
- **Accommodate reasonable variation.** "We default to async written, but if someone needs a quick sync, they can request it"
- **Document exceptions:** "Bob prefers phone calls for complex topics, we honor that for him"

Result: **Team Style Statement** — a 1–2 sentence norm per dimension.

Examples:
- Communication: *"We default to async Slack for non-urgent questions with 24h response expectation. If urgent, label 'ASAP' and we respond within 2 hours. If it needs real-time discussion, schedule a 15-min sync."*
- Decisions: *"For decisions under $10k or with no cross-team impact, the DLI decides. For larger decisions, the DLI proposes, team consults for 48h, then DLI decides."*
- Conflict: *"We encourage debate on ideas in meetings. We assume good intent. Personal criticism happens 1:1, never in group."*

### Phase 4: Action items (10 min)
- "What will we change tomorrow based on this?"
- Usually 1–2 concrete changes: update Slack channel descriptions, change meeting templates, create a decisions log, set focus-time calendar blocks.

## Output: Team Style Profile

`~/bettersense-work-reflections/team-charters/<team-slug>-style.md` (or appended to the charter)

```markdown
# [Team] — Working Style Profile

## Individual preferences (summary)
- Alice: async written, consultative decisions, comfortable with idea conflict
- Bob: synchronous calls, consensus decisions, conflict-averse
- Carol: async written, directive decisions, comfortable with conflict
[...]

## Agreed team norms
### Communication
We default to async Slack for non-urgent questions (24h response). Urgent = label ASAP (2h response). Complex = schedule 15-min call. No expectation of weekend response.

### Decisions
DLI consults team on scope changes > 2 weeks; decides alone on tactical execution. All decisions logged in #decisions with brief rationale.

### Conflict
Debate ideas vigorously in meetings. Personal feedback 1:1 only. Assume good intent; separate idea from identity.

### Meetings
Agenda required 24h in advance. Decisions recorded in notes. Camera-on for remote participants. Timeboxed to 50 minutes.

### Work style
Focus blocks 10–12 and 2–4 are meeting-free. Status updates written daily in stand-up channel (async).

## Exceptions & accommodations
- Bob takes calls for complex topics (agreed by team)
- Carol works EST, others PST — async is primary

## Review cadence
Review this profile during team check-ins; update as needed.
```

## Operating principles

- **Prefence ≠ capacity.** Individual preferences matter, but team norms may override (e.g., "I hate meetings but we agreed weekly sync is necessary")
- **Name mismatches.** "Alice says she's fine with conflict but visibly shuts down" — surface that gap
- **Keep it behavioral.** "We're collaborative" → what does that actually mean in meetings, decisions, docs?
- **Make exceptions explicit.** "We normatively do X, but for Y we do Z" — that's healthy, not hypocrisy
- **Revisit regularly.** Style drifts as team composition changes. Check during `team-check-in`
- **Psychological safety prerequisite.** If people don't feel safe naming their preferences, this exercise backfires. Use `psychological-safety` first if needed.

## Composition with other skills

- **`team-charter`** — this is the detailed input for the Norms section
- **`team-check-in`** — the style profile is the baseline; ask "are our agreed norms still working?"
- **`psychological-safety`** — prerequisite if the team lacks safety; style discussion requires candor
- **`read-the-room`** — after a style-inventory session, use to read subtext: "Alice agreed but seemed unhappy"
- **`coaching-mode`** — if the team lead needs to coach an individual whose style clashes with team norms

## Anti-patterns to flag

- **Confusing style with competence.** "Bob is conflict-averse" doesn't mean "Bob is weak"; different conflict styles are valid
- **Imposing majority preference.** Minority styles need accommodation, not suppression
- **Over-indexing on one dimension.** "We're async written" doesn't mean "no meetings ever" — find balance
- **One-time exercise.** Style evolves; revisit quarterly or after major personnel changes
- **Ignoring hybrid/remote complexity.** Remote teams need explicit communication norms more, not less
- **Treating as personality test.** This isn't MBTI — it's *team agreements*, not fixed traits
- **No exceptions.** Rigid norms that don't allow for individual needs create resentment
