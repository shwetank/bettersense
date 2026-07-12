---
name: team-workspace
description: Use to set up or work with a SHARED, git-backed team workspace for artifacts a team co-owns — team charters, strategy docs, decision records — kept strictly separate from your private reflections, which never leave your machine. Trigger phrases include "share our team charter with the team", "set up a shared bettersense workspace", "put our strategy doc in the team repo", "how do teams use bettersense together". Establishes `$BETTERSENSE_TEAM_HOME` (a separate git repo), enforces a hard wall that personal files (reflections, wins, retros, commitments) are NEVER shared, and drafts the branch/commit/PR — but never pushes or opens a PR for you. The multiplayer layer with the privacy wall built in.
---

# Team Workspace

bettersense is personal by default — the memory holds candid notes about real people and belongs to one person. But some artifacts are inherently collaborative: a **team charter** the whole team commits to, a **strategy doc** partners align on, **decision records** the team should be able to cite later. This skill lets a team share *those* through git and PRs, while guaranteeing the private layer stays private.

The entire value of this skill rests on one boundary being absolute. State it plainly to the user the first time, every time it matters:

> **The privacy wall.** Your reflections on people (stakeholder files), your self-reflections, wins, career retros, and commitments **never go in the team workspace.** Only artifacts a team is meant to co-own — charters, strategy, decisions — are shareable, and only when you explicitly move them.

## What is shareable vs. never-shared

| Shareable (team workspace) | Never shared (stays in `~/bettersense-work-reflections/`, always local) |
|---|---|
| `team-charters/<team>.md` | stakeholder files (`managing-*`, `teams/`) |
| `strategy/<area>.md`, `strategy/tech-<area>.md` | `self/reflections.md`, `self/retros/` |
| decision records the user explicitly promotes to shared ADRs | `wins.md`, `commitments.md` |
| | `pulses/` (may contain sensitive metrics — local by default; share a redacted summary manually if needed) |

This table is a hard allowlist. If the user asks to share anything in the right-hand column, **refuse and explain** — that content is about people or about the user, and sharing it is exactly what the wall prevents. Offer the legitimate alternative (e.g. "the *charter* can be shared; your private notes on the team cannot").

## The team workspace location

`$BETTERSENSE_TEAM_HOME` (suggest `~/bettersense-team/`), a **separate git repository** from the personal reflections directory — different directory, its own remote, its own access control managed by the team on their git host. Keeping it a distinct repo is what makes accidental leakage structurally hard: personal files simply aren't in this tree.

Setup (Mode: `init`):
1. Create the directory and `git init` it (or point at an existing clone of the team's repo).
2. Scaffold `team-charters/`, `strategy/`, `decisions/`, and a `README.md` explaining what belongs here and — loudly — what must never be committed here.
3. Confirm the remote is one the team controls. The skill does **not** create repos, set permissions, or manage sharing settings on git hosts — those are the user's to configure.

## Sharing an artifact (Mode: `share`)

When the user wants to move a shareable artifact into the team workspace:

1. **Confirm it's on the allowlist.** If not, stop (see the table above).
2. **Scan for leakage before copying.** Read the artifact and check for accidental private content: names from `stakeholders.json`, quotes that read like a private reflection, individual performance commentary. Flag anything and ask before proceeding — a strategy doc that names an underperformer, or a charter that embeds a candid person-note, is a leak wearing a shareable costume.
3. **Copy (don't move)** into the team workspace, preserving the original locally. Put it on a **branch**, never straight onto the main branch.
4. **Draft the commit and the PR description** — a clear summary of what's being shared and why, so the team can review.
5. **Stop at the push.** Show the user the exact `git push` and PR-creation commands (or `gh pr create` invocation) and let *them* run it. Do **not** push or open the PR yourself — sharing to the team is a publish action that belongs to the user. If the user explicitly asks you to run the push, confirm the destination and the exact content once more before doing so, and never bundle it with anything else.

## Working with shared artifacts (Mode: `sync` / `use`)

- Shared charters and strategy docs are read by the same skills that read the local ones (`the-spec-writer`, `metrics-design`, `team-check-in`, etc.). Point those skills at the team workspace copy when the team's version is the source of truth; keep private drafts local until they're ready to propose.
- Changes to shared artifacts go through the same branch → review → merge flow. bettersense drafts; the team's normal PR process decides.
- Never auto-pull-and-overwrite a local working copy the user has unmerged changes in — surface the divergence and let them reconcile.

## Anti-patterns

- **The convenience leak.** "Just put everything in one repo so it's easy to back up." No — that's how a stakeholder reflection ends up in a team PR. The two-repo separation is the whole design.
- **Silent publishing.** Pushing or opening a PR without the user running it. The skill prepares; the user publishes. Always.
- **Sharing pulses raw.** Product metrics can be sensitive (revenue, user counts). Default pulses to local; if a metric needs sharing, the user shares a deliberately redacted summary, not the file.
- **Managing access for them.** The skill never touches repo permissions, collaborator lists, or sharing settings — it assumes the team's git host is already governed by the team.

## Composition

- Shares the outputs of: `team-charter`, `strategy-doc`, `tech-strategy-writer`, `decision-log`
- Hard boundary against: `stakeholder-reflect`, `self-reflect`, `wins-log`, `career-retro`, `commitments` — these are never shared
- `doctor` — validates the personal directory; this skill validates that nothing personal crossed into the team one
- See the site's *Your data* page for the full privacy model
