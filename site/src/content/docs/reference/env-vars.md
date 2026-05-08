---
title: Environment variables
description: All environment variables used by bettersense skills, with platform-specific setup for macOS, Linux, and Windows.
---

## `BETTERSENSE_WORK_REFLECTIONS_HOME`

**Default:** your home directory + `/bettersense-work-reflections`

| Platform | Default path |
|---|---|
| macOS / Linux | `~/bettersense-work-reflections` |
| Windows (PowerShell) | `$HOME\bettersense-work-reflections` |
| Windows (WSL) | `~/bettersense-work-reflections` (same as Linux) |

Controls where all bettersense reflection data lives. Override if you want data on an encrypted volume, a different disk, or a non-standard location.

You don't need to create the directory yourself — `user-profile` creates it on first run, with a `.gitignore` and privacy README inside.

---

### macOS / Linux

```bash
# Set for the current session only:
export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-work-reflections"

# Persist across sessions — zsh (macOS default since Catalina):
echo 'export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-work-reflections"' >> ~/.zshrc

# Persist across sessions — bash (Linux default, older macOS):
echo 'export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-work-reflections"' >> ~/.bashrc
```

---

### Windows (PowerShell — native)

```powershell
# Set for the current PowerShell session only:
$env:BETTERSENSE_WORK_REFLECTIONS_HOME = "$HOME\Encrypted\bettersense-work-reflections"

# Persist across sessions (user scope, no admin required):
[System.Environment]::SetEnvironmentVariable(
    'BETTERSENSE_WORK_REFLECTIONS_HOME',
    "$HOME\Encrypted\bettersense-work-reflections",
    'User'
)

# Or using setx (cmd.exe / PowerShell):
setx BETTERSENSE_WORK_REFLECTIONS_HOME "%USERPROFILE%\Encrypted\bettersense-work-reflections"
```

:::note[Windows path separators]
Windows paths use `\` but forward slashes (`/`) also work in PowerShell. Claude Code reads the variable and handles the path accordingly. If a skill seems to ignore the variable, check that the path doesn't contain spaces (or wrap it in quotes).
:::

---

### Windows (WSL)

If you're running Claude Code inside WSL, follow the Linux instructions above. The WSL home directory (`~/`) is separate from your Windows home directory (`%USERPROFILE%`). If you want the data accessible from both environments, point to a path inside `/mnt/c/Users/<name>/`:

```bash
export BETTERSENSE_WORK_REFLECTIONS_HOME="/mnt/c/Users/YOUR_USERNAME/bettersense-work-reflections"
```

---

### When to override

- **Encrypted volume.** If you're keeping candid notes about real colleagues, an encrypted volume is a reasonable precaution.
- **Cloud sync exclusion.** If your home directory syncs to iCloud, OneDrive, or Dropbox and you don't want reflection data going there.
- **Custom organization.** Some users prefer `~/.local/share/bettersense/` (Linux XDG) or a dedicated notes directory.

---

### Moving existing data after changing the path

Move the directory first, then set the variable. If you set the variable first, the skills look in the new location and won't find your existing files.

**macOS / Linux:**
```bash
mv ~/bettersense-work-reflections ~/Encrypted/bettersense-work-reflections
export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-work-reflections"
```

**Windows (PowerShell):**
```powershell
Move-Item -Path "$HOME\bettersense-work-reflections" -Destination "$HOME\Encrypted\bettersense-work-reflections"
$env:BETTERSENSE_WORK_REFLECTIONS_HOME = "$HOME\Encrypted\bettersense-work-reflections"
```

---

## No other environment variables

bettersense doesn't require API keys, tokens, or other configuration beyond the optional path override. MCP integrations (PostHog, Datadog, Stripe, etc.) for `product-pulse` are configured through Claude Code's MCP settings, not through bettersense-specific environment variables.
