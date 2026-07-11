# Evals

bettersense preaches *evals before vibes* — so it ships with its own. This directory holds the golden-scenario suite that checks the two things that make the plugin worth more than plain Claude: that the right skill **routes** on a realistic prompt, and that a skill's **output** embodies its opinion once it fires.

This is dogfooding, and it doubles as CI for contributions: a new or edited skill that breaks routing (by colliding with a neighbour's trigger space) fails the suite.

## What's here

```
evals/
├── routing/
│   ├── cases.jsonl        golden set: realistic prompt → expected skill + neighbours that must stay quiet
│   └── run-routing.mjs    reads plugin/ descriptions at runtime, scores routing via `claude -p`
└── rubrics.md             output-quality checklists for the 10 most load-bearing skills (for an LLM judge)
```

## Routing eval

The candidate list is read from `plugin/skills/` and `plugin/agents/` **at runtime**, so the eval can never drift from what actually ships. Each golden case asserts the skill that should win *and* the near-neighbours that must not — that's what catches the description overlaps that quietly degrade auto-routing.

```bash
# Validate the dataset against the live plugin — no API calls, CI-safe, fast.
# Fails if any case references a skill/agent that doesn't exist, catching
# renames and deletions immediately.
node evals/routing/run-routing.mjs --dry-run

# Run the full routing eval (requires an authenticated `claude` CLI).
node evals/routing/run-routing.mjs

# Options
node evals/routing/run-routing.mjs --limit 10   # first 10 cases
node evals/routing/run-routing.mjs --verbose     # per-case result
```

The runner exits non-zero on any routing failure (or malformed dataset), so it drops straight into CI. `--dry-run` is the cheap gate to run on every PR; the full run (which calls the model) is the periodic or pre-release gate.

**Note:** the full run shells out to `claude -p`. Run it from a normal authenticated terminal — a sandboxed sub-invocation can't reuse the session's credentials and will report a clean 401.

## Output-quality rubrics

`rubrics.md` holds behavioral checklists for the ten skills whose forcing-function value is the reason to install bettersense. Each has **automatic-fail** items encoding the skill's non-negotiable opinion (e.g. `the-reducer` must not endorse building the AI feature in its first response). Apply them with an LLM-as-judge over a real transcript, or as a human review checklist. They score *behavior*, not prose.

## Adding cases

- **Routing:** add a line to `cases.jsonl` — `{"id", "prompt", "expect", "must_not_fire": [...], "note"}`. Write the prompt the way a user actually types, not as keyword bait. Every new skill should land at least one positive case and appear in a neighbour's `must_not_fire`. Run `--dry-run` to confirm the labels resolve.
- **Rubrics:** add a section to `rubrics.md` when a skill's opinion is strong enough that a plausible-looking output could still betray it.
