---
title: For AI Product Managers
description: The five-skill starter kit for AI PMs — and what a typical week with bettersense looks like when you're shipping on top of probabilistic systems.
---

You're responsible for shipping reliable products on top of a system that is, by design, unreliable in interesting ways. The asks arrive pre-solved ("can we add an LLM reranker?"), the demos always work, production sometimes doesn't, and when accuracy regresses you're the one explaining it to the CEO. The job is judgment under uncertainty — and the fear underneath it is shipping something that fails in public.

bettersense won't make the call for you. It makes sure the call gets made with the right questions asked first.

## Your starter kit

Ignore the rest of the catalog for now. These five earn their place in week one:

| | When it fires | What it does for you |
|---|---|---|
| `the-reducer` | Any "should we add AI to…?" ask | Refuses the surface question. Walks you through whether this is an intelligence problem or a data/UI/rules problem — *before* engineering spends two weeks on it. |
| `ai-pm-frameworks` | Scoping, build-vs-buy-vs-rule, model selection, guardrails | The working frameworks for feasibility and reliability decisions on probabilistic systems. |
| `metrics-design` | "How do we know this feature is working?" | Builds the metric tree — north star, leading/lagging, and the counter-metrics that catch "engagement up, product worse." |
| `decision-log` | "We're going with Sonnet over Opus for this" | Captures the rationale in a format that survives the next model migration — the decision you can't reconstruct three months later. |
| `weekly` | Friday, 15 minutes | The maintenance ritual: wins captured, one stakeholder reflected on, patterns surfaced. The habit that makes everything else compound. |

## A week with bettersense

**Monday.** Your VP forwards a customer complaint thread: "search feels off — can we throw an LLM at it?" You paste it in. `the-reducer` fires and asks who's complaining, what their workaround is, and whether anyone has looked at the index coverage. You go check. It's a data problem. Monday memo: $0 fix, AI as follow-on.

**Wednesday.** The reranker experiment *is* justified for the enterprise tier. `ai-pm-frameworks` walks the build-vs-buy call; `decision-log` writes down why you chose the API route and what would make you revisit.

**Friday, 3pm.** `/bettersense:weekly`. The Monday save gets logged as a win (category: judgment). You reflect on the VP for two minutes — their question patterns are shifting toward cost, worth pre-empting in the next readout. Done by 3:15.

## When you're ready for more

- **Pre-launch:** `the-eval-designer` → `the-red-teamer` → `demo-prep` is the "don't fail in public" pipeline.
- **The incident:** when the model says something wrong in production, `the-incident-responder` gives you structure under panic, and `the-translator` writes the exec explanation without hype or false humility.
- **First-time setup:** run `/bettersense:start` — it builds your profile and hands you this kit interactively.
