---
title: Install
description: Three ways to install bettersense into Claude Code — marketplace, symlink, or manual copy.
---

bettersense is a Claude Code plugin. There are three install paths; pick the one that fits your setup.

## Marketplace install (recommended)

If you're running Claude Code with plugin support:

```
/plugin marketplace add shwetank/bettersense
/plugin install bettersense@bettersense
```

Verify with `/agents` — you should see 13 subagents listed. Skills are namespaced under `bettersense:` (e.g. `/bettersense:wins-log`, `/bettersense:strategy-doc`).

To update later:

```
/plugin marketplace update bettersense
```

---

## Symlink install (recommended for development)

Clone the repo and run the install script. The script creates symlinks from `~/.claude/` back into the repo — so `git pull` updates your skills automatically.

```bash
git clone https://github.com/shwetank/bettersense.git
cd bettersense

# Install at user scope (available in every project):
scripts/install.sh

# Project scope instead (just the current repo):
scripts/install.sh --scope=project
```

The script prompts before doing anything. Existing skills with the same name are skipped; pass `--force` to overwrite.

### Why symlinks?

Three benefits over plain `cp`:

1. **Updates are free.** `git pull` updates your installed skills automatically — no re-install step.
2. **You can identify bundle items at a glance.** Any symlink in `~/.claude/skills/` pointing into this repo is from bettersense:
   ```bash
   find ~/.claude/skills ~/.claude/agents -maxdepth 2 -type l -lname "*bettersense*"
   ```
3. **Clean uninstall.** `scripts/uninstall.sh` removes only symlinks into this repo. Skills you wrote yourself or installed from elsewhere are untouched.

---

## Manual copy

If you prefer vendored copies (frozen snapshot, edit independently):

```bash
cd bettersense/plugin

mkdir -p ~/.claude/skills ~/.claude/agents
cp -r skills/* ~/.claude/skills/
cp agents/*.md ~/.claude/agents/
```

Tradeoff: no automatic updates. Use `MANIFEST.md` at the repo root to track what version you have.

---

## Verify the install

Inside Claude Code, run:

```
/agents
```

You should see 13 subagents (the-spec-writer, the-translator, the-eval-designer, etc.).

Skills auto-load when your prompt matches their description. You can also trigger them explicitly:

```
/bettersense:user-profile
/bettersense:stakeholder-register
/bettersense:wins-log
/bettersense:strategy-doc
```

---

## Uninstall

```bash
scripts/uninstall.sh                  # removes symlinks from ~/.claude/
scripts/uninstall.sh --scope=project  # removes from ./.claude/ instead
scripts/uninstall.sh --dry-run        # preview what would be removed
```

Your reflection data at `~/bettersense-work-reflections/` is **never touched** by uninstall. That data is yours; remove it manually if you want.
