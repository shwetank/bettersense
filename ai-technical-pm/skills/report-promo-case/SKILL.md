---
name: report-promo-case
description: Use when building a promotion case for a direct report — internal promo packet, panel write-up, or the one-pager that goes to a calibration committee. Trigger phrases include "build the promo case for [report]", "I'm submitting [name] for staff this cycle", "draft [report]'s promo packet", "help me make the case for [name]'s promotion". The mirror image of `wins-curate` — that one is for the user's own brag doc; this is for advocating *upward* for a report. Reads accumulated stakeholder-reflect entries on the report (and any growth plan from `report-career-architect`), produces a panel-ready packet with cited evidence per dimension, surfaces calibration concerns, and flags gaps before submission.
---

# Report Promo Case

The annual promo cycle is one of the highest-stakes things a manager does *for* a report. A weak case lands a strong report at the same level for another year — a real career cost. A strong case anchored in inflated claims gets dismissed and damages trust with the calibration committee.

This skill turns accumulated observations into a defensible, calibrated promo packet.

## When to use

- **6–8 weeks before the calibration committee meets.** Earlier than most managers start. Drafting late means scrambling for evidence; drafting early means the gaps you find can still be closed.
- **When deciding *whether* to submit.** A real draft surfaces whether the case is actually there. If the draft is thin, that's information — sometimes the answer is "wait one more cycle and close gap X."
- **When peer-calibrating with other managers.** A written case is reviewable; a verbal pitch isn't.

## Inputs to gather first

1. **Target level** the user is pitching for. Be specific (e.g., "Staff Eng" not "next level").
2. **The published rubric / leveling guide** if the company has one. If not, what dimensions does the calibration committee actually weigh?
3. **The report's stakeholder-reflect file** at `~/voohy-work-reflections/managing-down/<slug>.md`. Read the full file. Pay attention to entries on accomplishments, struggles, scope, and feedback received.
4. **The growth plan** from `report-career-architect` if it exists. The plan tells you what *should* have happened in the period; the file tells you what *did* happen. The gap is information.
5. **The cycle's calibration norms.** Is the company tightening or loosening the bar this cycle? Are there caps? Has this team submitted recently?

## The packet structure

Different companies have different templates. The skeleton below covers the common dimensions; adapt to the user's actual rubric.

```
# Promo Case: [Report] → [Target Level]
Period covered: [start — end]
Manager: [user]

## TL;DR
One paragraph: what this person has done that demonstrates target-level operation,
the strongest 2–3 wins that anchor the case, and an honest read on calibration
(at level / above level / stretch).

## Scope demonstration
[Citations from stakeholder-reflect entries showing target-level scope.]
- [Specific scope evidence 1] (source: 2026-03-12 entry — "led X across Y teams")
- [Specific scope evidence 2] (source: ...)

## Impact
[Quantified business / org / technical impact.]
- [Impact 1] (sources: ...)
- [Impact 2] (sources: ...)

## Judgment / decision-making
[Hard calls made well, especially under uncertainty.]
- [Specific call 1] — what was at stake, what they decided, what happened (source: ADR-007, 2026-04-15 entry)
- ...

## Leadership / influence
[Where they moved people, not just code/specs.]
- [Specific moment 1] (source: ...)
- ...

## Growth this period
[Concrete demonstration that they're operating differently than 12 months ago.]
- [Then vs. now examples, with sources]

## Cross-functional / range
[Work outside their direct lane — important for senior/staff levels especially.]
- [...]

## Calibration notes
- **What's at level vs. above level:** honest read. A panel can smell inflation.
- **Solo vs. shared credit:** named collaborators. Hidden plurals are how cases get torpedoed.
- **What the panel might push back on:** preempt the weakest argument and address it.

## Risks if promoted
[Real ones. "None" is a tell. Every promotion has tradeoffs.]

## My recommendation
[At level / above level / stretch. With confidence level.]
```

## The forcing functions

### 1. Cite, don't claim
Every line of the packet maps to a specific entry in the stakeholder-reflect file (or to a referenced document). If a claim has no source, **strike it.** Same discipline as `stakeholder-synthesize` — claims without evidence don't survive a calibration committee.

### 2. Calibrate solo vs. shared
"Led the migration" when 4 people led the migration is the kind of inflation that gets an experienced calibrator to dismiss the whole packet. Force the user to articulate, for each major win:
- Who else was involved
- The report's specific contribution vs. the team's
- Whether the report would have shipped this without [collaborator] (and vice versa)

