---
title: Environment variables
description: All environment variables used by bettersense skills.
---

## `BETTERSENSE_WORK_REFLECTIONS_HOME`

**Default:** `~/bettersense-work-reflections`

Controls where all bettersense reflection data lives. The default puts it in your home directory. Override if you want data on an encrypted volume, a different disk, or a non-standard location.

```bash
# Set for the current session:
export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-work-reflections"

# Persist for all future shells (zsh):
echo 'export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-work-reflections"' >> ~/.zshrc

# Persist for all future shells (bash):
echo 'export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-work-reflections"' >> ~/.bashrc
```

You don't need to create the directory yourself — `stakeholder-register` creates it on first run, with a `.gitignore` and privacy README inside.

### When to override

- **Encrypted volume.** If you're keeping candid notes about real colleagues, an encrypted volume is a reasonable precaution.
- **External drive.** If your home directory is synced to iCloud, Dropbox, or another cloud service, and you don't want reflection data going there.
- **Custom organization.** Some users prefer `~/.local/share/bettersense/` or similar XDG-compliant paths.

### Impact on skills

All skills that read or write to the reflection directory respect this variable. Changing it mid-session after data already exists: the skills will look in the new location and won't find your existing files. Move the directory manually before changing the variable:

```bash
mv ~/bettersense-work-reflections ~/Encrypted/bettersense-work-reflections
export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-work-reflections"
```

---

## No other environment variables

bettersense doesn't require any API keys, tokens, or other configuration. All operation is through Claude Code's skill and agent system. MCP integrations (PostHog, Datadog, Stripe, etc.) for `product-pulse` are configured through Claude Code's MCP settings, not through bettersense-specific environment variables.
