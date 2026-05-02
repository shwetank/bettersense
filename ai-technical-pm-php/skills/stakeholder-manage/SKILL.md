---
name: stakeholder-manage
description: Use when the user wants to *change* something about an already-registered stakeholder — list them, edit role/background, re-categorize after a reorg, rename, archive (because they left), or delete. Trigger phrases include "list my stakeholders", "show all my reports", "Jill is my manager now", "move Jill to managing-up", "Draymond left the company", "archive [name]", "Jill changed her name to [...]", "update [name]'s role", "delete [name] — registered by mistake". Mirrors stakeholder data lifecycle without touching the reflection content. Composes with `stakeholder-register` (which handles add).
---

# Stakeholder Manage

Lifecycle operations for the stakeholder bundle. The `stakeholder-register` skill handles initial *add*; this skill handles everything after — listing, editing, moving, renaming, archiving, deleting.

The data layout lives at `~/voohy-work-reflections/` (configurable via `$VOOHY_WORK_REFLECTIONS_HOME`):

```
~/voohy-work-reflections/
├── stakeholders.json                # registry: active + archived
├── managing-up/<slug>.md
├── managing-across/<slug>.md
├── managing-down/<slug>.md
├── teams/<slug>.md
└── archive/                         # created on first archive
    ├── managing-up/<slug>.md
    ├── managing-across/<slug>.md
    ├── managing-down/<slug>.md
    └── teams/<slug>.md
```

## Sub-modes (route by intent)

The skill detects intent from the user's phrasing. The six modes:

| Trigger phrasing | Mode |
|---|---|
| *"list my stakeholders"*, *"show all my reports"*, *"who's in managing-across"* | **list** |
| *"update X's role to Y"*, *"add background notes for X"*, *"change X's cadence"* | **edit** |
| *"X is my manager now"*, *"move X to managing-up"*, *"X became a peer"* | **re-categorize** |
| *"X changed her name to Y"*, *"X goes by Y now"* | **rename** |
| *"X left the company"*, *"archive X"*, *"X moved to a different org"* | **archive** |
| *"delete X — registered by mistake"*, *"remove X permanently"* | **delete** |

If the user's phrasing is ambiguous (e.g. *"remove Jill"* — archive or delete?), **ask**. Default toward archive — it's reversible; delete isn't.

## Mode: list

Read `stakeholders.json` and present a clean view. Default: active stakeholders only, grouped by category, with last-reflection date pulled from each file.

```
Active stakeholders (8)

Managing up (1):
  • John Adams — VP Product, my skip-level    last reflected: 2026-04-22 (10 days ago)

Managing across (2):
  • Jill Smith — iOS team lead                 last reflected: 2026-04-15 (17 days ago)
  • Trae Green — Design lead                   last reflected: 2026-04-29 (3 days ago)

Managing down (3):
  • Draymond Young — Sr Eng                    last reflected: 2026-04-30 (2 days ago)
  • Michelle Chang — Eng II                    last reflected: 2026-04-12 (20 days ago) ⚠
  • Priya Shah — Sr Eng II                     last reflected: 2026-04-26 (6 days ago)

Teams (2):
  • Client Delivery ABC                        last reflected: 2026-04-10 (22 days ago) ⚠
  • Client Delivery XYZ                        last reflected: 2026-04-25 (7 days ago)

Archived (3 — say "show archived" to list)
```

Flag stakeholders with no reflection in 14+ days using ⚠ — neglect signal. Don't moralize, just surface.

If the user asks "show archived", produce the archive list with `archived` date and reason.

## Mode: edit

In-place changes to a stakeholder's frontmatter or background. No file move.

Editable fields:
- `role` (frontmatter)
- `cadence_overrides` (frontmatter)
- the `## Background` section content
- *(name and category live in their own modes — rename and re-categorize)*

Flow:
1. Confirm which stakeholder (if ambiguous from phrasing).
2. Show the current value of the field being changed.
3. Show the proposed new value.
4. Wait for confirmation before writing.

