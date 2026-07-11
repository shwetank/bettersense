---
name: model-migration-planner
description: Use when a new model version ships (or a current one is deprecated) and the user must decide whether and how to migrate an AI feature — "Claude X just came out, should we move?", "our model is being deprecated in 90 days", "the new model is cheaper, can we switch?", "plan the migration to [model]". Runs the full checklist: inventory what's pinned to the old model, re-run evals before believing anything, revisit decision-log entries tied to the old model version, re-baseline cost and latency, stage the rollout with rollback criteria. Distinct from ai-pm-frameworks (choosing a model for a NEW feature) and the-vendor-evaluator (choosing a provider) — this is the recurring, painful event of moving a LIVE feature between model versions without breaking what works.
---

# Model Migration Planner

Every few months a better/cheaper/faster model ships and every AI feature you run becomes a quiet question mark. Migration is where teams pay for eval debt: if you can't measure the feature, you can't migrate it — you can only gamble on it. This skill turns "the new model is out!" into a decision with evidence.

The prior to state up front: **a model upgrade is a full change to your system's core dependency, wearing a minor-version costume.** Prompts are tuned to a model's quirks; downstream parsers are tuned to its output shapes; users are tuned to its behavior. "Better on benchmarks" tells you almost nothing about *your* feature.

## Step 0: Should you even migrate?

Three legitimate triggers — name which one this is, because it sets the deadline and the bar:

- **Deprecation** (forced): the question is only *how and by when*. Get the sunset date in writing; work back from it.
- **Capability/quality pull**: the new model might fix a known weakness. The bar: measurable improvement on the cases you currently fail, no regression elsewhere.
- **Cost/latency pull**: same quality, cheaper or faster. The bar: statistical parity on quality, with the savings quantified against migration cost (engineer-weeks are real money too).

"It's newer" is not a trigger. If there's no deprecation date and no pull, log a `decision-log` entry saying *why not yet* and stop here — declining a migration deliberately is a valid output of this skill.

## Step 1: Inventory the blast radius

Most teams underestimate what's coupled to the model version. Enumerate:

- **Call sites & pinned versions** — every place the model id appears (code, config, env). Unpinned "latest" references are a finding in themselves.
- **Prompts** — system prompts and templates tuned to the old model's behavior (formatting quirks, instruction-following patterns, tone). These are the #1 silent breakage source.
- **Output contracts** — parsers, JSON schemas, downstream regex, UI assumptions about length/format.
- **Guardrails and thresholds** — confidence cutoffs, refusal handling, token/cost budgets calibrated to old-model behavior.
- **Past decisions** — search `~/bettersense-work-reflections/decision-log` entries (and any ADRs the user has) mentioning the old model. Decisions made *because of* old-model behavior ("we chose few-shot because zero-shot was weak") may now be reversible — each is both a risk and an opportunity. This is exactly the payoff `decision-log` was built for.

## Step 2: Eval before belief

- **Golden set exists?** Run it on the new model, unchanged prompts first. That's the honest baseline of "what migration costs for free."
- **No golden set?** Stop and say so plainly: the migration is unmeasurable and step one is a minimal eval (hand off to `the-eval-designer` — even 30 curated cases beats vibes).
- Compare per-case, not just aggregate: a new model that fixes 10 cases and breaks 8 different ones looks like "+2" in aggregate and feels like a regression to the 8 affected users. Categorize the flips.
- **Then, and only then, re-tune prompts** for the new model on the failing cases — and re-run the full set after every prompt change (fixing case 12 by breaking case 40 is the classic).
- Re-baseline **cost and latency** on real traffic shapes: tokenizer changes and different verbosity mean per-request economics move even when the price sheet looks better.

## Step 3: Stage the rollout

- **Shadow** (run both, compare, serve old) → **canary** (5–10% of traffic, watch quality signals and complaint channels) → **ramp** — with an explicit gate at each step.
- **Rollback criteria written before the canary starts**: which metric, what threshold, who flips it back. If rollback isn't cheap (old model already sunset?), say so — that changes how conservative the ramp must be.
- Decide the comms: whether users are told, and what support/CS should watch for. A model migration is a product change; `the-explainer` and `the-gtm-planner` own the messaging when the behavior shift is user-visible.

## Step 4: Close the loop

- `decision-log` entry: which model, why, what the eval showed, the rollback trigger, and a revisit date (the next model release, at the latest).
- Fold every case that flipped during migration into the golden set — this migration's surprises are the next migration's regression tests.
- Update the inventory from Step 1 (it's the starter kit for next time; there is always a next time).

## Anti-patterns

- **Benchmark transference.** "It's better on SWE-bench" ≠ better at summarizing your contracts. Only your eval counts.
- **Prompt archaeology skipped.** Migrating prompts verbatim and calling the diff "model regression" — half of it is usually prompt-model mismatch, which is fixable.
- **The big-bang cutover.** 100% traffic on day one because "the evals passed." Evals are a sample; canaries exist because samples lie.
- **Migration as a side quest.** "Just swap the string" assigned to whoever's free. The inventory in Step 1 is the argument for treating it as a real project.

## Composition

- `the-eval-designer` — builds the golden set this skill depends on
- `decision-log` — both input (old decisions to revisit) and output (the migration decision)
- `ai-pm-frameworks` — model-selection criteria when the migration is also a provider question
- `the-vendor-evaluator` — when deprecation forces a provider comparison, not just a version bump
- `the-incident-responder` — if a migration ships and quality craters, that's an incident; this skill's rollback criteria are its first input
- `the-translator` — explaining the migration (and its risks) to executives
