---
name: wins-log
description: Use when the user wants to capture a "win at work" — something they shipped, judgment they exercised, someone they mentored, a fire they put out, a hard decision they got right. Trigger phrases include "I just shipped X", "log this win", "add to my brag doc", "I want to remember what I did this week", "I had a good week and want to capture it". Captures structured entries (situation, action, impact, evidence) to `~/voohy-work-reflections/wins.md` so they can be remixed later by `wins-curate` into a promo packet, interview stories, perf-review self-eval, salary case, or year-in-review.
---

# Wins Log

Capture a single "win at work" in a structured form so it can be remixed later. The output is one entry, prepended (newest first) to `~/voohy-work-reflections/wins.md`.

This is the front-of-funnel skill for the wins bundle (`wins-log`, `wins-due`, `wins-curate`). It works in two modes: **fresh** (the user just did something and wants to capture it) and **retroactive** (the user is logging something that happened recently — last week, last month).

## Data location

`~/voohy-work-reflections/wins.md` (configurable via `$VOOHY_WORK_REFLECTIONS_HOME`). Same root as the stakeholder reflection skills.

## First-run setup

If `~/voohy-work-reflections/wins.md` doesn't exist:

1. If `~/voohy-work-reflections/` itself doesn't exist, hand off to `stakeholder-register` first — that skill owns the root directory setup and the privacy warning. Resume here once it's done.
2. Create `wins.md` with this frontmatter:
   ```markdown
   ---
   subject: wins
   since: <today's date>
   ---

   # Wins at Work

   <!-- Newest entries are prepended below. Each entry begins with `## YYYY-MM-DD — <headline>`. -->
   ```

## Per-entry structure

Every entry uses this exact shape. The structure is what makes the entries remixable later — fight to fill every section.

```markdown
## 2026-05-01 — Shipped contract-summarization to GA

**Type:** delivery, judgment
**Scope:** Q2 multi-team launch
**Collaborators:** Priya (eng lead), Trae (design), legal review team
**Solo vs. shared credit:** Led PM side end-to-end; eng lead and design owned execution; legal team validated the safety story

What happened:
The legal team was spending ~4 hours per deal manually summarizing contracts. We
had committed to GA by end of Q2 against eng leadership skepticism that we'd hit
the eval bar in time.

What I did:
- Pushed back on the original scope (8 contract types) and got us to a focused 3
  in week 2 — that bought 6 weeks of timeline.
- Designed the eval rubric with the legal team directly rather than guessing,
  which surfaced the "non-standard termination clause" failure mode we would
  have shipped past.
- Made the call to delay GA by 1 week when the eval dropped under 0.85, against
  pressure to ship on the original date.

Impact:
- Time-to-summary: 4 hr → 90 sec for the legal team (verified by their team lead)
- 12 paying customers using the feature within 2 weeks of GA
- 0 P0 incidents in first 30 days
- Eval score on launch: 0.91 (held steady at 0.89 in production over month 1)

