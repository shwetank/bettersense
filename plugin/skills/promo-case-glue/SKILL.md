---
name: promo-case-glue
description: Use when an engineer who does significant glue work (onboarding, documentation, unblocking, cross-team alignment, process improvement) needs to build a promotion packet that frames that work as technical leadership. Trigger phrases include "promotion case for glue work", "I do a lot of glue work how do I get promoted", "frame my non-code work for promotion", "my manager says I need more technical accomplishments", "I'm a glue person how do I get senior". Works alongside or as a specialized mode of `report-promo-case`. Produces a promotion-ready narrative that translates glue tasks into ladder-appropriate evidence, with artifact collection guidance and manager talking points.
---

# Promotion Case for Glue-Heavy Engineers

Build a promotion-ready case for engineers whose impact is primarily through glue work — the coordination, documentation, unblocking, process improvement, and cross-team work that makes teams succeed but rarely appears as "technical accomplishments" on promotion packets.

Converts glue activities into ladder-aligned evidence by:
- Reframing glue tasks as technical leadership, system improvement, and force-multiplication work
- Identifying and collecting concrete artifacts that demonstrate ownership and outcomes
- Structuring the promotion narrative around "invisible technical impact"
- Providing manager-facing talking points to help advocates tell the story correctly
- Offering tactics for addressing the "not technical enough" bias head-on

## When to apply

Trigger this skill when:
- The user says: *"My manager says I need more technical accomplishments, but I spend all my time unblocking people and onboarding new hires."*
- Preparing a promotion packet and the user's biggest impacts are non-code (documentation, process, coordination).
- The user has been told: *"You're great at communication and soft skills, but we don't see you as an engineer."*
- The user is a junior/midlevel who naturally stepped into glue roles and now needs to translate that into senior-level evidence.
- The user's team would collapse without their glue work, but the promotion committee doesn't recognize it as "technical."

Skip when:
- The user has clear code/design/production impact to showcase (use `report-promo-case` directly).
- The user is clearly on a management/TPM track and should change titles, not fight for an IC promotion.
- The company's ladder explicitly excludes glue work from senior IC criteria (unfair but real; this skill helps user either change the ladder perception or decide to pivot roles).

## Prerequisites

First, run `glue-audit` to produce a recent inventory of glue tasks and their time allocation. The promo case builds directly on that inventory — it's the raw material.

## The interview flow

### 1. Ladder context
- "What level are you targeting? (Senior, Staff, Principal?)"
- "Do you have access to your company's official engineering ladder? If yes, what dimensions are evaluated?"
- Typical ladder dimensions: Technical Fluency, Delivery, Architecture, Leadership, Mentorship, Business Impact, Cross-functional Influence.

The skill will later map glue work to these dimensions.

### 2. The glue inventory review
Read the user's latest `glue-audit` file. Confirm the top 5–7 glue tasks by impact and time spent.

For each top task, drill:
- "What was the specific outcome? (Not the activity, but the result.)"
- "What would have gone wrong if this hadn't been done?"
- "Who benefited and how?"
- "Is there a metric or qualitative signal that improved?"
- "What artifact exists? (doc, email, Slack thread, postmortem, design doc)"

### 3. Reframe each glue task into technical leadership language

Tanya Reilly's key insight: glue work is *already* technical leadership — you just have to translate it. Use these reframing patterns:

| Glue task | Technical leadership frame |
|---|---|
| Onboarding new hires | Reduced ramp time from N weeks to M; built onboarding system; mentored 3 engineers to first solo ship |
| Documentation (ADRs, runbooks) | Institutional knowledge capture; reduced bus factor; enabled faster incident response; design clarity that prevented wrong builds |
| Design review (catching handwaves) | Architecture quality gate; risk identification; technical due diligence; raised issue that prevented P0 incident |
| Unblocking teammates stuck in email chains | Cross-team communication orchestration; removed bottleneck; enabled engineer to complete 3-week block |
| Process improvement (coding standards, testing guidelines) | Engineering systems improvement; reduced rollbacks by X%; accelerated code review velocity |
| Cross-team alignment meetings | System integration ownership; prevented duplicate work; aligned on shared interfaces |
| Keeping roadmap current | Product-technology coupling; priority clarity; reduced wasted engineering effort |
| Mentorship (informal) | Team capability building; retention; multiplied team output through knowledge transfer |
| Incident coordination | Reliability ownership; blameless postmortem; converted failures into process improvements |
| Hiring interviewer | Technical hiring craft; calibrated evaluation; reduced false negatives |

