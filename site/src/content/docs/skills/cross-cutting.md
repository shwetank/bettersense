---
title: Cross-cutting skills
description: Five skills for reading the room, influencing without authority, pre-mortems, glue work auditing, and the general leadership OS.
---

These five skills serve everyone in the bundle — not specific to AI PMs, EMs, or TPMs, but used by all of them.

---

## `glue-audit`

**Triggers:** "what glue work am I doing", "audit my glue work", "catalog our glue tasks", "is our glue work fairly distributed", "how much time do I spend on non-promotable work"

Systematically identifies, categorizes, and quantifies glue work — essential non-core technical tasks like onboarding, documentation, unblocking, cross-team alignment, and process improvement — that make projects succeed but are often invisible and non-promotable.

Produces a structured inventory:
- **Task list** with category, frequency, time estimates
- **Core vs. glue classification** based on the user's actual role and ladder
- **Visibility assessment** — who knows this work happens?
- **Promotion value** — does the company's engineering ladder recognize this?
- **Fairness signals** — for team audits: demographic patterns, single-point dependencies, volunteer vs. assignment bias

Three modes:
- **Self-audit** — for engineers questioning "why haven't I been promoted?" when their impact is primarily glue
- **Team audit** — for managers diagnosing glue distribution across reports
- **Role audit** — "If I become a manager/TPM, how much of my current glue becomes core?"

**Why this matters:** Tanya Reilly's "glue work" thesis — the team collapses without it, but many orgs don't count it as "technical" for promotion. The audit makes the invisible visible and gives you data for career conversations, workload rebalancing, and promotion packets.

---

## `read-the-room`

**Triggers:** "help me read this meeting", "I don't trust the consensus in that review", "everyone agreed but something felt off"

Retrospective interpretation of a meeting, Slack thread, 1:1, or design review. You bring the transcript or your notes; the skill surfaces:

- **Who held back** — people who were present but didn't speak, or whose silence had weight
- **Performative consensus** — agreement in the meeting that doesn't reflect actual positions
- **Positions vs. interests** — what people said they want vs. what they actually need
- **Burnout or disengagement signals** — in meeting patterns, not a clinical read
- **Subtext in language** — hedging, deflection, qualification that suggests hidden concerns

**Every output is a hypothesis, not a claim.** The skill ends with "hypotheses to verify directly" — observation, not diagnosis. Verifying means talking to the person, not acting on the hypothesis as fact.

**Necessarily retrospective.** You bring the meeting to Claude after it happened. The skill helps you see what you might have missed; it doesn't replace asking the person directly.

---

## `influence-without-authority`

**Triggers:** "I need [X] but they don't report to me", "how do I get [name/team] to do this?", "influence without authority", "I can't go around the VP"

Coalition-building and influence work for TPMs, staff engineers, and senior ICs who lead through the work, not through org chart authority.

Covers:
- **Positions vs. interests** — what someone says they want vs. what they actually need (often different; interests are more negotiable)
- **Sequencing the coalition** — early believers first, skeptics after you have momentum, the decision-maker last (not first)
- **Legitimate currencies** — real reciprocity, real scarcity, real expertise. What you can offer that has genuine value.
- **The listening conversation** — why going in with a proposal is often the wrong first move

**The skill is opinionated about manipulation.** It refuses to teach manufactured urgency, staged consensus, and fake reciprocity — even when they'd tactically "work." The reasoning: all influence work is iterated, and the cost-to-trust of manipulative tactics outpaces the short-term gain. If you want a tactically harder edge, the operating principles are where to adjust.

---

## `premortem`

**Triggers:** "what could go wrong", "run a pre-mortem", "risk assessment", "pre-mortem this plan"

Pre-mortem is prospective hindsight: imagine your initiative has failed, then work backward to identify why. This technique, developed by Gary Klein and refined by Shreyas Doshi, helps identify risks hidden by optimism bias.

**The three categories:**

- **🎯 Critical Risks** — Clear threats requiring action
- **🔍 Perceived Risks** — Potential threats others might worry about
- **🔇 Undiscussed Risks** — Important concerns the team isn't addressing

**Output:** A risk register with top risks ranked by impact × likelihood, proposed mitigations with owners/timelines, and accepted risks (intentional decisions to live with some risk).

Works solo (lightweight, before any significant decision) or as a facilitated team session — the skill includes the facilitation flow: framing the session as prevention rather than criticism, quiet brainstorming before discussion, and ending in an action plan with single owners and deadlines rather than a brainstorm that ends in anxiety.

For AI features, add specific categories: hallucination risk, refusal/over-refusal, prompt injection, data leakage, cost explosion.

---

## `leadership-os`

**Triggers:** "help me with this management situation", "I have a hard conversation", "stakeholder update", "cross-functional conflict with [team]", "post-mortem facilitation"

General-purpose management operations. Covers situations that don't fit neatly into a more specialized skill:

- **Hard conversations** — conversation scripts for specific management situations
- **Stakeholder updates** — framing updates for different audiences (exec vs. team vs. cross-functional)
- **Cross-functional conflict** — diagnosing what's driving the conflict and what the resolution path is
- **Post-mortem facilitation** — blameless, structured, with output that actually changes behavior
- **The "Mirror" mode** — leadership behavior feedback, for situations where you want to see your own pattern clearly

For development conversations: hand off to `coaching-mode`. For feedback on specific behaviors: hand off to `feedback-frameworks`. For program-level cross-team work: hand off to `the-program-manager` agent.