Evidence:
- Q2 OKR doc, "Contract Summarization GA" section
- Legal team time-study email (April 28)
- #legal-summarization Slack channel
- Postmortem ADR-007 (the eval-driven delay decision)
```

## The capture flow

When invoked, walk the user through these — but quickly. The whole session should take 5–10 minutes for a fresh win, longer for a complex retroactive one.

### 1. Headline + date
One short title, present tense or past tense, no buzzwords. *"Shipped contract-summarization to GA"* — not *"Successfully delivered industry-leading AI capability."*

### 2. Type
One or more from this list, comma-separated:
- `delivery` — shipped something
- `judgment` — made a hard call under uncertainty (especially a *no*, a delay, a scope cut)
- `leadership` — set direction, owned outcome, brought people along
- `mentorship` — grew someone else
- `recovery` — saved something that was going sideways
- `craft` — technical / PM excellence (a sharp spec, a clean prototype, a great eval rubric)
- `learning` — picked up a new capability
- `range` — worked outside your normal lane
- `culture` — changed how the team works (a ritual, a norm, a vocabulary)

The Type field is the single most important structural choice — it drives what `wins-curate` can do later. Don't let the user list everything; push for the 1–3 that actually fit.

### 3. Scope
One of: `sprint`, `quarter`, `multi-quarter`, `ongoing`. Helps calibrate the win's weight at curation time.

### 4. Collaborators + credit framing
Two questions, both required:
- *"Who else was involved?"* — name them with their role.
- *"What was specifically your contribution vs. theirs?"* — force an honest framing. "Led the PM side; eng owned execution" is calibrated. "I shipped this" when 5 people worked on it is inflation.

### 5. What happened (situation)
What was at stake, what was hard, what was unusual. 2–4 sentences. The sentence that matters most: *what made this a real win and not just routine work?*

### 6. What I did (action)
The user's specific contribution. **Push past team verbs to "I" verbs.** "We decided" → "I argued for X and got buy-in from Y." Distinguish what would have happened without the user from what did happen with them.

### 7. Impact
Quantified when at all possible. Push hard here — this is where most logged wins are weakest.

If the user offers vague impact ("improved the system"), probe:
- *For whom?* Which users / customers / teams?
- *By how much?* What numbers, even rough ones?
- *Over what time?* A spike vs. a sustained shift.

If the user says "I can't quantify it":
- *Is there an N you can name?* "Helped 3 engineers" beats "helped engineers."
- *Is there a downstream effect that's measurable?* "Mentored Priya" → "Priya shipped her first solo feature 6 weeks after we started pairing."
- *Is there a counterfactual?* "Would have been a P0 if we'd shipped" — even that's a measurable risk you reduced.

Some wins genuinely resist quantification (e.g. team culture changes). For those, anchor with **specific witnessed examples** rather than abstractions.

### 8. Evidence
Where someone could verify this. Doesn't have to be polished — informal works. *"#legal-summarization Slack channel, week of April 15"* is fine. *"Email from Sarah dated April 28"* is fine.

If the user can't name any evidence, gently flag: a win without evidence is hard to defend later when curation matters. They don't have to fix it now, but the entry should note `Evidence: none captured at the time` so it's honest.

## Writing the entry

Prepend the new entry to `wins.md` (newest first), under the frontmatter and intro. Use today's date.

Confirm the entry with the user before writing — show them the structured version and ask if it lands.

## Composing with other skills

When the win came from work that touches another skill, surface the cross-link:

- **Feedback-driven wins** ("I gave Priya direct feedback that landed and she changed the behavior") → mention `feedback-frameworks` in the entry. Good fodder for the `mentorship` type.
- **Judgment wins with a real decision behind them** → suggest invoking `decision-log` to capture the underlying ADR. Cross-reference both.
- **Wins about a stakeholder relationship** ("I built trust with the new VP by doing X") → suggest also logging this in the relevant stakeholder file via `stakeholder-reflect`. The two systems compose.

Don't force these. The capture is the primary product; cross-links are bonuses.

## Operating principles

- **Push past vague.** Specifics compound; vagueness rots. The skill's value is in being slightly more demanding than the user would be alone.
- **Calibrate solo vs. shared credit.** The brag doc is more credible — and protects the user's reputation when others read the artifact later — when it's calibrated, not inflated.
- **Honor "I had a quiet week."** If the user genuinely doesn't have a win this session, don't manufacture one. The forced-positivity school of hype-doc maintenance produces fictions.
- **The user's voice.** Don't sand off candor. The wins file is private; cleaned-up phrasing is the curate skill's job, not log.
- **Don't over-edit retroactive entries.** If the user is logging something from 3 weeks ago and the details are fuzzy, capture what they remember, mark it `(reconstructed from memory)`, and move on. Some signal beats no signal.

## Anti-patterns to flag

- **"I shipped X"** when 5 people shipped X. Push for the credit framing.
- **Adjectives instead of numbers.** "Massively improved" is noise; "reduced P95 from 2.4s to 800ms" is a win.
- **Wins that are really tasks.** Completing a routine ticket is not a win unless something genuinely hard happened. Distinguish achievement from output.
- **Resume buzzwords.** "Spearheaded a strategic initiative" is signaling, not capture. Force plain language.
- **No evidence + no impact.** An entry with neither is a story, not a win. Push for at least one.
- **Inflated type tags.** Tagging a routine ship as `leadership + judgment + craft + range` to load up on dimensions hurts curation. One or two honest tags beats five aspirational ones.
