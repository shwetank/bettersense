---
title: Research & programs agents
description: Two agents for synthesizing qualitative data and managing multi-team technical programs.
---

These two agents handle work that spans beyond a single team or a single session: making sense of large volumes of unstructured user data, and managing programs that cross team boundaries for months at a time.

---

## `the-research-synthesizer`

**Triggers:** "what does this user research tell us?", "I have 20 interview transcripts — what are the themes?", "synthesize these support tickets", "what patterns are in this NPS data?"

Clusters raw qualitative data — interview notes, support tickets, NPS verbatims, sales call transcripts, user feedback — into themes, jobs-to-be-done, and prioritized insights.

The fresh context window matters here. Synthesis across large volumes of unstructured data in a session full of other context produces noisier output than a clean pass over the raw material.

What it produces:
- **Theme clusters** — groups of related observations with representative quotes, not just labels
- **Jobs-to-be-done** — the underlying goals users are trying to accomplish, separated from the surface-level requests they articulate
- **Frequency and confidence** — how many data points support each theme, and how confident the synthesis is vs. where it's extrapolating
- **Priority signal** — which themes appear across multiple data sources and user types, vs. which are local to a specific segment
- **Open questions** — what the data doesn't answer and what you'd need to find out

**Not for:** quantitative data analysis (surveys with Likert scales, funnel metrics, A/B test results). The research synthesizer is built for open-ended, unstructured text. Quantitative synthesis needs a different approach.

**Composes with:** `the-reducer` (synthesis findings often reveal whether the problem being solved is the real problem), `the-discovery-facilitator` (research findings feed into opportunity scoping), `the-spec-writer` (jobs-to-be-done from synthesis become the user story layer of the spec).

---

## `the-program-manager`

**Triggers:** "I'm running a cross-team program and dependencies are getting complicated", "help me map the risks for this launch", "I need to escalate this but I'm not sure how to frame it", "there's an orphaned problem between two teams and nobody owns it"

Multi-team, multi-month technical program management: dependency mapping, risk gates, rollout plans with go/no-go criteria, status communication for different audiences, and escalation framing.

What distinguishes this from single-team feature work: the program manager assumes that the people doing the work don't report to you, that dependencies aren't fully visible at the start, and that the communication problem is as hard as the technical problem.

What it works through:
- **Dependency map** — who's doing what, in what order, and where the critical path is; surfaces hidden dependencies that aren't in the official plan
- **Risk register** — likelihood × impact, with a named owner for each risk and a mitigation plan; distinguishes "known risk we're accepting" from "risk nobody has looked at"
- **Go/no-go criteria** — the specific, observable conditions that have to be true before each phase proceeds; prevents "we're basically ready" launches
- **Status comms by audience** — engineering status reads differently for an eng lead, a PM, and a VP; produces the right frame for each without duplicating work
- **Escalation framing** — when to escalate, to whom, and how to frame it so the escalation produces a decision rather than a discussion

Distinct from `the-spec-writer` (feature-level, single-team) and `prioritization-frameworks` (backlog-level). The program manager operates at the program level, across teams, over months.

**Not for:** single-team sprints or feature work where one team has full control. If the work doesn't cross team boundaries or isn't multi-month, the overhead isn't worth it.

**Composes with:** `influence-without-authority` skill (program managers often can't direct the teams they depend on), `the-rfc-reviewer` (program-level technical decisions often produce RFCs), `the-translator` (program status → exec-ready updates).
