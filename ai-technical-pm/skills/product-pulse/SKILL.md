---
name: product-pulse
description: Use to produce a single-page dated pulse report on product health — usage metrics, system performance, AI-feature signals (hallucination, refusal, eval drift), counter-metrics, and follow-up investigation. Trigger phrases include "run a pulse on [area]", "give me a product health snapshot", "weekly product pulse", "what does the data say this week". Reads strategy.md to know what to watch and which counter-metrics matter. Saves to `~/bettersense-work-reflections/pulses/<area-slug>/pulse-YYYY-MM-DD.md` so the folder accumulates into product memory over time. Designed for daily/weekly `/schedule` cadence. Privacy-first — defaults to aggregated/redacted data; surfaces provenance.
---

# Product Pulse

A pulse report is a *dated, single-page snapshot* of product health: what changed, what's anomalous, what to investigate. The folder of accumulated pulses *is* your product memory — no individual report is meant to be re-read in a year, but six months of pulses reveal trends no single report could.

This skill produces one pulse. `pulse-synthesize` reads the folder over time. `strategy-doc` is the anchor that tells both skills what to watch.

## Where pulses live

```
~/bettersense-work-reflections/pulses/<area-slug>/pulse-YYYY-MM-DD.md
```

For single-product users, `area-slug` defaults to `default`. Multi-product users get one folder per area, mirroring the structure used by `strategy-doc`.

If `~/bettersense-work-reflections/` doesn't exist, hand off to `stakeholder-register` for root setup.

## Inputs

The skill needs three things to produce a useful pulse:

1. **Strategy doc** at `~/bettersense-work-reflections/strategy/<area-slug>.md` — read it for what to watch (key metrics) and what to flag against (counter-metrics). If missing, the pulse runs but with a generic "all metrics" lens; surface the gap.
2. **Data sources** — depends on what's accessible:
   - **MCPs available** (PostHog, Mixpanel, Amplitude, Datadog, Sentry, Logfire, Stripe, Paddle, etc.) — query directly through the MCP integrations. List what was queried and when in the pulse.
   - **No MCPs** — the user pastes / dumps recent metric numbers, and the skill structures them. Less ideal but works as a starting point.
   - **Application database via read-only replica** — for metrics analytics can't capture. Only if explicitly set up; never query production directly.
3. **The previous pulse** for this area, if one exists. Read it to compute deltas and avoid restating what hasn't changed.

## What goes in a pulse

Five sections, in this order. The whole thing should fit on one screen — 30-50 lines of substance.

### 1. Headline (1-2 sentences)
The single most important thing about product health this period. Not a recap — an editorial call. *"Engagement up 8% week-over-week, but trust signals (copy-edit rate) up 5% — possible Goodhart pattern worth investigating."*

### 2. Usage / outcome metrics (the strategy's KPIs)
Each of the strategy's key metrics, with current value, week-over-week / period-over-period delta, and a status mark.

```
- Weekly active engineers: 1,247 (▲ +3.2% WoW, ▲ +12% QoQ) — on track for Q3 target
- Time-to-first-success: 4.2 min (▼ -8% WoW) — exceeding target ✓
- Free → paid conversion: 2.1% (— flat WoW) — below target, needs attention 🟨
```

### 3. Counter-metrics (Goodhart watch)
The metrics that would tell you the headline is misleading. Pulled from the strategy's counter-metrics section + AI-specific signals where applicable.

```
- Trust signals — copy-edit rate: 7.4% (▲ +5% WoW) ⚠ flagging for follow-up
- Hallucination rate (eval set): 3.1% (— flat WoW) — within band
- Cost per successful interaction: $0.18 (▲ +12% WoW) ⚠ over budget if sustained
- Support ticket volume mentioning [feature]: 23 (▲ +30% WoW) ⚠
```

### 4. AI-specific signals (when the product is AI-powered)
First-class section — generic product pulses miss these. Compose with `the-eval-designer` outputs where they exist.

```
- Eval score (golden set, last run): 0.89 (▼ -0.02 WoW)
- Refusal rate: 1.2% (— flat) — within expected range
- Fallback path activation: 0.4% (▲ from 0.2%) — possible regression on edge cases
- p95 latency: 2.1s (▲ +15% WoW) ⚠
- Hallucination rate (production sample): 4.1% (▲ from 3.8%) ⚠
```

### 5. Follow-up investigation (≤3 items)
Anomalies surfaced above that warrant a deeper look this week. Each one with a hypothesis and a concrete next step. Never more than 3 — pulse is for surfacing, not solving.

```
- Cost per successful interaction up 12%. Hypothesis: increased retry rate after
  Tuesday's prompt change. Next: pull retry distribution by version.
- Copy-edit rate up 5%. Hypothesis: model is too verbose post-update; users are
  trimming. Next: sample 20 edited responses and tag patterns.
```

### 6. Provenance (one line per data source pulled)
What was actually queried, from where, when. This is the privacy/transparency footer. Lets future-you know what the pulse was based on.

