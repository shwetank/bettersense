---
title: Profile & strategy — the anchor files
description: How the profile.md and strategy/<area>.md anchor files work, why they matter, and how to maintain them.
---

Two files dramatically improve output quality across the whole bundle. Both are optional — skills work without them — but the difference is noticeable from the first invocation.

## `profile.md` — who you are

Created by `user-profile`. Lives at `~/bettersense-work-reflections/profile.md`.

**What it captures:**

```markdown
---
name: Shwetank Dixit
last_updated: 2026-05-06
default_hat: pm
---

## Role
AI PM, mid-stage B2B SaaS, reports to Director of Product who reports to VP of Product.

## Org and product context
~300 people. Workplace collaboration product (Mural/Miro category). Team: EM + 2 devs + 1 UX.
Cross-functional partners: Marketing, Data Science, Customer Success.

## Current strategic focus
- Increasing onboarding completion metrics (this quarter's singular focus)

## Communication style
Direct. Bullet points with some explanation. Use examples. Push back when framing is off.

## What I'm working on as a leader
Better self-advocacy, stakeholder management, and prioritization/pushback.

## Stack
PHP 8.x + FlightPHP, Tailwind CDN, vanilla JS, HTMX, Alpine.js, Flowbite. Astro for static sites.
```

**Skills that read it automatically:** `the-spec-writer`, `the-translator`, `the-explainer`, `report-promo-case`, `report-career-architect`, `metrics-design`, `coaching-mode`, `feedback-frameworks`.

What changes: the spec writer knows your stack defaults, the translator knows your audience register, the coaching-mode knows your default directness preference.

### Maintenance

- Create once with `user-profile` — 5-10 minute interview
- Update on real role changes (new title, new company, significant scope shift)
- The skill gently surfaces staleness after 90 days — not nagging, just a flag
- Keep it short (~30 lines) — a 2-page profile doesn't get read

---

## `strategy/<area>.md` — what you're building

Created by `strategy-doc`. Lives at `~/bettersense-work-reflections/strategy/<area>.md`.

**You never need to invent the filename.** Describe your area in plain language:

| What you say | File created |
|---|---|
| *"the onboarding flow"* | `strategy/onboarding.md` |
| *"the platform team's services"* | `strategy/platform.md` |
| *"developer experience"* | `strategy/developer-experience.md` |

The skill confirms the slug before writing and detects if a file already exists.

**What it captures:**

- **Target problem** — who hurts, what blocks them, why now (user/business problem, not your solution)
- **Approach** — strategic shape of the answer, not the spec
- **Personas** — 1-3 specific personas in priority order
- **Key metrics** — 3-5 SMART, each with baseline and target
- **Strategic tracks** — 2-4 multi-month bets (themes, not features)
- **Not working on** — the load-bearing section; what you've decided not to do and why
- **Counter-metrics** — what would tell you the strategy is wrong even if headline metrics look good

**Skills that read it automatically:** `the-spec-writer`, `prioritization-frameworks`, `metrics-design`, `product-pulse`, `pulse-synthesize`.

What changes: specs anchor to a track rather than floating, backlog prioritization scores against your tracks, pulses are evaluated against your metrics.

### The "not working on" section

This is the most skipped section in most strategy docs, and the most load-bearing one.

A strategy that doesn't say what it's *not* doing hasn't actually made decisions — it's just listed intentions. When people ask you about something that's not on the plan, the "not working on" section is what lets you say no clearly and explain why without re-litigating the strategy every time.

Write it with the reason: *"Mobile app — because our current users are 92% desktop; building for mobile before we have desktop retention solved is a distraction."*

### Multiple areas

Single-product users: one file at `strategy/default.md` is fine.

Multi-area users (PM with two products, TPM coordinating three programs, EM with multiple services): one file per area. Keep them separate — the composition with downstream skills works better when each is bounded.

### When to refresh

Refresh on real triggers, not on a schedule:
- Quarterly planning round
- A bet that didn't land — what does the strategy say about it?
- Market or competitive shift that changes the target problem
- Reorg or leadership change that changes your scope
- The strategy stops matching what you're actually working on (a signal from `patterns-watch`)

---

## How the two files compose

When both exist, the stack of context for a spec looks like:

```
Your prompt
  + profile.md (who you are, your stack, your communication style)
  + strategy/onboarding.md (what you're building, what track this spec lives under)
  = A spec anchored to your actual strategic context, written in your voice, for your stack
```

Without them: a well-structured but generic spec that assumes nothing about your situation.
