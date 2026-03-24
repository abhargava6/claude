# Claude Skills

A shared repository for custom Claude skills (slash commands) available across Claude Desktop and Claude Code (terminal).

## How It Works

Skills are `.md` files in the `commands/` folder. Each file becomes a slash command you can invoke as `/<filename>` in Claude.

## Setup

### 1. Clone the repo

```bash
git clone git@github.com:abhargava6/claude.git ~/claude-skills
```

### 2. Symlink to Claude Code (terminal)

```bash
ln -s ~/claude-skills/commands ~/.claude/commands
```

### 3. Symlink to Claude Desktop

```bash
ln -s ~/claude-skills/commands ~/Library/Application\ Support/Claude/commands
```

### 4. Claude.ai (web)

Skills are not currently supported on Claude.ai web. They only work in Claude Desktop and Claude Code (terminal).

## Adding a New Skill

1. Create a new `.md` file in `commands/`:

```bash
nano ~/claude-skills/commands/my-skill.md
```

2. Write a plain English prompt describing what the skill should do:

```markdown
Do X by doing Y. Then check for Z and summarize the results.
```

3. Commit and push:

```bash
cd ~/claude-skills
git add .
git commit -m "add my-skill"
git push
```

The skill is immediately available as `/my-skill` in Claude Desktop and Claude Code — no restart needed.

## Using a Skill

In Claude Code (terminal) or Claude Desktop, just type:

```
/my-skill
```

## Syncing to a New Machine

```bash
git clone git@github.com:abhargava6/claude.git ~/claude-skills
ln -s ~/claude-skills/commands ~/.claude/commands                                      # Claude Code
ln -s ~/claude-skills/commands ~/Library/Application\ Support/Claude/commands         # Claude Desktop
```

## Available Skills

| Skill | Description |
|-------|-------------|
| `/review-pr` | Reviews git diff or PR for bugs, security issues, and code quality |
