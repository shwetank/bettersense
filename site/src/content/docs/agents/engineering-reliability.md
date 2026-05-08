---
title: Engineering reliability agents
description: Four agents for design review, reliability planning, incident response, and postmortems.
---

These four agents cover the reliability arc of an engineering team: reviewing designs before they ship, defining reliability targets, responding to incidents when they happen, and learning from them after.

They're distinct tools. The RFC reviewer is pre-ship. The SLO designer is pre-incident. The incident responder is real-time. The postmortem facilitator is post-incident. Using the right one for the right moment is most of the value.

---

## `the-rfc-reviewer`

**Triggers:** "review this design doc", "give me a second opinion on this RFC", "I'm about to approve this proposal — anything I'm missing?", "review my own RFC before I publish it"

Reviews engineering RFCs, design docs, technical proposals, and architecture write-ups the way a senior staff engineer would — including the parts a polite reviewer would skip.

What it looks for:
- **Problem–solution fit:** does the proposed solution actually solve the stated problem, or does it solve an easier adjacent problem?
- **Unstated assumptions:** what has to be true for this to work? Are those assumptions stated?
- **Failure modes:** what happens when this fails? Is there a recovery path?
- **Scope and reversibility:** how hard is it to undo this decision? Is the scope proportionate to the confidence level?
- **Alternatives considered:** was the rejected space actually explored, or listed to look thorough?
- **Implementation risk:** where does the complexity live? Is that acknowledged?

The fresh context window matters here. For long design docs, an agent starting clean reads the whole document without being anchored by your earlier framing in the session.

**Not for:** production system design from scratch (that's `the-architect`) or SLO/reliability planning (that's `the-slo-designer`). The RFC reviewer evaluates an existing proposal; it doesn't produce one.

**Composes with:** `the-architect` (architectural proposals may generate an RFC; the reviewer evaluates it), `the-slo-designer` (reliability commitments in an RFC get pressure-tested against the SLO design).

---

## `the-slo-designer`

**Triggers:** "what SLOs should we have for this service?", "how do we define our error budget?", "how do we know when to roll back?", "we need reliability targets before launch"

Designs the reliability contract for a service — SLOs grounded in user experience, error budgets with a real policy, and the monitoring setup that makes those commitments credible.

The core principle: **SLOs should be derived from user experience, not system metrics.** Uptime is not an SLO. Latency at the p95 for users who complete checkout is an SLO.

What it produces:
- **SLO definition** — the specific user-experience behavior being protected, with the SLI (indicator) and threshold
- **Achievable target** — calibrated from actual baselines, not aspirational round numbers
- **Error budget** — the allowed failure headroom and what happens when it's exhausted
- **Error budget policy** — what changes when the budget is burning fast (freeze deployments? escalate? reduce scope of on-call?)
- **Leading indicators** — signals that predict SLO breach before it happens
- **Burn-rate alerts** — how fast the budget is being consumed, not just whether you're in breach
- **Rollback trigger** — the specific condition that initiates a rollback vs. a hotfix

Distinct from `metrics-design` (business and product metrics) and `engineering-health` (diagnosing existing system health). The SLO designer sets targets before incidents happen.

**Not for:** post-incident learning (that's `the-postmortem-facilitator`) or real-time incident response (that's `the-incident-responder`). SLOs are designed once; incidents are handled when they occur.

**Composes with:** `the-architect` (the production system design determines what's measurable), `the-rfc-reviewer` (reliability commitments in an RFC get validated against SLO design), `the-incident-responder` (incidents that breach SLOs become the incident responder's domain).

---

## `the-incident-responder`

**Triggers:** "we have a regression in…", "the model started producing…", "users are reporting…", "our eval scores dropped overnight", any real-time AI feature incident

Handles AI-feature incidents: model regressions, hallucination spikes, eval drops, guardrail bypasses, cost or latency anomalies, customer-reported wrong answers that escalated. The structure under pressure is the value.

What it works through:
- **Scope and blast radius** — how many users affected, what product surface, what downstream systems
- **Immediate containment** — what can be done right now to limit impact (rollback, rate limit, disable feature)
- **Root cause hypothesis** — model change? prompt change? data drift? deployment artifact? upstream dependency?
- **Evidence gathering** — what logs, evals, and examples to pull to confirm the hypothesis
- **Communication draft** — what to tell CS, what to tell the exec, what to tell engineering, in what order
- **Handoff to postmortem** — what to preserve now so the postmortem has the material it needs

Distinct from `the-postmortem-facilitator` — the incident responder handles the real-time incident; the postmortem facilitator handles the structured learning after it's resolved.

**Not for:** non-AI incidents (general infra outages, database failures). The incident responder is calibrated for AI-specific failure modes. For general incidents, use standard runbooks.

**Composes with:** `the-slo-designer` (SLO breach triggers the incident; error budget policy shapes the response), `the-postmortem-facilitator` (incident resolution triggers the postmortem), `the-translator` (incident facts → exec-ready comms).

---

## `the-postmortem-facilitator`

**Triggers:** "we had an incident — now what?", "help me run a blameless postmortem", "the incident is resolved and I need to make sure we learn from it"

Runs structured, blameless postmortems after engineering incidents. The right time to invoke this is when the incident is stabilized and the team still has the events fresh — before memory fades and before the instinct to assign blame hardens.

What it works through:
- **Blameless frame** — establishes explicitly that the goal is systemic learning, not individual accountability; surfaces and names the systemic conditions that made the failure possible
- **Precise timeline** — not "around 2pm" but "14:03: first alert fired." Reconstructs the event with timestamps from logs, Slack, and memory
- **Five-whys from each failure point** — not stopping at the proximate cause (the deploy), not stopping at the first systemic cause, finding the condition that made the proximate cause possible
- **Findings sorting** — systemic vs. individual, fixable vs. accepted risk
- **Action item pressure-test** — specific owner, specific deadline, counterfactual validity (would this action have prevented the incident?)
- **What worked** — explicit credit for what the response got right, which is often skipped

Distinct from `the-incident-responder` (real-time) — this is reflective, not reactive.

**Not for:** real-time incident response. If the incident is still active, use `the-incident-responder` first.

**Composes with:** `the-incident-responder` (hands off when the incident is resolved), `the-slo-designer` (postmortem findings often reveal SLO gaps or error budget policy gaps).
