---
title: Agent catalog
description: All 23 bettersense agents — what each one does and when to use it.
---

## `the-architect`

Use when scaling an AI prototype toward production and needing reliability, cost-efficiency, and clean separation between probabilistic and deterministic logic. Trigger for system design, guardrail design, fallback strategy, or when the question is *"how do we run this in production?"*

Best for: production architecture decisions, LLM call structure, safety sandwiches, cost modeling.

---

## `the-discovery-facilitator`

Use when a PM or team needs structured opportunity discovery before committing to build. Trigger when the user says *"we're thinking about building X"*, *"users keep asking for Y"*, or when `the-reducer` has pushed back on a solution and the team needs to find the real problem.

Works through: separating the problem from the solution, mapping direct vs. assumed evidence, validating demand before technical investment, scoping the opportunity, and producing a falsifiable "informed conviction" statement with open questions for the next phase.

Best for: after the-reducer has confirmed AI might be appropriate but before a spec is written. Sits between the-reducer → **the-discovery-facilitator** → the-scientist → the-spec-writer.

---

## `the-eval-designer`

Use when designing an evaluation system for an LLM or ML feature — golden datasets, metrics, LLM-as-judge rubrics, regression suites, or production sampling strategies. Trigger when the question is *"how do I measure if this is good?"* or when shipping an AI feature without a clear eval in place.

Best for: before committing engineering to an AI feature, after a model regression, when "it feels right" is the current evaluation strategy.

---

## `the-explainer`

Use to write internal or external explanations of how an AI feature works — sales enablement, customer-facing help docs, exec briefings, support runbooks, FAQ, security/legal review materials. Calibrates technical depth to audience. Includes the limitations and safety story, not just the capability story.

Best for: launch enablement, customer trust docs, "explain this to my CEO" situations.

---

## `the-incident-responder`

Use during or after an AI-feature incident — model regression, sudden hallucination spike, eval drop, guardrail bypass, cost or latency anomaly, customer-reported wrong answer that escalated. Triggers on *"we have a regression in…"*, *"the model started…"*, *"users are reporting…"*, or post-incident reviews.

Best for: Tuesday-at-11am when CS forwards a screenshot and launch is Friday. The structure under panic is the value.

---

## `the-postmortem-facilitator`

Use after any significant engineering incident to run a blameless postmortem. Trigger when the incident is stable and the team needs to learn from it — *"we had an outage"*, *"the incident is over — now what?"*, *"how do I run a blameless retrospective on this?"*

Distinct from `the-incident-responder` (which handles real-time AI feature incidents). This is for structured learning after any engineering failure, once the situation is stabilized.

Works through: reading existing incident artifacts, establishing the blameless frame, building a precise timeline, five-whys from each failure point, sorting findings into systemic vs. individual causes, pressure-testing action items for specificity and counterfactual validity, and naming what worked.

Best for: the hour after an incident is resolved, before the team's memory fades and before the instinct to assign blame hardens.

---

## `the-premortem-facilitator`

Use proactively before launches, major initiatives, or strategic decisions to identify failure modes and create mitigation plans. Trigger when the user says "let's run a pre-mortem", "what could go wrong with this plan", or "run a pre-mortem on this".

Works through: establishing the forward-looking frame, posing the failure prompt, collecting risks in three categories (Critical, Perceived, Undiscussed), prioritizing risks by impact × likelihood, and creating an action plan with owners/timelines.

Best for: product launches, AI feature deployments, strategic initiatives, team workshops on risk identification.

---

## `the-program-manager`

Use for multi-team, multi-month technical program management — dependency mapping, risk gates per launch phase, adopting orphaned cross-team problems, designing rollout plans with go/no-go criteria, drafting status comms for different audiences, framing escalations.

Distinct from `the-spec-writer` (feature-level) and `prioritization-frameworks` (backlog-level). Trigger when you're running a program, not a single-team feature.

Best for: Q-launch programs, cross-team dependency management, escalation framing to a VP.

