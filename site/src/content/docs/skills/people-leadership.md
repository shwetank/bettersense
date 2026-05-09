---
title: People leadership
description: Eighteen skills for engineering managers and technical leaders — coaching, feedback, performance, hiring, promotions, team health, psychological safety, glue work management, team processes, and engineering systems.
---

## `coaching-mode`

**Triggers:** "help me coach [name]", "I need to have a development conversation with [name]", "coaching mode"

Flips Claude into ask-not-tell mode. Stays in question mode for at least 5 turns. Applies the GROW frame:

- **G**oal — what does the person want to achieve?
- **R**eality — what's actually happening now?
- **O**ptions — what could they try?
- **W**ill — what will they specifically do?

Pushes back when you catch yourself prescribing ("sounds like you already have a suggestion — do you want to give it, or explore more options first?").

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

---

## `one-on-one-prep`

**Triggers:** "help me prep for my 1:1 with [name]", "1:1 agenda for [name]", "I have a hard 1:1 tomorrow"

Builds a 1:1 agenda matched to the relationship type:

- **Manager → report:** progress check, blockers, career, feedback
- **Report → manager:** updates, asks, escalations, career development
- **Peer:** coordination, dependencies, relationship health
- **Skip-level:** organizational health, career visibility, broader context

Composes with `feedback-frameworks` for hard conversations and `coaching-mode` for development talks.

---

## `performance-management`

**Triggers:** "I have an underperforming report", "managing someone who's struggling", "PIP", "performance conversation with [name]"

Walks the underperformance ladder deliberately — doesn't let you skip stages:

1. **Coaching** — is the gap a skill gap or a motivation gap? Are expectations clear?
2. **Formalized feedback** — written documentation of the gap and improvement criteria
3. **PIP** — specific, measurable, time-bound improvement targets with consequences stated
4. **Termination** — when and how to exit someone with dignity and documentation

**The brilliant-jerk pattern** gets explicit treatment: high output + toxic behavior is its own ladder (the output doesn't excuse the behavior; the behavior has a cost the output doesn't offset).

---

## `hiring-craft`

**Triggers:** "help me design a hiring loop", "I'm interviewing for [role]", "help me run a debrief"

Three modes:

- **Loop design** — map signals to slots, avoid redundant coverage, write behavioral anchors
- **Rubric writing** — what "strong yes / lean yes / lean no / strong no" looks like for each signal
- **Debrief facilitation** — structured debrief with silent-vote-first, round-robin, and calibration norms

Doesn't let you run a debrief without silent votes first — the research on anchoring is clear.

---

## `report-career-architect`

**Triggers:** "build a growth plan for [name]", "12-month plan for [name]", "career conversation with [name]"

Produces a 12–18 month growth plan for a direct report:

- **Target state** — where they're headed (title, scope, capability)
- **Current state** — honest read on gaps and strengths
- **Capability gaps** — specific and behaviorally anchored
- **Sequenced experiences** — ordered: build on strengths before stretching into gaps
- **Manager moves** — what *you* have to stop doing to make room for their growth (the most skipped section in management)
- **Risks** — what could derail the plan
- **Observable success criteria** — how you'll both know the plan is working

Reads `stakeholder-reflect` data from the managing-down folder when present. Highlights that underrepresented reports often get weaker growth plans not because they don't deserve them, but because managers feel less confident advocating.

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

---

## `psychological-safety`

**Triggers:** "build psychological safety", "team is afraid to speak up", "create safe environment", "people are withholding opinions", "no one challenges decisions", "fear-based culture"

Builds psychological safety on a team through concrete leader practices. Not just measure it — actively build it.

**Four pillars:**
1. **Leader vulnerability** — model admitting mistakes, saying "I don't know", asking for input
2. **Response to upward speech** — thank immediately, listen without interrupt, take visible action, follow up privately
3. **Inclusive voice** — round-robin meeting invites, pre-meeting input collection, anonymous channels, credit public
4. **Enabling rituals** — pre-mortems, blameless post-mortems, failure resumes, appreciation rounds

**Quick diagnostic (anonymous 5-question pulse, 1–5 scale):**
1. If I make a mistake, it is used against me
2. It is safe to speak up and disagree
3. Problems can be raised without fear
4. My unique skills and perspectives are valued
5. I feel I belong

