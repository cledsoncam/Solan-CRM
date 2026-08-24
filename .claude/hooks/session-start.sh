#!/bin/bash
# Provisions the "threads-carousel" Claude Code skill (personal/global skill,
# lives outside the repo under ~/.claude/skills) at the start of every
# session so it survives ephemeral remote containers being recycled.
# Source: https://github.com/itchernetski/threads-carousel-claude-skill
set -euo pipefail

SKILL_DIR="$HOME/.claude/skills/threads-carousel"
REPO_URL="https://github.com/itchernetski/threads-carousel-claude-skill"

# Idempotent: skip entirely if already installed with dependencies ready.
if [ -f "$SKILL_DIR/SKILL.md" ] && [ -d "$SKILL_DIR/template/node_modules" ]; then
  exit 0
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  git clone --depth 1 "$REPO_URL" "$TMP_DIR/threads-carousel" >/dev/null 2>&1
  mkdir -p "$SKILL_DIR"
  cp -a "$TMP_DIR/threads-carousel/." "$SKILL_DIR/"
  rm -rf "$SKILL_DIR/.git"
fi

# rsync is used by the skill's workflow to create per-run working copies.
if ! command -v rsync >/dev/null 2>&1; then
  apt-get update >/dev/null 2>&1 && apt-get install -y rsync >/dev/null 2>&1 || true
fi

if command -v bun >/dev/null 2>&1 && [ -f "$SKILL_DIR/template/package.json" ]; then
  (cd "$SKILL_DIR/template" && bun install >/dev/null 2>&1) || true
fi

exit 0
