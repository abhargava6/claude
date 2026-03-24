# Claude Skills

A shared git repository for custom Claude skills, synced across **Claude Desktop** and **Claude Code (terminal)**.

Both platforms read from the same `~/.claude/skills/` folder — update once, available everywhere.

---

## Skill Structure

Each skill lives in its own folder under `skills/`:

```
skills/
  my-skill/
    SKILL.md          ← main skill file (required)
    references/       ← supporting context files (optional)
    evals/            ← test evals (optional)
```

The `SKILL.md` file contains a YAML frontmatter header (`name`, `description`) followed by the skill instructions in markdown.

---

## First-Time Setup (new machine)

### 1. Clone the repo

```bash
git clone git@github.com:abhargava6/claude.git ~/claude-skills
```

### 2. Create the symlink

```bash
ln -s ~/claude-skills/skills ~/.claude/skills
```

That's it — Claude Desktop and Claude Code both auto-discover skills from `~/.claude/skills/`.

---

## Adding a New Skill

### Option A — Built in Claude Desktop

1. Create and refine your skill in Claude Desktop as normal
2. Run the sync script:

```bash
# Sync a specific skill
~/claude-skills/sync-from-desktop.sh jira-ticket-writer

# Sync all Desktop skills at once
~/claude-skills/sync-from-desktop.sh
```

This automatically copies the skill from Desktop's cache, commits, and pushes to GitHub.

### Option B — Built in Claude Code (terminal)

1. Create a new skill folder:

```bash
mkdir -p ~/claude-skills/skills/my-skill
```

2. Create the `SKILL.md`:

```bash
nano ~/claude-skills/skills/my-skill/SKILL.md
```

Minimal format:

```markdown
---
name: my-skill
description: >
  One sentence describing when Claude should trigger this skill.
---

# My Skill

Instructions for what Claude should do when this skill is invoked.
```

3. Commit and push:

```bash
cd ~/claude-skills
git add .
git commit -m "add my-skill"
git push
```

### Option C — Pull latest skills on another machine

```bash
cd ~/claude-skills && git pull
```

Skills are available immediately after pull — no restart needed.

---

## Publishing a Skill to Claude Desktop

Skills built in Claude Code (terminal) are available in Claude Code automatically via the symlink, but need to be packaged and installed to appear in Claude Desktop's slash command menu.

Run the publish script:

```bash
~/claude-skills/publish-to-desktop.sh my-skill
```

This will:
1. Package the skill as a `.skill` file using the skill-creator packager
2. Open the `.skill` file — Claude Desktop will prompt you to install it
3. The skill then appears in Desktop's `/` command menu

**Note:** Evals (`evals/`) are excluded from the package by design — they're for development use with `/skill-creator`, not for end-user installation.

To see all available skills you can publish:

```bash
~/claude-skills/publish-to-desktop.sh
```

---

## Improving a Skill Over Time

Skills with an `evals/evals.json` file can be benchmarked and improved using the `/skill-creator` skill:

```
/skill-creator improve the my-skill skill at ~/claude-skills/skills/my-skill
```

This runs the test cases, compares outputs with/without the skill, opens a browser review viewer, and helps you iterate. After improving, re-run the publish script to update the Desktop version.

---

## Using a Skill

In Claude Desktop or Claude Code terminal, type:

```
/my-skill
```

---

## Available Skills

### Custom
| Skill | Description |
|-------|-------------|
| `/jira-ticket-writer` | Converts Slack messages or freeform text into Jira Bug, Story, or Task tickets |
| `/review-pr` | Reviews git diff or PR for bugs, security issues, and code quality |
| `/pptx-designer` | Creates visually polished presentations as .pptx or Google Slides with professional design system |

### Built-in (Claude Desktop)
| Skill | Description |
|-------|-------------|
| `/pdf` | Read, extract, and work with PDF files |
| `/docx` | Create and edit Word documents |
| `/pptx` | Create and edit PowerPoint presentations |
| `/xlsx` | Create and edit Excel spreadsheets |
| `/schedule` | Schedule and manage calendar events |
| `/skill-creator` | Build and refine new Claude skills |

### Plugins (Cowork)
| Skill | Description |
|-------|-------------|
| `/roadmap-update` | Generate roadmap update summaries |
| `/stakeholder-update` | Write stakeholder update communications |
| `/sprint-planning` | Assist with sprint planning and ticket breakdown |
| `/competitive-brief` | Create competitive analysis briefs |
| `/write-spec` | Write product specs and requirements |
| `/synthesize-research` | Synthesize research and user feedback |
| `/metrics-review` | Review and summarize product metrics |
| `/cowork-plugin-customizer` | Customize existing Cowork plugins |
| `/create-cowork-plugin` | Create new Cowork plugins |
