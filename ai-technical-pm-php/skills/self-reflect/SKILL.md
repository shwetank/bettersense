---
name: self-reflect
description: Use when the user wants to reflect on themselves as a leader — behavior under pressure, communication, time and energy, leadership style, fulfillment, advocating for themselves, calendar review. Trigger phrases include "let me reflect on myself", "self-check", "I want to think about how I've been leading lately", "self-reflection". Loads `~/bettersense-work-reflections/self/reflections.md`, picks 1–3 self-reflection questions appropriate to the moment, guides the reflection, and writes the dated entry back. Mirrors `stakeholder-reflect` but aimed at the user themselves.
---

# Self-Reflect

Reflect on the user themselves — leadership, behavior, fulfillment, calendar — and capture the result to `~/bettersense-work-reflections/self/reflections.md`. The shape mirrors `stakeholder-reflect`; the difference is the audience and the question pool.

## First-run setup

If `~/bettersense-work-reflections/self/reflections.md` doesn't exist:

1. Create the `self/` directory under `$BETTERSENSE_WORK_REFLECTIONS_HOME`.
2. Initialize `reflections.md` with this frontmatter:
   ```markdown
   ---
   subject: self
   since: 2026-05-01
   ---

   # Self-reflections

   <!-- The self-reflect skill appends per-question entries below this line. -->
   ```

If `~/bettersense-work-reflections/` itself doesn't exist, hand off to `stakeholder-register` first — that skill owns the root setup and the privacy warning.

## Picking questions

Filter `questions.json` (loaded from the `stakeholder-reflect` skill folder) to questions where `stakeholder_categories` includes `self`. The pool spans three families:

- **General behaviour:** how the user behaves under pressure, communicates, gives/handles feedback, manages calendar.
- **Leadership:** what makes them effective, how they're growing, what to work on.
- **Current role:** compensation, fulfillment, time/energy, advocating for self, work environment, what they're unclear about.

Default picker, when no specific topic given:

1. Compute due-ness same as `stakeholder-reflect`: `days_since_last / cadence_days`.
2. Apply variety: pick from at least two of the three families when picking 2+ questions.
3. Deprioritize anything answered in the last 7 days (self-reflection saturates faster than stakeholder reflection).
4. Take top N (default 2; 3 if "I have time"; 1 if "quick").

Show the picks before drilling in:

> *"Here's what feels worth thinking about: 1) How well have you managed your time and energy recently? (biweekly cadence, last logged 3 weeks ago) 2) How are you handling feedback? (monthly cadence, never logged). Sound right?"*

If the user named a topic ("specifically I want to think about advocating for myself"), skip the picker.

## Running the reflection

Same shape as `stakeholder-reflect`, with self-specific adaptations:

1. **Surface the question's `subheading` and `things_to_consider` in full.** These are especially load-bearing for self-reflection — the prompts are short but the prompts-to-consider have most of the actual depth.
2. **Push past the comfortable answer.** Self-reflection tends toward two failure modes: false modesty ("I'm fine, nothing to work on") and false self-criticism ("I'm terrible at everything"). When you spot either, gently challenge it. *"You said you're 'fine' under pressure, but earlier you mentioned the Friday call where you snapped at the iOS lead — can we look at that?"*
3. **Reference past entries.** Self-reflections compound only when the user revisits them. *"Two months ago you wrote that you wanted to delegate more — has that shifted, and what specifically have you handed off?"*
4. **Specifically for `current-role` questions** (compensation, fulfillment, advocacy): take these seriously even when the user is glib. These are the questions people are most prone to skipping and most likely to regret skipping.

## Writing the entry

Append to `~/bettersense-work-reflections/self/reflections.md` in the same per-question / per-date structure as stakeholder files.

```markdown
## How well have you managed your time and energy recently? [current-role, biweekly]

### 2026-05-01

Calendar over the last 2 weeks: 31 hrs of meetings (target was ≤24). Of those,
6 hrs were optional that I could have skipped. Energy: noticeably lower in the
afternoons; I'm protecting mornings well but burning the back half of the day
in low-stakes syncs.

Action: cancel the standing Thursday product review I haven't actively contributed
to in 5 weeks. Block 2-4pm Wednesdays for deep work and treat as inviolable.
```

Self-reflection entries should produce *actions or commitments* more often than stakeholder entries do — because the user is the only person who can act on them. Encourage this; write the action down explicitly.

## Composing with other skills

- **If self-reflection surfaces feedback to give to someone else** (e.g. "I realize I'm avoiding telling Priya she's underperforming") → offer to switch to `stakeholder-reflect` or `feedback-frameworks`.
- **If it surfaces a decision** (e.g. "I'm going to push for a promo") → offer to invoke `decision-log`.
- **If it surfaces a leadership behavior the user wants to change** → after a few entries on the same theme, invite a `stakeholder-synthesize` over the self file with that lens.

Don't force these. Most self-reflection sessions just need to land cleanly.

## Operating principles

- **Honesty over performance.** Self-reflection that sounds like it could be read out at a performance review isn't doing real work. Encourage the user to be candid; the file is private.
- **Concrete observations, not labels.** "I lost my temper Tuesday at 3pm in the cross-functional review when the eng director cut me off" is useful. "I'm impatient" is not.
- **Action-orientation, not performative resolutions.** "I'll be a better listener" is a non-commitment. "I will not respond to anyone for 5 seconds after they finish a sentence in tomorrow's standup" is a commitment.
- **Cadence respect.** Self-reflection daily is grinding, not growth. Weekly to bi-weekly is the sweet spot for most people.
- **Don't double up with therapy.** This skill is for getting more effective at work. Real distress, burnout, or mental health concerns belong with a professional, not a markdown file.

## Anti-patterns to flag

- **Vague gratitude lists.** "Grateful for my team this week." Push for one specific person and one specific moment.
- **Resolutions as a substitute for reflection.** Long lists of "I should…" with no observation behind them are aspirational, not reflective. Anchor every resolution to a concrete recent observation.
- **Skipping the same question every time.** If the user keeps deflecting `compensation` or `advocating for yourself` or `handling feedback`, that pattern is itself reflective material. Surface it gently.
- **Reframing critique as praise.** "I struggle with delegation" → "I care deeply about quality." That's a dodge. Call it.
- **Logging without revisiting.** Recommend that the user run `stakeholder-synthesize` on their self file once a month or so. The compounding insight is in the rereading, not the writing.
