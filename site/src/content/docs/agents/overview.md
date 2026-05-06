---
title: Agents overview
description: What agents are, how they differ from skills, and when to use them.
---

bettersense includes 13 subagents alongside the 30 skills. They're different tools for different situations.

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

3. **You want the agent to act as a second opinion.** Fresh context means the agent hasn't been anchored by your framing from earlier in the session.

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

## The 13 agents

Quick reference:

| Agent | Core job |
|---|---|
| `the-architect` | System design, guardrails, production reliability |
| `the-eval-designer` | Evaluation systems for LLM/ML features |
| `the-explainer` | Internal/external explanations of AI features |
| `the-incident-responder` | AI feature incidents and regressions |
| `the-program-manager` | Multi-team program management |
| `the-prompt-critic` | Review and improve production prompts |
| `the-red-teamer` | Find failure modes before launch |
| `the-reducer` | Validate whether AI is the right solution |
| `the-research-synthesizer` | Cluster qualitative data into themes |
| `the-rfc-reviewer` | Senior-engineer read on RFCs and design docs |
| `the-scientist` | Feasibility and prototyping for AI features |
| `the-spec-writer` | Structured product specs and PRDs |
| `the-translator` | Technical results into business language |

[Full agent catalog →](/agents/catalog)
