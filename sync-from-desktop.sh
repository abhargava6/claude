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

copy_skill() {
  local skill_dir="$1"
  local skill_name
  skill_name=$(basename "$skill_dir")

  echo "→ Syncing: $skill_name"
  cp -r "$skill_dir" "$REPO/$skill_name"
}

TARGET="$1"
SYNCED=0

while IFS= read -r skill_md; do
  skill_dir=$(dirname "$skill_md")
  skill_name=$(basename "$skill_dir")

  # If a specific skill was requested, skip others
  if [[ -n "$TARGET" && "$skill_name" != "$TARGET" ]]; then
    continue
  fi

  copy_skill "$skill_dir"
  SYNCED=$((SYNCED + 1))
done < <(find_desktop_skills)

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
