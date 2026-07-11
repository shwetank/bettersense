---
title: Using bettersense as a team
description: Share the collaborative artifacts — charters, strategy, decisions — through a git-backed team workspace, while your private reflections never leave your machine.
---

bettersense is personal by default, and most of it should stay that way — your reflections on colleagues, your wins, your career retros are yours alone. But a few artifacts are inherently shared: a **team charter** the whole team commits to, a **strategy doc** partners align on, **decision records** the team cites months later. The `team-workspace` skill lets a team share exactly those, with a privacy wall that makes leaking the private layer structurally hard.

## The two-repo model

```
~/bettersense-work-reflections/     PRIVATE — never shared, one person
  ├── stakeholder files, self/, wins.md, retros, commitments, pulses …

$BETTERSENSE_TEAM_HOME (e.g. ~/bettersense-team/)   SHARED — git repo, whole team
  ├── team-charters/
  ├── strategy/
  └── decisions/
```

Two separate git repositories. The team workspace has its own remote and its own access control, governed by your team on your git host. Because personal files simply aren't in the shared tree, they can't be committed there by accident — the separation *is* the protection.

## What's shareable

| Shareable | Never shared |
|---|---|
| Team charters | Stakeholder reflections (your notes on people) |
| Strategy & tech-strategy docs | Self-reflections and career retros |
| Decision records you promote to shared ADRs | Wins log, commitments |
| | Pulses (local by default — share a redacted summary manually if needed) |

Ask `team-workspace` to share something on the right-hand list and it will refuse and explain. That's the point.

## How sharing works

1. **`init`** — set up the team workspace (or point at an existing clone of your team's repo).
2. **`share`** — the skill confirms the artifact is shareable, **scans it for accidental personal content** (names from your stakeholder registry, quotes that read like private notes), copies it onto a branch, and drafts the commit and PR description.
3. **You push and open the PR.** The skill stops at the push — sharing to your team is a publish action, so it stays your call. It never pushes or opens PRs on your behalf, never creates repos, and never touches repository permissions.

## Why not just one shared folder?

Because that's how a candid reflection ends up in a team PR. The moment charters and stakeholder notes live in the same tree, one `git add .` leaks something career-sensitive about a colleague. The two-repo model costs a little convenience and buys a guarantee. See [Your data](/reference/your-data) for the full privacy model.
