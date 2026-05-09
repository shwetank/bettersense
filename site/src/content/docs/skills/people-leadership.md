---
title: People leadership
description: Twelve skills for engineering managers and technical leaders — coaching, feedback, performance, hiring, promotions, team health, glue work management, and engineering systems.
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

## `promo-case-glue`

**Triggers:** "promotion case for glue work", "I do a lot of glue work how do I get promoted", "frame my non-code work for promotion", "my manager says I need more technical accomplishments"

Builds promotion packets for engineers whose impact is primarily through glue work (onboarding, documentation, unblocking, process improvement, cross-team alignment). Translates glue tasks into technical leadership evidence and provides manager talking points to counter "not technical enough" bias.

**Three-act narrative:**
1. **Problem:** Team had gaps in [onboarding, design quality, alignment] causing [slow ramp, rework, incidents]
2. **Intervention:** You owned the coordination layer — designed systems, set standards, broke logjams
3. **Outcome:** Quantified results: ramp time ↓, rollbacks ↓, alignment ↑ — with artifacts

**Reframing patterns:**
- Onboarding → reduced ramp time, built onboarding *system*
- Documentation → institutional knowledge, bus factor reduction
- Design review → architectural quality gate, risk identification
- Unblocking → cross-team communication orchestration
- Coding standards → engineering systems improvement

**Artifacts:** design doc comments, onboarding docs, alignment emails, postmortems/ADRs, metrics (onboarding time, review cycle, rollback rate)

**Q&A prep:**
- *"This looks like project management."* → "I solved technical problems: designed onboarding curriculum, set testing standards, caught architectural gaps."
- *"Where's your code?"* → "My work enabled better code output. The measure isn't lines written; it's problems solved."
- *"Are you technical enough?"* → "I participate in technical discussions, review designs, make architectural trade-offs."

Prerequisite: run `glue-audit` first.

---

## `team-diagnosis`

**Triggers:** "team health check", "before my skip-level, give me a read on the team", "how is my team doing?"

Multi-dimensional health check across eight dimensions:

| Dimension | What it reads |
|---|---|
| Delivery cadence | Shipping consistently? Healthy pace? |
| Attrition risk | Who's at risk of leaving? Signals? |
| Dependency tax | External-team dependency slowing you down? |
| On-call burden | Load distributed or concentrated? |
| Peer relationships | How are teammates working together? |
| Information flow | Does right info reach right people? |
| Technical health | Debt, observability, test coverage, incidents |
| Culture | Psychological safety, feedback, inclusion |

Output: green / yellow / red across all eight, with cited evidence and top-3 risks worth acting on this quarter.

Reads from `stakeholder-reflect` (managing-down) and composes with `report-career-architect`. When technical health is red, trigger `engineering-health`.

---

## `workload-equity`

**Triggers:** "is our glue work fair", "who does the non-promotable work", "are women doing more glue work", "workload distribution audit"

Diagnoses whether non-promotable (glue) work is fairly distributed across a team, with attention to demographic and seniority patterns. Combines Tanya Reilly's glue work framework with HBR research: women volunteer 48% more often for non-promotable tasks; managers ask women 44% more often.

**Signals it surfaces:**
- **Single-point dependency** — one person exclusively owns critical glue functions
- **Task ghettoization** — note-taking, admin, onboarding always fall to same person(s)
- **Credit mismatch** — person does work, someone else gets visibility
- **Career penalty** — glue-doer's code output suffers, promotion stalls
- **Demographic clustering** — women/junior staff disproportionately doing support/coordination

**Output:** Per-person breakdown: core work output, glue hrs/week, glue type, visibility, promotion risk. Pattern analysis with flags and redistribution recommendations.

**Privacy-first:** Anonymized mode by default; named only with explicit consent.

**For managers:** use before calibration cycles, when attrition signals appear, or when DEI review looms.

---

## `manage-glue-workers`

**Triggers:** "my report does too much glue", "how do I protect my glue person", "glue worker promotion", "coaching someone who's always helping others"

Coaching, protecting, and developing engineers who consistently do glue work — coordination, documentation, unblocking, process improvement that's often invisible and non-promotable.

