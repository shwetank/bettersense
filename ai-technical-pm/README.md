# Voohy — Claude Code plugin

Opinionated skills and agents for **AI PMs, engineering managers, and TPMs**. Once installed, all skills and agents are namespaced under `voohy:` (e.g., `/voohy:coaching-mode`, `/voohy:wins-log`).

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
/plugin install voohy
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
☐ Run `/voohy:user-profile` once → creates the "who you are" anchor file
☐ Run `/voohy:strategy-doc` once per product/area (optional but recommended) → creates the "what you're building" anchor
☐ Run `/voohy:stakeholder-register` to register your first stakeholder → creates the data directory at ~/voohy-work-reflections/
☐ Wire scheduled skills via /schedule (see Cadence below)
```

The anchor files (`profile.md`, `strategy/<area>.md`) are the most important setup step. Eight other skills read them to tailor outputs to you — without them, the skills work but produce more generic results.

## Cadence (the scheduled skills)

Several skills are designed to fire on a schedule via Claude Code's `/schedule`. Wire them once and pair each with a calendar reminder:

```
/schedule "Every Friday at 4pm, run /voohy:wins-due and post the list"
/schedule "Every Monday at 9am, run /voohy:stakeholder-due and post the list"
/schedule "Every Sunday at 6pm, run /voohy:patterns-watch"
/schedule "Every Monday at 8am, run /voohy:product-pulse for the default area"
/schedule "On the first Monday of every month at 10am, run /voohy:self-reflect"
```

Output of scheduled runs lands inside Claude Code — not on your phone. Pair each `/schedule` with a recurring calendar event titled *"Open Claude Code → review [skill]"* so you actually see it. Honest constraint: cadence reliability scales with how often you open Claude Code.

## What each skill does

For a one-line description of every skill and agent in this bundle, see [`MANIFEST.md`](../MANIFEST.md) at the repo root.

For deeper rationale, worked examples, three real-life scenarios, and the design philosophy, see the [root README](../readme.md). It covers:

- The full skills + agents tables with descriptions
- Worked examples per lens (stakeholder reflection, wins log, EM bundle, TPM set, anchor pattern)
- "What these skills add over plain Claude" with three real scenarios
- "Where these skills don't help" — honest counterpoints
- Setup section with privacy posture, cadence story, scheduling cheat sheet, maintenance

## Where the data lives

This plugin creates a private folder at `~/voohy-work-reflections/` (configurable via `$VOOHY_WORK_REFLECTIONS_HOME`) for stakeholder reflections, wins log, self-reflection, pulse reports, and the anchor files. The folder is gitignored on first run and lives only on your local machine.

**Uninstalling the plugin does not delete this folder.** It's your data; remove it manually if you want.

## Updates

If installed via marketplace: `/plugin update voohy`.

If installed via `--plugin-dir` pointing at your git clone: `git pull` in this repo, then `/reload-plugins` (or restart Claude Code). For non-trivial changes, restart the session — the routing layer may carry stale state otherwise. See the root README's *Updating skills after changes* section for the full picture.

## Honest tradeoffs

- **Won't replace mobile-app reflection tools for daily use.** Claude Code is desktop/CLI/IDE; the cadence story works as well as your habit of opening Claude Code. The plugin wins on *depth* (composition across skills, citation discipline) and loses on *frequency* compared to a phone-first journaling app.
- **Quality of reflection synthesis depends on quality of input.** One-line entries → shallow synthesis. The skills push back on vague inputs but can't manufacture insight from nothing.
- **Opinionation is real.** `performance-management` won't let you describe a Stage 3 problem in Stage 1 language. `coaching-mode` won't let you prescribe in the first 5 turns. `hiring-craft` won't let you run a debrief without silent votes first. If the forcing functions feel pushy, the operating-principles section in each skill is the easy place to soften.

## Troubleshooting

- **`/voohy:` prefix doesn't tab-complete:** the plugin isn't loaded. Verify with `/plugin info voohy` or restart Claude Code with `--plugin-dir` pointing at this directory.
- **A skill auto-routes to a different skill than expected:** the skill descriptions are designed to disambiguate, but with 30 skills there can be edge cases. Invoke the specific skill with `/voohy:<skill-name>` to override routing.
- **Composition handoffs (skill A suggests skill B) don't trigger:** explicitly invoke skill B by name. If this happens consistently, [open an issue](../../../../issues) — the cross-references in skill bodies may need namespace prefixing.

## License

MIT. See the root repo for the full license file.