Average ≤ 3 indicates work needed.

**Leader actions this week:**
- Admit a mistake in next team meeting
- Thank someone who raises bad news
- Use round-robin in next meeting; call on quieter members
- Run a pre-mortem for the next project
- Start team meetings with "one thing I appreciated last week"

**Never do:** shoot the messenger, minimize, get defensive, ignore, punish.

**Composes with:** `team-diagnosis` (assesses safety level), `team-check-in` (include safety pulse), `read-the-room` (detect hidden safety issues post-meeting), `coaching-mode` (leader develops own vulnerability skills).

---

## `team-charter`

**Triggers:** "create a team charter", "align our team on goals roles norms", "new team kickoff", "reset the team operating model"

Facilitates explicit conversation on the three foundations from Moussa's 3X3 (Goals, Roles, Norms) for new or resetting teams. Produces a living charter at `~/bettersense-work-reflections/team-charters/<team-slug>.md` that serves as the baseline for recurring check-ins.

**Three foundations:**
- **Goals** — purpose statement, 2–4 specific objectives, success metrics, scope boundaries, stakeholders
- **Roles** — per-role accountabilities, decision rights, dependencies, escalation path, ownership gaps
- **Norms** — communication expectations, meeting structure, decision process, conflict handling, information sharing, work hours, feedback cadence

**Process:**
1. Context: team name, members, reason for charter now
2. Goals: draft purpose, set SMART objectives, define in/out of scope, metrics
3. Roles: list roles, clarify decision rights, assign owners, surface gaps
4. Norms: choose categories (meetings, communication, decisions, conflict), specify behaviors (not values)
5. Review and commit: confirm alignment, set next review cadence (default 6 weeks via `team-check-in`)

**Charter format** includes metadata (version, date, members), purpose, goals with owners, role table, norm statements, review schedule, changelog.

**Operating principles:** Explicit not implicit; behavioral not vague; facilitated not imposed; living not archival; concise (≤2 pages); assign owners for all responsibilities.

---

## `team-check-in`

**Triggers:** "team check-in", "are we still aligned", "review our team charter", "3X3 check-in"

Structured recurring conversation to revisit a team's Goals, Roles, and Norms — the Check-In step of Moussa's 3X3. Answers: Are we still committed to what we said? If not, what's the gap between said and done?

**Three-part agenda (60–90 min):**
1. **Review current state (15 min)** — read current charter, note changes since last check-in, quick pulse (1–5) on goals/roles/norms alignment
2. **Diagnose gaps (25–40 min)** — for each foundation, specific misalignments: goals drift (what are we actually working on?), roles gaps (overlap, ambiguity, missing owners), norms friction (painful meetings, communication breakdown). Use anonymous input collection first.
3. **Close the gaps (20–30 min)** — for each gap: define specific behavior change, assign single owner, set target date (2–3 weeks), make success criterion observable. Decide which gaps to fix now vs. intentionally live with (explicit trade-off).

**Output:** 2–4 action items with owner, change, success criterion, review date. Track in separate action log or team charter changelog.

**Cadence:** New teams: every 2 weeks × 2 months, then monthly. Stable teams: every 6 weeks. High-change: every 2–4 weeks. Link to `/schedule`.

**Facilitation:** Use round-robin, timebox sections, end with clear next steps, rotate facilitator.

**Composes:** reads from `team-charter`, writes updates to charter if needed; `team-close-gap` is the action-planning component; `team-diagnosis` provides complementary quantitative data.

---

## `team-close-gap`

**Triggers:** "close the saying-doing gap", "how do we actually change our behavior", "action plan for team norm change", "small steps to improve team work"

Turns identified alignment gaps into **small, targeted behavioral changes** with owners and environmental support. The Close step of 3X3.

**Process (for each gap):**
1. **Gap specification** — convert vague to specific: current state (observable) vs desired state (observable)
2. **Identify smallest possible change** — one behavior, observable, binary, time-bound (2–3 weeks), reversible
3. **Environmental design** — remove friction from new behavior, add friction to old, add cues, change layout, social proof
4. **Owner and success criteria** — single named owner; how we'll know it's done (binary or metric)
5. **2-week follow-up plan** — scheduled check to review progress; if failed, diagnose step/environment design, not blame

