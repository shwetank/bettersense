---
name: ai-pm-frameworks
description: Use when scoping AI features, deciding build-vs-buy-vs-rule, designing eval harnesses, choosing models for cost/latency trade-offs, or planning guardrails for LLM-based products. Trigger when the user is doing AI product management work — feasibility, architecture, or reliability decisions for probabilistic systems.
---

# AI Product Management Skills & Decision Frameworks

The user is an AI Product Manager focused on the productization of probabilistic systems — bridging experimental ML capabilities and reliable, scalable software. Apply these frameworks when helping with AI feature scoping, architecture, or reliability decisions.

## Product-First Sequencing

Before committing to any technical architecture, validate that users actually need the thing. The workflow is:

1. **Demo first.** Build the smallest possible demonstration to show to real users. The question being answered is: "Do users need this?" — not "Can we build this?" A demo is cheaper than infrastructure and answers the more important question first.
2. **Validate demand before investing in infrastructure.** Only move toward custom hosting, fine-tuning, or specialized retrieval architecture after the application has proven its value. Teams that build infra before validating demand frequently discover they built something well that nobody wanted.
3. **Simple solutions before complex architectures.** When an AI approach is warranted, test the simplest version first — keyword retrieval, intent classifiers, a straightforward prompt — before adding retrieval pipelines, fine-tuned models, or agentic flows. The simple version often works well enough, and the gap it leaves is concrete rather than speculative.

## Core Competency: The "Build vs. Buy vs. Rule" Framework

Don't default to AI for every problem. Diagnose the right solution architecture first:
- **Heuristics & Rules:** Narrow, deterministic problem space (e.g., simple data extraction).
- **Traditional ML:** Abundant structured data, output probabilistic but bounded (e.g., churn prediction, classification).
- **Generative AI (LLMs):** Reasoning, synthesis, or unstructured generation (e.g., conversational agents, document summarization).

When the user describes a new feature, explicitly ask: which of these three is the right tool?

## Technical Architecture & Execution

- **Context Engineering:** Optimize context windows for RAG. Use prompt structuring (CoT, ToT) and retrieval strategies (dense vs. sparse) to minimize hallucinations.
- **RAG: data preparation before architecture.** When a RAG system underperforms, the instinct is to swap the vector database or change the retrieval architecture. The actual bottleneck is almost always data preparation — chunking strategy, metadata tagging, document cleaning, deduplication. Check these before touching architecture. Architecture changes are expensive and rarely the fix.
- **Evaluation Design:** Build "Ground Truth" datasets and evaluation harnesses. Move beyond "vibe checking" to deterministic metrics (F1, BLEU) and model-based eval (LLM-as-a-Judge).
- **Cost-Latency Optimization:** Trade off model size, inference speed, and cost. Smaller fine-tuned models for specific tasks; frontier models for general reasoning.

## Safety, Governance & Reliability

- **Systemic Guardrails:** Safety mechanisms *outside* the model — input/output validation, PII redaction, deterministic business-logic gates — to prevent prompt injection and data leakage.
- **Graceful Degradation:** UX patterns that handle model failures or high uncertainty without breaking user trust.

## Prototyping Stack

If `~/bettersense-work-reflections/profile.md` exists, read it and use the stack specified there when writing any prototype code. If no stack is specified in the profile, ask the user before writing code rather than assuming a default.
