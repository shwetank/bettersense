---
name: stakeholder-reflect
description: Use when the user wants to reflect on a registered stakeholder — a manager, peer, direct report, or team — and capture the insight to a durable file. Trigger phrases include "let me reflect on John", "I want to think through my 1:1 with Jill", "log my thoughts on the Client Delivery ABC team", "reflect on [name]". Loads the stakeholder file, picks 1–3 questions appropriate to the moment based on cadence and what hasn't been touched recently, guides the reflection, and writes the dated entry back.
---

# Stakeholder Reflect

Guide a single reflection session about a registered stakeholder. The output is a dated entry appended to `~/voohy-reflections/<category>/<slug>.md` for one or more questions from the question library.

## Inputs you need

1. **Which stakeholder.** Either named explicitly ("John") or implied ("my manager"). Resolve via `~/voohy-reflections/stakeholders.json`.
2. **Time available.** Optional. If the user says "quick" or "just one question," pick exactly one. Default to 2–3 questions, ~10–15 minutes of dialogue.
3. **Anything specific on their mind.** Optional. If the user says *"specifically I want to think about her morale"*, prioritize matching questions over the cadence picker.

If the named stakeholder isn't registered yet, hand off to the `stakeholder-register` skill instead.

## Loading context

Before asking anything:

1. Read `~/voohy-reflections/<category>/<slug>.md` in full.
2. Load `questions.json` (in this skill's folder).
3. Filter questions: `stakeholder_categories` must include the stakeholder's category.
4. For each candidate question, read the existing entries (if any) for that question in the file. Note the most recent entry date.

## Picking questions

Default picker (when the user gave no specific topic):

1. Build a candidate pool: all questions whose `stakeholder_categories` matches the stakeholder's category.
2. Compute "due-ness" for each: today minus last entry date, divided by `suggested_freq` in days (weekly=7, biweekly=14, monthly=30, quarterly=90, biyearly=180). Questions never answered get a flat high score (treat as 2× their cadence).
3. Apply variety bias: prefer at least one `ask`-category and one `sense`-category question to keep the session balanced (the user shouldn't only do "things I observe about them" or only "things I will ask them"). For team stakeholders, pull from at least two of the team-* sub-categories (clarity-alignment, culture, talent-process-resources, results, future) when picking 2+.
4. Deprioritize questions answered in the last 3 days regardless of cadence.
5. Take the top N (default 2; 3 if the user said they have time; 1 if "quick").

Show the picks to the user before drilling in:
> *"Here's what feels worth thinking about for John today: 1) What's been their feedback to you (you haven't logged on this in 5 weeks), 2) What questions from them can you anticipate (weekly cadence, last logged 11 days ago). Sound right, or want to swap one?"*

If the user redirected to a topic, skip the picker and find the closest matching questions in the library.

## Running the reflection

For each picked question:

1. **Surface the question's metadata in full.** Display the prompt, then the `subheading` (if any), then the `things_to_consider` (if any) as a checklist. These are not decoration — they are the entire reason the question is useful.
2. **State the sense category honestly.**
   - `ask`: *"This one's only useful if it comes from them. The point of writing now is to plan how you'll ask, or to log what you already heard."*
   - `sense`: *"Their stated answer here would be unreliable. Read their behavior, tone, and choices instead. What have you noticed?"*
   - `askandsense`: *"Some of this you'll only get by asking; some you'll only get by watching. Cover both."*
3. **Hold a real conversation.** Ask follow-ups. Push past one-line answers. When the user says something vague ("morale seems fine"), ask for the specific evidence ("based on what?"). When the user labels someone ("she's defensive"), ask for the behavior that prompted that label.
4. **Reference the file's history.** If the user previously logged something contradictory or related, surface it. *"Three weeks ago you wrote that John was 'all-in on the migration' — does that still hold, or has that shifted?"*
5. **Don't synthesize while reflecting.** Save the patterns for `stakeholder-synthesize`. Right now you're just capturing this moment honestly.

## Writing the entry

After each question's reflection (or at the end of the session), append to the file in this exact structure. Find or create a `## <prompt> [<sense_category>, <suggested_freq>]` heading, then add a `### <YYYY-MM-DD>` subsection beneath it.

Use today's date (the user's local date as you understand it).

```markdown
## What's been their feedback to you? [askandsense, biweekly]

### 2026-05-01

He told me on Tuesday that the spec was "much sharper" than the previous one and
that pulling forward the eval section was the right call. Behaviorally, he also
forwarded it to the platform team unprompted, which he doesn't usually do — that's
real signal, not just politeness.

Open: he didn't say anything about the timeline pushback I raised. Need to bring
it up directly next 1:1 or it'll fester.
```

Keep the entry compact but substantive. Voice = the user's, captured cleanly. Include "open" / "to do" / "to bring up next" lines when something is unresolved — these compound across sessions and become useful raw material for `stakeholder-synthesize`.

If the user wants to skip a picked question without answering, write nothing for it. Don't backfill empty entries.

## Composing with other skills

Surface these handoffs *only when the conversation naturally produces the input*:

- **Feedback to give.** If the reflection produces "I need to tell her X" → offer to invoke `feedback-frameworks` to draft it now.
- **A 1:1 coming up.** If the reflection mentions an imminent 1:1 → offer to invoke `one-on-one-prep` to build the agenda.
- **A decision worth recording.** If the reflection produces a decision the user is making about how to handle the relationship → offer to invoke `decision-log`.

Don't force these. The reflection is the primary product; the handoffs are bonuses.

## Operating principles

- **Push for specificity.** Vague entries compound into vague synthesis. "She seems unhappy" → "what specifically did you notice?"
- **Honor the sense category.** If a question is `sense`, do not record what the stakeholder *said*; record what the user *noticed*. The two are different and the distinction is the whole point of the framework.
- **Cite evidence in the entry.** When a claim is made ("his morale is dropping"), the entry should include the specific observations or quotes that support it.
- **Reference the file's history.** Reflections compound only if the user is reading their own past entries. Surface them.
- **Respect the user's bandwidth.** If they tap out after one question, end the session cleanly. Better one good entry than three rushed ones.

## Anti-patterns to flag

- **One-line entries.** "Morale fine" is not an entry. Push back.
- **Logging stated answers as observed truth on `sense` questions.** "She said morale is fine" is not the answer to "How's their morale?" — that's an `ask`. The `sense` answer is what the user noticed.
- **Reflection that's actually venting.** If the user is just frustrated, name it gently and ask whether the goal is to capture insight or to process emotion. Both are legitimate, but the file should hold insight.
- **Letting ratings ("morale is 7/10") substitute for description.** A number without observations is noise.
- **Confusing "I haven't asked yet" with "I don't know yet."** For `ask` questions where the user hasn't asked, the entry should plan the question, not invent the answer.