The skill writes these reframings into the case document explicitly: "What someone might call 'just documentation,' we call 'system design clarity that prevented divergent implementations.'"

### 4. Artifact mining

For each reframed item, list concrete evidence:
- **Design docs with your comments** — show your technical judgment in action
- **Onboarding docs you wrote** — show system understanding and teaching ability
- **Email threads where you aligned teams** — show influence without authority
- **Postmortem/ADR where your intervention was cited** — show incident leadership
- **Metrics: onboarding time before/after, review cycle time, rollback rate, mean-time-to-resolution**
- **Testimonials:** Slack messages, 1:1 email praise, performance review quotes (exact wording)

The skill creates an "Artifacts" section with file paths or excerpts.

### 5. Narrative construction

Assemble a three-act story:

**Act 1 — The problem:** The team had gaps in [onboarding, design quality, cross-team alignment]. This caused [slow ramp, rework, duplicated effort, incidents].

**Act 2 — Your intervention:** You did [specific glue tasks]. Not as "helping" but as *owning* the problem. Technical decisions you made: [choose standards, design the onboarding flow, set the review checklist].

**Act 3 — The outcome:** Quantified results: [shorter ramp, fewer rollbacks, faster incident recovery, aligned architecture]. The team is now [more productive, more reliable, better aligned]. You did this *as an engineer* through technical leadership, not project management.

### 6. Address the "not technical enough" objection head-on

Anticipate and pre-bunk common pushback:

**Objection:** *"Your impact isn't sufficiently technical."*
**Response:** *"My work prevented [quantify] hours of wasted engineering, reduced [metric] by X%, and directly enabled [feature/ship]. Those are engineering outcomes. I'm a systems thinker who operates at the coordination layer — that's senior/staff-level work."*

**Objection:** *"You didn't write enough code."*
**Response:** *"I made the codebase more effective by improving the conditions under which code gets written. My artifacts — [list] — show the breadth of my technical contribution. The ladder values 'impact,' not just 'lines of code.'"*

**Objection:** *"This looks like project management."*
**Response:** *"Project managers coordinate timelines. I solved technical problems: I designed the onboarding system, I set the technical standards, I identified architectural gaps in design reviews. Those are engineering judgments."*

The skill writes a "Q&A prep" section with these exact talking points.

### 7. Manager advocacy guide

Provide the user's manager with a separate "how to tell this story" note:
- What to emphasize in calibration meetings
- Which artifacts to surface
- How to answer the "was this promotable?" question
- Preemptive language to neutralize "soft skills" dismissal

## Output structure

The skill creates `~/bettersense-work-reflections/promo-cases/<level>-glue-<name>-<date>.md`:

```markdown
---
candidate: [name]
target_level: Senior | Staff | Principal
period: [date range]
summary: "[one-sentence impact claim]"
---

# Promotion Case: [Name] — [Target Level]

## TL;DR
[2–3 sentences: "I'm being evaluated on Technical Leadership, Delivery, and Architecture. My glue work is the vehicle for those dimensions: I built onboarding that cut ramp time 40%; I instituted design-review quality gates that caught 3 architectural gaps before implementation; I coordinated cross-team alignment that prevented duplicated effort on X integration."]

## Evidence by ladder dimension

### Technical Leadership
- **Task:** Onboarding system design
  - **What I did:** Wrote onboarding checklist, paired with 3 new hires, created runbook collection
  - **Outcome:** Average ramp from 6 weeks → 3.5 weeks; new hires shipping within 30 days
  - **Artifacts:** `docs/onboarding.md`, Slack thread `#eng-onboarding` (March–April), email from eng lead (May 2)
  - **Why this is senior work:** Onboarding is a systems problem; I treated it as such, not as ad-hoc help

### Delivery / Execution
- **Task:** Design review quality gate
  - **What I did:** Read every design doc, asked clarifying questions, surfaced missing edge cases in 4 reviews
  - **Outcome:** Two designs materially changed before build; one potential P0 security issue caught
  - **Artifacts:** Google Doc comments on [link], ADR-012 revised per my feedback, incident postmortem cites "lacking design review" as root cause (which we now have)
  - **Why this is senior work:** Architectural due diligence is a core IC responsibility at senior+

