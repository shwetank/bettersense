---
name: doctor
description: Use to health-check the user's bettersense memory directory — validate the file layout, catch problems before they cost data, and set up backups. Trigger phrases include "run bettersense doctor", "check my reflection files", "is my bettersense data okay", "something seems off with my stakeholder files", "back up my reflections", "I'm moving to a new machine". Validates ~/bettersense-work-reflections/ (or $BETTERSENSE_WORK_REFLECTIONS_HOME): stakeholders.json integrity, orphaned or unregistered stakeholder files, layout drift, and backup status. Read-only by default — proposes fixes and applies them only with explicit approval per fix.
---

# Doctor

Years of reflections, wins, and decision context live in one plaintext directory. This skill is the trust layer: it verifies that directory is healthy, catches corruption or drift early, and makes sure the user has a backup before they need one.

**Read-only by default.** Run every check without modifying anything, present findings, then offer fixes one at a time. Never bulk-fix without approval. Never delete user content — quarantine (rename with a `.orphaned` suffix or move to an `_attic/` subfolder) is the strongest action available, and only with approval.

## Locate the data

Root is `$BETTERSENSE_WORK_REFLECTIONS_HOME` if set, else `~/bettersense-work-reflections/`. If the directory doesn't exist at all, this isn't an error — the user just hasn't set up yet. Say so and point to `start`. Don't create anything.

## The checks

Run all of them; report as a single table (✅ / ⚠️ / ❌ per check).

### 1. Registry integrity

- `stakeholders.json` parses as JSON, has `version` and a `stakeholders` array.
- Every entry has `name`, `category`, and a slug; `category` is one of `managing-up`, `managing-across`, `managing-down`, `teams`.
- No duplicate slugs.

If the JSON is corrupt: report the parse error and offer to rebuild the registry by scanning the category directories (each stakeholder file's frontmatter has the authoritative name/category). Show the rebuilt version for approval before writing; save the corrupt original as `stakeholders.json.bak` first.

### 2. Registry ↔ files consistency

- **Missing files:** registry entries whose `<category>/<slug>.md` doesn't exist. Offer to create a stub or remove the entry.
- **Orphaned files:** `.md` files in category directories with no registry entry (common after hand-editing or a partial `stakeholder-manage` operation). Offer to re-register (preserves all reflection history) or quarantine.
- **Category mismatches:** file's frontmatter `category:` disagrees with the directory it sits in. The directory a reflect/due scan uses is the one that matters — offer to reconcile.

### 3. Layout drift

- Expected structure present where content implies it: `profile.md`, `self/`, `wins.md`, `strategy/`, `pulses/<area>/`, `team-charters/` — absence is fine (feature not used yet), but *misplacement* is flagged (e.g., a `pulse-2026-*.md` at the root, a stakeholder file outside any category dir).
- Pulse files match the `pulse-YYYY-MM-DD.md` naming that `pulse-synthesize` depends on; misnamed pulses are invisible to synthesis.
- Dated entries inside reflection files use real dates (a `## 2026-13-40` heading breaks due-ness math).

### 4. Privacy posture

- `.gitignore` exists in the root (created by `user-profile`; protects against the directory being swept into a repo). If missing, offer to write it (`*` + `!.gitignore`).
- Warn — don't block — if the directory is inside a cloud-synced folder (Dropbox/iCloud/OneDrive paths): syncing is a legitimate backup choice, but the user should be making it knowingly for career-sensitive plaintext.
- Confirm the root `README.md` privacy note exists; offer to write it if missing.

### 5. Backup status

The check most likely to matter someday:

- Is the directory a git repo with a remote? When did it last commit?
- If not: report the total size and age of the data ("214 entries across 9 files since 2026-01"), and offer one of:
  - **Snapshot:** `tar -czf ~/bettersense-backup-YYYY-MM-DD.tar.gz -C ~ bettersense-work-reflections` — one command, done.
  - **Versioned:** `git init` inside the directory + first commit, with a note that any remote must be **private** and that pushing sends the data to that host — the user's call, stated plainly.
- If a backup exists but is older than ~30 days of new entries, flag it.

## Output format

```
# bettersense doctor — YYYY-MM-DD

| Check | Status | Detail |
|---|---|---|
| Registry integrity      | ✅ | 7 stakeholders, valid JSON |
| Registry ↔ files        | ⚠️ | 1 orphaned file: managing-down/alex-kim.md |
| Layout                  | ✅ | |
| Privacy posture         | ✅ | .gitignore present; local-only path |
| Backup                  | ❌ | No backup found; 214 entries at risk |

## Proposed fixes (each needs your OK)
1. Re-register alex-kim.md into stakeholders.json (keeps all 12 entries)
2. Create tonight's snapshot: tar -czf ~/bettersense-backup-2026-07-11.tar.gz ...
```

Then walk fixes one at a time. End by suggesting a cadence: *"Run me again whenever something feels off, after hand-editing files, or before a machine migration."*

## Anti-patterns

- **Fixing silently.** Every write is announced first, even trivial ones. The user's trust in this directory is the product.
- **Alarmism.** An empty directory, an unused feature, or a missing optional file is not a warning. Only flag what would actually lose data or break a skill.
- **Backup nagging beyond once.** State the risk once per run, plainly, and respect the answer.

## Composition

- `start` / `user-profile` — where to send a user with no data directory yet
- `stakeholder-manage` — for intentional lifecycle changes doctor shouldn't guess at (archiving someone who left, renames)
- `weekly` — a healthy directory is what makes the weekly ritual's scans trustworthy
