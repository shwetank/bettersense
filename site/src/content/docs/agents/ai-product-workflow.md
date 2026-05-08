---
title: AI product workflow agents
description: Seven agents that cover the full lifecycle of shipping an AI feature — from problem validation through production reliability.
---

These seven agents form an end-to-end pipeline for disciplined AI feature development. They're designed to be used in sequence, though each can stand alone. The core principle: **default to "no AI," earn the yes, build evals before code, design for production from the start.**

The pipeline:

```
the-reducer → the-discovery-facilitator → the-scientist → the-eval-designer
                                                                    ↓
                        the-red-teamer ← the-prompt-critic ← the-architect
```

---

## `the-reducer`

**Triggers:** "we should add AI to…", "users are complaining about…", "can we use an LLM for…", any feature pitch where the problem is fuzzier than the proposed solution

The first agent to reach for. Pushes back on AI solutions before they harden into specs. Works through the "default to no" question: is this actually an AI problem, or a UI problem, a data problem, a rules problem?

What it produces:
- A diagnosis of the real problem (often not the one stated)
- A classification: AI-appropriate / better solved without AI / needs more discovery
- If AI might be appropriate: a scoped, falsifiable problem statement to hand to `the-discovery-facilitator` or `the-scientist`

**Not for:** features where the AI approach is already validated and you're in implementation mode. The reducer is for the question before the question.

**Composes with:** `the-discovery-facilitator` (if the problem is real but under-defined), `the-scientist` (if the problem is clear and you want a feasibility pass), `ai-pm-frameworks` skill (for the full decision framework in-session).

---

## `the-discovery-facilitator`

**Triggers:** "we're thinking about building X", "users keep asking for Y", after `the-reducer` has confirmed the problem is real but the solution space is still open

Sits between problem validation and solution commitment. Keeps you in discovery mode longer than feels comfortable — which is the point.

Works through:
- Separating what users say they want from what behavior change you're actually trying to drive
- Mapping direct evidence vs. assumed evidence for demand
- Validating that the opportunity is real before technical investment
- Producing an "informed conviction" statement: a falsifiable claim about the problem, the target user, and the expected outcome

**Not for:** post-spec work, or when you need to move fast and the problem is already validated. If `the-reducer` has given a clear go, skip to `the-scientist`.

**Composes with:** `the-reducer` (upstream), `the-scientist` (downstream), `the-spec-writer` (once conviction is established).

---

## `the-scientist`

**Triggers:** "does this even work?", "I want to validate this approach before we spec it", "help me prototype this AI feature"

Feasibility and prototyping before engineering commitment. Designs rapid validation experiments: what to test, with what data, in what timeframe, to produce a go/no-go with actual evidence.

What it produces:
- A validation plan (what to test, what good looks like, what would kill the idea)
- Guidance on sample construction (what tickets/documents/inputs to use, how many, what mix)
- A failure taxonomy from the experiment — where the approach breaks and what that implies for scope
- A go/no-go recommendation with the evidence that supports it

**Not for:** production system design (that's `the-architect`) or post-validation eval harness design (that's `the-eval-designer`). The scientist answers "does this work?" not "how do we ship it?"

**Composes with:** `the-reducer` and `the-discovery-facilitator` (upstream), `the-eval-designer` and `the-spec-writer` (downstream).

---

## `the-eval-designer`

**Triggers:** "how do I measure if this is good?", "I need an eval harness for this feature", "we shipped and now we have no way to detect regressions"

Designs the evaluation system that separates disciplined AI shipping from vibes-driven shipping. The right time to invoke this is *before* you write production code — not after.

What it produces:
- **Golden dataset spec:** size, sampling strategy, distribution across easy/hard/edge cases, how to handle distribution shift over time
- **Metric set:** primary human-judgment metric, proxy metrics for automation, counter-metrics that catch Goodhart failures
- **LLM-as-judge rubric:** dimensions, scoring scale, what passes vs. flags for human review
- **Regression threshold:** what change triggers a human review before shipping

**Not for:** production monitoring (that's `the-slo-designer`) or incident diagnosis (that's `the-incident-responder`). Evals are pre-ship; SLOs are post-ship.

**Composes with:** `the-scientist` (upstream — experiment results seed the golden dataset), `the-architect` (the eval harness plugs into the production system design), `metrics-design` skill (for the business metric layer above the eval).

---

## `the-architect`

**Triggers:** "how do we run this in production?", "we need to scale this prototype", "what does the guardrail design look like?", "how do I separate the LLM from the business logic?"

Production reliability and system design for AI features. The core principle: **probabilistic in, deterministic out** — LLMs propose, business rules dispose.

What it produces:
- Safety sandwich design: input filter → LLM call → output guardrail
- Cost modeling: token budget, caching strategy, expected cost at scale
- Fallback design: what happens when the model fails, is slow, or produces out-of-distribution output
- Clean separation between probabilistic logic (the model) and deterministic logic (business rules, validation, routing)

**Not for:** eval harness design (that's `the-eval-designer`) or prompt quality review (that's `the-prompt-critic`). The architect designs the system; the other agents design what runs inside it.

**Composes with:** `the-eval-designer` (the eval harness is part of the production system), `the-prompt-critic` (prompts are reviewed after the system structure is set), `the-slo-designer` (reliability targets for the production system).

---

## `the-prompt-critic`

**Triggers:** "is this prompt good?", "review my system prompt", "I'm iterating on a struggling LLM feature", before any prompt ships to production

Reviews production prompts and system prompts the way a senior engineer reviews code. Proactively look for issues rather than just confirming what you already wrote is fine.

What it checks:
- **Clarity:** is the instruction unambiguous? What would a model that followed this exactly produce at the edge?
- **Injection risk:** where could a user or upstream system inject instructions?
- **Role and persona bleed:** does the prompt create a character that could be jailbroken?
- **Instruction conflict:** do any instructions contradict each other under specific inputs?
- **Over-specification:** instructions that box the model into bad outputs on edge cases
- **Under-specification:** missing constraints that allow bad outputs in production

**Not for:** security red-teaming at scale (that's `the-red-teamer`). The prompt critic reviews one prompt; the red teamer stress-tests the full attack surface.

**Composes with:** `the-architect` (prompt review happens after system structure is set), `the-red-teamer` (red team follows prompt hardening).

---

## `the-red-teamer`

**Triggers:** "find the failure modes I haven't thought of", "stress-test this before launch", "what could go wrong with this prompt/agent/endpoint?"

Adversarial analysis of AI features before users find the problems. Covers the attack surface a well-intentioned reviewer misses because they're not thinking like someone trying to break the system.

What it looks for:
- **Prompt injection:** can user input or upstream data hijack the model's instructions?
- **Data exfiltration:** can the model be made to reveal system prompt contents, training data, or other users' data?
- **Jailbreaks:** does the persona or role specified in the system prompt have a known bypass pattern?
- **Out-of-distribution failures:** what inputs does the system handle gracefully in testing but fail on at scale?
- **Scope creep:** can the model be coaxed into acting outside its intended scope?

**Not for:** prompt iteration (that's `the-prompt-critic`). The red teamer assumes the prompt is roughly final and looks for what survives despite that.

**Composes with:** `the-prompt-critic` (review before red team), `the-eval-designer` (failures found in red team become edge cases in the golden dataset), `the-architect` (systemic vulnerabilities feed back into guardrail design).
