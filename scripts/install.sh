#!/usr/bin/env bash
#
# install.sh — Install the awesome-skills-ai bundle into your Claude Code config.
#
# Creates symlinks from your Claude config directory back into this repo.
# Symlinks (not copies) so:
#   1. Pulling updates from this repo updates your installed skills automatically.
#   2. You can identify bundle items at a glance: any symlink in
#      ~/.claude/skills/ or ~/.claude/agents/ pointing into this repo is ours.
#   3. Uninstall is clean — see scripts/uninstall.sh.
#
# Usage:
#   scripts/install.sh <variant> [--scope=user|project] [--force]
#
#   <variant>          Required. One of: agnostic | php
#   --scope=user       Default. Installs to ~/.claude/{skills,agents}/
#   --scope=project    Installs to ./.claude/{skills,agents}/ (current dir)
#   --force            Overwrite existing skills/agents with the same name
#                      (default behavior is to skip with a warning)
#
# Examples:
#   scripts/install.sh agnostic
#   scripts/install.sh php --scope=project
#   scripts/install.sh agnostic --force

set -euo pipefail

# ---------- argument parsing ----------

if [ $# -lt 1 ]; then
  echo "Usage: $0 <variant> [--scope=user|project] [--force]" >&2
  echo "  <variant>: agnostic | php" >&2
  exit 1
fi

VARIANT="$1"
shift

SCOPE="user"
FORCE=0

for arg in "$@"; do
  case "$arg" in
    --scope=user) SCOPE="user" ;;
    --scope=project) SCOPE="project" ;;
    --force) FORCE=1 ;;
    *) echo "Unknown argument: $arg" >&2; exit 1 ;;
  esac
done

case "$VARIANT" in
  agnostic) BUNDLE_DIR="ai-technical-pm" ;;
  php) BUNDLE_DIR="ai-technical-pm-php" ;;
  *) echo "Unknown variant: $VARIANT (expected 'agnostic' or 'php')" >&2; exit 1 ;;
esac

# ---------- paths ----------

# Resolve the repo root from this script's location.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
SOURCE_DIR="$REPO_ROOT/$BUNDLE_DIR"

if [ ! -d "$SOURCE_DIR/skills" ] || [ ! -d "$SOURCE_DIR/agents" ]; then
  echo "Error: bundle directory not found at $SOURCE_DIR" >&2
  echo "Expected: $SOURCE_DIR/skills/ and $SOURCE_DIR/agents/" >&2
  exit 1
fi

case "$SCOPE" in
  user)
    TARGET_BASE="$HOME/.claude"
    ;;
  project)
    TARGET_BASE="$(pwd)/.claude"
    ;;
esac

TARGET_SKILLS="$TARGET_BASE/skills"
TARGET_AGENTS="$TARGET_BASE/agents"

mkdir -p "$TARGET_SKILLS" "$TARGET_AGENTS"

# ---------- pre-flight ----------

echo
echo "Bundle:    awesome-skills-ai ($VARIANT variant)"
echo "Source:    $SOURCE_DIR"
echo "Target:    $TARGET_BASE"
echo "Force:     $([ $FORCE -eq 1 ] && echo yes || echo no)"
echo
echo "Will install:"
echo "  - $(find "$SOURCE_DIR/skills" -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d ' ') skills"
echo "  - $(find "$SOURCE_DIR/agents" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ') agents"
echo

read -p "Proceed? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborted."
  exit 0
fi

# ---------- install ----------

INSTALLED=0
SKIPPED=0
REPLACED=0

for skill_dir in "$SOURCE_DIR/skills"/*/; do
  skill_name=$(basename "$skill_dir")
  target="$TARGET_SKILLS/$skill_name"

  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ -L "$target" ] && [ "$(readlink "$target")" = "${skill_dir%/}" ]; then
      # Already symlinked correctly to this exact location; skip silently.
      INSTALLED=$((INSTALLED + 1))
      continue
    fi
    if [ $FORCE -eq 1 ]; then
      rm -rf "$target"
      ln -s "${skill_dir%/}" "$target"
      REPLACED=$((REPLACED + 1))
      echo "  replaced: skills/$skill_name"
    else
      SKIPPED=$((SKIPPED + 1))
      echo "  skipped (exists): skills/$skill_name"
      continue
    fi
  else
    ln -s "${skill_dir%/}" "$target"
    INSTALLED=$((INSTALLED + 1))
  fi
done

for agent_file in "$SOURCE_DIR/agents"/*.md; do
  agent_name=$(basename "$agent_file")
  target="$TARGET_AGENTS/$agent_name"

  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$agent_file" ]; then
      INSTALLED=$((INSTALLED + 1))
      continue
    fi
    if [ $FORCE -eq 1 ]; then
      rm -f "$target"
      ln -s "$agent_file" "$target"
      REPLACED=$((REPLACED + 1))
      echo "  replaced: agents/$agent_name"
    else
      SKIPPED=$((SKIPPED + 1))
      echo "  skipped (exists): agents/$agent_name"
      continue
    fi
  else
    ln -s "$agent_file" "$target"
    INSTALLED=$((INSTALLED + 1))
  fi
done

# ---------- summary ----------

echo
echo "Done."
echo "  Installed/already current: $INSTALLED"
echo "  Replaced (--force):        $REPLACED"
echo "  Skipped (already exists):  $SKIPPED"
echo
if [ $SKIPPED -gt 0 ]; then
  echo "Note: skipped items already exist at the target with different content."
  echo "Re-run with --force to overwrite, or remove them manually first."
  echo
fi
echo "Verify in Claude Code: /agents (should list the bundle's 13 agents)"
echo "To uninstall: scripts/uninstall.sh --scope=$SCOPE"
