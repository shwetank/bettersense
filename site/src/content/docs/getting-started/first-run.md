---
title: First run
description: What to do in the first 10 minutes after installing bettersense — set up your profile, register a stakeholder, and wire up the cadence.
---

After installation, three commands are worth running in your first session. Each takes 5-10 minutes and dramatically sharpens everything else.

## Quick setup checklist

```
☐  /bettersense:stakeholder-register  → creates the data directory + privacy setup
☐  /bettersense:user-profile          → creates your "who you are" anchor file
☐  /bettersense:strategy-doc          → creates your "what you're building" anchor (optional)
```

None are required — the skills work without them. But they pay for themselves the first time you run `wins-curate` or `the-spec-writer` and the output is already calibrated to your role and context.

---

## 1. Register your first stakeholder

Run this first, even if you haven't decided on your other stakeholders yet. It sets up the private data directory.

```
register a stakeholder
```

Or explicitly:

```
/bettersense:stakeholder-register
```

The skill will:
1. Create `~/bettersense-work-reflections/` with a `.gitignore` and a privacy README inside
2. Walk you through registering your first stakeholder (manager, peer, report, or team)
3. Confirm the file before writing

**Why first?** `stakeholder-register` owns the data directory creation and the privacy warning. Running it before other skills means you understand where your data lives before anything gets written.

---

## 2. Set up your profile

```
set up my profile
```

Or explicitly:

```
/bettersense:user-profile
```

A 5-10 minute interview capturing:
- Your role, level, and who you report to (in shape, not detail — "reports to a Director who reports to a VP")
- Company size/stage and what you own
- Current strategic focus (what you're spending most time on this quarter)
- Communication preferences (concise/verbose, examples/abstractions, push back or not)
- What you're working on as a leader
- Stack (only if relevant — useful for spec-writer, prompt-critic, RFC reviewer)

The result is `~/bettersense-work-reflections/profile.md` — a plain markdown file you own. Skills that read it: `the-spec-writer`, `the-translator`, `the-explainer`, `report-promo-case`, `report-career-architect`, `metrics-design`, `coaching-mode`, `feedback-frameworks`.

**Update it** when your role or scope materially changes — not every week.

---

## 3. Draft a strategy doc (optional)

```
draft a strategy doc for [your area]
```

Or explicitly:

```
/bettersense:strategy-doc
```

An interview-driven doc capturing: target problem, approach, personas, SMART metrics, 2-4 multi-month tracks, the "not working on" section, and counter-metrics.

The result is `~/bettersense-work-reflections/strategy/<area>.md`. Skills that read it: `the-spec-writer`, `prioritization-frameworks`, `metrics-design`, `product-pulse`, `pulse-synthesize`.

Single-product users can use `strategy/default.md`. Multi-area users create one file per area — the skill confirms the filename before writing and detects existing files.

**Skip this** if you can't yet articulate a clear target problem. A vague strategy doc is worse than none.

---

## 4. Wire up the cadence (optional)

If you want skills to run automatically on a schedule, the two highest-value recurring commands are:

```
/schedule "Every Friday at 4pm, run /wins-due and post the list"
/schedule "Every Monday at 9am, run /stakeholder-due and post the list"
```

:::note[`/schedule` requires the schedule skill]
`/schedule` is not built into Claude Code — it's a separate plugin. If it's not recognized, install it from Anthropic's marketplace first, or see [OS-level scheduling fallback](/guides/scheduling#os-level-fallback).
:::

For the full scheduling setup, see [Scheduling routines](/guides/scheduling).

---

## What's next?

With your profile and at least one stakeholder set up:

- Try [`/bettersense:stakeholder-reflect`](/skills/stakeholder-management) — a reflection session on your first registered stakeholder
- Try [`/bettersense:wins-log`](/skills/wins-system) — log something you shipped or did this week
- Browse [all skills](/skills/overview) to understand what's there before you need it