Update the file. Append a one-line note to the audit log section (see *Audit log* below). Update the registry if the field is mirrored there (currently `role`).

## Mode: re-categorize

The most consequential operation. Triggered by reorgs, role changes, or relationship shifts.

Flow:
1. Confirm which stakeholder + new category.
2. **Tell the user what will happen:**
   > *"Moving John Adams from `managing-across` to `managing-up`. The file moves to `~/voohy-work-reflections/managing-up/john-adams.md`. All reflection history is preserved. The question pool will shift to managing-up questions on the next reflection. I'll add an audit note explaining the move — what's the context?"*
3. Capture a one-sentence reason from the user (e.g., "reorg, John became my skip-level").
4. Move the file across category folders.
5. Update frontmatter `category`.
6. Update `stakeholders.json`.
7. Append audit log entry.

**Critical:** preserve all reflection history intact. Do not start over. The accumulated entries are *more* useful in the new relationship, not less.

The `## Audit log` section gets a line:
```markdown
## Audit log
- 2026-05-02 — Re-categorized from managing-across to managing-up. Reason: reorg, John became my skip-level.
```

Slug stays the same (the file is still about the same person; the filename doesn't need to change).

## Mode: rename

Triggered when the person's name changes (marriage, common-name update, formal name correction).

Flow:
1. Confirm new name.
2. Decide on new slug. Default: re-slugify from the new name. Ask the user if they prefer to keep the old slug for stability (e.g. cross-references in their own notes).
3. Show what will change: filename, frontmatter `name`, frontmatter `slug`, registry entry.
4. Wait for confirmation.
5. Rename file, update frontmatter, update registry.
6. Append audit log entry: *"2026-05-02 — Renamed from Jill Smith to Jill Brown. Reason: marriage."*

If the user explicitly *doesn't* want to rename the slug (to keep filename stable), allow that — the slug becomes a cosmetic divergence from the name, which is fine.

## Mode: archive

Triggered when the person leaves the company, moves to a different org outside the user's orbit, or otherwise stops being an active stakeholder.

Flow:
1. Confirm the user wants to archive (not delete). Surface the difference:
   > *"Archive preserves the file and all reflection history; the active reflection skills won't surface them anymore, but you can synthesize over the archive folder when retrospecting (e.g., 'what did I learn from working with Draymond?'). Delete removes the file and history permanently. Which do you want?"*
2. If archive: capture a one-sentence reason ("Left for [new company]", "Moved to the platform org", "Project ended").
3. Move the file from `<category>/<slug>.md` → `archive/<original-category>/<slug>.md`. Create the `archive/` directory tree if needed.
4. Update `stakeholders.json`: remove from `stakeholders[]`, add to `archived[]` array with original metadata + `archived` date + `reason`.
5. Append audit log entry to the file: *"2026-05-02 — Archived. Reason: left for Stripe."*

If the user later asks to *unarchive* (rare), reverse the operation: move the file back, restore in registry. Add an audit log line.

## Mode: delete

Friction-y by design. Most "delete" requests should actually be archive.

Flow:
1. Strongly recommend archive first. Surface what will be lost:
   > *"Deleting Sam will permanently remove the file `managing-down/sam-jones.md` and all 12 reflection entries spanning 8 months. This can't be undone. Are you sure you don't want to archive instead? (Archive keeps the history for retrospection.)"*
2. If user explicitly confirms delete: ask for the reason (audit/sanity check) — registered by mistake / privacy reasons / etc.
3. **Two-step confirmation.** Type the stakeholder's name to confirm.
4. Remove file. Remove registry entry (don't move to archived — full removal).

There's no audit trail post-delete; the data is gone. Note in the *registry's top-level audit field*: `last_delete: {date, slug, reason}` — minimal trace for the user's own future-you.

## The audit log section

Each stakeholder file carries a `## Audit log` section between `## Background` and `# Reflections`. Created on the first audit event (re-categorize, rename, archive, etc.). Edits in place don't always create a log line — only changes that affect *the relationship* or *the file's identity*.

```markdown
---
name: John Adams
slug: john-adams
category: managing-up
role: VP Product, my skip-level
since: 2024-09-01
---

## Background
[user's prose]

## Audit log
- 2026-05-02 — Re-categorized from managing-across to managing-up. Reason: reorg, John became my skip-level.
- 2025-11-14 — Role updated from "Sr Director, Product" to "VP Product, my skip-level". Reason: promo.

---

# Reflections
[per-question entries — untouched by management operations]
```

Audit log entries are *append-only* in normal operation. The user can hand-edit if they want; the skill doesn't enforce.

## Registry shape (`stakeholders.json`)

```json
{
  "version": 1,
  "stakeholders": [
    {
      "slug": "john-adams",
      "name": "John Adams",
      "category": "managing-up",
      "role": "VP Product, my skip-level",
      "registered": "2024-09-01"
    }
  ],
  "archived": [
    {
      "slug": "draymond-young",
      "name": "Draymond Young",
      "category": "managing-down",
      "role": "Sr Eng",
      "registered": "2024-03-15",
      "archived": "2026-05-02",
      "reason": "Left for Stripe"
    }
  ]
}
```

`archived[]` is optional — only created when the first archive happens. Old registries without it are valid.

## Operating principles

- **Confirm before writing.** Every operation shows the proposed change and waits for a yes. The data is private and the cost of an unintended write is real.
- **Default toward reversibility.** When the user's intent is ambiguous, route to the safer option (archive over delete; keep slug over change slug; keep history over reset).
- **Preserve history aggressively.** A re-categorize never starts over. An archive never deletes the file. The accumulated reflection record is the *whole point* of the system.
- **One operation per invocation.** If the user wants to re-categorize and update the role at once, do them sequentially with separate confirmations rather than batching. Bulk operations are how subtle errors creep in.
- **Surface neglect, don't moralize.** The list mode flags stakeholders with no reflection in 14+ days. Inform; don't shame.
- **Detect drift between file system and registry.** If `stakeholders.json` lists Jill but `managing-across/jill-smith.md` doesn't exist (or vice versa), surface it and offer to repair. Hand-edits happen.

## Anti-patterns to flag

- **Re-categorize as "delete and re-add."** Don't. The reflection history is the asset.
- **Bulk re-categorization on a reorg.** Tempting, but each move benefits from its own one-sentence reason in the audit log. Do them one at a time.
- **Archive when the relationship just got rocky.** Sometimes the user wants to archive someone they're frustrated with. Surface it gently — *"You've reflected on Sam 5 times in the last 60 days, with notes about a hard conversation pending. Are you sure you want to archive, or is this a moment to push the harder reflection?"*
- **Delete to "clean up."** A clean registry is not a feature. Keep the historical record.
- **Letting the slug drift from the name without intent.** Most renames should re-slug. Keep slug stable only when the user has a deliberate reason.

## Composition with other skills

- **`stakeholder-register`** — owns add. End-of-flow message can suggest the management skill: *"To list, edit, or re-categorize stakeholders later, just describe what you want — the `stakeholder-manage` skill handles the lifecycle."*
- **`stakeholder-due` / `stakeholder-reflect` / `stakeholder-synthesize`** — read the active state. After a re-categorize, they pick up the new category automatically. After an archive, they no longer surface the person (unless the user explicitly synthesizes over the archive folder).
- **`stakeholder-synthesize`** — can read across the `archive/` folder when the user wants retrospective lessons (e.g. *"what did I learn from working with Draymond?"*).
- **`feedback-frameworks`** — when an archive is happening because of a falling-out or hard departure, surface the option to draft a final piece of feedback or a goodbye message, if the user has unfinished business.
- **`decision-log`** — significant lifecycle decisions (e.g., "decided to archive the entire 2024 cohort of mentees because the program ended") can be logged as ADR-style entries in `decision-log`.
