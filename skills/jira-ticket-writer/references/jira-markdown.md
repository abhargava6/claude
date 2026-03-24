# Jira Markdown Compatibility

Jira supports a limited markdown subset. Follow these rules when formatting ticket descriptions.

## Supported Formatting

- `**bold**` — preferred over `__bold__`
- `_italic_`
- Numbered lists: `1.` prefix
- Bulleted lists: `-` prefix
- Horizontal rules: `---`
- Code blocks: triple backticks
- Inline code: single backticks

## Avoid

- HTML tags — Jira ignores them
- `__bold__` — use `**bold**` instead
- Complex nested lists — keep nesting to one level

## Checkboxes

`- [ ]` checkboxes render in Jira's new editor (Next-gen / Team-managed projects). For classic (Company-managed) projects, checkboxes render as plain bullet points. Note this to the user if they mention using a classic project.

## Content Format for API

When creating tickets via `createJiraIssue`, use:
- `contentFormat`: `"markdown"`
- `description`: the full ticket body as markdown text
- `summary`: plain text only (no markdown formatting)
