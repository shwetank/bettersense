---
title: Your data
description: What bettersense stores, where it lives, who can read it, and how to back it up or delete it. The short version — plaintext, local, yours.
---

bettersense's memory holds career-sensitive material: candid reflections on named colleagues, performance concerns, promotion drafts, your own self-assessments. You should know exactly where that lives and what touches it. This page is the complete answer.

## What is stored, and where

Everything private lives in **one directory**: `~/bettersense-work-reflections/` (or wherever `$BETTERSENSE_WORK_REFLECTIONS_HOME` points). Profile, strategy docs, stakeholder reflections, self-reflections, wins, pulses, team charters — all of it. See [File locations](/reference/file-locations) for the full map.

- **Plaintext markdown and JSON.** No proprietary format, no database. You can read every file in any editor, grep it, or take it with you. If you stop using bettersense tomorrow, you lose nothing.
- **Local only.** The plugin never transmits, syncs, or phones home. There is no bettersense server, no account, no telemetry.
- **Not touched by uninstall.** Removing the plugin removes skills, never your data.

## When data leaves your machine

Two cases, both under your control:

1. **Your own Claude usage.** When a skill reads a reflection file to prepare your 1:1, that content enters your Claude conversation and is processed by Anthropic per your own Claude Code account settings — the same as any file you'd ask Claude to read. bettersense adds no path beyond the Claude usage you already have. Skills that handle sensitive aggregates (like `product-pulse`) default to redacted/aggregated data.
2. **Backups you choose.** If you put the directory in Dropbox, or push it to a git remote, that host has your data. bettersense never does this for you; `doctor` will warn you if it notices the directory is in a cloud-synced path, so the choice is deliberate.

## Protections in place

- A `.gitignore` is written into the directory on first run, so it can't be swept accidentally into a repository you're committing.
- A `README.md` privacy warning sits at the directory root for anyone (including future you) who stumbles on it.
- Skills follow a write-once/append-only discipline — reflections and pulses are dated entries, so nothing silently rewrites your history.

## Back it up

This directory becomes more valuable every month you use it — which means losing it gets worse every month too. Run:

```
/bettersense:doctor
```

It checks the directory's health (registry integrity, orphaned files, layout drift) and offers two backup paths: a one-command dated snapshot (`tar`), or `git init` with a **private** remote for versioned history. It will also tell you when your last backup is stale.

For encryption at rest, rely on full-disk encryption (FileVault on macOS, LUKS on Linux, BitLocker on Windows) — it covers this directory like everything else you care about.

## Delete it

It's one directory. `rm -rf ~/bettersense-work-reflections` and it is gone — bettersense keeps no other copy anywhere. (Take a snapshot first; `doctor` makes that one command.)
