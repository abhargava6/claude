#!/bin/bash

# Syncs skills from Claude Desktop's local cache to ~/claude-skills/skills/
# Usage: ./sync-from-desktop.sh [skill-name]
#        ./sync-from-desktop.sh         ← syncs all skills
#        ./sync-from-desktop.sh jira-ticket-writer  ← syncs one skill

REPO="$HOME/claude-skills/skills"
SKILLS_PLUGIN="$HOME/Library/Application Support/Claude/local-agent-mode-sessions/skills-plugin"
COWORK_BASE="$HOME/Library/Application Support/Claude/local-agent-mode-sessions"

# Find all SKILL.md files across both Desktop skill locations
find_desktop_skills() {
  find "$SKILLS_PLUGIN" -name "SKILL.md" -path "*/skills/*" 2>/dev/null
  find "$COWORK_BASE" -name "SKILL.md" -path "*/skills/*" ! -path "*/skills-plugin/*" 2>/dev/null
}

# Find .skill zip files in Desktop outputs
find_skill_files() {
  find "$COWORK_BASE" -name "*.skill" 2>/dev/null
}

copy_skill() {
  local skill_dir="$1"
  local skill_name
  skill_name=$(basename "$skill_dir")

  echo "→ Syncing: $skill_name"
  rm -rf "${REPO:?}/$skill_name"
  cp -r "$skill_dir" "$REPO/$skill_name"
}

install_skill_file() {
  local skill_file="$1"
  local skill_name
  skill_name=$(basename "$skill_file" .skill)

  echo "→ Installing from .skill file: $skill_name"
  rm -rf "${REPO:?}/$skill_name"
  mkdir -p "$REPO/$skill_name"
  unzip -q "$skill_file" -d "$REPO/$skill_name"

  # Also copy evals folder if it exists next to the .skill file
  local evals_dir
  evals_dir="$(dirname "$skill_file")/${skill_name}-evals"
  if [[ -d "$evals_dir" ]]; then
    echo "  + copying evals"
    cp -r "$evals_dir" "$REPO/$skill_name/evals"
  fi
}

TARGET="$1"
SYNCED=0

# First pass: try extracted SKILL.md folders
while IFS= read -r skill_md; do
  skill_dir=$(dirname "$skill_md")
  skill_name=$(basename "$skill_dir")

  if [[ -n "$TARGET" && "$skill_name" != "$TARGET" ]]; then
    continue
  fi

  copy_skill "$skill_dir"
  SYNCED=$((SYNCED + 1))
done < <(find_desktop_skills)

# Second pass: fallback to .skill zip files for anything not found above
while IFS= read -r skill_file; do
  skill_name=$(basename "$skill_file" .skill)

  if [[ -n "$TARGET" && "$skill_name" != "$TARGET" ]]; then
    continue
  fi

  # Skip if already synced via extracted folder
  if [[ -f "$REPO/$skill_name/SKILL.md" ]]; then
    continue
  fi

  install_skill_file "$skill_file"
  SYNCED=$((SYNCED + 1))
done < <(find_skill_files)

if [[ $SYNCED -eq 0 ]]; then
  if [[ -n "$TARGET" ]]; then
    echo "✗ Skill '$TARGET' not found in Claude Desktop."
  else
    echo "✗ No skills found in Claude Desktop."
  fi
  exit 1
fi

# Commit and push
cd "$HOME/claude-skills" || exit 1
git add skills/
if git diff --cached --quiet; then
  echo "✓ No changes — skills already up to date."
else
  if [[ -n "$TARGET" ]]; then
    git commit -m "sync $TARGET from Claude Desktop"
  else
    git commit -m "sync all skills from Claude Desktop"
  fi
  git push
  echo "✓ Pushed to GitHub."
fi