```
Data: PostHog (events 2026-04-27 to 2026-05-04 UTC), Datadog (latency p95 from
prod-us-1), Stripe (conversion funnel last 7d). Sample sizes redacted; no PII
in this report.
```

## Privacy discipline (load-bearing)

Pulses can pull from production data. Three rules:

1. **Default to aggregated/redacted data.** Counts, rates, percentiles. Not user IDs, email addresses, or raw event content. Redact at the source query.
2. **PII never enters the pulse file.** If a follow-up requires looking at a specific user, do it in a separate session with explicit user awareness. The pulse report itself stays redacted.
3. **Provenance footer is mandatory.** Every pulse names what was queried, when, and what was excluded. If a future reader (or the user themselves) wants to verify a number, they can.

If pointed at a hosted model, the pulse contents go through that provider on every read/synthesis. Disclose this on first run.

## The cadence

Designed for `/schedule`. Recommended:

```
/schedule "Every weekday at 8am, run /product-pulse for default area"
```

For most users, daily is too noisy and weekly is the right cadence. Daily makes sense if the product moves fast (consumer with high event volume) or during a launch window. Quarterly makes sense for slow-moving B2B.

The honest constraint: scheduled output lands in Claude Code, not on the user's phone. Pair with a calendar reminder ("Open Claude Code → /pulse review") for the cadence to be reliable.

## Operating principles

- **Editorial discipline.** A pulse is *one page*. Forcing this constraint produces real prioritization. Resist the temptation to dump everything.
- **Anchor to strategy.** The metrics that matter are in `strategy.md`. The counter-metrics that matter are in `strategy.md`. The pulse is the operational layer; the strategy is the editorial layer. Without the anchor, the pulse becomes a dashboard.
- **Counter-metrics first-class.** Same opinion as `metrics-design`: optimizing the headline metric while a counter-metric drifts is how you ship a worse product. The pulse format makes this hard to ignore.
- **AI-specific signals first-class for AI products.** Hallucination, refusal, eval drift, cost-per-success, p95 latency. Generic product pulses skip these; the bundle's pulse doesn't.
- **Hypothesis, not conclusion.** Anomalies trigger investigation, not action. *"Cost is up 12%, hypothesis: retry rate."* Not *"we need to roll back the prompt."* The user decides; the pulse surfaces.
- **Cap follow-ups at 3.** Pulse is for surfacing. Solving is downstream work. Resist the urge to list every issue.
- **Honest deltas.** Compute against the previous pulse; don't restate what hasn't changed. WoW deltas reveal what's moving; absolute values are baselines.
- **No vanity metrics.** Total signups grow mechanically. Total events grow with traffic. Use *rates* and *per-user* metrics in the pulse; reserve absolute counts for the headline only when material.

## Anti-patterns to flag

- **Dashboard-as-pulse.** A pulse is editorial; a dashboard is comprehensive. If the output reads like a metric dump, it failed.
- **Headline that's a recap.** *"This week we measured X, Y, and Z."* No — what's the *single thing* the user should walk away knowing?
- **Counter-metrics buried.** If counter-metrics are at the bottom in 6pt font, the pulse is performing thoroughness, not actually surfacing risk.
- **More than 3 follow-ups.** Means nothing was prioritized.
- **PII in the pulse.** Specific customer names, emails, raw user content. Hard rule. Redact.
- **Pulse without strategy.** Possible but generic. Surface the gap to the user — *"no strategy doc found for area X; pulse is running with all-metrics lens, will be more useful if you set one up."*
- **Same pulse week after week with no editorial.** Means the cadence is too high or the data isn't moving. Suggest a slower cadence or richer signals.

## Composition with other skills

- **`strategy-doc`** — anchor. The pulse reads it for what to watch and what to flag against. Without strategy, the pulse is generic.
- **`metrics-design`** — counter-metric framing in the pulse mirrors metrics-design's discipline. If the strategy doesn't yet have counter-metrics defined, route to metrics-design.
- **`pulse-synthesize`** — reads the accumulated folder of pulses to surface trends across pulses (the report-on-reports). Designed to compose with this skill.
- **`the-eval-designer`** — for AI products, the eval score in the pulse comes from the harness this skill set up.
- **`the-architect`** — when a counter-metric drifts in a way that suggests architectural drift (latency, fallback activation, cost), route to the-architect.
- **`the-incident-responder`** — when the pulse surfaces something that's actually an incident in progress, hand off.
- **`wins-log`** — when the pulse surfaces a metric improvement the user contributed to, suggest logging it.
- **`decision-log`** — when the pulse triggers a decision (rollback, escalation, scope cut), capture the decision.
- **`the-translator`** — when the pulse needs to be reframed for a non-technical audience (exec readout, sales update), the-translator does that work; the pulse stays technical.
- **`patterns-watch`** — pulse data is one of the inputs `patterns-watch` reads when scanning the whole reflection ecosystem.
