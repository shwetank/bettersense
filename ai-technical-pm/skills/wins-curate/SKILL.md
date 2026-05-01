---
name: wins-curate
description: Use to turn the wins log into an audience-specific artifact — promo packet, behavioral interview stories (STAR), perf-review self-eval, salary negotiation case, or a personal year-in-review. Trigger phrases include "build my promo packet", "I have a behavioral interview Tuesday", "draft my self-eval for the perf review", "make a case for a raise", "year in review for me". Reads `~/voohy-work-reflections/wins.md`, picks and remixes entries for the chosen audience, and produces a usable artifact. Never invents wins — only curates from what's logged. Composes with `stakeholder-synthesize` and `self-reflect` for perf-review prep.
---

# Wins Curate

Take the accumulated wins log and produce an audience-specific artifact. Five modes; pick one before producing anything.

## Inputs to settle first

Refuse to curate before these are clear. Audience determines structure, tone, depth, and which wins matter.

1. **Mode.** One of:
   - `promo-packet` — internal promotion case for a panel
   - `interview-stories` — STAR-shaped answers for behavioral interviews
   - `perf-review` — self-eval for the formal review cycle
   - `salary-case` — case for a raise, equity refresh, or counteroffer
   - `year-in-review` — personal retrospective; less external-facing
2. **Time window.** Default: last 12 months. The user can override.
3. **Specifics for the mode** (audience-specific):
   - Promo: target level, the company's published rubric if available.
   - Interview: target company / role, known behavioral question themes.
   - Perf: review cycle template (which sections, what rating scale).
   - Salary: comp band you're targeting, the case you'll make.
   - Year-in-review: any specific lens or theme.

If the user says "all of them," push back: each artifact has a different shape and different selection criteria. Build them one at a time.

## Loading

1. Read `~/voohy-work-reflections/wins.md` (configurable via `$VOOHY_WORK_REFLECTIONS_HOME`).
2. Filter entries to the time window.
3. Read the structured fields per entry — type, scope, collaborators, credit framing, impact, evidence.
4. For perf-review mode, also read `~/voohy-work-reflections/self/reflections.md` (if it exists) and any registered stakeholders' files (via `stakeholders.json`) — composition.

## Mode: `promo-packet`

The shape varies by company but most internal promo packets need:

- **Scope demonstration** — the candidate operates at the target level's scope.
- **Impact** — the candidate has shipped business-relevant outcomes.
- **Judgment** — the candidate makes calls others would have gotten wrong.
- **Leadership / influence** — the candidate moves people, not just code/specs.
- **Growth trajectory** — the candidate has stretched recently.

Curate by mapping wins to dimensions:

```
# Promo case: [name] → [target level]
Period: [time window]

## Scope demonstration
- [headline win] — [1-line summary] (cited: 2026-03-12 entry)
- ...

## Impact
- [headline win] — [quantified result] (cited: 2026-04-22 entry)
- ...

## Judgment
- [headline win] — [the call, the reasoning, the result] (cited: ...)
- ...

## Leadership / influence
- ...

## Growth
- ...

## Gaps to address before submission
- [Dimension X] is thin in the log. Strongest available is [Y], but a panel may want more.
- [Specific evidence the panel will likely want that the log doesn't have.]
```

Pull primarily from `delivery`, `judgment`, `leadership` types. Use `mentorship` and `range` for the leadership and growth dimensions. Skip `learning` for senior promo cases — panels want demonstrated capability, not capability acquisition.

**Calibration is non-negotiable.** Show solo-vs-shared credit in the packet — don't claim solo on team work. Reviewers know the team. Inflation costs the case more than a thinner-looking-but-honest packet.

## Mode: `interview-stories`

Behavioral interview answers want **stories with conflict and resolution**, not summaries. Pick 4–6 wins that have real texture.

Prefer types: `recovery`, `judgment`, `range`, `leadership`. Skip pure `delivery` unless the delivery had genuine conflict embedded.

For each picked win, produce:

```
## Story: [headline]

**Best fit for behavioral prompts about:** disagreement, ambiguity, hard call, mentoring, [etc.]

### STAR draft (90-second target)

**Situation (15s):**
[the context — make the stakes clear without burying the listener in detail]

**Task (10s):**
[what specifically you were on the hook for — distinguish from team task]

**Action (45s):**
[what *you* did — first-person verbs. The interviewer wants to know about you, not the team. Surface the hard part.]

**Result (20s):**
[quantified where possible; if not, the qualitative outcome with audience]

### Likely follow-ups
- "What would you do differently?"
- "How did [collaborator] react?"
- "What was the most uncomfortable part?"
- [audience-specific follow-ups]

### Anti-pattern check
- ☐ Doesn't end with "and everyone lived happily ever after" — has a real result with caveats
- ☐ The "I" is real, not collective
- ☐ The conflict is real — not "I solved it by working hard"
```

Then a separate **bench depth** note: a quick scan of which themes are well-covered vs. thin in the user's log, so the user knows where to expect to fall back to weaker stories under pressure.

## Mode: `perf-review`

Reviewers want **breadth across types** plus **growth narrative**. Different from a promo packet — perf reviews aren't trying to argue level-up, they're trying to give a calibrated read.

