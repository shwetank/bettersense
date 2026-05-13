---
title: File locations
description: A complete map of where bettersense reads from and writes to on your local machine.
---

## Plugin files (installed, not private)

These are the skill and agent definition files. They live wherever you installed the bundle.

**macOS / Linux / WSL:**

| Install method | Location |
|---|---|
| Marketplace / symlink (user scope) | `~/.claude/skills/` and `~/.claude/agents/` |
| Symlink (project scope) | `./.claude/skills/` and `./.claude/agents/` |
| Manual `cp` (user scope) | `~/.claude/skills/` and `~/.claude/agents/` |
| `--plugin-dir` (ephemeral) | Wherever you pointed `--plugin-dir` |

**Windows (PowerShell, native):**

| Install method | Location |
|---|---|
| Marketplace / symlink (user scope) | `$HOME\.claude\skills\` and `$HOME\.claude\agents\` |
| Symlink (project scope) | `.\.claude\skills\` and `.\.claude\agents\` |
| Manual copy (user scope) | `$HOME\.claude\skills\` and `$HOME\.claude\agents\` |

On Windows, `$HOME` resolves to `C:\Users\<YourName>`. The `.claude` directory in your home folder is where Claude Code reads installed skills, regardless of platform.

Symlink installs (macOS/Linux/WSL) point back into the repo: `~/.claude/skills/wins-log` → `/path/to/bettersense/plugin/skills/wins-log/`.

---

## Reflection data (private, gitignored)

All private data lives under `$BETTERSENSE_WORK_REFLECTIONS_HOME` (default: `~/bettersense-work-reflections/`). This directory is:

- Created by `user-profile` on first run
- Gitignored inside the directory itself (`.gitignore` written on creation)
- Never touched by `scripts/uninstall.sh`

### Full directory map

```
~/bettersense-work-reflections/
│
├── .gitignore                         # created by user-profile on first run
├── README.md                          # privacy warning, created by user-profile on first run
│
├── profile.md                         # created by user-profile
│
├── strategy/
│   ├── default.md                     # created by strategy-doc (single-product users)
│   ├── onboarding.md                  # created by strategy-doc (per-area)
│   └── <area-slug>.md                 # one per product/area
│
├── stakeholders.json                  # index of all registered stakeholders
│
├── managing-up/
│   └── trae-north.md                  # one per stakeholder
│
├── managing-across/
│   └── sahil-bhatia.md
│
├── managing-down/
│   ├── yulia-krenkova.md
│   └── <first-last>.md
│
├── teams/
│   └── platform-team.md
│
├── self/
│   └── reflections.md                 # written by self-reflect
│
├── wins.md                            # written by wins-log, read by wins-due and wins-curate
│
└── pulses/
    ├── default/
    │   ├── pulse-2026-05-05.md        # one per pulse run
    │   └── pulse-2026-05-12.md
    └── <area-slug>/
        └── pulse-YYYY-MM-DD.md
```

### File ownership by skill

| File | Created by | Read by | Updated by |
|---|---|---|---|
| `profile.md` | `user-profile` | 8+ skills | `user-profile` |
| `strategy/<area>.md` | `strategy-doc` | 5 skills | `strategy-doc` |
| `stakeholders.json` | `stakeholder-register` | `stakeholder-due`, `stakeholder-manage` | `stakeholder-register`, `stakeholder-manage` |
| `managing-*/name.md` | `stakeholder-register` | `stakeholder-reflect`, `stakeholder-synthesize`, `report-career-architect`, `report-promo-case`, `team-diagnosis` | `stakeholder-reflect`, `stakeholder-manage` |
| `self/reflections.md` | `self-reflect` | `patterns-watch`, `wins-curate` | `self-reflect` |
| `wins.md` | `wins-log` | `wins-due`, `wins-curate`, `patterns-watch` | `wins-log` |
| `pulses/<area>/pulse-YYYY-MM-DD.md` | `product-pulse` | `pulse-synthesize` | (immutable — new file per run) |

---

## What uninstall touches

`scripts/uninstall.sh` removes symlinks from `~/.claude/skills/` and `~/.claude/agents/` that point into the bettersense repo.

**It never touches:**
- `~/bettersense-work-reflections/` — your private data
- Skills or agents you installed from other sources
- Skills or agents you wrote yourself

Your reflection data persists after uninstall. Remove it manually if you want:

```bash
rm -rf ~/bettersense-work-reflections/
```

Consider archiving instead if you think you might return:

```bash
mv ~/bettersense-work-reflections/ ~/bettersense-work-reflections-archive/
```
