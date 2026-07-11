---
name: engineering-health
description: Use when an EM wants to assess how well their engineering systems and processes are working — not team morale or people dynamics (that's team-diagnosis), but the productivity layer: are the right things being measured, where is developer experience breaking down, is onboarding a signal of deeper friction, and how to make the case for platform investment. Trigger phrases include "is my team actually productive", "I want to understand developer experience on my team", "how do I measure engineering productivity", "I need to justify platform team investment", "our onboarding is too slow".
---

# Engineering Health

`team-diagnosis` reads the people and culture layer of a team. This skill reads the **engineering systems layer** — how well the tooling, processes, and infrastructure support the people building in them. A team can score green on culture and red here, or vice versa.

Inspired by Nicole Forsgren's DORA and SPACE research.

## The core principle: constellation, not solo metrics

The most common mistake in engineering productivity measurement is reaching for whatever is easy to count — PR frequency, commits, lines of code — and treating it as a signal. These are all activity metrics, and any single metric used in isolation will mislead.

Senior engineers often have low PR output by design: they're doing architecture, unblocking others, mentoring, and reviewing. Optimizing for PR count would punish exactly the people doing the most leverage work. And when people know what's measured, they optimize for it — which is fine if you've picked the right thing, and damaging if you haven't.

Use a **constellation**: at least three different categories of signal together paint a real picture.

---

## The SPACE diagnostic

When assessing engineering productivity, get at least three of these five:

**S — Satisfaction**
Ask people directly. Are you satisfied with the tools you use? Are there processes that feel nearly impossible? Where do you feel friction? People can usually tell you immediately, and their answer often surfaces problems that dashboard data misses — particularly at system handoff points (where one tool ends and another begins and integration is manual).

**P — Performance (outcomes)**
Quality signals: build stability, deployment success rate, security outcomes, incident rate. What is the system actually producing, not just how busy it is?

**A — Activity**
Counts: PRs opened, commits, deployments. Useful in context, misleading in isolation. Look at these with the team composition in mind — a senior-heavy team will have lower raw counts than a junior-heavy one doing equivalent or more valuable work.

**C — Communication and collaboration**
How well is work coordinating across people and systems? This can be meeting load (is collaboration creating overhead?), but also API reliability (are integrations between systems working or constantly breaking?), PR review time, and whether information reaches people who need it.

**E — Efficiency and flow**
Time and handoffs: build time, time waiting for PR review, deployment pipeline duration, time to get an environment provisioned. Where are the delays? This is where slow but invisible friction lives. DORA's four metrics (deployment frequency, lead time for changes, change failure rate, time to restore) are a well-validated instance of this category specifically for the commit-to-production pipeline.

---

## Onboarding time as a leading indicator

Time to first meaningful commit from a new hire is one of the most reliable signals of how navigable the engineering system is. A long ramp isn't a people problem — it's a systems problem showing up in people.

**What good looks like:** Getting a new hire through a trivial but real PR (fix a title, add a test, update a doc) within the first one or two weeks has an outsized effect. Research at Microsoft found this kind of early PR increases measurable productivity by 30–50% across the rest of the year, because the developer has now traversed the full system end-to-end before it matters.

**The internal transfer test:** If moving to a new team within the same company takes nearly as long as starting fresh, that's a red flag. It means the tooling, documentation, and context aren't portable — and everything has to be re-learned regardless of prior familiarity. These two onboarding times should be clearly different. If they're similar, investigate why.

**What slow onboarding usually surfaces:**
- Documentation that exists but can't be found (or doesn't exist and lives in tribal knowledge)
- Dev environments that require manual, undocumented setup steps
- Access provisioning that bottlenecks on manager approval chains
- No "day one task" that forces traversal of the whole system

---

## Developer experience friction

Developer experience is the lived experience of doing the work day-to-day. Dashboards often miss it because friction lives at system boundaries — the handoff between one tool and the next that looks automated but isn't.

**How to surface it:**
Don't rely on metrics alone. Ask directly: *"What's the most annoying thing about getting work done right now?"* and *"Where do you find yourself doing repetitive manual steps that shouldn't be manual?"* Take the answers seriously. This is "honor their reality" — a developer's lived experience of the system is data, even if it doesn't appear in any dashboard.

**Common friction patterns:**
- Access approval bottlenecks (a compliance change that requires manager sign-off on every sensitive data query)
- Systems that appear integrated but require manual coordination at every handoff
- Tooling that's fast for the company's reporting but slow for the developer (appears automated, every interaction is actually manual)
- Cognitive load from context-switching due to broken systems, not choice

**Why cognitive load matters:** Friction doesn't just cost time. Repeated interruptions and broken systems consume creative capacity. Work that requires problem-solving and design suffers differently than work that requires execution — high-friction environments quietly route engineers away from the harder, more valuable work.

