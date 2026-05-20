---
title: Wins system
description: Three skills for capturing your impact as it happens and turning it into promo packets, interview stories, and perf-review self-evals when you need them.
---

The three `wins-*` skills cover the "hype doc" / "brag document" pattern: capture wins as they happen — honestly, with evidence and calibrated credit — so you can remix them into an artifact when the moment comes. The artifact is only as good as what's in the log.

## How it works

```
log (in-week) → nudge (Friday) → curate (promo cycle / interview / perf review)
```

All wins live in a single chronological file at `~/bettersense-work-reflections/wins.md`, newest entry first.

---

## Skills

### `wins-log`

**Triggers:** "log a win", "I just shipped [X]", "capture this as a win", "I want to log something"

Structured capture for a win:

```
Type:         delivery | judgment | leadership | mentorship | recovery | craft | learning | range | culture
Scope:        sprint | quarter | multi-quarter | ongoing
Collaborators: [named, with roles]
Credit:       [honest solo-vs-shared framing]

What happened: [situation — what was at stake, what was hard]
What I did:   [your specific contribution]
Impact:       [quantified results, audience]
Evidence:     [where someone could verify]
```

**The skill pushes back on:**
- Vague impact ("improved the dashboard" → for whom, by how much, by when?)
- Inflated solo credit on team work
- Skipping evidence ("even a Slack thread in #design week of April 15 counts")
- "I can't quantify it" — usually untrue with one more pass

**The `Type` field is load-bearing.** Different audience artifacts need different type mixes. A promo panel cares about `delivery` + `judgment` + `leadership`; interviews want `recovery` + `judgment` + `range`.

---

### `wins-due`

**Triggers:** "wins nudge", "what wins did I have this week?", "anything to log?"

Or via schedule:

```
/schedule "Every Friday at 4pm, run /bettersense:wins-due and post the list"
```

:::tip[Background monitor included]
bettersense ships a built-in background monitor (`check-wins-cadence`) that nudges you automatically — no scheduling setup required. At the start of each Claude Code session it checks whether you've logged a win in the last 14 days (configurable via `WINS_NUDGE_THRESHOLD_DAYS`). If overdue and the cooldown window has passed, Claude gets one notification pointing you to `/wins-log`. Use `wins-due` when you want the full category-probe experience; the monitor is for ambient, passive reminders. See [Scheduling routines](/guides/scheduling#built-in-wins-cadence-monitor) for details.
:::

Weekly cadence check:
- Computes days since last entry
- If ≥ 7 days, nudges with category-specific probes (not generic "anything notable?")
- Probe examples: "Any judgment calls this week — a useful no, a scope cut, a pushback?", "Any mentorship — a code review, a career conversation, onboarding?"
- Accepts "honestly, nothing notable this week" without manufacturing a fake win

**Why category probes?** Memory is selective. "Anything notable?" gets blank stares. "Did you say a useful no?" gets memory hits.

---

### `wins-curate`

**Triggers:** "I have a promo cycle coming", "help me prep for interviews", "perf review self-eval", "salary negotiation", "year-in-review"

Reads the wins log and produces an audience-specific artifact. Five modes:

| Mode | What it produces | Favored types |
|---|---|---|
| `promo-packet` | Strengths × scope × impact, cited wins per dimension | delivery, judgment, leadership |
| `interview-stories` | 4-6 STAR-shaped answers with anticipated follow-ups | recovery, judgment, range |
| `perf-review` | Balanced self-eval across all type dimensions | breadth across types |
| `salary-case` | Business value framing: revenue, retention, cost saved, risk reduced | delivery, impact-quantified |
| `year-in-review` | Personal retrospective, trajectory and type-balance read | all types |

**Operating principles:**
- **Never invents wins.** Curates from the log only. Names gaps ("judgment is thin — strongest available is X, but a panel may want more") so you know what to build before submission.
- **Calibration is non-negotiable.** An overclaimed promo packet hurts more than a thinner-but-honest one. Shared-credit wins are labeled as such.
- **Resists marketing-speak.** Outputs your voice, not "spearheaded transformative initiatives."

---

## Worked example

See [Wins curation: a worked example](/guides/worked-example-wins) for a full lifecycle walkthrough from first log entry through a promo-packet curate.

---

## Things to know

**The "log it later" decay is real.** Friday nudges help but won't fully prevent it. Wins captured weeks after the fact are thinner than wins captured in-week.

**Artifact quality is bounded by log quality.** Six sparse entries produce a sparse promo packet. Twelve rich entries — situation, specific action, quantified impact, real evidence — produce a compelling one.

**Composes with perf-review prep.** `wins-curate (perf-review)` reads `wins.md` *plus* `self-reflect`'s growth language *plus* `stakeholder-synthesize`'s relationship signals — the three together produce a self-eval with both delivery breadth and relational depth.
