---
title: Strategy
description: Skills for creating strategic anchors, running product pulse reports, and synthesizing trends over time.
---

Four skills form the strategy layer: one for creating the anchor, one for recurring health checks, one for synthesizing trends, and one for your personal profile. Together they give the rest of the bundle the context it needs to produce output that's calibrated to your situation.

---

## `user-profile`

**Triggers:** "set up my profile", "create my user profile", "update my profile", "what does my profile look like"

Creates `~/bettersense-work-reflections/profile.md` — a single anchor file capturing who you are, read automatically by 8+ other skills.

What it captures:
- Role, level, time in role, reporting chain (in shape)
- Company size/stage, product you own, team size, cross-functional partners
- Current strategic focus (the 2-4 things you're spending most time on)
- Communication style preferences
- What you're working on as a leader
- Stack and tools (if relevant)

**Update on real role changes** — not every week. Profiles rot when they're kept too current.

---

## `strategy-doc`

**Triggers:** "draft a strategy doc for [area]", "I need a strategy doc for [area]", "update my strategy doc"

Interview-driven creation or update of a product/area strategy document.

### Document structure

```markdown
## Target problem
[Who hurts, what they're trying to do, what blocks them, why now.
State the user/business problem — not the solution you've already chosen.]

## Approach
[Strategic shape of the answer. Not the spec — the bet.]

## Personas
[Who you're optimizing for. 1-3 max. Priority-ordered. Specific.]

## Key metrics (SMART)
[3-5. Each: current baseline, target, by when.]

## Strategic tracks (next 2 quarters)
[2-4 multi-month themes. Not features — bets.]

## Not working on
[Things people will ask about that you've decided not to do. With reasons.
This section is as load-bearing as the tracks.]

## Counter-metrics
[What would make you doubt the strategy is working, even if headline metrics look good.]
```

### What the skill pushes back on

- **Solution-first framing.** "We're going to build X" is a roadmap, not a strategy.
- **5+ tracks.** Force consolidation.
- **No "not working on" section.** This means nothing was actually decided.
- **Vague metrics.** "Improve engagement" is not a metric. Specifically measurable with a baseline and target by a date is.
- **Marketing language.** "Empower transformative..." is signaling. Write it like you'd explain it to a senior peer who'd push back.

### Slug confirmation

Before writing, the skill always confirms the filename: *"I'll create `strategy/onboarding.md` — sound right?"* If a file already exists for that slug, it surfaces the existing doc and asks whether to update or start fresh.

### Skills that read strategy docs

`the-spec-writer`, `prioritization-frameworks`, `metrics-design`, `product-pulse`, `pulse-synthesize`

---

## `product-pulse`

**Triggers:** "run my product pulse", "Monday product pulse", "product health check for [area]"

A dated one-page pulse report on product health, saved to `~/bettersense-work-reflections/pulses/<area>/`. The folder accumulates into product memory — `pulse-synthesize` reads it.

Each pulse covers:
- Usage metrics (with baselines, not just snapshots)
- System performance (latency, error rate, availability)
- AI-feature signals (hallucination rate, refusal rate, eval drift, where applicable)
- Counter-metrics (the signals that catch Goodhart-style failures)
- ≤3 follow-up investigations (questions the data raises, not answers to claim)
- Provenance footer (where each metric came from)

**Pulls from analytics MCPs** when wired (PostHog, Datadog, Stripe, etc.). Otherwise, paste recent metrics and the skill structures them.

**Designed for recurring schedule:**

```
/schedule "Every Monday at 8am, run /bettersense:product-pulse for the default area"
```

---

## `pulse-synthesize`

**Triggers:** "before my exec readout, what's the trajectory?", "synthesize the last 8 weeks of pulses", "what's the trend?"

Reads accumulated pulse reports for an area over a time window and surfaces:
- Trends (directional signals that hold across multiple pulses)
- Anomalies (spikes or drops worth investigating)
- Regime shifts (points where the baseline itself changed)
- Goodhart-pattern warnings (headline metric improving while counter-metric worsens)
- Coverage gaps (weeks with missing pulses that limit confidence)

**Refuses to forecast.** Calls out what the data supports vs. what would require a claim beyond the evidence.

---

## Refresh triggers for strategy docs

Refresh on real triggers, not on schedule:

- Planning round (quarterly)
- A bet that didn't work — what does the strategy say about it?
- Market or competitive shift
- Reorg, leadership change, significant scope change
- The strategy stops matching what you're actually working on

If `revisit_by` has passed, the skill surfaces it on any invocation.
