---
title: "Tutorial: Sanity-check an AI feature before building it"
description: Run a feature pitch through the-reducer, the-scientist, and the-eval-designer before committing any engineering resources.
---

**Time:** ~10 minutes  
**Skills used:** `the-reducer` → `the-scientist` → `the-eval-designer`  
**Who this is for:** AI PMs and PMs with AI features in their roadmap.

**You'll learn:**
- How `the-reducer` stress-tests whether AI is actually the right solution
- What `the-scientist` produces as a feasibility plan before you write a line of code
- How `the-eval-designer` designs a minimal eval harness that catches regressions

**Prerequisites:** bettersense installed.

---

## The scenario

You're a PM at a B2B SaaS company. Your support team is drowning. Average response time is 4 hours. The VP of Customer Success has asked you to "add AI" to fix it. The idea on the table: an LLM that reads support tickets and auto-drafts replies.

You have an eng sprint in three weeks and a "let's ship something" push from leadership. This tutorial shows you what to do before saying yes.

---

## Step 1: Run it through the-reducer

```
I want to build an AI feature that auto-drafts support ticket replies. The VP of CS thinks this will fix our 4-hour response time. Should we build it?
```

`the-reducer` doesn't start with how to build it. It starts with whether to build it:

> *"Before designing anything: what's causing the 4-hour response time? Is it:*
> *1. Volume — more tickets than the team can handle?*
> *2. Triage — tickets sitting in queue unrouted?*
> *3. Research time — agents know the answer but have to dig for it?*
> *4. Approval — drafts are ready but sit waiting for a sign-off?*
> *5. Coverage — thin on-call during certain hours?"*

You dig into your data. Turns out 60% of the delay is triage — tickets sit unassigned for 2+ hours because the routing rules are manual and the on-call list is stale.

> *"If triage delay is 60% of the problem, an LLM that drafts replies doesn't move the metric — it helps agents who already have a ticket. What's the routing logic? Is it a rules problem or a classification problem?"*

After exploring: the routing logic is 12 conditions in a spreadsheet that nobody maintains. A decision-tree or simple classifier would solve most of it. The LLM draft idea addresses the remaining 40%.

> *"Recommendation: fix the routing rules first. That's a week of work, not a sprint. Validate the 60% hypothesis with a two-week experiment before investing in LLM infrastructure. Come back to the draft assistant once the triage problem is solved and you can measure response quality in isolation."*

You haven't built anything yet. You've avoided six weeks of engineering on the wrong problem.

---

## Step 2: Validate the smaller scope with the-scientist

The reducer's verdict: if you do pursue the draft assistant for the remaining 40% of delay, do a feasibility pass first. You run:

```
Assuming we fix routing separately, I still want to explore the LLM draft assistant. Help me figure out if it's feasible before committing engineering time.
```

`the-scientist` designs a rapid validation plan:

> *"To validate this before building, you need to answer three questions:*
>
> *1. **Can an LLM draft a good reply at all?** Sample 30 real tickets from the last 90 days — a mix of easy (password reset, billing question) and hard (multi-step technical issue, upset customer). Draft replies with Claude Sonnet using your existing knowledge base as context. Have two agents rate each draft: would you send this as-is, with edits, or not at all?*
>
> *2. **Where does it break?** Note the failure categories. Common ones: tickets requiring account lookup, tickets needing empathy over information, multi-issue tickets where the LLM picks one thread. These define your edge cases.*
>
> *3. **What's the business case if it works?** If the 'send as-is' rate is above 40%, calculate the time saved per agent per day. If it's below 20%, the editing burden may exceed the time saved."*

> *"Timeline: one week. What you'll have: a data-backed go/no-go, a failure taxonomy you can design around, and a baseline you can measure improvement against."*

You run the experiment. The "send as-is" rate is 52% on easy tickets, 8% on hard ones. Easy tickets are 70% of volume. The case is real for a scoped version.

---

## Step 3: Design the eval harness with the-eval-designer

Now you're ready to commit. Before writing a line of production code:

```
I want to build a minimal eval system for the support draft assistant. I need to be able to catch regressions when I update the prompt or the model.
```

`the-eval-designer` produces a minimal eval spec:

> **Golden dataset:** *Start with the 30 tickets from your feasibility experiment — you already have human ratings. Expand to 60-80 once in production, sampling monthly to catch distribution shift (ticket types change seasonally, new product launches create new ticket categories).*
>
> **Metrics:**
> - *Human acceptance rate* (primary): % of drafts accepted with no or minor edits by agents
> - *Edit distance* (proxy): average character change between draft and sent reply — catches "accepted but heavily rewritten"
> - *Failure-category rate*: % of outputs flagging a known bad pattern (account-lookup required, multi-issue ticket, tone mismatch)
>
> **LLM-as-judge rubric** (for automated daily regression runs):
> - *Accuracy:* does the reply correctly address the question? (1-5)
> - *Tone:* appropriate for a support context, not robotic? (1-5)
> - *Completeness:* does it cover all issues raised in the ticket, or only one? (1-5)
> - *Hallucination check:* does it reference any product behavior not in the knowledge base context? (pass/fail)
>
> **Regression threshold:** flag for human review if human acceptance rate drops >5pp week-over-week, or if LLM-judge scores drop >0.3 points on any dimension.

> *"Ship nothing to production without a passing run on the full golden set. When you update the prompt or upgrade the model, run evals before and after. The before/after delta is your sanity check."*

---

## What you have now

Starting from a vague "add AI" request:

- A diagnosis that the real problem is routing, not drafting — saving six weeks of misallocated engineering
- A scoped, evidence-backed case for the draft assistant in the 40% of tickets where it helps
- A minimal eval harness that will catch regressions before users see them

None of this required any production code. The whole process took days, not sprints.

---

## Where to go next

- [Metrics design](/skills/ai-product-craft) — build the full metric tree for the draft assistant
- [AI product craft skills](/skills/ai-product-craft) — full reference for all seven AI PM skills and agents
- [Agents catalog](/agents/catalog) — the-reducer, the-scientist, and the-eval-designer are agents; see the catalog for the full list
