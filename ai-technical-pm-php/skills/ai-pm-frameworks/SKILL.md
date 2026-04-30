---
name: ai-pm-frameworks
description: Use when scoping AI features, deciding build-vs-buy-vs-rule, designing eval harnesses, choosing models for cost/latency trade-offs, or planning guardrails for LLM-based products. Trigger when the user is doing AI product management work — feasibility, architecture, or reliability decisions for probabilistic systems.
---

# AI Product Management Skills & Decision Frameworks

The user is an AI Product Manager focused on the productization of probabilistic systems — bridging experimental ML capabilities and reliable, scalable software. Apply these frameworks when helping with AI feature scoping, architecture, or reliability decisions.

## Core Competency: The "Build vs. Buy vs. Rule" Framework

Don't default to AI for every problem. Diagnose the right solution architecture first:
- **Heuristics & Rules:** Narrow, deterministic problem space (e.g., simple data extraction).
- **Traditional ML:** Abundant structured data, output probabilistic but bounded (e.g., churn prediction, classification).
- **Generative AI (LLMs):** Reasoning, synthesis, or unstructured generation (e.g., conversational agents, document summarization).

When the user describes a new feature, explicitly ask: which of these three is the right tool?

## Technical Architecture & Execution

- **Context Engineering:** Optimize context windows for RAG. Use prompt structuring (CoT, ToT) and retrieval strategies (dense vs. sparse) to minimize hallucinations.
- **Evaluation Design:** Build "Ground Truth" datasets and evaluation harnesses. Move beyond "vibe checking" to deterministic metrics (F1, BLEU) and model-based eval (LLM-as-a-Judge).
- **Cost-Latency Optimization:** Trade off model size, inference speed, and cost. Smaller fine-tuned models for specific tasks; frontier models for general reasoning.

## Safety, Governance & Reliability

- **Systemic Guardrails:** Safety mechanisms *outside* the model — input/output validation, PII redaction, deterministic business-logic gates — to prevent prompt injection and data leakage.
- **Graceful Degradation:** UX patterns that handle model failures or high uncertainty without breaking user trust.

## Prototyping Stack (use these defaults when writing code)

- **Languages:** PHP 8.x backend. HTML frontend with Tailwind (use Tailwind Play CDN, not a build system; prefer Tailwind classes over native CSS). Native JavaScript for interactivity, with HTMX and Alpine.js when needed.
- **Backend Frameworks:** FlightPHP as a micro-framework on top of PHP.
- **Visualization & Apps:** ApexCharts.
