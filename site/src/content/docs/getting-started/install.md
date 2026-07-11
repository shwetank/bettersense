---
title: Install
description: Three ways to install bettersense into Claude Code — marketplace, symlink, or manual copy. Covers macOS, Linux, and Windows.
---

bettersense is a Claude Code plugin. There are three install paths; pick the one that fits your setup.

:::tip[Platform quick reference]
- **macOS / Linux / WSL:** all three install paths work
- **Windows (native PowerShell):** marketplace install works; symlink install requires [extra steps](#symlink-install-windows)
- **Not sure?** The marketplace install works everywhere and is the easiest starting point
:::

:::note[Best experience: Claude Code Desktop app]
The cadence-driven skills (`stakeholder-due`, `wins-due`, `self-reflect`, `patterns-watch`, `product-pulse`) give the most value when they run on a schedule. The **Claude Code Desktop app** makes this the easiest — Routines run locally, have full access to your reflection files, and persist indefinitely. Cloud routines (created via the `schedule` skill in the CLI) cannot access local files and won't work with bettersense. See the [Scheduling guide](/guides/scheduling) for the full comparison.
:::

---

## Marketplace install (recommended)

**Claude Desktop app:**

1. Click **Customize** in the left sidebar
2. Click **+** next to "Personal plugins" → choose **Add marketplace**
3. Enter `shwetank/bettersense` and click **Sync**
4. Go to **Plugins → Code** tab, find Bettersense, and click **+** to install it

**Claude Code CLI (terminal):**

```
/plugin marketplace add shwetank/bettersense
/plugin install bettersense@bettersense
```

To update later: `/plugin marketplace update bettersense`

:::note
The `/plugin` commands only work in the terminal CLI. Pasting them into the Desktop app chat does nothing — use the GUI path above instead.
:::

To verify, run `/bettersense:start` in a new chat — it should greet you and walk through first-time setup.

---

## Symlink install (recommended for development)

Clone the repo and run the install script. Symlinks mean `git pull` updates your skills automatically.

### macOS / Linux / WSL

```bash
git clone https://github.com/shwetank/bettersense.git
cd bettersense

# Install at user scope (available in every project):
scripts/install.sh

# Project scope instead (just the current repo):
scripts/install.sh --scope=project
```

The script prompts before doing anything. Existing skills with the same name are skipped; pass `--force` to overwrite.

**Why symlinks?** Three benefits over plain `cp`:

1. **Updates are free.** `git pull` updates your installed skills automatically.
2. **You can identify bundle items at a glance:**
   ```bash
   find ~/.claude/skills ~/.claude/agents -maxdepth 2 -type l -lname "*bettersense*"
   ```
3. **Clean uninstall.** `scripts/uninstall.sh` removes only bettersense symlinks. Skills from other sources are untouched.

### Symlink install — Windows (native PowerShell) {#symlink-install-windows}

Windows supports symlinks but requires either **Developer Mode** (Settings → System → Developer Mode) or **admin elevation**. Without one of these, the install script will fail silently when creating symlinks.

**Recommended:** enable Developer Mode, then run the PowerShell install script:

```powershell
git clone https://github.com/shwetank/bettersense.git
cd bettersense

# Install at user scope:
.\scripts\install.ps1

# Project scope:
.\scripts\install.ps1 -Scope project

# Overwrite existing:
.\scripts\install.ps1 -Force
```

If you see an execution policy error:
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

**Claude Code config directory on Windows:**
The install script targets `~\.claude\skills\` and `~\.claude\agents\`, which resolves to `C:\Users\<YourName>\.claude\` in PowerShell. This is where Claude Code reads installed skills on Windows.

**Verify (PowerShell):**
```powershell
Get-ChildItem "$HOME\.claude\skills", "$HOME\.claude\agents" -Recurse |
  Where-Object { $_.LinkType -eq 'SymbolicLink' -and $_.Target -like '*bettersense*' }
```

---

## Manual copy

Works on all platforms. No symlinks, no admin needed — just copies the files.

**macOS / Linux / WSL:**
```bash
cd bettersense/plugin

mkdir -p ~/.claude/skills ~/.claude/agents
cp -r skills/* ~/.claude/skills/
cp agents/*.md ~/.claude/agents/
```

**Windows (PowerShell):**
```powershell
cd bettersense\plugin

New-Item -ItemType Directory -Force "$HOME\.claude\skills", "$HOME\.claude\agents"
Copy-Item -Recurse skills\* "$HOME\.claude\skills\"
Copy-Item agents\*.md "$HOME\.claude\agents\"
```

Tradeoff: no automatic updates. Use `MANIFEST.md` at the repo root to track what version you have.

---

## Verify the install

Inside Claude Code, run:

```
/agents
```

You should see the bettersense agents listed (the-spec-writer, the-translator, the-eval-designer, the-discovery-facilitator, the-postmortem-facilitator, the-slo-designer, etc.).

Skills auto-load when your prompt matches their description. You can also trigger them explicitly:

```
/bettersense:user-profile
/bettersense:stakeholder-register
/bettersense:wins-log
/bettersense:strategy-doc
```

---

## Uninstall

**macOS / Linux / WSL:**
```bash
scripts/uninstall.sh                  # removes symlinks from ~/.claude/
scripts/uninstall.sh --scope=project  # removes from ./.claude/ instead
scripts/uninstall.sh --dry-run        # preview what would be removed
```

**Windows (PowerShell):**
```powershell
.\scripts\uninstall.ps1
.\scripts\uninstall.ps1 -Scope project
.\scripts\uninstall.ps1 -WhatIf       # preview without removing
```

Your reflection data at `~/bettersense-work-reflections/` (or `$HOME\bettersense-work-reflections\` on Windows) is **never touched** by uninstall. That data is yours; remove it manually if you want.
