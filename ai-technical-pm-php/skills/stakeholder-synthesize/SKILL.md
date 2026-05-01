---
name: stakeholder-synthesize
description: Use when the user wants to derive insight across accumulated stakeholder reflections — patterns, trends, contradictions, blind spots. Trigger phrases include "how is my managing-up overall", "summarize what I've learned about Jill this quarter", "before my performance review, what do I know about my reports", "what patterns do I see across my team leads", "give me a read on the Client Delivery ABC team". Reads one or many stakeholder files and produces synthesis with citations to specific dated entries — never claims a pattern without evidence.
---

# Stakeholder Synthesize

Find the signal in accumulated reflections. Operates over one stakeholder, a category, or all stakeholders, depending on the user's framing.

## Inputs to clarify

Before synthesizing, settle:

1. **Scope.** One stakeholder, one category (e.g. all of managing-down), or everything?
2. **Time window.** Default: last 90 days. The user can override ("this quarter", "since the reorg in March", "all time").
3. **Lens.** What's the user looking for?
   - **Trend over time** ("has Jill's morale improved?")
   - **Cross-stakeholder pattern** ("am I getting consistent feedback across managing-up?")
   - **Pre-meeting prep** ("what do I know about John before our 1:1?")
   - **Performance review prep** ("what's the case for Draymond's promotion?")
   - **Blind spots** ("what haven't I been thinking about?")

If the user gives an open-ended ask ("what's going on with my team?"), pick a default lens and state it: *"I'll do a cross-stakeholder pattern read across managing-down for the last 90 days — let me know if you want a different cut."*

## Loading

1. Read `~/voohy-reflections/stakeholders.json` for the registry.
2. Identify which files to load based on scope.
3. Read each file in full. Within each file, read all `### YYYY-MM-DD` entries falling inside the time window.

## Synthesis discipline

This is the load-bearing part. Bad synthesis on stakeholder data is worse than no synthesis — it manufactures false confidence about real people.

**Every claim must cite at least one specific dated entry.** Format: *"Morale has been declining since mid-March (entries 2026-03-18, 2026-04-02, 2026-04-15 all reference disengagement signals)."* If you cannot cite, do not claim.

**Distinguish your three modes of evidence:**
- `ask` entries: what the stakeholder said. Treat as their stated position, which may or may not be the truth.
- `sense` entries: what the user observed. Treat as the user's read, which is filtered by the user's biases but anchored in behavior.
- `askandsense` entries: where stated and observed agree, conviction is highest; where they disagree, surface the gap explicitly.

**Surface contradictions, don't paper over them.** If the user wrote on March 5 that John "seems all-in" and on April 12 that John "is checked out," call out the gap rather than averaging it.

**Distinguish trend from snapshot.** Three entries in the same week saying the same thing is a snapshot. Three entries across two months saying the same thing is a trend. Don't conflate them.

**Watch for the user's blind spots.** Patterns of *non-reflection* are themselves signal:
- Stakeholders with no entries in 60+ days despite due items: avoidance? Genuine no-news?
- Questions consistently skipped across stakeholders: unwillingness to look at certain topics (compensation, conflict, morale)?
- Entries that always say "fine, no issues": real, or surface-skating?

Surface these as "patterns of attention," not as accusations.

## Output structure

Match the lens. For most lenses, this shape:

```
# Synthesis: [scope] — [time window]

## Top-line read
One paragraph. The most important thing the user should walk away with.

## Patterns
- **[Pattern]** — one-sentence claim. (Sources: 2026-03-18, 2026-04-02 in [stakeholder])
- ...

## Contradictions / open questions
- **[Tension]** — what was said vs. what was observed. (Sources: ...)
- ...

## Blind spots
- Stakeholders or topics the user hasn't engaged with recently, with what would be worth doing.

## Suggested next conversations
- [Stakeholder]: what's worth raising, with concrete framing.
```

For pre-meeting prep, swap "Suggested next conversations" for a meeting agenda. For performance review prep, swap for a structured promo-packet-style write-up (strengths with evidence, growth areas with evidence, recent impact).

## Composing with other skills

After producing the synthesis, surface the natural next steps:

- If a "next conversation" would benefit from structured feedback drafting → offer to invoke `feedback-frameworks`.
- If a meeting was named → offer to invoke `one-on-one-prep`.
- If the synthesis surfaced a decision the user is implicitly making (e.g. "I'm going to stop investing in this peer relationship") → offer to invoke `decision-log` so it's named and revisitable.
- If the synthesis is part of pre-launch / pre-review prep → mention that `the-translator` can help reframe technical findings for execs (when the audience matters).

## Operating principles

- **Synthesis ≠ summary.** A summary describes what the entries say. Synthesis derives a claim the user wouldn't have seen by reading them sequentially. If the output reads like a recap, you haven't finished.
- **Cite or strike.** Any claim without an entry-date citation gets removed. No exceptions.
- **Honor the user's voice.** Quote the user's own phrasing where it's vivid; don't sand off the candor. The reflections are private — clean copy is not the goal, accurate insight is.
- **Quantify scope honestly.** "Across 4 entries over 6 weeks" is honest; "consistently" is loaded.
- **Don't moralize.** If the user has been avoiding a stakeholder, name the pattern, not the person. The skill is a mirror, not a coach.
- **Resist the temptation to therapize.** Stakeholder reflection is for getting more useful at work, not for psychological insight about the stakeholder.

## Anti-patterns to flag

- **Bulleted summary that reads "John said X. John said Y. John said Z."** That's a list, not synthesis. Do better.
- **Smoothing over a contradiction.** If three entries disagree, surface the disagreement.
- **Inventing patterns from sparse data.** Two entries is not a trend. Say "one signal" if that's what it is.
- **Synthesizing across stakeholders without naming the segment.** "My managing-up relationships are healthy" is a claim about a population; specify which stakeholders, over what window, with what evidence.
- **Producing a synthesis the user can't act on.** End with concrete next moves, even if the next move is "I should talk to her about X."