---

## `the-prompt-critic`

Use to review production prompts, system prompts, or agent instructions the way a senior engineer reviews code. Trigger when sharing a prompt and asking *"is this good?"*, when iterating on a struggling LLM feature, or proactively before any prompt ships to production.

Best for: prompt review, system prompt hardening, identifying injection risks and edge cases.

---

## `the-red-teamer`

Use proactively before launch and during maintenance of an AI feature to find failure modes not yet considered. Trigger when reviewing prompts, agent tool wiring, or LLM-facing endpoints for prompt injection, data exfiltration, jailbreaks, or out-of-distribution failures.

Best for: pre-launch security review, finding the failure modes you'll hit at scale before users find them.

---

## `the-reducer`

Use in early-stage AI product discovery when you have a vague or ambiguous problem and haven't yet decided whether AI is the right solution. Trigger phrases: *"we should add AI to…"*, *"users are complaining about…"*, or any new feature pitch where the problem is fuzzier than the proposed solution.

Best for: the Friday-afternoon "can we throw an LLM at search?" message. Defaults to "no AI" and works to earn its way back to yes.

---

## `the-research-synthesizer`

Use to cluster raw qualitative data — interview notes, support tickets, NPS verbatims, sales call transcripts, user feedback — into themes, jobs-to-be-done, and prioritized insights. Trigger when you have unstructured user-voice data and ask *"what does this tell us?"*

Best for: synthesis after user interviews, making sense of a dump of support tickets, pre-planning discovery.

---

## `the-rfc-reviewer`

Use to review engineering RFCs, design docs, technical proposals, or architecture write-ups the way a senior staff engineer would. Trigger when someone shares a doc for review, when you need a second opinion before approving a proposal, or when reviewing your own RFC before publishing.

Best for: EMs who want a credible technical read before signing off, especially when the domain is outside their deepest expertise. The fresh context window is essential for long docs.

---

## `the-scientist`

Use for pre-development feasibility and prototyping of an AI feature. Trigger when validating whether an LLM or ML approach actually works before committing engineering resources — building rapid prototypes, golden datasets, or eval baselines.

Best for: the question *"does this even work?"* before you write a spec.

---

## `the-slo-designer`

Use when a team needs to define reliability targets for a service — SLOs grounded in user experience, error budgets with an actual policy, and the monitoring setup that makes those commitments real. Trigger when the user says *"what SLOs should we have?"*, *"how do we define our error budget?"*, or *"how do we know when to roll back?"*

Distinct from `metrics-design` (product/business metric trees) and `engineering-health` (diagnosing existing systems). This designs the reliability contract before incidents happen.

Works through: defining SLOs from user experience (not system metrics), choosing the right SLIs, verifying instrumentation start points (queue entry vs. handler entry), setting achievable targets from actual baselines, designing error budget policy, specifying leading indicators and burn-rate alerts, and defining the rollback trigger.

Best for: new services, launches, or any service where "we'll figure out reliability later" has held for too long.

---

## `the-spec-writer`

Use to turn a validated problem into a written product spec or PRD. Trigger: *"draft a PRD for…"*, *"write a spec on…"*, *"I need a one-pager on…"*. Also use when reviewing an existing spec for gaps.

Reads `profile.md` and `strategy/<area>.md` when present — specs anchor to strategic tracks, not free-floating. The spec writer will ask which track applies if not stated.

Best for: after `the-reducer` has confirmed this is the right problem, after `the-scientist` has confirmed the approach works.

---

## `the-translator`

Use when converting technical AI results (eval metrics, latency numbers, failure modes, model trade-offs) into business-language updates for executives, stakeholders, or investor demos. Trigger for status updates, demo prep, exec summaries, or post-incident comms.

Reads `profile.md` when present — uses your communication style and audience defaults. Composes with `the-incident-responder` for post-incident comms.

Best for: *"I need to brief the CEO on why our accuracy regressed"*, pre-exec readout prep, investor update on AI feature performance.

