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

## Using a Skill

In Claude Desktop or Claude Code terminal, type:

```
/my-skill
```

---

## Available Skills

| Skill | Description |
|-------|-------------|
| `/jira-ticket-writer` | Converts Slack messages or freeform text into Jira Bug, Story, or Task tickets |
| `/review-pr` | Reviews git diff or PR for bugs, security issues, and code quality |
