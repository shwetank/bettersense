---
title: Operations & people agents
description: Six agents covering business operations, team effectiveness, and career development — vendor evaluation, GTM launches, retrospectives, data storytelling, status reporting, and IC career coaching.
---

These six agents handle the operational and people-side machinery that makes AI products and teams succeed beyond the core technical workflow: selecting vendors, planning launches, running effective retrospectives, crafting status communications, translating data into narratives, and coaching individual contributors on career growth.

They complement the technical agents by addressing the "how do we work together and communicate" layer.

---

## `the-vendor-evaluator`

**Triggers:** "we're evaluating vendor X for…", "help me decide which LLM provider to use", "build vs buy analysis for this AI component", "procurement evaluation for AI tool"

Brings engineering rigor to third-party AI procurement decisions. Most vendor evaluations fail by comparing marketing sheets instead of testing on real data. This agent enforces empirical validation, TCO analysis, and exit-strategy planning.

What it produces:
- **Evaluation matrix** with scored dimensions (capability fit, quality metrics, integration cost, operational burden, cost model clarity, vendor health, compliance fit)
- **Comparative test plan** using your golden dataset or representative samples, blind-evaluated
- **Decision memo** with recommendation, conditions, risks, and next steps (contract negotiation points, integration spike, pilot plan)

**Not for:** vendor negotiations themselves (that's procurement/legal) or intra-team build-vs-building internal tooling decisions (that's `the-reducer` + `ai-pm-frameworks`).

**Composes with:** `ai-pm-frameworks` (model selection criteria), `metrics-design` (defining success criteria for the evaluation), `the-architect` (integration patterns and safety sandwich for third-party components), `decision-log` (capture the vendor decision as an ADR).

---

## `the-gtm-planner`

**Triggers:** "how do we launch this AI feature?", "what's our GTM strategy?", "help me plan a phased rollout", "how do we build trust for an AI launch"

Designs phased go-to-market launch strategies that acknowledge AI's unique trust and adoption hurdles. Traditional GTM assumes known product categories; AI features require building new mental models and managing edge-case visibility.

What it produces:
- **Trust gap assessment** (novelty, stakes, black-box risk level)
- **Launch cohort plan** (internal alpha → trusted beta opt-in → limited GA opt-out → full GA) with gate criteria per phase
- **Messaging architecture** by audience (early adopters, risk-averse users, executives, support, sales)
- **Readiness checklist** across product, ops, support, and communications
- **Monitoring plan** for adoption and sentiment signals (opt-in rate, override rate, feature abandonment, support volume)

**Not for:** the actual product marketing copy (that's `the-explainer`) or multi-team launch coordination (that's `the-program-manager`). This agent designs the launch strategy; others execute the pieces.

**Composes with:** `the-explainer` (audience-calibrated explainer docs), `the-translator` (executive launch-readout language), `demo-prep` (launch demo that acknowledges edge cases), `the-incident-responder` (if trust-breaking failures occur mid-launch), `the-red-teamer` (pre-launch failure mode surfacing for the FAQ).

---

## `the-retro-facilitator`

**Triggers:** "let's run a retro", "help me facilitate a post-mortem", "how do we run an effective retrospective?", "what's the best retro format for this team?"

Structured retrospective facilitation that produces actionable improvement items — not complaint sessions or status reports. Selects the right retro format for the team's need, surfaces system-level root causes, and converts insights into SMART action items with clear owners.

What it produces:
- **Retro format selection** (standard, sailboat, start/stop/continue, 5 whys, mad/sad/glad) matched to team needs
- **Facilitation script** with stage-setting, silent data gathering, theming, insight generation, decision-making
- **Action item table** (action, owner, success criterion, due date) — limited to 1–3 items
- **Retro health check** (blame-free? quiet voices included? root-cause linked? likely to get done?)

