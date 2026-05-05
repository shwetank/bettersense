---
name: wins-due
description: Use when the user wants a low-pressure nudge on whether anything from the recent week is worth logging to their wins file. Trigger phrases include "what should I log this week", "is anything missing from my wins doc", "did I do anything notable this week", "Friday wins check". Designed to be invoked on demand or fired weekly via `/schedule "Every Friday at 4pm, run /wins-due"`. Probes by category (delivery / judgment / mentorship / recovery / range) because memory is selective and "anything notable?" alone surfaces nothing. Accepts "honestly, nothing this week" gracefully — the skill is for honest capture, not forced positivity.
---

# Wins Due

A weekly low-pressure nudge to surface forgotten wins. Most underlogging is forgetting, not modesty — this skill exists because *"what did you do this week?"* gets blank stares while *"did you mentor anyone? recover anything? push back on a bad decision?"* gets memory hits.

## When to apply

Triggers:
- Friday-afternoon "did anything happen?" moments.
- User opens Claude after a big shipping week and isn't sure what's worth capturing.
- Wired to `/schedule` (recommended cadence: weekly, late-week so the week is fresh).

Skip:
- The user just logged something today.
- The user is mid-flow on something else (be polite — don't context-switch them into a reflection session unsolicited).

## Loading

1. Read `~/bettersense-work-reflections/wins.md` (configurable via `$BETTERSENSE_WORK_REFLECTIONS_HOME`).
2. Find the most recent `## YYYY-MM-DD —` entry. Compute `days_since_last`.
3. If the file doesn't exist, hand off to `wins-log` (which handles first-run setup).

## When to nudge

- `days_since_last < 7`: don't nudge. Tell the user the file is current and bow out. *"Last entry was 3 days ago — you're current. Nothing to chase."*
- `7 ≤ days_since_last < 14`: gentle nudge.
- `days_since_last ≥ 14`: stronger nudge, with a note that things may already be slipping from memory.
- Never logged anything: warmer onboarding nudge — *"You haven't logged anything yet. That's fine. Want to start with one thing from this week, or skip for now?"*

## The probe

Generic "anything notable?" gets nothing. Probe by category. Pick 4–5 of these per session, randomize across runs so the user isn't asked the same prompts every Friday:

- **Delivery:** Did you ship anything that took real effort? Push past a milestone you weren't sure about?
- **Judgment:** Did you make a hard call this week? A *no* you said that protected something? A delay that was the right move? A scope cut that was unpopular but right?
- **Recovery:** Did you save anything that was sliding sideways? Take over something that was stuck?
- **Mentorship:** Help someone with something they couldn't have done alone? Coach someone through a hard conversation? Pair on something that unblocked them?
- **Range:** Work outside your normal lane? Cover for someone? Fix something that wasn't yours?
- **Craft:** Produce a piece of work you're particularly proud of — a sharp doc, a clean prototype, a great eval design?
- **Culture:** Push a new norm or ritual? Surface a problem the team was working around?
- **Learning:** Pick up a new capability or framework you'll use again?

The point of probing by type is that **selective memory undercounts certain types** — most users remember `delivery` (because it's tangible) and forget `judgment`, `mentorship`, `recovery`, and `culture` (because they don't show up as artifacts). The probe surfaces what's been forgotten.

## Output format

When nudging:

```
You haven't logged a win in 11 days. Quick probe — anything in these buckets?

🚀 Delivery: ship anything that mattered? Push past a hard milestone?
⚖️ Judgment: make a call under uncertainty? Say a useful "no"?
🧯 Recovery: save anything that was going sideways?
🤝 Mentorship: help someone with something they couldn't have done alone?
🪜 Range: cover for someone? Fix something outside your lane?

Pick one and we can log it now (`wins-log`), or say "nothing notable" and I'll get out of your way.
```

When the user says "nothing notable," accept it cleanly:

> *Fair. Quiet weeks happen. Talk again next Friday.*

When the user picks something, hand off to `wins-log` to do the structured capture. Don't try to capture inline — `wins-log` has the forcing functions; this skill is just discovery.

## Optional: scan accessible context

If the user has integrations open (recent commits, calendar, chat history reachable via tools or context), offer to scan for forgotten wins:

> *Want me to skim recent commits / calendar / open Slack threads for things you might have forgotten? You'd review before anything gets logged.*

This is **opt-in only** — invasive otherwise. Don't auto-scan.

If invoked, look for:
- Commits with substantive messages (not "fix typo")
- Calendar entries that were big launches, hard meetings, executive reviews
- Chat threads where the user pushed back, made a call, helped someone

Surface 3–5 candidates as bullets and let the user pick which (if any) to convert into wins entries.

## Wiring to `/schedule`

When the user wants this to fire automatically, suggest:

> *To get a Friday afternoon nudge every week:*
> ```
> /schedule "Every Friday at 4pm, run /wins-due"
> ```

Don't run `/schedule` automatically — the user owns the cadence decision.

## Operating principles

- **Lower pressure than `stakeholder-due`.** A quiet week of stakeholder reflection is a missed obligation; a quiet week of wins is sometimes just a quiet week. Match the tone.
- **Probe, don't cheerlead.** "What did you crush this week?" is hype-doc-ese and produces inflated entries. "Did you say a useful no?" produces real ones.
- **Vary the probes.** Same five questions every Friday becomes background noise. Rotate.
- **Hand off cleanly.** This skill discovers; `wins-log` captures. Don't try to do both — you'll either water down the discovery or rush the capture.
- **Be okay with "no."** Accepting "nothing notable" without a guilt-trip is what makes the skill sustainable. A weekly nag turns into a weekly skip.

## Anti-patterns to flag

- **Nagging.** If the user has skipped 4 weeks in a row, don't escalate the urgency. Ask once if the cadence is right and offer to back off. *"Want to drop the cadence to monthly, or pause for now?"*
- **Probing every category every time.** Long lists are background noise. 4–5 categories per nudge is the cap.
- **Logging inline.** Tempting to just write a quick entry from the probe answer. Don't — `wins-log` exists because the structured capture is hard work, and skipping it produces vague entries that hurt later curation.
- **Treating absence of wins as a problem.** Some weeks are admin / planning / context-loading. That's normal. The skill is for capturing what happened, not validating the user's existence.
