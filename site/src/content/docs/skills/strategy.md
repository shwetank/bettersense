---
title: Strategy
description: Skills for stress-testing strategic alignment, creating strategic anchors, running product pulse reports, and synthesizing trends over time.
---

Five skills form the strategy layer: a pre-strategy diagnostic, an anchor for what you're building, recurring health checks, trend synthesis, and your personal profile. Together they give the rest of the bundle the context it needs to produce output that's calibrated to your situation.

---

## `impact-audit`

**Triggers:** "are we doing the right work?", "I'm worried my team isn't driving real impact", "help me check if my team is aligned", "I'm worried about layoffs", "stress-test our goals"

Runs a diagnostic on whether a team's work is genuinely connected to business outcomes. Run this *before* `strategy-doc` or `prioritization-frameworks` — it answers "are we even pointed at the right thing?" Inspired by Matt LeMay's *Impact First Product Teams* framework.

### The three diagnostic questions

**1. The budget stress test**

> "If the person who controls your team's budget had to justify it from scratch today, could they? Would they?"

Watch for hedged answers: "I think so," "probably," "I mean…" — those are the signal. A confident yes means move on; anything less means spend time here.

*(In large orgs — Google, Microsoft, Philips-scale — substitute "the exec who controls your budget" for "CEO." The principle is the same: someone with authority should be able to justify the team without hesitation.)*

**2. The death spiral check**

Teams fall into low-impact work gradually. It starts with small, safe additions that invite no scrutiny — and compounds: the product gets crowded, complexity grows, doing anything high-impact gets harder.

Ask: *"What has your team shipped in the last two quarters? Would those things be missed if they hadn't been built?"*

Listen for: work that was "requested" but where business impact is unclear, features that shipped but outcomes were never tracked, a roadmap driven by stakeholder asks rather than a goal.

**3. The goal distance check**

> "Can you state your team's primary goal and connect it to a real business outcome in one step?"

One step means one mathematical operator. "We convert single-product users to multi-product — each conversion is worth £X in lifetime value, so our goal contributes £Y" ✓. "We improve onboarding which improves retention which improves revenue" ✗ (too many steps).

### If the audit surfaces problems

1. Set team goals no more than one step from the nearest meaningful business goal
2. Keep impact first at every stage, not just goal-setting — when scoping sprints, keep asking: how does this connect to the goal?
3. Express impact in the same unit as your goal — if the goal is users converted, estimate in users converted, not abstract scores

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