Structure:

```
# Self-evaluation: [period]

## Core deliverables
[Quantified, with collaborators named honestly. Pull from `delivery`.]

## Judgment & decision-making
[Hard calls, with reasoning. Pull from `judgment`. ADR cross-references where they exist.]

## Leadership & influence
[Pull from `leadership`, `mentorship`, `culture`.]

## Range / cross-functional
[Pull from `range`. Especially valuable in perf — shows breadth.]

## Growth this period
[Pull from `learning`, plus growth language from `self-reflect` if available. Frame as: "I've been working on X" with a concrete example of progress.]

## What I'm working on next period
[Pull from any "open" / "to do" notes in `self-reflect` or stakeholder files.]

## Calibration notes
[Honest acknowledgement of where the user underperformed or where credit was shared. This builds reviewer trust.]
```

**Composition with other skills:**
- `self-reflect` file → growth narrative and "working on next" sections.
- `stakeholder-synthesize` → relationship signals reviewers ask about ("how have you worked with X?").
- `decision-log` → judgment evidence with rationale.

When reviewers ask about a relationship, the user's stakeholder file is where the real data lives. Surface a 3-sentence read on each major relationship.

## Mode: `salary-case`

Different framing entirely: business value over personal scope. Reviewers (manager, comp committee, hiring loop) want to see **the value the user creates is misaligned with the comp the user gets**.

Structure:

```
# Comp case

## Business value created (last [period])
- Revenue: [if quantifiable] (sources: [wins entries])
- Retention/expansion: [if quantifiable]
- Cost saved or risk reduced: [if quantifiable]
- Strategic impact (qualitative but anchored): [...]

## Scope vs. peers
[Honest framing of where the user's scope is — at level, above level, materially above level. Cite specific wins demonstrating scope.]

## Market context
[Comp-band research the user has done. The skill doesn't fabricate market data.]

## The ask
[Specific number range, with reasoning.]

## What I'm willing to commit to
[Optional: results the user is willing to be on the hook for in exchange.]
```

**Critical: don't inflate.** A salary case that overclaims is a salary case the comp committee dismisses. Every dollar figure cited should map to a logged win with evidence. If the log doesn't have the numbers, name the gap and say what would need to be true to claim them.

## Mode: `year-in-review`

Personal retrospective — less external-facing, more "what did I actually do this year and what does it tell me?"

Structure:

```
# Year in review: [year]

## By the numbers
- N wins logged
- Type distribution: [delivery: X, judgment: Y, ...]
- Top 3 by impact

## What I shipped
[Brief list. The user already knows; this is for the file.]

## What I'm proudest of
[2-3 wins, with the why. The hardest, not the loudest.]

## Patterns
- [Did one type dominate? Was there a quarter that felt off?]
- [Did the user log mostly delivery and miss leadership? That's signal.]
- [Trajectory: was Q4 stronger than Q1?]

## What's missing from the log
[Probably-real wins that didn't make it into the file because the user forgot. Useful for next year's discipline.]

## What I want next year
[Pull from `self-reflect` if available.]
```

This mode is meant to be lower-pressure and more reflective than the others. Honest patterns matter more than impressive headlines.

## Operating principles (apply to all modes)

- **Never invent wins.** Curate from the log only. If the requested artifact needs a win the log doesn't have, name the gap explicitly. Tell the user what would need to be true to claim X — don't paper over it.
- **Honor the user's voice.** No marketing buzzwords. The artifact should sound like the user, not like LinkedIn. *"Spearheaded a strategic initiative"* is a flag — replace with what they actually did.
- **Calibrate solo vs. shared credit.** This is the difference between an artifact that holds up under scrutiny and one that gets the user dismissed. Inflation always costs more than calibration.
- **Cite log entries.** Every claim in the artifact maps to a specific entry in `wins.md`. Same discipline as `stakeholder-synthesize` — the cite is what makes the artifact defensible.
- **Surface gaps as prep targets.** A thin promo case in the `judgment` dimension is information the user can act on (log more judgment wins; or rethink the timing). Name the gap.
- **Match the audience's risk tolerance.** A perf review tolerates honest growth language. A promo panel reads growth language as "not ready." Tune accordingly.
- **Compose, don't duplicate.** When `self-reflect` and `stakeholder-synthesize` have material that matters, pull it in by reference rather than restating. The artifact is a curation, not a rewrite.

## Anti-patterns to flag

- **One artifact for all audiences.** Tempting and wrong. Each mode produces a different shape because the audiences need different things. Refuse to merge.
- **Inflation by adjective.** "Massively transformed" / "industry-leading" / "transformational." Replace with the number that justifies the adjective, or drop the adjective.
- **Hidden plurals.** "I led teams across the org" when the user worked with two teams. Force singular when singular is honest.
- **Skipping calibration.** A perf review or promo packet without a single shared-credit acknowledgement reads as collusive or oblivious. Almost no work is solo.
- **Recency-bias only.** Promo cases that pull only from the last quarter look thin. Pull across the time window.
- **Listing wins in chronological order.** That's the log itself; the artifact should rank by the audience's selection criteria.
- **Ending with "and the rest is up to you."** Always end with concrete next moves: what to log before submission, what to rehearse, where the gaps are.
