# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

`bettersense` is a Claude Code plugin with skills and agents for AI PMs, engineering managers, TPMs, and senior ICs. Users install it from the marketplace (`shwetank/bettersense`) or by running `scripts/install.sh`. The repo also contains an Astro/Starlight documentation site at `site/` that deploys to bettersense.ai.

## Repo structure

```
plugin/           — the installable plugin (source of truth for all skills and agents)
  skills/         — one directory per skill; each contains at minimum a SKILL.md
  agents/         — one .md file per agent
site/             — Astro + Starlight docs site (astro.config.mjs configures sidebar/nav)
scripts/          — install.sh / uninstall.sh (bash) + install.ps1 / uninstall.ps1 (Windows)
.claude-plugin/
  marketplace.json — plugin metadata for the Claude marketplace
MANIFEST.md       — authoritative list of every skill and agent in the bundle
```

## Plugin file formats

**Skills** (`plugin/skills/<name>/SKILL.md`) — YAML frontmatter with `name` and `description`, followed by the skill's instruction body in Markdown.

**Agents** (`plugin/agents/<name>.md`) — YAML frontmatter with `name`, `description`, and `tools`, followed by the agent system prompt.

The `description` field in both formats is the trigger condition Claude uses for auto-routing. Keep it precise and action-oriented.

After editing a skill, start a new Claude Code session to pick up changes. Edits to `description` (which controls routing) may not take effect mid-session; edits to `name` always require a new session.

## Installation mechanics

`scripts/install.sh` creates **symlinks** (not copies) from `~/.claude/skills/<name>` and `~/.claude/agents/<name>.md` into this repo. This means pulling updates auto-updates installed skills. Use `--scope=project` to install into a project's `.claude/` instead of `~/.claude/`.

To verify installed bundle items:
```bash
find ~/.claude/skills ~/.claude/agents -maxdepth 2 -type l -lname "*bettersense*"
```

## Documentation site

The site lives in `site/` and uses [Astro](https://astro.build) with the [Starlight](https://starlight.astro.build) theme.

```bash
# from the site/ directory
npm install
npm run dev      # local dev server
npm run build    # production build → site/dist/
npm run preview  # preview the production build locally
```

Deploy is via `scripts/deploy-site.sh` (rsync to VPS). It only deploys if `site/` changed in the last commit; use `-f` to force.

The sidebar navigation is declared in `site/astro.config.mjs`. Adding a new docs page requires both a `.md`/`.mdx` file under `site/src/content/docs/` **and** a sidebar entry in `astro.config.mjs`.

## User data written outside the repo

Skills that capture reflections write to `~/bettersense-work-reflections/` (overrideable via `$BETTERSENSE_WORK_REFLECTIONS_HOME`). This folder is user data — never touch it from code in this repo. Key paths:

- `profile.md` — created by `user-profile`
- `strategy/<area-slug>.md` — created by `strategy-doc`
- `stakeholders.json` — index of all registered stakeholders
- `managing-up/<slug>.md`, `managing-across/<slug>.md`, `managing-down/<slug>.md`, `teams/<slug>.md` — one file per stakeholder, in the appropriate subdirectory
- `archive/<category>/<slug>.md` — archived stakeholders (moved here by `stakeholder-manage`, never deleted)
- `wins.md` — created by `wins-log`
- `pulses/<area-slug>/pulse-YYYY-MM-DD.md` — created by `product-pulse`
- `self/reflections.md` — created by `self-reflect`
- `self/retros/retro-YYYY-MM-DD.md` — created by `career-retro`
- `commitments.md` — created by `commitments`

Skill/agent counts on the docs site are generated at build time by `site/scripts/gen-counts.mjs` (wired into the `predev`/`prebuild` npm hooks → `site/src/data/counts.json`). Never hard-code a count in site content; consume `counts.json` instead.

## Adding a new skill

1. Create `plugin/skills/<name>/SKILL.md` with `name` and `description` frontmatter.
2. Add a row to the skills table in `MANIFEST.md` (and update the count in the heading + intro line).
3. Add a row to the skills table in `readme.md`.
4. Add a directory entry in the tree diagram in `readme.md`.
5. Add the skill to the relevant category table in `site/src/content/docs/skills/overview.md` (and a category page if applicable).
6. Add at least one routing case to `evals/routing/cases.jsonl` — one positive case (`expect`) and an appearance in a neighbour's `must_not_fire` — then run `node evals/routing/run-routing.mjs --dry-run` to confirm the labels resolve.
7. If the skill has supporting data files (e.g., `questions.json`), put them in the same directory.

## Adding a new agent

1. Create `plugin/agents/<name>.md` with `name`, `description`, and `tools` frontmatter.
2. Add a row to the agents table in `MANIFEST.md` (and update the count in the heading + intro line).
3. Add a row to the agents table in `readme.md`.
4. Add the filename to the tree diagram in `readme.md`.
5. Add an entry to `site/src/content/docs/agents/catalog.md` and the relevant cluster page.
6. Add at least one routing case to `evals/routing/cases.jsonl` and run the `--dry-run` validation.

## Marketplace listing

`.claude-plugin/marketplace.json` controls how the plugin appears in the Claude marketplace. The `source` field points to `./plugin`. Changes here affect the public listing.