### Architecture / System Design
- **Task:** Cross-team service boundary definition
  - **What I did:** Led alignment meeting between Team A and Team B, produced shared interface contract
  - **Outcome:** Prevented two conflicting implementations; integration tested successfully first try
  - **Artifacts:** Meeting notes email (Apr 15), GitHub issue #456 with agreed spec
  - **Why this is senior work:** System thinking across team boundaries; influence without authority

### Mentorship / Team Multiplier
- **Task:** Informal mentorship of 2 juniors
  - **What I did:** Regular pairing sessions, PR feedback, career guidance
  - **Outcome:** Both shipped first solo features; one received "high performer" quarterly recognition
  - **Artifacts:** Their thank-you messages, their PRs showing independent work, their promotion packets (they shared with me)
  - **Why this is senior work:** Multiplying team capability through teaching is a senior IC expectation

## Quantitative summary
- Estimated hours/week on glue work: 15–20 (out of 40)
- Outcomes attributable to glue work: onboarding time -42%, design rework avoided (2–3 designs), cross-team duplicate effort avoided (~1 engineer-week)
- Visibility: team-wide; documented in team retro (May), mentioned in manager's skip-level update

## Artifacts collected
[List with file paths or descriptions]

## Narrative — "The glue narrative"
[150-word story: "My technical contribution is making the team effective. I own the coordination layer that connects individual engineers to collective outcomes. That's why Team X shipped Y on schedule and with zero P1 incidents."]

## Q&A prep
- Q: "This looks like project management, not engineering."
  A: "Project managers manage timelines and dependencies. I solve technical problems: I designed the onboarding curriculum, I set the testing standards, I caught architectural gaps in design reviews. Those are engineering judgments."
- Q: "Where's your code?"
  A: "My work enabled others to write better code faster. The measure of an engineer isn't lines written; it's problems solved. I solved ramp, alignment, and quality problems that were blocking the team's code output."
- Q: "Are you technical enough?"
  A: "I participate in technical discussions, I review designs, I make architectural trade-off calls. I'm not 'less technical' — I'm *applied* technically at a different layer."

## Manager guidance
[Separate section addressed to the user's manager, with: suggested language for calibration, which artifacts to highlight, pre-bunking the "soft skills" dismissal, and a direct ask: "Please tell the committee: X's glue work is the reason Y outcome happened."]

## Risks & mitigations
- Risk: Committee still says "not technical enough."
  Mitigation: Plan B — temporarily reduce glue, increase core technical work for next cycle (see `boundary-negotiation` skill). But try this narrative first.
- Risk: User accused of "not wanting to code."
  → Mitigation: Emphasize that user *can* code; they choose to allocate time elsewhere for team multiplier effect.
```

## Operating principles

- **Frame glue as technical leadership, not "soft skills."** The language matters: *coordination* not *communication*; *system design* not *documentation*; *quality gate* not *code review*.
- **Visibility is half the battle.** The user must have artifacts; if they don't, instruct them to start collecting now (for next cycle).
- **Don't invent impact.** Stick to what's real. The story is stronger when honest.
- **Target the ladder, not vague "seniority."** Use the company's actual rubric language.
- **Use Tanya Reilly's thesis:** doing glue work doesn't mean you're less technical; it means you're operating at a different (and necessary) technical layer.
- **Allow for honest "not promotable here" conclusions.** If the company truly doesn't value glue work at the IC level, help the user see that and consider role change — don't force a losing battle.

## Composition with other skills

- **`glue-audit`** — prerequisite; consumes its output
- **`report-promo-case`** — this is a specialized mode of that skill; can route to it or compose
- **`user-profile`** — reads the user's current level and company context to calibrate ladder expectations
- **`wins-log`** — glue wins should be captured here too; cross-reference both files
- **`boundary-negotiation`** — if the user wants to reduce glue to focus on core work, that's Plan B; link the two skills

## Anti-patterns to flag

- **"I helped a lot"** — too vague. Force specific outcomes and artifacts.
- **Taking sole credit for team glue.** Acknowledge collaborators where glue is shared.
- **Listing tasks without technical framing.** "I onboarded Bob" → "I designed and executed an onboarding flow that reduced Bob's ramp to production from 6 weeks to 3."
- **Ignoring the company's actual ladder.** If the ladder says "writes production code" as top criterion, this case may still fail — surface that reality.
- **Waiting until promotion season to start collecting.** The skill should suggest: "Start your artifact collection now for next cycle."
