---
title: Stakeholder management
description: Five skills for registering, reflecting on, and synthesizing your working relationships over time.
---

The five `stakeholder-*` skills and `self-reflect` form a tighter system than the rest of the bundle. They share private data at `~/bettersense-work-reflections/` and are designed to be used together over months.

## How it works

The system is cadence-driven: register once, reflect weekly-ish, synthesize before big moments.

```
register → reflect (weekly) → stay current (due-list) → synthesize (before big moments)
```

Data lives in plain markdown files, organized by relationship type:

```
~/bettersense-work-reflections/
├── stakeholders.json
├── managing-up/
│   └── trae-north.md
├── managing-across/
│   └── sahil-bhatia.md
├── managing-down/
│   └── yulia-krenkova.md
├── teams/
│   └── platform-team.md
└── self/
    └── reflections.md
```

---

## Skills

### `stakeholder-register`

**Triggers:** "register a stakeholder", "add a new stakeholder", "I have a new manager"

Walks you through registering a new stakeholder:
- Name and relationship category (managing-up / managing-across / managing-down / teams)
- Role, context, and initial notes
- Creates a structured `.md` file in the right category folder
- Sets up the root directory and privacy warning on first run

First run: creates `~/bettersense-work-reflections/` with a `.gitignore` and privacy README inside.

---

### `stakeholder-reflect`

**Triggers:** "let me reflect on [name]", "it's time to reflect on [name]", "how are things going with [name]"

Guided reflection session on a registered stakeholder:
- Loads the stakeholder file and checks what's been reflected on recently
- Picks 2-3 cadence-appropriate questions from a question library
- Questions span *ask* lenses (what do I know?) and *sense* lenses (what am I observing?)
- Surfaces `things_to_consider` for each question to deepen the reflection
- Pushes back on one-line answers and identity-level labels ("he's difficult")
- Writes a dated entry per question

**Quality of synthesis depends on quality of input.** One-line entries produce shallow synthesis. Use the `things_to_consider` prompts.

---

### `stakeholder-due`

**Triggers:** "what's due this week?", "who should I reflect on?", "stakeholder due-list"

Scans all stakeholder files and surfaces which question × stakeholder pairs are overdue based on suggested frequency. Sorts by overdue ratio.

Most useful as a recurring scheduled check:

```
/schedule "Every Monday at 9am, run /bettersense:stakeholder-due and post the list"
```

---

### `stakeholder-synthesize`

**Triggers:** "synthesize my reflections on [name]", "what do I know about [name]?", "before my 1:1 with [name]..."

Reads all accumulated reflection entries for a stakeholder and produces:
- Patterns across entries (with citations to specific dates)
- Contradictions and blind spots
- Suggested next conversations or questions
- Handoffs to `feedback-frameworks` or `one-on-one-prep` when natural

**Synthesis is honest about its evidence.** If your file is sparse, the synthesis will be tentative. If it's rich, the synthesis will be sharp. The skill will not claim a pattern without citing a dated entry.

---

### `stakeholder-manage`

**Triggers:** "list my stakeholders", "Jill is my manager now", "archive [name] — they left", "rename [name]"

Lifecycle operations on registered stakeholders:
- **List** — show all registered stakeholders with category and last-reflected date
- **Re-categorize** — move between folders (history preserved)
- **Archive** — when someone leaves; file is kept, marked inactive, available for retrospection
- **Delete** — permanently removes (only on explicit confirmation after archive is offered)
- **Rename / edit** — update name or role

Defaults toward archive over delete.

---

### `self-reflect`

**Triggers:** "let me reflect on myself", "self-reflection", "how am I doing as a leader"

Same shape as stakeholder reflection — aimed at you. Covers:
- Behavior under pressure
- Communication patterns
- Time and energy
- Fulfillment and motivation
- Advocating for yourself

Writes dated entries to `~/bettersense-work-reflections/self/reflections.md`.

---

## Worked example

See [Stakeholder reflection: a worked example](/guides/worked-example-stakeholder) for a full lifecycle walkthrough from registration through synthesis.

---

## Things to know before adopting

**The data lives outside the public repo.** The skill creates `~/bettersense-work-reflections/` on first run, gitignores it, and warns you about privacy. The folder holds candid notes about real people — treat it like a journal.

**Override the data path** if you want it on an encrypted volume:
```bash
export BETTERSENSE_WORK_REFLECTIONS_HOME="$HOME/Encrypted/bettersense-reflections"
```

**Synthesis composes with the management skills.** `stakeholder-synthesize` output from a managing-down file feeds naturally into `report-career-architect` (growth plans) and `report-promo-case` (promotion packets). `patterns-watch` scans across all stakeholder files together.
