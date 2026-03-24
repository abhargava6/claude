#!/bin/bash

# Packages a skill and installs it in Claude Desktop via .skill file
# Usage: ./publish-to-desktop.sh <skill-name>
#        ./publish-to-desktop.sh pptx-designer

SKILLS_DIR="$HOME/claude-skills/skills"
SKILL_CREATOR="$SKILLS_DIR/skill-creator"

if [[ -z "$1" ]]; then
  echo "Usage: ./publish-to-desktop.sh <skill-name>"
  echo ""
  echo "Available skills:"
  for dir in "$SKILLS_DIR"/*/; do
    name=$(basename "$dir")
    [[ -f "$dir/SKILL.md" ]] && echo "  - $name"
  done
  exit 1
fi

SKILL_NAME="$1"
SKILL_PATH="$SKILLS_DIR/$SKILL_NAME"

if [[ ! -d "$SKILL_PATH" ]]; then
  echo "✗ Skill '$SKILL_NAME' not found at $SKILL_PATH"
  exit 1
fi

if [[ ! -f "$SKILL_PATH/SKILL.md" ]]; then
  echo "✗ No SKILL.md found in $SKILL_PATH"
  exit 1
fi

echo "→ Packaging: $SKILL_NAME"

# Run packager from skill-creator directory
OUTPUT=$(cd "$SKILL_CREATOR" && python3 -m scripts.package_skill "$SKILL_PATH" 2>&1)
if [[ $? -ne 0 ]]; then
  echo "✗ Packaging failed:"
  echo "$OUTPUT"
  exit 1
fi

# Find the generated .skill file (packager puts it in skill-creator dir)
SKILL_FILE="$SKILL_CREATOR/${SKILL_NAME}.skill"
if [[ ! -f "$SKILL_FILE" ]]; then
  echo "✗ Expected .skill file not found at $SKILL_FILE"
  exit 1
fi

# Move to the skill's own folder
mv "$SKILL_FILE" "$SKILL_PATH/${SKILL_NAME}.skill"
echo "✓ Packaged: $SKILL_PATH/${SKILL_NAME}.skill"

# Open in Claude Desktop
echo "→ Installing in Claude Desktop..."
open "$SKILL_PATH/${SKILL_NAME}.skill"

echo ""
echo "✓ Done. Claude Desktop should now prompt you to install '$SKILL_NAME'."
echo "  After installing, use it with: /$SKILL_NAME"