This is uncomfortable. Do it anyway. A calibrated packet wins more often than an inflated one.

### 3. Surface gaps as prep targets, not omissions
If the packet is thin in `judgment` but strong in `delivery`, **say so in the calibration notes.** Don't try to manufacture judgment evidence by stretching a delivery example. The committee will see through it; you'll lose credibility on the parts that are real.

If a gap is closable in 2–4 weeks, surface it to the user as a pre-submission target: *"Two more weeks of [specific scope] would close this. Worth delaying submission?"*

### 4. Pre-empt the strongest objection
Calibration committees ask hard questions. The packet that anticipates and answers them lands better than the one that gets blindsided. Force the user to write down: *"What's the strongest argument someone could make against this promotion?"* Then address it.

Common objections:
- "Their wins are all on team work; what's the individual contribution?"
- "They've been at this level for X years — what's changed in the last 12 months?"
- "I haven't seen them at this level in [specific dimension]. Where's the evidence?"
- "Compared to other [target-level] folks across the org, where do they sit?"

### 5. Compose with `wins-curate` — but don't substitute
If the report maintains their own wins log (using `wins-log`), pull from it. But the manager's packet is *the manager's view*, not a republished version of the report's self-promotion. The two should reinforce each other, with the manager's voice and the manager's calibration.

### 6. Compose with `report-career-architect`
If a growth plan was made 12 months ago, *did the report do what was planned?* That's the strongest single argument for a promotion: the plan, the execution, the result. If the plan wasn't followed (because work shifted, life happened, etc.), name what happened and what evidence does exist.

### 7. Honest no-recommendations
Sometimes drafting the case reveals the answer is "not this cycle." Surface it cleanly to the user — *"Looking at this honestly, you're submitting a strong case for senior-staff, not staff. Is the report ready for that conversation?"*

A "no this cycle" handled well preserves trust; a "yes" submitted on a thin case and dismissed corrodes trust both ways.

## Operating principles

- **The packet is a written argument, not a celebration.** Tone: confident, calibrated, defensible. Not enthusiastic, not deferent.
- **The committee doesn't know the report; they know the artifact.** Optimize for the artifact carrying its own weight.
- **Calibration > inflation, every time.** A reputation for submitting honest cases gets future cases more credibility, including for the same report's next promo.
- **The report deserves to know.** Share the draft with them; let them push back on framing or surface evidence you missed. They'll often catch things you didn't see — they're closer to the work.
- **Underrepresented reports often get worse promo packets, not because they don't deserve them but because their managers feel less confident advocating with the same volume.** Notice this; don't under-advocate.

## Anti-patterns to flag

- **Adjective-heavy, evidence-light packets.** "Strong technical leader, exceptional communicator, key driver of strategic initiatives." Replace with what they actually did.
- **Hidden plurals.** "Led the team to ship X." Force singular when singular is honest. *"Owned the architecture, with team execution."*
- **Recency bias.** Pulling only from the last 3 months. Pull from the full review period.
- **The "promote because they'll leave otherwise" case.** Sometimes true, but if it's the *strongest* argument in the packet, they probably aren't ready.
- **Writing the packet without consulting the growth plan or the stakeholder file.** The packet ungrounded in the longitudinal record reads thin.
- **Submitting based on tenure.** "It's been long enough" is not an argument the calibration committee accepts.
- **Skipping the risks section.** "I see no risks" is a lie. Every promotion has tradeoffs (will they grow into the bigger scope, will their skills hold, will the role suit them). Naming them honestly builds credibility.

## Composition with other skills

- **`user-profile`** — if `~/voohy-work-reflections/profile.md` exists, read it before drafting. It carries the user's level, which calibrates *what bar to argue against* (a Director writing a Staff promo packet has a different framing than a manager writing a Senior packet). The user shouldn't have to re-explain.
- **`stakeholder-reflect` (managing-down)** — primary source of evidence. Read the full file before drafting.
- **`report-career-architect`** — the growth plan is the prequel to the promo case. Strong execution against a plan is the strongest single argument.
- **`wins-curate`** — if the report maintains a self wins log, cross-reference. The two views should reinforce, not duplicate.
- **`feedback-frameworks`** — when sharing the draft with the report, especially if the recommendation is "not this cycle," use COIN structure for the conversation.
- **`decision-log`** — log the decision (submit / hold / submit at lower level) and the calibration reasoning. Useful next cycle.
- **`leadership-os` (Calibrator mode)** — for managing up to your own manager and the calibration committee. The case is a written artifact; the calibrator mode is how you defend it in the room.
