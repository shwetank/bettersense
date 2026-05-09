---
name: manage-glue-workers
description: Use when managing engineers who naturally gravitate toward glue work (onboarding, documentation, unblocking, process improvement) and need protection from burnout, visibility for their impact, and career development that doesn't force them off the IC track. Trigger phrases include "my report does too much glue", "how do I protect my glue person", "glue worker promotion", "coaching someone who's always helping others", "my engineer is drowning in non-promotable work". Provides manager-specific guidance on credit amplification, workload rebalancing, promotion advocacy, and skill development that preserves technical growth.
---

# Managing Glue Workers

Coaching, protecting, and developing engineers who consistently take on or are assigned glue work — the essential coordination, documentation, unblocking, and process improvement tasks that keep teams running but are often invisible and non-promotable in traditional engineering ladders.

This skill is for managers of glue-heavy ICs who need to:
- Prevent burnout from endless support requests
- Ensure glue work counts toward promotion
- Balance team workload without dropping critical glue functions
- Develop the engineer's core technical skills alongside their multiplier skills
- Advocate effectively in promotion cycles against "not technical enough" bias

**Key premise (from Tanya Reilly):** Glue work is technical leadership. The problem isn't the work; it's that many organizations don't recognize it as such. This skill helps managers fix that mismatch — either by making the glue visible and promotable, or by strategically reducing it so the engineer can build different skills.

## When to apply

Trigger this skill when:
- A report is doing 30%+ glue work and their promotion is stalled.
- A report complains they're "just the helper" and never get to work on their own projects.
- Noticing a pattern: one person always mentors new hires, always updates the roadmap, always coordinates cross-team work.
- A glue-heavy engineer is showing burnout signs (exhaustion, cynicism, reduced coding time).
- Preparing for a promotion packet for a glue-heavy report and needing to frame their impact correctly.
- The user says: *"Everyone says my report is great, but they didn't promote — said not technical enough."*

