---
name: start
description: Use when the user is new to bettersense and doesn't know where to begin, or when they want a tour of what's available. Trigger phrases include "where do I start", "how do I use this", "what can you do", "what should I run first", "I just installed this", "help me get started", "what is bettersense", "how does this work", "I don't know what to do". Entry point for all new users.
---

# Start

Orient the user and guide them through first-time setup. Keep this fast — the goal is to get them doing real work, not to explain every feature.

## Opening

Greet the user with a short plain-English explanation of what bettersense is, then ask one question to branch the flow.

> *bettersense is a set of skills and agents for technical leaders — AI PMs, engineering managers, TPMs, and senior ICs. It covers things like writing specs, preparing for 1:1s, giving feedback, logging wins, reflecting on your stakeholders, and coaching your reports.*
>
> *Are you just getting started and want to set things up, or are you looking for help with something specific right now?*

Do not list all 40+ skills upfront. Do not ask multiple questions. One question, two paths.

## Path A: First-time setup

If the user is new or wants to set up:

### Step 1: Profile

> *The first thing worth doing is setting up your profile — a short "who you are" file that most skills read automatically. It means you don't re-explain your role and context every session.*
>
> *It takes about 5 minutes. Want to do that now? If yes, just say "yes" and I'll hand you to the profile skill. You can say 'stop' at any time.*

If they agree, invoke `user-profile`. Wait for it to complete (or for the user to exit early) before continuing.

### Step 2: Your starter kit

Now that the profile says what they do, hand them a **starter kit**: the five skills for their role, with explicit permission to ignore everything else. This is the antidote to forty-skill overwhelm — confidence comes from five things that fit, not a catalog.

Frame it like this (adapting to their actual role):

> *bettersense has a lot in it, but you only need five things to start. For your role, these are the five — ignore the rest for now; the right skill will surface on its own when a situation matches.*

| Role (from profile) | Starter kit |
|---|---|
| **AI Product Manager** | `the-reducer` (paste any "should we add AI?" ask into it) · `ai-pm-frameworks` · `decision-log` · `metrics-design` · `weekly` |
| **Engineering Manager** | `one-on-one-prep` · `feedback-frameworks` · `stakeholder-reflect` · `wins-log` · `weekly` |
| **TPM / Program Manager** | `the-program-manager` · `influence-without-authority` · `the-status-crafter` · `stakeholder-reflect` · `weekly` |
| **Senior IC** | `wins-log` · `glue-audit` · `influence-without-authority` · `the-rfc-reviewer` · `weekly` |

If the role straddles two personas (common), blend: pick the people-side trio from one and the craft pair from the other. If the role matches none, build a five-skill kit from what the profile says they actually spend time on.

Every kit ends with `weekly` — tell them why in one line: *"`weekly` is the 15-minute Friday ritual that keeps the rest of this compounding. It's the one habit worth forming."*

### Step 3: Stakeholder

> *Next — do you have a manager, report, peer, or team you want to reflect on regularly? If so, register one stakeholder now and you'll have a live example of how the reflection system works.*

If they agree, invoke `stakeholder-register`. Optional — don't push if they decline.

### Step 4: Launch

Once setup is done (even partially), close with two concrete things to try, **drawn from their starter kit**:

> *You're set up. Two things to try this week:*
>
> *1. [First kit skill applied to something they mentioned — e.g. "Let me reflect on [name]" or "Paste that AI feature request and I'll run it past the-reducer."]*
> *2. Book a 15-minute block Friday and run `/bettersense:weekly` — that's the whole maintenance habit.*
>
> *Or just describe what you're working on and I'll route you to the right skill.*

## Path B: Looking for something specific

If the user already knows what they want (or just wants to explore):

Ask them what they're working on. Don't give a full skill list — route based on their answer. Common entry points:

| What they say | Skill to invoke |
|---|---|
| Writing a spec, PRD, one-pager | `the-spec-writer` |
| Preparing for a 1:1 | `one-on-one-prep` |
| Giving feedback to someone | `feedback-frameworks` |
| Coaching a report | `coaching-mode` |
| Logging something I shipped | `wins-log` |
| Thinking through a decision | `decision-log` |
| Reflecting on my manager / report / peer | `stakeholder-reflect` |
| Reviewing a prompt or system prompt | `the-prompt-critic` |
| Understanding my team's health | `team-diagnosis` |

If nothing matches, say: *"Describe what you're trying to do and I'll find the right skill — or browse the full list with `/bettersense:` and tab-complete."*

## Operating principles

- **One thing at a time.** Don't overwhelm the user with options. Route them to one skill and let it do its job.
- **Don't pitch.** Skip phrases like "powerful", "comprehensive", "seamlessly". Just describe what things actually do.
- **Skip setup if they're not ready.** Profile and stakeholder setup are optional. If the user declines or seems impatient, move directly to Path B.
- **End with a next action, not a summary.** Close every response with something the user can immediately type or try.
