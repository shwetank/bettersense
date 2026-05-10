---
title: First run
description: What to do in the first 10 minutes after installing bettersense — get oriented, set up your profile, and run your first skill.
---

After installation, run one command:

```
/bettersense:start
```

It orients you, walks through profile and stakeholder setup, and routes you to your first real task. You can say "stop" at any time to skip setup and jump straight to a skill.

## What setup does

Three things are worth configuring — none are required, but each one sharpens the skills that read them.

```
☐  /bettersense:user-profile          → creates your "who you are" anchor file + data directory
☐  /bettersense:stakeholder-register  → registers your first stakeholder
☐  /bettersense:strategy-doc          → creates your "what you're building" anchor (optional)
```

`/bettersense:start` walks you through the first two. Run them manually if you prefer.

---

## 1. Set up your profile

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

On first run, this also creates `~/bettersense-work-reflections/` — the private local directory where all your reflection data lives — and shows you a one-time privacy notice before writing anything.

The result is `~/bettersense-work-reflections/profile.md` — a plain markdown file you own. Skills that read it: `the-spec-writer`, `the-translator`, `the-explainer`, `report-promo-case`, `report-career-architect`, `metrics-design`, `coaching-mode`, `feedback-frameworks`.

**Update it** when your role or scope materially changes — not every week.

---

## 2. Register your first stakeholder

```
register a stakeholder
```

Or explicitly:

```
/bettersense:stakeholder-register
```

The skill will:
1. Walk you through registering your first stakeholder (manager, peer, report, or team)
2. Create the stakeholder subdirectories inside `~/bettersense-work-reflections/` if they don't exist yet
3. Confirm the file before writing

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

Not sure where to go? Run `/bettersense:start` again — it routes you based on what you're working on.
