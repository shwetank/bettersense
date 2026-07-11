---
title: Agents overview
description: What agents are, how they differ from skills, and when to use them. bettersense's agents are organized into five clusters.
---

bettersense ships subagents alongside its skills. They're different tools for different situations.

## Skills vs. agents

| | Skills | Agents |
|---|---|---|
| **Context** | Runs inside your current session | Gets a fresh context window |
| **State** | Carries your session history | Starts clean |
| **Best for** | Framework-guided conversations, quick structured outputs | Long documents, multi-pass analysis, tasks that compete with session state |
| **Invocation** | Auto-routes or `/bettersense:<skill-name>` | `/agents` then select, or Claude delegates automatically |

## When to use an agent

Agents earn their keep when:

1. **The task involves a large document.** An RFC review, a complex spec, a 30-page strategy doc. Reading the whole thing in a session full of other context produces worse analysis than a fresh window.

2. **The task is multi-pass.** The eval designer runs several passes (problem statement → metric design → test cases → rubric → edge cases). Each pass benefits from the previous without competing with your meeting prep from earlier.

3. **You want a second opinion.** Fresh context means the agent hasn't been anchored by your framing from earlier in the session.

## How agents are invoked

**From within Claude Code:**
```
/agents
```
Select the agent from the list that appears. You can also describe what you're working on and Claude may route to an agent automatically.

**Explicitly by name:**
```
use the-spec-writer for this
the-eval-designer should look at this eval setup
```

## The clusters

### [AI product workflow](/agents/ai-product-workflow)

Seven agents covering the full lifecycle of shipping an AI feature — from problem validation through production reliability.

`the-reducer` → `the-discovery-facilitator` → `the-scientist` → `the-eval-designer` → `the-architect` → `the-prompt-critic` → `the-red-teamer`

### [Docs & communication](/agents/docs-and-communication)

Three agents for turning technical work into written artifacts — specs, explanations, and executive communication.

`the-spec-writer` · `the-explainer` · `the-translator`

### [Engineering reliability](/agents/engineering-reliability)

Four agents covering the reliability arc — design review, reliability planning, incident response, and postmortems.

`the-rfc-reviewer` · `the-slo-designer` · `the-incident-responder` · `the-postmortem-facilitator`

### [Research & programs](/agents/research-and-programs)

Two agents for qualitative data synthesis and multi-team program management.

`the-research-synthesizer` · `the-program-manager`

### [Operations & people](/agents/operations-people)

Six agents covering business operations, team effectiveness, and career development.

`the-vendor-evaluator` · `the-gtm-planner` · `the-retro-facilitator` · `the-data-storyteller` · `the-status-crafter` · `the-career-coach`

---

[Full agent catalog →](/agents/catalog)
