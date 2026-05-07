---
title: People leadership
description: Nine skills for engineering managers and technical leaders — coaching, feedback, performance, hiring, promotions, team health, and engineering systems.
---

Seven of these skills (`hiring-craft`, `performance-management`, `coaching-mode`, `report-career-architect`, `report-promo-case`, `team-diagnosis`, `engineering-health`) form a tighter set aimed at the highest-stakes work an engineering manager does — the work most managers do loosely because nobody handed them a forcing function for it.

**The opinionation is real.** `performance-management` will not let you describe a Stage 3 problem in Stage 1 language. `coaching-mode` will not let you prescribe in the first 5 turns. `hiring-craft` will not let you run a debrief without silent votes first.

---

## `coaching-mode`

**Triggers:** "help me coach [name]", "I need to have a development conversation with [name]", "coaching mode"

Flips Claude into ask-not-tell mode. Stays in question mode for at least 5 turns. Applies the GROW frame:

- **G**oal — what does the person want to achieve?
- **R**eality — what's actually happening now?
- **O**ptions — what could they try?
- **W**ill — what will they specifically do?

Pushes back when you catch yourself prescribing ("sounds like you already have a suggestion — do you want to give it, or explore more options first?").

Most valuable for: development conversations where the report needs to do the thinking, not just receive your answer.

---

## `feedback-frameworks`

**Triggers:** "help me give feedback to [name]", "draft feedback for [name]", "is this feedback good?", "how do I deliver this feedback?"

Drafts and pressure-tests feedback using:

**COIN structure:**
- **C**onnection — situate the conversation (why are we talking about this?)
- **O**bservation — what specifically happened (behavior, not character)
- **I**mpact — what did it cost or create (specific, not vague)
- **N**ext steps — what changes or continues

**SOLID quality checklist:**
- **S**pecific — a behavior, not a trait
- **O**bjective — something observable, not an interpretation
- **L**inked — connected to something that matters
- **I**mpactful — the person can see why this matters
- **D**ata-based — at least one concrete example; secondhand examples removed

The skill pushes back on character labels ("dismissive," "not strategic") and rewrites them as behaviors. It pushes back on vague impacts ("bad for the team") until they're specific.

---

## `one-on-one-prep`

**Triggers:** "help me prep for my 1:1 with [name]", "1:1 agenda for [name]", "I have a hard 1:1 tomorrow"

Builds a 1:1 agenda matched to the relationship type:

- **Manager → report:** progress check, blockers, career, feedback
- **Report → manager:** updates, asks, escalations, career development
- **Peer:** coordination, dependencies, relationship health
- **Skip-level:** organizational health, career visibility, broader context

For hard 1:1s, the skill composes with `feedback-frameworks` to prepare the specific conversation and `coaching-mode` for development conversations.

If you've been avoiding the conversation: the skill surfaces this and pushes you to book it properly instead of ambushing.

---

## `performance-management`

**Triggers:** "I have an underperforming report", "managing someone who's struggling", "PIP", "performance conversation with [name]"

Walks the underperformance ladder deliberately — doesn't let you skip stages:

1. **Coaching** — is the gap a skill gap or a motivation gap? Are expectations clear?
2. **Formalized feedback** — written documentation of the gap and improvement criteria
3. **PIP** — specific, measurable, time-bound improvement targets with consequences stated
4. **Termination** — when and how to exit someone with dignity and documentation

**The brilliant-jerk pattern** gets explicit treatment: high output + toxic behavior is its own ladder (the output doesn't excuse the behavior; the behavior has a cost the output doesn't offset).

Documentation discipline throughout: what you said, when, what the response was, what the next step is.

---

## `hiring-craft`

**Triggers:** "help me design a hiring loop", "I'm interviewing for [role]", "help me run a debrief"

Three modes:

- **Loop design** — map signals to slots, avoid redundant coverage, write behavioral anchors
- **Rubric writing** — what "strong yes / lean yes / lean no / strong no" looks like for each signal
- **Debrief facilitation** — structured debrief with silent-vote-first, round-robin, and calibration norms that prevent anchoring to the first opinion

Doesn't let you run a debrief without silent votes first — the research on anchoring is clear.

---

## `report-career-architect`

**Triggers:** "build a growth plan for [name]", "12-month plan for [name]", "career conversation with [name]"

Produces a 12-18 month growth plan for a direct report:

- **Target state** — where they're headed (title, scope, capability)
- **Current state** — honest read on gaps and strengths
- **Capability gaps** — specific and behaviorally anchored
- **Sequenced experiences** — ordered: build on strengths before stretching into gaps
- **Manager moves** — what *you* have to stop doing to make room for their growth (the most skipped section in management)
- **Risks** — what could derail the plan
- **Observable success criteria** — how you'll both know the plan is working

