---
title: Docs & communication agents
description: Three agents for turning technical work into written artifacts — specs, explanations, and executive communication.
---

These three agents handle the writing layer of technical work: turning validated ideas into specs, turning AI features into explanations non-engineers can trust, and turning technical results into business language executives can act on.

They read `profile.md` when present — communication style, audience defaults, and role context shape how each one frames its output.

---

## `the-spec-writer`

**Triggers:** "draft a PRD for…", "write a spec on…", "I need a one-pager on…", "review this spec for gaps"

Turns a validated problem into a written product spec or PRD. The key word is *validated* — if the problem hasn't been through `the-reducer` or `the-discovery-facilitator`, the spec writer will surface that gap rather than write a spec for the wrong problem.

What it produces:
- **Problem statement** — the specific user behavior being changed, not a capability description
- **Success metrics** — primary metric, leading indicators, counter-metrics; anchored to `strategy/<area>.md` if present
- **Scope** — what's in, what's explicitly out, what's deferred
- **User stories or jobs-to-be-done** — the frame that connects the solution to the problem
- **Open questions** — what has to be resolved before or during build
- **Non-goals** — as load-bearing as goals; prevents scope creep during implementation

Reads `profile.md` (communication style, level of technical detail) and `strategy/<area>.md` (which strategic track this belongs to). Asks which track applies if not stated — specs that don't connect to a strategic track are a flag.

**Not for:** discovery (that's `the-reducer` and `the-discovery-facilitator`) or feasibility (that's `the-scientist`). Invoke `the-spec-writer` after you know what you're building, not to figure it out.

**Composes with:** `the-reducer` and `the-scientist` (upstream — spec follows validation), `the-eval-designer` (the eval harness gets specified here), `the-translator` (for exec-ready summaries of the spec).

---

## `the-explainer`

**Triggers:** "I need to explain this AI feature to customers", "write a how-it-works doc", "draft an FAQ for…", "help me write the security review material", "explain this to [non-technical audience]"

Writes explanations of AI features calibrated to a specific audience — customers, executives, legal/security reviewers, support teams. The distinguishing characteristic: it tells the limitations and safety story, not just the capability story.

Modes:
- **Customer-facing docs** — what the feature does, what it doesn't do, what the user should verify
- **Exec briefing** — what we shipped, what it does for the business, what we're watching, what we're not claiming
- **Internal enablement** — sales decks, support runbooks, onboarding docs for teams who'll answer questions about the feature
- **Legal/security review materials** — data handling, model behavior under adversarial input, failure modes and mitigations

Reads `profile.md` — audience defaults and communication style shape the register. An explainer written by an AI PM at a regulated enterprise looks different from one written by a PM at a seed-stage startup.

**Not for:** technical architecture docs (that's `the-architect`) or specs (that's `the-spec-writer`). The explainer is for audiences who need to understand a feature, not build it.

**Composes with:** `the-spec-writer` (spec is the source of truth the explainer draws from), `the-translator` (explainer covers external audiences; translator covers internal/exec audiences).

---

## `the-translator`

**Triggers:** "I need to brief the CEO on why our accuracy regressed", "translate this eval result into business language", "write the exec summary for this incident", "prep me for the investor update on our AI feature"

Converts technical AI results — eval metrics, latency numbers, failure modes, model trade-offs — into business-language updates for executives, stakeholders, and investor demos.

The core move: **connect technical facts to business consequences.** A 4pp drop in accuracy is not meaningful until you say what it costs. A 200ms latency increase is not meaningful until you say whose workflow it affects.

What it produces:
- A single-paragraph executive summary in plain language
- The business implication of each technical fact (not just the fact)
- What you're doing about it (not just what happened)
- What you're *not* claiming (calibration that builds trust over time)

Reads `profile.md` — your role, the audience you're briefing, and your communication style shape the output. If your profile indicates you report to a technical VP, the output registers differently than if you're briefing a non-technical board.

**Not for:** external customer communication (that's `the-explainer`) or detailed technical write-ups. The translator produces the business layer; the underlying technical content comes from your notes or the incident record.

**Composes with:** `the-incident-responder` (incident → translator produces post-incident exec comms), `the-explainer` (translator handles internal/exec; explainer handles external/customer).
