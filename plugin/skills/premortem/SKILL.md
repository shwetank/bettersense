---
name: premortem
description: Use for individual or lightweight pre-mortem analysis of decisions, projects, or initiatives. Trigger when the user says "what could go wrong", "risk assessment", "pre-mortem this", or when evaluating risks for a plan. Applies a three-category framework for systematic risk identification.
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