**Diagnostic questions:**
- What does [name] typically do in a week? Time breakdown: coding, meetings, glue?
- What are their 2–3 biggest accomplishments? Which were glue-mediated?
- What would break first if they went on vacation for two weeks?
- Who knows the glue work they do? How do they talk about it in self-reviews?
- Have they mentioned feeling overwhelmed? Are they the go-to person for everything?

**Manager actions:**
- **Credit amplification:** Public attribution in team meetings: "Alice's design review caught a critical gap — that saved 2 weeks of rework."
- **Workload rebalancing:** Explicit rotation; protected core work blocks; delegate the glue after training others
- **Pre-promotion:** Run `promo-case-glue` together; fill ladder gaps with a small visible core project; get senior advocate pre-brief
- **If promotion fails:** Ask for specifics; re-run equity audit; consider temporary core-work focus; evaluate if TPM/EM is a better fit

**Coaching the glue-heavy engineer:**
- Reframe self-description: "I enable team velocity" not "I help people"
- Artifact habit: save design comments, onboarding docs, Slack unblock threads
- Strategic volunteering: yes to high-visibility glue, no to invisible glue
- Negotiation language: "I can't take that this sprint — my priority is [core project]"
- Calendar as shield: block unbreakable focus time

**If the team needs the glue but org doesn't value it:**
1. Ladder advocacy: add "multiplies team effectiveness" to senior IC
2. Title change: Tech Lead with explicit glue mandate
3. Hybrid IC-TPM role: formalize coordination work
4. Protect and pay anyway: adjust comp even if promotion stalls (temporary)

Key: don't confuse "good at glue" with "should be manager." Many prefer IC track. Protect their learning time to deepen technical skills if they want IC growth.

---

## `engineering-health`

**Triggers:** "is my team actually productive?", "assess developer experience", "how do I measure engineering productivity?", "I need to justify platform investment", "our onboarding is too slow"

Reads the **engineering systems layer** — not team morale or culture (that's `team-diagnosis`), but whether tooling, processes, and infrastructure support the people building in them. Inspired by DORA and SPACE research.

### The core principle: constellation, not solo metrics

Any single metric will mislead. PR count punishes seniors doing architecture. Lines of code rewards verbosity. Use at least three categories of signal together.

### The SPACE diagnostic

| Dimension | What it reads |
|---|---|
| **S**atisfaction | Where do you feel friction? People surface dashboard-missed problems at system handoffs. |
| **P**erformance (outcomes) | Build stability, deployment success, security outcomes, incident rate. What is the system producing? |
| **A**ctivity | PR counts, commits, deployments. Useful in context, misleading in isolation. |
| **C**ommunication & collaboration | Meeting load, API reliability, PR review time, information reach. |
| **E**fficiency & flow | Build time, time waiting for review, deployment duration, env provisioning. DORA's four metrics (deployment frequency, lead time, change failure rate, time to restore) are a validated instance. |

### Onboarding time as a leading indicator

Time to first meaningful commit from a new hire is a reliable signal of system navigability. A long ramp isn't a people problem — it's a systems problem.

**What good looks like:** A trivial-but-real PR (fix a title, add a test, update a doc) within first 1–2 weeks. Microsoft research: early commit increases yearly productivity by 30–50%.

**The internal transfer test:** If moving to a new team within the same company takes nearly as long as starting fresh, that's a red flag. Tooling, documentation, and context aren't portable.

### Developer experience friction

Where dashboards say "fine" but lived experience is painful. The skill asks: *"What's the most annoying thing about getting work done right now?"* and *"Where do you find yourself doing repetitive manual steps that shouldn't be manual?"*

Common patterns: access approval bottlenecks, systems appearing integrated but requiring manual coordination at every handoff, tooling fast for reporting but slow for the developer.

### Making the case for platform investment

When engineering systems are the bottleneck: use data and story together. Numbers alone are abstract; stories alone are dismissed as one-offs.

Key move: be explicit about what "good enough" looks like before asking for investment. Pre-empts the "bottomless problem" objection and frames the conversation as a scoped, tractable investment rather than an open-ended budget request.