Skip when:
- The engineer wants to transition to management/TPM (that's a role-change conversation; use `report-career-architect` for growth planning).
- The glue work is genuinely non-essential (busywork) — first run `glue-audit` to validate it's load-bearing.
- The team is failing deliveries and needs everyone on core work temporarily (but re-evaluate later).

## Prerequisites

**First, run `glue-audit` on the report's workload** (the skill can do this for a single person). You need an itemized list of glue tasks with time estimates before you can manage it.

## The diagnostic questions

The skill interviews the manager on:

### 1. The report's work profile
- "What does [name] typically do in a week? Rough time breakdown: coding, meetings, glue tasks, other?"
- "What are their 2–3 biggest accomplishments this quarter?"
- "Which of those were glue-mediated vs solo?"
- "What would break first if they went on vacation for two weeks?"

### 2. Career goals & ladder
- "What level are they targeting? What does our ladder say at that level about leadership/impact?"
- "Do they want to stay IC, or are they considering management/TPM?"
- "What's the gap between what they're doing and what the ladder values?"

### 3. Credit & visibility
- "Who knows the glue work they do? (You? Their peers? Their manager's manager?)"
- "How do they talk about their impact in self-reviews? Do they frame it as 'helping' or 'leading'?"
- "When you advocate for them in calibration, how do you describe their contribution?"

### 4. Team dependency & burnout signals
- "Have they mentioned feeling overwhelmed, or that they can't focus on coding?"
- "Are they the go-to person for everything? Do people interrupt them constantly?"
- "What happens when they say no? Do others pick up the task, or does it drop?"

### 5. Skill development desires
- "What skills do they want to grow? (Systems design? Project management? People leadership?)"
- "Does their current glue work develop those skills, or crowd them out?"

## Manager actions: before promotion season

### 1. Credit amplification
- **Public attribution:** In team meetings, retell glue wins as technical leadership: *"Alice's design review caught a critical API inconsistency — that saved us from a rework that would have taken 2 weeks."*
- **Document the artifacts:** Ensure the report saves evidence (meeting notes, design comments, Slack threads) in a shared folder or their wins log.
- **Coach their narrative:** Work with the report to rewrite "I helped onboard Bob" → "I designed and executed an onboarding flow that reduced Bob's time to first PR from 14 days to 6."

### 2. Workload rebalancing
- **Rotate glue explicitly.** Don't let glue default to the same person. Create a shared ownership model with rotations.
- **Protected time.** Block "core work" hours on the report's calendar; auto-defer non-urgent requests.
- **Delegate the glue.** Have the report train others on their glue tasks; gradually transfer ownership.
- **Say no for them.** When a non-essential glue request comes in, the manager intercepts: *"That's not on [name]'s priority list this quarter — can [other person] take it?"*

**Caution:** Don't remove all glue. Some engineers enjoy it and need it for satisfaction. The goal is *balanced* glue, not elimination.

### 3. Before the promotion packet
- **Run `promo-case-glue` together.** Review the draft, pressure-test each framing.
- **Fill the ladder gaps.** If the ladder says "writes production code" and the report hasn't, plan a small visible core project that can be completed pre-promotion (with glue temporarily reduced).
- **Get senior advocate.** Ensure the report's director+ understands their impact; provide a pre-brief with talking points.

### 4. If the promotion fails
- **Ask for specifics:** "What concrete evidence would have convinced you?"
- **Re-run the equity audit:** Was there bias in the committee's interpretation?
- **Consider the cynical solution (Tanya Reilly):** If the org truly won't promote glue-heavy ICs, the engineer may need to temporarily reduce glue and do a clearly technical project — even if it's not the best use of their skills — to "check the box."
- **Exit consideration:** If the org won't budge and the engineer's skills are glue-oriented, a TPM or EM role (internal or external) may be a better fit.

## Coaching the glue-heavy engineer

### 1. Help them see glue as leadership, not service
Reframe their self-description from *"I help people"* to *"I enable team velocity through coordination and system improvement."*

### 2. Artifact habit
Teach them to save evidence automatically:
- Copy insightful design-review comments to a `design-reviews/` folder
- Archive onboarding docs with timestamps
- Screenshot Slack threads where they unblocked someone (with permission)

### 3. Strategic volunteering
Coach: *"Volunteer for glue that's high-visibility and aligned with your growth goals. Say no to glue that's invisible and doesn't develop you."*

### 4. Negotiation language for incoming requests
Practice: *"I can't take that on this sprint — my priority is [core project]. Can [name] handle it?"* or *"I can mentor, but only for 1 hour/week; here's the onboarding doc for self-service."*

### 5. Calendar as shield
Block out "focus time" and "project work" as recurring events. Treat them as unbreakable meetings.

### 6. Skill expansion plan
Ensure they're doing *some* core technical work regularly — even if small — to maintain and demonstrate technical fluency:
- Pair on a tricky bug once a week
- Own a small service or script
- Lead a design for a narrow scoped feature

## If the team needs the glue but the org doesn't value it

**The system problem:** The team would collapse without this person's glue, but promotion criteria ignore glue. Manager options:

1. **Ladder advocacy:** Propose ladder language change: *"Senior ICs demonstrate impact through code AND by multiplying team effectiveness through mentorship, design review, and process improvement."*
2. **Title change:** Could the person become Tech Lead or Principal IC with explicit glue mandate? A title gives license to do glue without penalty.
3. **Create a hybrid IC-TPM role:** If the person loves coordination, formalize it with a title that recognizes that work.
4. **Protect and pay anyway:** If the person is happy and the team needs them, keep them in the role and adjust comp appropriately, even if formal promotion stalls (temporary measure only — they'll eventually leave if stuck).

## Operating principles

- **Believe the report.** If they say the work isn't counted, assume it's true until proven otherwise.
- **Make glue work visible.** That's 80% of the solution — if the committee can't see it, they won't value it.
- **Balance team needs with report's career.** The team's glue dependency is a red flag; distribute it, don't just celebrate it.
- **Don't confuse "good at glue" with "should be manager."** Many glue-workers prefer IC track; don't push them to EM just because they're good at coordination.
- **Protect learning time.** Ensure they have space to deepen technical skills if they want to grow as an IC.
- **Bias interrupt.** If you catch yourself asking a woman/junior person to take notes or organize the offsite, pause and ask someone else.

## Composition with other skills

- **`glue-audit`** — run first to establish baseline
- **`promo-case-glue`** — run with the report to co-create their narrative
- **`workload-equity`** — if multiple reports do glue, run team-level audit
- **`report-career-architect`** — if the report wants to stay IC but grow, this skill designs the growth plan
- **`coaching-mode`** — helps the manager ask, not tell, when coaching the report through their choices

## Anti-patterns to flag

- **Manager taking credit.** "My team's glue success is because I hired well." No, the report did the day-to-day glue; name them.
- **Overloading the glue person.** "Let's just have Alice do it, she's good at that." This is exploitation, not development.
- **Pigeonholing.** "You're the documentation person now." That's a career dead-end unless it's formally recognized.
- **Ignoring burnout signals.** Glue work is endless; without boundaries it consumes all time.
- **"We'll recognize it next cycle."** Promises without evidence. The current cycle's work must count.
- **Confusing glue with low-value work.** Good glue is high-impact system work; don't throw the baby out with the bathwater.
