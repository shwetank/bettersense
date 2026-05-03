---
name: pulse-synthesize
description: Use to derive insight across accumulated product-pulse reports — trends, anomalies, inflection points, regime shifts. Trigger phrases include "what's been the pattern across pulses this quarter", "synthesize my product pulses for [area] over the last 8 weeks", "before my exec readout, what does the data say across the period", "is anything trending that I missed week to week". Reads `~/voohy-work-reflections/pulses/<area-slug>/` over a time window and produces a synthesis with citations to specific dated pulse reports. Citation-disciplined; never claims a trend without evidence; distinguishes signal from noise. The Every.to gap, closed.
---

# Pulse Synthesize

A single product pulse is a snapshot. The folder of pulses *over time* is the asset — but only if someone reads across them. This skill does that reading.

The pulse you ran last Tuesday told you cost-per-success was up 12%. The one from three weeks ago told you the same. The one before that told you 8%. Across pulses, that's a trend; in any single pulse, it's noise. This skill is the layer that turns the folder into the insight.

Same discipline as `stakeholder-synthesize`: every claim cites the specific pulse reports that support it. No predictions; only observations and hypotheses to verify.

## When to apply

Trigger this skill when:
- A planning round, exec readout, board meeting, or quarterly review needs a *trajectory* read, not just the latest snapshot.
- The user has been logging pulses for 4+ weeks and wants to see what's compounded.
- A specific metric has been moving and the user wants to see how long it's been moving and what else moved with it.
- Before kicking off a new strategic track, to read where the product actually is vs. where the strategy assumes it is.

Skip when:
- The user wants a snapshot — `product-pulse` does that.
- There are fewer than 4 pulses in the window. Patterns need volume; with 2-3 pulses you're seeing noise.
- The user wants synthesis across stakeholders or wins, not pulses — route to `stakeholder-synthesize` or `wins-curate`.

## Inputs to clarify

Before synthesizing:

1. **Area** — which product/area's pulses (`<area-slug>`). For single-product users, `default`.
2. **Time window** — default last 90 days. Override on user's framing ("this quarter", "since the launch in March", "last 8 weeks").
3. **Lens** — what's the user looking for?
   - **Trend over time** — has metric X improved, regressed, or stayed flat?
   - **Anomaly hunt** — did anything unusual happen that wasn't picked up week-to-week?
   - **Inflection points** — when did the trajectory change, and what changed around the same time?
   - **Pre-readout** — before exec/board comms, what's the trajectory story?
   - **Strategy check** — is the product moving in the direction strategy.md predicted?

If the user gives an open-ended ask, default to **trend + anomalies** and state the choice: *"I'll do a trend + anomaly read across the last 90 days for area X — let me know if you want a different lens."*

## Loading

1. Read `~/voohy-work-reflections/strategy/<area-slug>.md` if present — it's the interpretive frame.
2. Read all pulse files in `~/voohy-work-reflections/pulses/<area-slug>/` falling within the time window. Sort chronologically.
3. Optional: read `~/voohy-work-reflections/profile.md` for the user's strategic focus context.

## Synthesis discipline (the load-bearing part)

Pattern detection across product metrics is *easy to do badly*. The risk is producing a confident-sounding trajectory story that the user starts pitching to leadership — and that turns out to be a noise read.

**Rules:**

1. **Minimum threshold.** A "trend" requires at least 4 consecutive pulse data points moving in the same direction with a meaningful magnitude. 3 in a row is "early signal." 2 is "moment, not trend."
2. **Cite every claim.** Format: *"Cost per successful interaction has trended up since the second week of March (pulses: 2026-03-09 → $0.14, 2026-03-23 → $0.16, 2026-04-13 → $0.18, 2026-05-04 → $0.20)."* If you can't cite, don't claim.
3. **Distinguish trend from regime shift.** A gradual climb is a trend. A step change followed by a new flat line is a regime shift — usually points to a specific event (deploy, model change, market change). Surface the difference; the response is different.
4. **Distinguish signal from seasonality.** A weekly cycle (lower on weekends) or monthly cycle (lower at month-end) is *seasonality*, not a trend. Call it out; subtract it before claiming the underlying movement.
5. **Cross-correlate metrics, but cautiously.** *"Engagement and cost both rose starting March; possible coupling worth investigating"* is honest. *"Engagement caused cost to rise"* is a claim the data can't make from observation alone.
6. **Watch counter-metrics independently.** If the headline metric is up and the counter-metric is also up, that's the Goodhart pattern — surface it explicitly, even if neither is dramatic individually.
7. **Don't predict.** Same discipline as `read-the-room` and `patterns-watch`. *"Cost is up over 8 weeks"* is observation. *"Cost will keep rising"* is forecast. Refuse the forecast.
8. **Acknowledge the gaps.** If the pulse coverage is thin (skipped weeks, missing data), say so. *"Synthesis covers 7 of the last 12 weeks; gaps in late March may obscure a regime shift."*

## Output format