Reads `stakeholder-reflect` data from the managing-down folder when present — uses accumulated reflection entries rather than starting from a blank slate.

**Underrepresented reports often get weaker growth plans not because they don't deserve them, but because managers feel less confident advocating with the same volume.** The skill calls this out explicitly.

---

## `report-promo-case`

**Triggers:** "build a promo case for [name]", "submit [name] for promotion", "promo packet for [name]"

Produces a panel-ready promotion packet:

- **Cited evidence per dimension** — each claim backed by a specific example
- **Calibrated solo/shared credit** — honest framing of collaborative wins
- **Pre-empted objections** — what the panel is likely to push on, and the counter
- **Gaps surfaced as pre-submission targets** — what's thin in the log, and what to build before submitting

Mirror image of `wins-curate (promo-packet)` — that one is for your own brag doc; this one is for your report's.

---

## `team-diagnosis`

**Triggers:** "team health check", "before my skip-level, give me a read on the team", "how is my team doing?"

Multi-dimensional team health check across eight dimensions:

| Dimension | What it reads |
|---|---|
| Delivery cadence | Are you shipping consistently? Is the pace healthy? |
| Attrition risk | Who's at risk of leaving? What are the signals? |
| Dependency tax | How much external-team dependency is slowing you down? |
| On-call burden | Is the on-call load distributed or concentrated? |
| Peer relationships | How are teammates working with each other? |
| Information flow | Does the right information reach the right people? |
| Technical health | Debt, observability, test coverage, incident frequency |
| Culture | Psychological safety, feedback culture, inclusion signals |

Output: green / yellow / red across all eight, with cited evidence and top-3 risks worth acting on this quarter.

Reads from `stakeholder-reflect` (managing-down) and composes with `report-career-architect` for individual context. When the technical health dimension comes up red, trigger `engineering-health` for the deeper systems read.

---

## `engineering-health`

**Triggers:** "is my team actually productive?", "assess developer experience on my team", "how do I measure engineering productivity?", "I need to justify platform team investment", "our onboarding is too slow"

Reads the **engineering systems layer** — not team morale or culture (that's `team-diagnosis`), but whether the tooling, processes, and infrastructure support the people building in them. Inspired by Nicole Forsgren's DORA and SPACE research.

### The core principle: constellation, not solo metrics

Any single metric will mislead. PR count punishes senior engineers doing architecture and mentorship. Lines of code rewards verbosity. Use at least three categories of signal together.

### The SPACE diagnostic

| Dimension | What it reads |
|---|---|
| **S**atisfaction | Ask directly: where do you feel friction? People can surface problems dashboards miss — especially at system handoff points. |
| **P**erformance (outcomes) | Build stability, deployment success rate, security outcomes, incident rate. What is the system producing? |
| **A**ctivity | PR counts, commits, deployments. Useful in context, misleading in isolation. Senior-heavy teams will have lower raw counts. |
| **C**ommunication & collaboration | Meeting load, API reliability, PR review time, whether information reaches people who need it. |
| **E**fficiency & flow | Build time, time waiting for PR review, deployment pipeline duration, time to provision an environment. DORA's four metrics (deployment frequency, lead time, change failure rate, time to restore) are a well-validated instance of this category. |

### Onboarding time as a leading indicator

Time to first meaningful commit from a new hire is one of the most reliable signals of how navigable the engineering system is. A long ramp isn't a people problem — it's a systems problem.

**What good looks like:** A trivial-but-real PR (fix a title, add a test, update a doc) within the first one or two weeks. Research at Microsoft found this kind of early commit increases productivity by 30–50% across the rest of the year.

**The internal transfer test:** If moving to a new team within the same company takes nearly as long as starting fresh, that's a red flag. The tooling, documentation, and context aren't portable.

### Developer experience friction

Where dashboards say "fine" but the lived experience is painful. The skill asks directly: *"What's the most annoying thing about getting work done right now?"* and *"Where do you find yourself doing repetitive manual steps that shouldn't be manual?"*

Common patterns: access approval bottlenecks, systems that appear integrated but require manual coordination at every handoff, tooling fast for reporting but slow for the developer.

### Making the case for platform investment

When the diagnosis shows engineering systems are the bottleneck: use data and story together. Numbers alone are abstract; stories alone are dismissed as one-offs. 

Key move: be explicit about what "good enough" looks like before asking for investment. Pre-empts the "bottomless problem" objection and frames the conversation as a scoped, tractable investment rather than an open-ended budget request.