---

## Operational readiness testing

Knowing that a system can handle load is different from knowing that the team can operate it under load. The second question is often skipped.

**Game day simulation:** Run a synthetic peak-load event — generate realistic traffic, scale systems, and run operational protocols — but deliberately withhold the traffic and metrics dashboards from the on-call teams. The team has to respond to what they observe (alerts, logs, service behavior) without being able to watch the numbers directly.

This reveals something load tests don't: whether the team actually knows what to do when they can't see the full picture. A team that passes a load test with dashboards open may have no idea how to respond when monitoring is degraded or when they're looking at the wrong signals.

What game day simulations typically surface:
- Runbooks that exist in theory but nobody has exercised under pressure
- Operational protocols that depend on a specific tool or dashboard that isn't always available
- Gaps in alerting (things that should have fired, didn't)
- On-call load concentrated on one or two people who carry tribal knowledge nobody else has

Run this before major launches or high-traffic events, not after. The point is to find the gaps while there's time to close them.

---

## Metric instrumentation traps

Dashboards that exist don't always measure what you think they measure. Before trusting a metric, verify how it's instrumented.

**The most common trap: measuring from the wrong start point.** Response time should be measured from when the request enters the queue, not from when it enters the processing function. If you start the clock at the handler, you're measuring your code's speed — not the latency the user experienced. Queue wait time is invisible to handler-based measurement and is often where the real latency lives under load.

Ask this for each latency or throughput metric: *"Where exactly does the clock start? Does that match where the user starts waiting?"* If the answer is no, the metric is optimistic by design.

Other instrumentation questions worth checking:
- Are timeouts included in the latency distribution, or silently dropped?
- Are failed requests counted in the denominator for success rate?
- Is sampling happening before or after filtering, and what gets filtered out?

---

## Making the case for platform investment

When the diagnosis shows that engineering systems are the bottleneck, the question becomes: how do you get resources to fix it?

**Use data and story together.** Numbers alone are abstract. Stories alone get dismissed as one-off complaints. Together they land.

For data: estimate time lost at the team level. A rough spreadsheet of "about how much time does [specific friction] cost per week per person" across the team gives you a number to multiply. It doesn't have to be precise — a back-of-napkin estimate shows you've thought about it quantitatively and gives leadership something to react to.

For story: describe a day in the life. What does a developer trying to do a specific task actually go through? Where do they get stuck? What's the experience of a new hire in week two? A concrete narrative makes the number feel real.

**Acknowledge the tipping point.** One of the most effective moves when making this case is to be explicit that you're not asking to fix everything — you're asking for investment in the highest-leverage bottleneck, and when it's good enough, you'll stop asking for more. This pre-empts the "it's a bottomless problem" objection and reframes the conversation as a scoped, tractable investment.

**Frame in trade-offs, not requests.** Rather than "we need a platform team," present it as: "here's what we can deliver with and without this investment." Repurposing existing engineers toward platform work is often more credible than asking for headcount. Show what stops when you do that, and what improves.

---

## Composition with other skills

- **`team-diagnosis`** — run first for the people/culture layer; run this skill when the technical health dimension of that diagnosis needs deeper investigation
- **`metrics-design`** — if a formal engineering metric program is being set up, this skill identifies which SPACE categories to cover; metrics-design handles the measurement tree
- **`strategy-doc`** — platform investment should connect to a strategic track; use strategy-doc to anchor the case in business outcomes
- **`impact-audit`** — if the engineering health diagnosis reveals that teams are doing low-leverage work, the impact audit helps diagnose whether that's a goal alignment problem upstream

## Anti-patterns to flag

- **Measuring only activity.** PR counts, commit frequency, lines of code — these will always be tempting because they're easy to grab. Always pair with at least one satisfaction signal and one outcome signal.
- **Using the same benchmark for all roles.** Senior engineers, staff engineers, and principals will have lower raw activity counts than ICs doing feature work. Context is everything.
- **Asking for data without asking people.** The most valuable friction often lives between systems, invisible to dashboards. Ask directly.
- **Treating slow onboarding as a people problem.** If multiple consecutive new hires take a long time to ramp, the system is the variable — not the people.
- **Asking for unlimited platform investment.** Know what "good enough" looks like before you make the case, and say it out loud.
- **Confusing load testing with operational readiness.** A system that passes a load test with dashboards open may completely fail when the team has to operate it under degraded visibility. Load tests validate infrastructure; game day simulations validate the team.
- **Trusting metrics without verifying instrumentation.** A dashboard showing acceptable latency can be measuring from the wrong start point. Always ask where the clock starts and whether it matches the user's experience.
