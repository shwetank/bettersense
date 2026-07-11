---
title: We eval our own skills
description: bettersense preaches "evals before vibes" — so the plugin ships with a golden-scenario suite that tests routing accuracy and output quality, and runs as CI.
---

One of bettersense's core opinions is **evals before vibes**: no AI feature should ship on demo-day feel. It would be hard to take that seriously if the plugin itself shipped 50+ skills on vibes. So it doesn't — the repo carries its own golden-scenario suite under [`evals/`](https://github.com/shwetank/bettersense/tree/main/evals).

## What gets tested

**Routing accuracy.** The plugin's headline feature is auto-routing — you describe your situation, the right skill fires without you naming it. The suite holds a golden set of realistic prompts, each asserting the skill that should win *and* the near-neighbours that must stay quiet (e.g. a "brief the CEO on the regression" prompt must route to `the-translator`, not `the-status-crafter` or `the-data-storyteller`). The candidate list is read from the plugin at runtime, so the eval can never drift from what ships. This is what catches the description overlaps that quietly degrade routing — the exact failure mode a growing skill catalog is prone to.

**Output quality.** Routing is only half of it. `evals/rubrics.md` holds behavioral checklists for the ten most load-bearing skills, with *automatic-fail* items encoding each skill's non-negotiable opinion — `the-reducer` fails if it endorses building the AI feature in its first response; `feedback-frameworks` fails if it lets a character label ("dismissive") through instead of an observable behavior; `career-retro` fails if it reports a snapshot instead of cited deltas. Applied by an LLM-as-judge over a real transcript, they score *behavior*, not prose.

## It's also CI

The routing runner exits non-zero on any failure, so a contributed skill that collides with a neighbour's trigger space fails the suite before it merges. A fast `--dry-run` mode validates the whole dataset against the live plugin without any API calls — catching renames and deletions instantly — and is the cheap gate for every change.

If you're evaluating bettersense for your team, this is the part worth poking at: the tool that tells you to build evals brought its own.
