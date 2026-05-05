#!/usr/bin/env bash
#
# uninstall.sh — Remove the awesome-skills-ai bundle from your Claude Code config.
#
# Safe by design: removes only items in ~/.claude/{skills,agents}/ that are
# symlinks pointing into THIS repo. Will not touch:
#   - skills/agents you wrote yourself
#   - skills/agents installed from other sources
#   - skills/agents installed via plain `cp` instead of symlinks (use --hard-uninstall for that)
#   - your reflection data at ~/bettersense-work-reflections/ (your data, your call)
#
# Usage:
#   scripts/uninstall.sh [--scope=user|project] [--hard-uninstall] [--dry-run]
#
#   --scope=user        Default. Uninstalls from ~/.claude/{skills,agents}/
#   --scope=project     Uninstalls from ./.claude/{skills,agents}/
#   --hard-uninstall    Also remove copies (not just symlinks) whose names match
#                       the bundle MANIFEST. Use this if you installed via `cp`.
#                       Will prompt for confirmation per item.
#   --dry-run           Show what would be removed, don't actually remove.

set -euo pipefail

# ---------- argument parsing ----------

SCOPE="user"
DRY_RUN=0
HARD=0

for arg in "$@"; do
  case "$arg" in
    --scope=user) SCOPE="user" ;;
    --scope=project) SCOPE="project" ;;
    --dry-run) DRY_RUN=1 ;;
    --hard-uninstall) HARD=1 ;;
    *) echo "Unknown argument: $arg" >&2; exit 1 ;;
  esac
done

# ---------- paths ----------

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

case "$SCOPE" in
  user)    TARGET_BASE="$HOME/.claude" ;;
  project) TARGET_BASE="$(pwd)/.claude" ;;
esac

TARGET_SKILLS="$TARGET_BASE/skills"
TARGET_AGENTS="$TARGET_BASE/agents"

if [ ! -d "$TARGET_SKILLS" ] && [ ! -d "$TARGET_AGENTS" ]; then
  echo "Nothing to do — $TARGET_BASE doesn't appear to be a Claude Code config directory."
  exit 0
fi

# ---------- bundle item names (from filesystem, both variants) ----------

BUNDLE_SKILL_NAMES=()
BUNDLE_AGENT_NAMES=()

for variant in ai-technical-pm ai-technical-pm-php; do
  if [ -d "$REPO_ROOT/$variant/skills" ]; then
    while IFS= read -r d; do
      BUNDLE_SKILL_NAMES+=("$(basename "$d")")
    done < <(find "$REPO_ROOT/$variant/skills" -maxdepth 1 -mindepth 1 -type d)
  fi
  if [ -d "$REPO_ROOT/$variant/agents" ]; then
    while IFS= read -r f; do
      BUNDLE_AGENT_NAMES+=("$(basename "$f")")
    done < <(find "$REPO_ROOT/$variant/agents" -maxdepth 1 -name "*.md")
  fi
done

# Deduplicate (both variants ship the same names).
BUNDLE_SKILL_NAMES=($(printf "%s\n" "${BUNDLE_SKILL_NAMES[@]}" | sort -u))
BUNDLE_AGENT_NAMES=($(printf "%s\n" "${BUNDLE_AGENT_NAMES[@]}" | sort -u))

# ---------- pre-flight ----------

echo
echo "Repo:    $REPO_ROOT"
echo "Target:  $TARGET_BASE"
echo "Mode:    $([ $DRY_RUN -eq 1 ] && echo 'DRY RUN — no changes will be made' || echo 'live')"
echo "Hard:    $([ $HARD -eq 1 ] && echo 'yes — will offer to remove copies as well' || echo 'no — symlinks only')"
echo

# ---------- helpers ----------

is_symlink_into_repo() {
  local path="$1"
  [ -L "$path" ] || return 1
  local target
  target="$(readlink "$path")"
  case "$target" in
    "$REPO_ROOT"/*) return 0 ;;
    *) return 1 ;;
  esac
}

# ---------- skills ----------

REMOVED_SYMLINKS=0
REMOVED_COPIES=0
LEFT_ALONE=0

for name in "${BUNDLE_SKILL_NAMES[@]}"; do
  target="$TARGET_SKILLS/$name"
  [ -e "$target" ] || [ -L "$target" ] || continue

  if is_symlink_into_repo "$target"; then
    if [ $DRY_RUN -eq 1 ]; then
      echo "  would remove (symlink): skills/$name"
    else
      rm -f "$target"
      echo "  removed (symlink): skills/$name"
    fi
    REMOVED_SYMLINKS=$((REMOVED_SYMLINKS + 1))
  elif [ $HARD -eq 1 ] && [ -d "$target" ]; then
    echo "  found copy: skills/$name"
    if [ $DRY_RUN -eq 1 ]; then
      echo "    would prompt for removal"
    else
      read -p "    remove this copy? [y/N] " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$target"
        echo "    removed (copy): skills/$name"
        REMOVED_COPIES=$((REMOVED_COPIES + 1))
      else
        LEFT_ALONE=$((LEFT_ALONE + 1))
      fi
    fi
  else
    LEFT_ALONE=$((LEFT_ALONE + 1))
  fi
done

# ---------- agents ----------

for name in "${BUNDLE_AGENT_NAMES[@]}"; do
  target="$TARGET_AGENTS/$name"
  [ -e "$target" ] || [ -L "$target" ] || continue

  if is_symlink_into_repo "$target"; then
    if [ $DRY_RUN -eq 1 ]; then
      echo "  would remove (symlink): agents/$name"
    else
      rm -f "$target"
      echo "  removed (symlink): agents/$name"
    fi
    REMOVED_SYMLINKS=$((REMOVED_SYMLINKS + 1))
  elif [ $HARD -eq 1 ] && [ -f "$target" ]; then
    echo "  found copy: agents/$name"
    if [ $DRY_RUN -eq 1 ]; then
      echo "    would prompt for removal"
    else
      read -p "    remove this copy? [y/N] " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -f "$target"
        echo "    removed (copy): agents/$name"
        REMOVED_COPIES=$((REMOVED_COPIES + 1))
      else
        LEFT_ALONE=$((LEFT_ALONE + 1))
      fi
    fi
  else
    LEFT_ALONE=$((LEFT_ALONE + 1))
  fi
done

# ---------- summary ----------

echo
echo "Done."
echo "  Removed symlinks:  $REMOVED_SYMLINKS"
echo "  Removed copies:    $REMOVED_COPIES"
if [ $LEFT_ALONE -gt 0 ]; then
  echo "  Left alone:        $LEFT_ALONE"
  if [ $HARD -eq 0 ]; then
    echo
    echo "Note: $LEFT_ALONE bundle-named items at the target are not symlinks into"
    echo "this repo. They may be your own modifications or installs from elsewhere."
    echo "Re-run with --hard-uninstall to be prompted on each."
  fi
fi
echo
echo "Your reflection data at ~/bettersense-work-reflections/ was not touched."
echo "If you want to remove that too, do it manually — it's your data."
