---
name: demo-prep
description: Use when the user is preparing for a demo — exec review, customer pitch, board update, investor meeting, sales call, or all-hands. Trigger phrases include "I'm demoing X tomorrow", "help me prep for the review", "what could go wrong in this demo?". Especially valuable for AI-feature demos, where probabilistic systems can fail in ways scripted demos can't predict.
---

# Demo Prep

A demo is a *performance of confidence*, not a feature walkthrough. The goal of prep is to know what you'll do when the magic doesn't happen, and to land the message regardless of what the software does in the next ten minutes.

## When to apply

Trigger this skill on:
- Exec, board, or investor demos
- Sales demos with high-value prospects
- Customer pilot kickoffs
- Internal cross-functional reviews where stakeholders will form opinions
- Any AI-feature demo (extra critical — see below)

Skip for: routine team standups, casual show-and-tells, anything where the audience is already sold.

## The five-pass demo prep

Walk through these in order. Each pass takes 5–15 minutes; the whole thing is 30–60 minutes well spent.

### Pass 1: The headline

What is the **one sentence** the audience should walk away saying to a colleague?

If the user can't answer this in one sentence, the demo isn't ready. Headlines are *outcomes*, not features:
- Bad: "We shipped the new summarization feature."
- Good: "We can now process contracts the legal team currently spends 4 hours per deal on, in 90 seconds with citations they can verify."

The rest of the demo serves the headline. Anything that doesn't reinforce it is a candidate to cut.

### Pass 2: The audience

For each stakeholder in the room, write one line:
- What do they care about most?
- What's the question they're most likely to ask?
- What would make them block / champion / stay neutral?

Then revisit the headline: does it land for the *most senior skeptic* in the room? If not, sharpen.

### Pass 3: The pre-mortem

Ask: *"Imagine the demo failed. Why?"* Force at least five answers. Common categories:

- **Technical:** Internet drops, model is slow, eval fails on a specific input, screen-share glitch, login expires mid-demo.
- **AI-specific:** Hallucination on a live input, refusal/over-refusal, wrong format output, retrieval returns nothing, output exposes data the user wasn't expecting.
- **Narrative:** Audience asks the question you don't have an answer to. Audience misinterprets a metric. Stakeholder hijacks the meeting.
- **Logistical:** Wrong projector, demo account locked, dependency down, time runs out before the punchline.

For each, decide: prevent, mitigate, or accept-and-have-a-line-ready. Write the lines.

### Pass 4: The script

A demo script is not a slide deck. It's:

- **The opening** (45 seconds): land the headline before any feature.
- **The core flow** (3–5 minutes): one path through the product, no detours. Pick inputs you've tested. Multiple times.
- **The receipts** (1–2 minutes): the hard data — eval scores, customer outcomes, before/after metrics. This is what makes the demo memorable to skeptics.
- **The ask** (30 seconds): explicit. Approval to roll out? Budget? A pilot customer? Don't end with "any questions" — end with a specific next step.

For AI demos, *script the inputs.* Use inputs you've run through the system 20 times, not inputs the audience just suggested. If you must take a live input, have a prepared response for "the model gave a worse answer than usual" — usually some version of "this is exactly the kind of edge case our eval set catches; let me show you."

### Pass 5: The Q&A

List the top 10 questions you might get. For each:
- One-sentence answer
- The data or example you'd reach for
- The follow-up you'd redirect to if it's a rabbit hole

Special case for AI features — pre-load answers for these, because they *will* come up:

- "How often is it wrong?" → eval score, with confidence
- "What happens when it's wrong?" → fallback path, named
- "How do you prevent [hallucination / injection / data leak]?" → guardrail architecture, briefly
- "How much does it cost per request?" → know the number cold
- "Why this model and not [competitor]?" → trade-off you actually evaluated, not marketing
- "Who reviewed this for safety?" → real names, real process

If any of these don't have crisp answers, the demo isn't ready. Go fix that *before* the demo, not in the room.

## AI demo special hazards

- **Don't demo with cold-cache, fresh-context calls.** Warm the system. Hit the same prompts a few times if there's caching.
- **Have a backup recording.** Pre-record a clean version of the demo flow. If live fails, switch to the recording without skipping a beat. Better to show a recording with confidence than fight a flaky live system.
- **Pre-stage the inputs.** Inputs visible to the audience should be ones you've validated.
- **Show the boring path too.** Demos that show only the magic case feel like a setup. Show one realistic-but-imperfect case and how the system handles it — it builds more trust than five wow moments.
- **Never let the audience drive the keyboard during a high-stakes demo.** Take the suggestion, do it yourself, narrate.

## Output

When invoked, produce:
- The one-sentence headline (or push back if the user's version is fuzzy)
- An audience map (one line per stakeholder)
- A pre-mortem list with mitigation/response for each
- A scripted demo flow with timings
- The top-10 Q&A prep, with crisp answers for any AI-specific ones

If the demo is in less than 24 hours, also produce a **dry-run checklist** the user can run through 30 minutes before going live: backup recording playable, inputs pre-loaded, dependencies up, test account working, time-zoned correctly.

## Anti-patterns to flag

- **Slides as a crutch.** If the demo can be replaced by slides, you're not demoing — you're presenting. Decide which one this is.
- **No ask.** Demos without an explicit next step waste the audience's attention. Always end with one.
- **Live live live.** Showing "this is happening live!" is impressive when it works and a disaster when it doesn't. Match the risk to the audience.
- **Demoing the team's pride, not the audience's interest.** The cool internal architecture isn't the headline. The user outcome is.