**Not for:** incident postmortems (that's `the-postmortem-facilitator`) or real-time incident handling. This is for regular team improvement cycles.

**Composes with:** `read-the-room` (surface unspoken tensions before retro), `team-diagnosis` (bring health data as anchor), `feedback-frameworks` (structure feedback using COIN when people are hesitant), `one-on-one-prep` (handle sensitive individual issues in 1:1s, not group retros).

---

## `the-data-storyteller`

**Triggers:** "I have the data but I don't know what story it tells", "help me present these metrics to execs", "how do I make this dashboard compelling?", "turn these numbers into a narrative"

Translates spreadsheets, dashboards, and metric tables into narratives that land. Data without story gets ignored; story without data gets dismissed. This agent finds the singular insight, chooses the right story archetype, builds the narrative arc, and drives to action.

What it produces:
- **Insight statement** (one-sentence takeaway)
- **Story archetype selection** (trend, comparison, breakpoint, correlation, segment, outlier)
- **Narrative structure**: hook → evidence → discovery → implication → action
- **Visualization recommendation** matched to story type
- **Actionable conclusion** — not "interesting" but "here's what we should do"

**Not for:** raw data analysis or statistical modeling (that's an analyst's job). This agent shapes existing analysis into communication.

**Composes with:** `metrics-design` (ensures you're looking at the right metrics), `product-pulse` (source of product health data), `pulse-synthesize` (finds trends across pulses that become stories), `the-translator` (upgrade path for executive audiences), `the-explainer` (adds narrative layer to technical findings).

---

## `the-status-crafter`

**Triggers:** "help me write my weekly status update", "draft a monthly report for leadership", "what should I put in my stakeholder update?", "status email that actually gets read"

Crafts recurring operational status reports that provide signal, not noise. Avoids the pitfalls of laundry-list updates, optimism bias, risk-free reporting, and decision-silent communications.

What it produces:
- **Audience-specific templates** (exec sponsor, cross-functional partners, manager, peers)
- **Executive summary** (2–3 bullets of what matters most)
- **Progress categorization** (on track, at risk, blocked) with evidence and metrics
- **Decisions explicitly requested** (what needed, by when, options)
- **Risk register** (description, likelihood, impact, mitigation, owner)
- **Metrics snapshot** (current, target, trend)

**Not for:** one-off project reports (can adapt the template) or incident updates (that's `the-incident-responder`). This is for recurring operational rhythm.

**Composes with:** `the-translator` (when audience is executive and status contains heavy AI technical results), `product-pulse` (source data for product health), `team-diagnosis` (health signals to incorporate), `wins-curate` (highlights section), `the-incident-responder` (hand-off if status surfaces a P0).

**When to skip:** if nothing changed since last period, no decisions needed, no risks escalated, metrics flat-on-target — send "no update" or skip. Don't train your audience to ignore you.

---

## `the-career-coach`

**Triggers:** "I'm stuck in my career", "how do I get to the next level?", "career advice for an IC", "help me plan my growth as an engineer", "coaching for promotion readiness"

Structured career development coaching for individual contributors — not just ladder climbing but intentional career design matching skills, interests, and life context. Works for both ICs self-assessing and managers coaching ICs who aren't their direct reports.

What it produces:
- **Career stage diagnosis** (early IC, established IC, transition, plateau, alt-planning)
- **Assessment across dimensions** (technical depth, scope, influence, visibility, mentorship, business impact)
- **Promotion-readiness mapping** to rubric dimensions with evidence gaps identified
- **Skill-gap-to-project conversion** (gap → project opportunity)
- **6–12 month growth plan** (target behaviors, experiences needed, support requested, risks, check-ins)
- **Navigation for specific challenges** (boredom, management track, passed-over, IC ceiling, unsupportive manager)

**Not for:** performance management of direct reports (that's `performance-management` + `report-career-architect`) or general development conversations using ask-not-tell (that's `coaching-mode`). This agent provides the structured framework; coaching-mode is the conversation style.

**Composes with:** `feedback-frameworks` (COIN structure for developmental feedback), `one-on-one-prep` (career conversation prep), `report-promo-case` (mirror the promo-case framework for self-assessment), `influence-without-authority` (relevant for staff+ ICs), `performance-management` (if issues require formal process).

**When to refer out:** burnout/mental health (HR resources), chronic bias (formal HR intervention), reorg confusion (stakeholder-manage).

---

These six agents complete the bettersense bundle, filling out the operational and people development dimensions that sit alongside the technical AI workflow, reliability, and core documentation agents.
