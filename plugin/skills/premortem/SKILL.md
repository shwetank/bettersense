---
name: premortem
description: Use for pre-mortem analysis of decisions, projects, or initiatives — solo and lightweight, or facilitated with a team before a launch or strategic commitment. Trigger when the user says "what could go wrong", "risk assessment", "pre-mortem this", "let's run a pre-mortem", or when evaluating risks for a plan. Applies a three-category framework (Critical, Perceived, Undiscussed risks) and, for team sessions, a facilitation flow that ends in an action plan with owners — not a brainstorm that ends in anxiety.
---

# Premortem

A pre-mortem is prospective hindsight: imagine your project or decision has failed, then work backward to identify why. This technique, developed by Gary Klein and popularized by Shreyas Doshi, helps teams and individuals surface risks that optimism bias keeps hidden.

## When to apply this

Trigger this skill for:
- Major product launches or feature releases
- Strategic initiatives with significant investment
- AI feature deployments (high uncertainty)
- Team reorganizations or process changes
- Any decision worth documenting in a decision log

Skip for: trivially reversible choices, daily execution decisions, routine maintenance.

Before starting, read whatever already exists — project brief, PRD, strategy doc, launch plan. Don't make the user re-explain what's documented.

## The framework

### Step 1: The prompt

Ask yourself: **"If this initiative failed, what would have caused it?"**

Don't just think about it — write down at least 5 reasons.

### Step 2: Categorize the risks

Organize your concerns into three buckets:

| Category | What it means | How to use it |
|----------|---------------|---------------|
| **🎯 Critical Risks** | Clear, concrete threats that will cause real damage if not addressed | These require action items |
| **🔍 Perceived Risks** | Potential threats others might worry about, but you're confident won't materialize | Document to reassure stakeholders |
| **🔇 Undiscussed Risks** | Important concerns the team isn't openly addressing | Must be surfaced in team contexts |

### Step 3: Assess likelihood and impact

Rate each Critical and Undiscussed risk on two dimensions:

- **Impact**: 1 (minor) to 5 (catastrophic)
- **Likelihood**: 10% to 90% (avoid 0% or 100% certainty)

Calculate priority score: Impact × Likelihood

### Step 4: Brainstorm mitigations

For top 3-5 risks, ask:
- **Prevent**: What would stop this from happening?
- **Detect**: How would we know early if it's starting?
- **Recover**: If it happens, how do we limit damage?

### Step 5: Decide what to accept

Not everything needs mitigation. Explicitly list what you're accepting, with rationale: "We're accepting X because Y, and will monitor Z indicator."

## Facilitating a team pre-mortem

When the user is running this with a group (not just thinking alone), add the facilitation layer:

1. **Set the frame out loud first.** Pre-mortems work because they flip the psychology: instead of avoiding problems to be supportive, the group actively seeks problems to be helpful. State the operating principle: *we're imagining failure to prevent it, not to criticize* — everyone gets credit for identifying real risks.
2. **Pose the prompt vividly:** "Imagine this project has failed spectacularly six months from now. The team is debriefing: what went wrong?" Give a beat to absorb it.
3. **Quiet brainstorm before discussion.** 5–10 minutes of silent writing, then go around the room. This stops the loudest voice from anchoring the risk list.
4. **Use the Undiscussed category deliberately.** It creates permission: participants can flag what the team is too polite to raise without owning it as an accusation.
5. **End in an action plan, not a mood.** Every top risk gets a specific mitigation with a **single owner** (not "the team"), a **deadline**, and **success criteria**. A pre-mortem that ends with a brainstorm and no owners isn't a pre-mortem — it's anxiety.

Facilitation red flags to name in the room: too few Critical risks (safety problem or overconfidence), all Perceived and no Critical (avoiding real concerns under the guise of positivity), zero Undiscussed risks (the team isn't comfortable yet), everything rated maximum impact (force-rank).

## Pre-mortem for AI features

AI systems have unique failure modes. Add these categories:

- **Hallucination risk**: Model produces confident-looking but wrong output
- **Refusal/over-refusal**: System rejects valid inputs or is too conservative
- **Prompt injection**: Malicious inputs overriding system behavior
- **Data leakage**: Sensitive information exposed in responses
- **Cost explosion**: Usage spikes beyond budget

## Pre-mortem checklist

- [ ] At least 5 failure modes identified
- [ ] Critical Risks have proposed mitigations
- [ ] Top risks have owners/timelines
- [ ] Accepted risks are intentional, not accidental
- [ ] Early warning indicators defined

## Output

When invoked, produce a concise risk register:

```markdown
# Pre-mortem: [Initiative Name]

## Critical Risks
| Risk | Impact | Likelihood | Mitigation | Owner |
|------|--------|------------|------------|-------|
| [risk] | [1-5] | [%] | [action] | [name] |

## Undiscussed Risks to Surface
- [concern the team may not be addressing]

## Early Warning Indicators
- [metric or signal to watch]

## Accepted Risks
- [what we're not mitigating and why]
```

## Integration points

- **`demo-prep`**: Feed pre-mortem risks into Pass 3
- **`decision-log`**: Capture pre-mortem insights for AI decisions tied to model versions
- **`prioritization-frameworks`**: Use likelihood scores in WSJF or Cost of Delay calculations

## Anti-patterns to avoid

- **False precision**: Don't rate likelihood as 73% when you mean "likely"
- **Everything is critical**: If all risks are 5-impact, force-rank them
- **No Undiscussed Risks in team settings**: A team comfortable with pre-mortems will surface unspoken concerns
- **Analysis paralysis**: More than 7 Critical Risks means either over-analysis or poor scoping