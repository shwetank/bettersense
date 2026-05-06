---
name: user-profile
description: Use to create or update the user's anchor profile — a single private file (`~/bettersense-work-reflections/profile.md`) that captures who the user is, what they do, what context other skills need to know about them. Read automatically by other skills in the bundle when present, so the user doesn't re-explain themselves every session. Trigger phrases include "set up my profile", "create my user profile", "update my profile", "I changed roles, refresh my profile", "what does my profile look like". Inspired by the `SOUL.md` pattern from agents like Hermes — explain yourself once, get tailored output forever.
---

# User Profile

Most skills in this bundle work better when they know who the user is. Right now they don't — every session starts from a blank slate, and the user re-establishes context the skills already could have known. This skill creates a **single anchor file** that carries the user's standing context, which other skills read automatically when present.

The file lives at `~/bettersense-work-reflections/profile.md` (configurable via `$BETTERSENSE_WORK_REFLECTIONS_HOME`). Same private root as the rest of the reflection bundle. Same `.gitignore`. Same privacy posture.

## When to apply

Trigger this skill when the user:
- Is setting up the bundle for the first time and wants the skills to know them.
- Just changed roles, joined a new team, or shifted scope.
- Notices another skill producing generic output that would be sharper with context (*"the spec writer keeps assuming I'm at a startup; I'm not"*).
- Wants to see or review what's currently in their profile.
- Wants to add an alternate "hat" (e.g. they wear both PM and EM hats and want skills to know which mode they're in).

Skip when:
- The user is just answering a one-off question. Don't suggest profile setup mid-flow.
- The user already has a profile and is doing reflection work — point them at the right skill instead.

## File format

Single markdown file with frontmatter + sections. Designed to be hand-editable (the user owns it; this skill just helps create and update).

```markdown
---
name: [User's name, optional]
last_updated: 2026-05-03
default_hat: pm
---

# Default profile

## Role
[One paragraph: current role, level, time in role, who you report to in shape (e.g. "Sr PM, 3 years in role, report to a Director of Product who reports to the VP of Product").]

## Org and product context
[Company size and stage, product or area you own, team size, who your primary cross-functional partners are.]

## Current strategic focus (next 1-2 quarters)
[2-4 bullets: the things you're spending most of your time on. Not a backlog — the *narrative arc* you're trying to advance.]

## Communication style preferences
[How you like outputs framed. E.g. "Concise, no marketing buzzwords, direct over diplomatic, examples over abstractions, push back on me if my framing is off."]

## What I'm working on as a leader
[1-2 areas of personal growth — connects to `self-reflect`. Composes with coaching, performance management, etc.]

## Stack and tools (if relevant)
[Languages, frameworks, observability stack, etc. Useful for `the-spec-writer`, `the-eval-designer`, `the-rfc-reviewer`, `the-prompt-critic`.]

## Cross-references
- Stakeholder files: `~/bettersense-work-reflections/managing-{up,across,down,teams}/`
- Self-reflection: `~/bettersense-work-reflections/self/reflections.md`
- Wins log: `~/bettersense-work-reflections/wins.md`

---

# Alternate hats (optional)

## Hat: TPM mode
[Used when running cross-team programs. Captures any context that differs from default — usually different stakeholders, different KPIs, different communication register.]

## Hat: IC mode
[For users who do both manager and IC work. Captures what the IC work involves, who your collaborators are when you're in this mode.]
```

The "alternate hats" section is optional. Most users have one mode; some wear multiple. The skill should ask whether the user wants alternates only if they bring it up.

## The interview flow

When invoked for first-run creation, walk through these in order. Keep each step short — this is a doorway, not an interrogation. The user fills detail over time.

1. **Name (optional, skip if user prefers)**
2. **Role** — one paragraph. Title, level, time in role, the rough shape of who you report to.
3. **Org and product context** — two or three sentences. Company stage and size, what you own, who you work with.
4. **Current strategic focus** — *"What are the 2-4 things you're spending most of your time on this quarter?"* Push for the *arc* not the backlog.
5. **Communication style** — *"How do you want outputs framed? Direct or diplomatic? Examples or abstractions? Should the skills push back on you?"* Capture verbatim if possible.
6. **Personal growth area** — *"Anything you're working on as a leader that the skills should know about? E.g. 'I want to delegate more,' or 'I'm trying to be less reactive in meetings.'"* Optional but high value — it composes with coaching, feedback, performance management.
7. **Stack and tools** — only if relevant to the user's work.
8. **Alternate hats?** — only ask if the user has indicated they wear multiple.

After capture, write the file. Confirm with the user before writing — show them the rendered profile and ask if anything is off.

## The update flow

When invoked for an existing profile, three sub-modes:

- **Show** — dump the current profile content. *"Here's your current profile. Anything you want to change?"*
- **Edit a specific section** — let the user say *"update my strategic focus"* and edit just that section.
- **Refresh entirely** — re-run the interview, but pre-populate from the existing file so the user just confirms / edits each step.

Always update the `last_updated` date in frontmatter when writing.

## How other skills should use this

The convention (also referenced in the README's *anchor-file pattern* section):

> **If `~/bettersense-work-reflections/profile.md` exists, read it before doing your work.** Use the role, level, communication style, current strategic focus, stack, and any other relevant fields to tailor your output. Don't repeat questions the profile already answers.

Skills currently designed to read the profile when present:
- `the-spec-writer` — spec format, scope assumptions, stack defaults
- `the-translator` — audience defaults, framing register
- `the-explainer` — audience preferences, voice
- `report-promo-case` — level calibration (what bar to argue against)
- `report-career-architect` — pacing and plausibility (a Director-level user designs different growth plans than a first-time manager)
- `metrics-design` — product/area context for KPI framing
- `coaching-mode` — user's leadership style (sets default tone for coaching prompts)
- `feedback-frameworks` — user's directness preference

When in doubt about whether a skill should read it: yes, and tailor the output. The skill body always has the right structure; the profile makes it land in the user's voice.

If the profile is missing, the skills work without it — just produce more generic output. Don't pester the user to set it up unless they raise the question.

## Multiple hats (the optional advanced pattern)

A user who wears multiple roles (PM + EM, TPM during programs + senior IC otherwise, or one PM hat per product line) can capture each as a section under "Alternate hats."

When a user invokes a skill, the skill defaults to the `default_hat` from frontmatter unless the user explicitly indicates a different mode (*"use my TPM hat for this"*). The skill should be light on this — most invocations don't need to ask which hat; it'll be obvious from the context.

## Operating principles

- **The user owns the file.** It's plain markdown; they can edit it directly. The skill is a doorway and a periodic refresher, not a gatekeeper.
- **Honest staleness check.** Profiles rot. After 90 days, when the user invokes `user-profile` for any reason, gently surface: *"Your profile was last updated 2026-02-04. Anything material changed?"* Don't nag.
- **Keep it short.** A 2-page profile is too long; nothing in it gets read. Aim for ~30 lines of content. The depth lives in the rest of the bundle.
- **Don't capture what the bundle already captures.** Stakeholder names belong in the stakeholder files, not the profile. Reflection content belongs in `self-reflect`. Wins belong in the wins log. The profile is *standing context*, not active record.
- **Privacy is non-negotiable.** Same posture as the rest of the bundle — local file, gitignored, never auto-shared. If pointed at a hosted model, the contents go through that provider. Disclose this on first-run.
- **Root directory ownership.** `stakeholder-register` owns the creation of `~/bettersense-work-reflections/`, the `.gitignore`, and the privacy warning. If `user-profile` runs first and the root directory doesn't exist yet, create it and the `.gitignore` silently as part of the profile write — but do not re-issue the full privacy ceremony. If the directory already exists, skip creation entirely. The privacy warning only needs to fire once, and `stakeholder-register` is the canonical place for it.

## Anti-patterns to flag

- **Profile as résumé.** "Spearheaded transformative AI initiatives across the org." That's signaling, not standing context. The skills don't need it.
- **Listing reports / stakeholders in the profile.** That's what `stakeholders.json` is for. Cross-reference instead.
- **Updating the profile every week.** It's a semi-static anchor; update on real role/scope changes, not on every shift in tactical focus.
- **Multiple hats when one is fine.** Most users have one. Don't suggest hats unless the user volunteers.
- **Profile that contradicts other files.** If the profile says "focus is X" and recent stakeholder/wins entries are mostly about Y, surface the gap — but don't auto-update either side. The user resolves it.

## Composition with other skills

- **All listed in "How other skills should use this" above** — they read the profile if present.
- **`patterns-watch`** — composes naturally; the profile's "current strategic focus" is one of the lenses for surfacing whether the user's actual logged work matches their stated focus.
- **`self-reflect`** — the personal-growth field in the profile is the connective tissue. After several `self-reflect` sessions, the user may want to update the profile's growth area to reflect what's surfaced.
- **`stakeholder-register`** — when registering a new stakeholder, the role + relationship can be inferred against the profile's role rather than re-explained.
