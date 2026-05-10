# bettersense — Claude Code plugin

Opinionated skills and agents for **AI PMs, engineering managers, TPMs, and senior ICs leading without authority**. 30 skills + 22 agents, namespaced under `bettersense:` (e.g. `/bettersense:coaching-mode`, `/bettersense:wins-log`).

→ **Full documentation, install instructions, and worked examples: [root README](../readme.md)**

## Quick install

```
/plugin marketplace add shwetank/bettersense
/plugin install bettersense@bettersense
```

Or for local development:

```bash
claude --plugin-dir /path/to/bettersense/plugin
```

## First-time setup

```
/bettersense:start
```

That's it. The `start` skill orients you, walks through profile + stakeholder setup, and routes you to your first real task.

If you prefer to run setup manually:

```
☐ /bettersense:user-profile          — who you are (anchor file, read by 8+ skills)
☐ /bettersense:strategy-doc          — what you're building (optional but recommended)
☐ /bettersense:stakeholder-register  — register your first stakeholder
```

## License

[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) — credit required, derivatives stay CC BY-SA 4.0. See [`LICENSE`](../LICENSE).