---

## `the-vendor-evaluator`

Use when evaluating third-party AI tools, models, APIs, or platforms before purchase. Trigger for vendor selection, build-vs-buy decisions with external options, model-provider comparisons, or when the user needs a structured evaluation framework for procurement. Distinct from `the-reducer` (build-vs-buy internal options) and `the-scientist` (technical feasibility validation). Composes with `ai-pm-frameworks` (model selection criteria), `metrics-design` (success criteria), and `the-architect` (integration patterns).

Best for: procurement decisions, comparing LLM providers, evaluating AI SaaS tools, avoiding vendor lock-in, TCO analysis.

---

## `the-gtm-planner`

Use when planning a go-to-market launch for an AI feature or product — sequencing, audience segmentation, messaging calibration, and launch readiness gates. Trigger when the user asks "how do we launch this?", "what's our GTM strategy for the AI feature?", or needs a phased rollout plan that accounts for AI-specific considerations (trust-building, edge-case communication, opt-in/opt-out strategies). Distinct from `the-program-manager` (multi-team coordination) and `the-rollout-planner` (staged feature rollouts). Composes with `the-explainer` (messaging), `the-translator` (executive comms), and `demo-prep` (launch demos).

Best for: phased AI launches, trust-gap management, cohort-based rollouts, launch readiness gates.

---

## `the-retro-facilitator`

Use when facilitating a team retrospective or post-mortem after a project, incident, or sprint. Trigger for structured retros that produce action items, not just conversation. Distinct from `the-incident-responder` (real-time incident management) and `the-postmortem-facilitator` (blameless postmortem after infrastructure incidents). This agent focuses on team process, teamwork, and improvement cycles — it's for the regular cadence retro, not just incident deep-dives. Composes with `read-the-room` (surface subtext before retro), `team-diagnosis` (health data to inform retro), and `feedback-frameworks` (airing concerns constructively).

Best for: sprint retros, project post-mortems, continuous improvement cycles, psychological safety maintenance, system diagnosis.

---

## `the-data-storyteller`

Use when translating metrics, data, or analytical findings into a compelling narrative for stakeholders. Trigger when the user has data but struggles to frame it into a story, when presenting results to non-technical audiences, or when metrics need context and meaning. Distinct from `the-translator` (which focuses on AI-specific technical results) — this agent handles general data-to-story translation across product, business, and team metrics. Composes with `metrics-design` (defining the metrics), `product-pulse` (source data), and `the-translator` (AI-specific reframing).

Best for: executive presentations, metric-driven narratives, insight communication, data visualization storyboarding.

---

## `the-status-crafter`

Use when drafting regular status updates, stakeholder reports, or leadership communications about ongoing work. Trigger for weekly/monthly status emails, stakeholder updates, leadership readouts, or any recurring communication that summarizes progress, risks, and next steps. Distinct from `the-translator` (which converts technical results into business language) and `the-explainer` (which explains features/concepts). This agent focuses on recurring operational reporting. Composes with `the-translator` for executive audiences, `team-diagnosis` for health insights, and `product-pulse` for product metrics.

Best for: weekly status emails, monthly leadership readouts, operational reporting, signal extraction from noise.

---

## `the-career-coach`

Use when coaching individual contributors on career development, growth planning, and skill-building — particularly for ICs navigating promotion paths, skill gaps, or role transitions. Distinct from `report-career-architect` (which builds growth plans for the user's direct reports) and `coaching-mode` (which is for ask-not-tell development conversations). This agent provides structured guidance for ICs to self-assess and build their own careers, and for managers coaching ICs who are not their direct reports (e.g., matrixed reports, mentorship relationships). Composes with `feedback-frameworks` (giving actionable feedback), `report-promo-case` (building evidence), and `leadership-os` (career conversations).

Best for: promotion readiness assessment, career path planning, skill gap analysis, growth plan crafting for ICs.

---