```
# Pulse synthesis: [area] — [time window]

## Top-line read
One paragraph. The most important trajectory the user should walk away with.
Trend, regime shift, or "no significant movement worth flagging."

## Trends (≥4 consecutive data points)
- **[Metric]** — direction and magnitude, with citations to specific pulse dates.
  - Source pulses: [list of dates]
- ...

## Anomalies (single-pulse outliers worth re-investigating)
- **[Metric] — [pulse date]** — what was unusual; whether it was followed up at
  the time; whether it persisted.
- ...

## Regime shifts (step-changes, with date if identifiable)
- **[Metric]** — shifted from [old level] to [new level] around [date]. What
  else changed in the same window?
- ...

## Counter-metric watch
- **[Headline metric] up + [counter-metric] up** — Goodhart pattern flag, with
  source pulses.
- ...

## Strategy check (if strategy.md present)
- **Track [N]** — pulses suggest [progress / no progress / regression] against
  the track's bet. Sources: [pulses].
- ...

## Coverage and confidence
- Pulses read: [N], time span: [start → end]
- Gaps: [any skipped weeks or missing metrics]
- Confidence: [high / medium / low — and why]

## What you might want to do
- 2-4 concrete follow-ups, ranked by leverage. Includes "do nothing" if the
  trajectory is healthy and on-strategy.
```

## Composing with the rest of the bundle

After producing the synthesis, surface the natural next steps:

- **Pulse trajectory diverges from strategy** → suggest invoking `strategy-doc` to refresh the strategy or to make the divergence explicit.
- **Counter-metric trending wrong** → route to `metrics-design` for a deeper look at the metric tree.
- **An anomaly is actually a regression** → route to `the-incident-responder`.
- **Architectural drift visible (latency, fallback rate, cost)** → route to `the-architect`.
- **Synthesis is part of an exec/board readout** → compose with `the-translator` to reframe technical signals as business framing.
- **A trajectory is a credit-worthy improvement** → suggest `wins-log` to capture it.
- **Synthesis surfaces a strategic decision being made implicitly** (e.g., "we've been deprioritizing X for 6 weeks") → suggest `decision-log` to capture it explicitly.

## Operating principles

- **Synthesis ≠ summary.** A summary describes the pulses; synthesis derives a claim that wasn't visible in any single pulse. If the output reads like a recap, you haven't finished.
- **Cite or strike.** Same as `stakeholder-synthesize`. Every claim has source pulse dates. No exceptions.
- **Honest confidence.** Low coverage = low confidence. Skipped weeks = call it out. The user will use this for real decisions; don't manufacture certainty.
- **Match the lens.** The same data tells different stories under different lenses. If the user asked for "trend over time," lead with trends. If they asked "before exec readout," lead with the trajectory story.
- **Resist drama-ranking.** The most actionable trend isn't always the most dramatic. Rank by leverage to the user's situation, not by how alarming the framing sounds.
- **Counter-metrics get equal billing.** A pulse synthesis that reports headline metric improvements without the counter-metric trajectory is misleading. Always show both.
- **Acknowledge the noise floor.** Some things genuinely fluctuate within a band and aren't trends. Saying "this metric has bounced between 0.14 and 0.16 for 12 weeks; no trend" is more useful than fabricating a story.

## Anti-patterns to flag

- **Trends from 2 data points.** Refuse. Mark as "early signal," not trend.
- **Causal language from observational data.** *"Engagement up because of the launch"* — unless there's an experimental design. Default to *"engagement up coincident with launch."*
- **Predictive forecasting.** *"At this rate, we'll hit X by Q3."* Refuse. The skill is observation; forecasting is a different discipline.
- **Synthesis without the strategic frame.** A synthesis that doesn't reference what the strategy was trying to accomplish floats free of meaning.
- **Burying the regime shift in the trends section.** Step-changes are different from gradual movements; they get their own section because the response is different (regime shift = "something specific changed; what was it?"; trend = "ongoing dynamic; what's driving it?").
- **One synthesis to rule all audiences.** The lens matters. Ask which lens the user wants; produce one synthesis per lens, not a Frankenstein.
- **Hiding the gaps.** A confident-sounding synthesis based on 5 pulses across 12 weeks is dishonest. Surface the coverage limitations up front.

## Composition with other skills

- **`product-pulse`** — produces the input data. This skill reads the folder it produces.
- **`strategy-doc`** — interpretive frame. Without it, synthesis is generic. Read first if available.
- **`metrics-design`** — counter-metric discipline composes; if the strategy's counter-metrics are weak, route here.
- **`patterns-watch`** — runs cross-cutting across the whole reflection ecosystem (stakeholder + wins + self + pulses). Pulse-synthesize is the deeper cut on pulses specifically; patterns-watch is the wider scan that may surface "your pulses say X, your wins say Y, possible decoupling worth examining."
- **`the-translator`** — for exec/board reframing of synthesis output.
- **`the-incident-responder`** — when synthesis surfaces a regression that's actually an active incident.
- **`the-architect`** — when synthesis surfaces architectural drift signals.
- **`wins-log`** — when synthesis surfaces a credit-worthy improvement.
- **`decision-log`** — when synthesis surfaces an implicit decision the user has been making.
