# Voohy — Claude Code plugin

Opinionated skills and agents for **AI PMs, engineering managers, and TPMs**. Once installed, all skills and agents are namespaced under `bettersense:` (e.g., `/bettersense:coaching-mode`, `/bettersense:wins-log`).

**30 skills + 13 agents** organized around five lenses:

- **AI product craft** — discovery, eval design, prompt review, safety architecture, incident response.
- **People leadership** — feedback (COIN/SOLID), 1:1s, coaching, performance management, hiring craft.
- **Longitudinal reflection** — stakeholder reflection journal, wins log / hype doc, self-reflection. Cadence-driven; accumulates into useful insight over weeks and months.
- **Program coordination** — read-the-room, influence-without-authority, multi-team program management.
- **Anchor files** — `profile.md` (who you are) and `strategy/<area>.md` (what you're building). Both are read automatically by other skills so you never re-explain context.

## Install

### As a plugin (recommended)

If installed via a marketplace:

```
/plugin install bettersense
```

For local development or if you've cloned this repo:

```bash
claude --plugin-dir /path/to/awesome-skills-ai/ai-technical-pm
```

After installation, run `/reload-plugins` (or restart Claude Code), then verify with `/agents` — you should see 13 subagents.

### As standalone (alternative)

If you'd rather drop the skills directly into `~/.claude/` without the plugin namespace prefix, see the [root README](../readme.md) for the symlink-based install via `scripts/install.sh`.

## First-time setup (5 minutes)

```
☐ Install (above)
☐ Run `/bettersense:user-profile` once → creates the "who you are" anchor file
☐ Run `/bettersense:strategy-doc` once per product/area (optional but recommended) → creates the "what you're building" anchor
☐ Run `/bettersense:stakeholder-register` to register your first stakeholder → creates the data directory at ~/bettersense-work-reflections/
☐ Wire scheduled skills (via `/schedule` if installed, or OS-level cron — see Cadence below)
```

The anchor files (`profile.md`, `strategy/<area>.md`) are the most important setup step. Eight other skills read them to tailor outputs to you — without them, the skills work but produce more generic results.

## Cadence (the scheduled skills)

Several skills are designed to fire on a schedule. **Important: `/schedule` is not a built-in Claude Code feature** — it's a separate skill commonly installed from Anthropic's official marketplace. Two paths:

**If you have `/schedule` installed:**

```
/schedule "Every Friday at 4pm, run /bettersense:wins-due and post the list"
/schedule "Every Monday at 9am, run /bettersense:stakeholder-due and post the list"
/schedule "Every Sunday at 6pm, run /bettersense:patterns-watch"
/schedule "Every Monday at 8am, run /bettersense:product-pulse for the default area"
/schedule "On the first Monday of every month at 10am, run /bettersense:self-reflect"
```

**If `/schedule` is unknown** (you'll see "Unknown slash command"), use OS-level scheduling instead — cron on macOS/Linux, Task Scheduler on Windows. Example cron entries:

```bash
# Friday 4pm — wins nudge
0 16 * * 5 cd ~/git/awesome-skills-ai && claude --plugin-dir ./ai-technical-pm -p "/bettersense:wins-due" >> ~/bettersense-work-reflections/scheduled-output.log 2>&1

# Monday 9am — stakeholder due-list
0 9 * * 1 cd ~/git/awesome-skills-ai && claude --plugin-dir ./ai-technical-pm -p "/bettersense:stakeholder-due" >> ~/bettersense-work-reflections/scheduled-output.log 2>&1
```

Verify your Claude Code supports headless invocation (`claude -p "<prompt>"`) before relying on this — run `claude --help` if unsure.

Output of scheduled runs lands inside Claude Code (or in the log file you redirect to) — not on your phone. Pair each schedule with a recurring calendar event titled *"Open Claude Code → review [skill]"* so you actually see it. Honest constraint: cadence reliability scales with how often you open Claude Code.

See the [root README](../readme.md) section *5. OS-level scheduling fallback* for more cron / launchd / Task Scheduler patterns.

## What each skill does

For a one-line description of every skill and agent in this bundle, see [`MANIFEST.md`](../MANIFEST.md) at the repo root.

For deeper rationale, worked examples, three real-life scenarios, and the design philosophy, see the [root README](../readme.md). It covers:

- The full skills + agents tables with descriptions
- Worked examples per lens (stakeholder reflection, wins log, EM bundle, TPM set, anchor pattern)
- "What these skills add over plain Claude" with three real scenarios
- "Where these skills don't help" — honest counterpoints
- Setup section with privacy posture, cadence story, scheduling cheat sheet, maintenance

## Where the data lives

This plugin creates a private folder at `~/bettersense-work-reflections/` (configurable via `$BETTERSENSE_WORK_REFLECTIONS_HOME`) for stakeholder reflections, wins log, self-reflection, pulse reports, and the anchor files. The folder is gitignored on first run and lives only on your local machine.

**Uninstalling the plugin does not delete this folder.** It's your data; remove it manually if you want.

## Updates

If installed via marketplace: `/plugin update bettersense`.

If installed via `--plugin-dir` pointing at your git clone: `git pull` in this repo, then `/reload-plugins` (or restart Claude Code). For non-trivial changes, restart the session — the routing layer may carry stale state otherwise. See the root README's *Updating skills after changes* section for the full picture.

## Honest tradeoffs

- **Won't replace mobile-app reflection tools for daily use.** Claude Code is desktop/CLI/IDE; the cadence story works as well as your habit of opening Claude Code. The plugin wins on *depth* (citation discipline, structured forcing functions) and loses on *frequency* compared to a phone-first journaling app.
- **Quality of reflection synthesis depends on quality of input.** One-line entries → shallow synthesis. The skills push back on vague inputs but can't manufacture insight from nothing.
- **Opinionation is real.** `performance-management` won't let you describe a Stage 3 problem in Stage 1 language. `coaching-mode` won't let you prescribe in the first 5 turns. `hiring-craft` won't let you run a debrief without silent votes first. If the forcing functions feel pushy, the operating-principles section in each skill is the easy place to soften.
- **Cross-skill composition is informational, not executional.** When `coaching-mode` says *"composes with `feedback-frameworks`"*, that's a signpost, not an auto-load. Inside one skill's session, Claude knows the other skill exists and approximates its structure but doesn't load the full skill body. **For the full discipline of the second skill, invoke it explicitly in a new turn** (e.g., `/bettersense:feedback-frameworks` after the coaching session ends). What you get inside the original skill is a reasonable shorthand; what you get from explicit invocation is the full treatment.
- **`/schedule` is not a built-in Claude Code feature.** It's a separate skill commonly installed from Anthropic's marketplace. If unavailable, use OS-level scheduling (cron / launchd / Task Scheduler) — see the Cadence section above.

## Troubleshooting

- **`/bettersense:` prefix doesn't tab-complete:** the plugin may still be loaded; tab-completion is unreliable in some environments. Try invoking a skill explicitly (`/bettersense:wins-log`) to confirm.
- **`/plugin info bettersense` shows nothing:** plugins loaded via `--plugin-dir` aren't surfaced in the persistent plugin manager — that's expected, not a bug. Verify by invoking a skill instead.
- **"Unknown slash command: bettersense:..."** — the plugin isn't loaded. Restart Claude Code with `--plugin-dir` pointing at this directory.
- **Manifest schema validation fails silently** — Claude Code v2.0.30 and earlier may reject `author.email`, `license`, or other fields not in the docs' minimal example. Keep `plugin.json` to the minimum (`name`, `description`, `version`, `author.name`).
- **A skill auto-routes to a different skill than expected:** the skill descriptions are designed to disambiguate, but with 30 skills there can be edge cases. Invoke the specific skill with `/bettersense:<skill-name>` to override routing.
- **Composition handoffs (skill A suggests skill B) feel partial:** that's the soft-handoff behavior described in *Honest tradeoffs* above. Explicitly invoke skill B in a new turn for the full treatment.

## License

[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) — use and adapt freely, credit required, derivatives must stay CC BY-SA 4.0. See the [`LICENSE`](../LICENSE) file at the repo root for full terms.