**Examples:**
- Gap: "Decisions made in DMs" → small step: "All design discussions in #design-review channel; decisions logged in #decisions"
- Gap: "Interruptions in meetings" → small step: "Use raised-hand feature; facilitator manages queue"
- Gap: "No meeting agendas" → small step: "All recurring meetings post agenda 24h in advance"

**Key principle:** realistic optimist — think ahead about obstacles, design environment to make new behavior easier than old.

**Not:** grand resolutions ("revamp our entire process"), multiple changes at once, ownerless agreements.

**Output:** one-sentence change block with owner, success criterion, review date, status.

---

## `team-lifecycle`

**Triggers:** "our team is changing", "new team member joining", "team reorg transition", "how do we reset our team", "team dissolving", "adjourning a team"

Guides a team through Tuckman's stages: Forming, Storming, Norming, Performing, Adjourning. Provides phase-specific interventions and leader actions. Also covers resets after reorgs, new members, scope changes.

**Phases:**

- **Forming:** High uncertainty, polite, dependency on leader. Actions: set clear purpose, structure early interactions, `team-charter` immediately.
- **Storming:** Conflict emerges, roles clash, power struggles. Actions: normalize conflict, facilitate tough conversations, ensure psychological safety, use `team-style-inventory` to surface style mismatches, `team-check-in` to refocus.
- **Norming:** Roles clarified, norms established, cohesion increases. Actions: document implicit norms (`team-charter` update), guard against premature harmony, introduce stretch goals.
- **Performing:** High autonomy, trust, external focus. Actions: delegate aggressively, protect from disruption, individual growth plans (`report-career-architect`), `wins-log` team achievements, periodic `team-check-in` to prevent drift.
- **Adjourning:** Work completed, team disperses. Actions: celebrate achievements, capture learnings, support transitions, archive (`stakeholder-manage`), `wins-log` retrospective.

**Resets:** New member → partial re-forming; new leader → re-charter; major scope change → revisit charter; major conflict → storming intervention; high performer → adjourning focus.

**Leader role shifts:** Forming (directive) → Storming (facilitator) → Norming (coach) → Performing (delegator) → Adjourning (supporter).

**Composes with:** `team-charter`, `team-check-in`, `psychological-safety`, `team-style-inventory`, `team-close-gap`, `stakeholder-manage`, `report-career-architect`, `wins-log`.

---

## `team-style-inventory`

**Triggers:** "team work style assessment", "understand our team dynamics", "team communication preferences", "style inventory"

Helps teams surface and align on working style preferences — communication, decision-making, conflict, meetings, work rhythms — to reduce friction and increase intentionality.

**Five dimensions:**
1. **Communication:** synchronous vs async; written vs verbal; channel selection; response time expectations; meeting pre-work
2. **Decision-making:** consensus vs consultative vs directive; escalation threshold; how disagreements resolved; decision documentation
3. **Conflict:** comfort with disagreement; task vs personal focus; public vs private pushback; emotional expression level
4. **Meeting style:** meeting necessity; structure vs free-flowing; participation style; attendance; camera policy; facilitation rotation
5. **Work styles:** focus time protection; work hours expectations; workload visibility; information sharing default; learning mode

**Process (90 min):**
- **Phase 1 (15 min):** Individual preferences collected privately (written)
- **Phase 2 (20 min):** Team current state discussion — what do we actually do now? What works, what's painful?
- **Phase 3 (20 min):** Desired team norms — agree on default style for each dimension, with documented exceptions
- **Phase 4 (10 min):** Action items — 1–2 concrete changes to implement in next 2 weeks

**Output:** Team Style Profile appended to team charter or stored at `team-charters/<slug>-style.md`. Includes individual preferences summary (aggregate), agreed norms (behavioral statements), exceptions, review cadence.

**Operating principles:** Preferences ≠ capacity; name mismatches; keep behavioral; make exceptions explicit; revisit quarterly; safety prerequisite.

**Composes with:** `team-charter` (feeds norms), `team-check-in` (review norms), `psychological-safety` (safety needed for honest discussion), `coaching-mode` (leader coaches individuals on style differences).
