---
name: jira-ticket-writer
description: >
  Converts any Slack message — provided as a link or pasted text, structured, semi-structured, or fully freeform — into
  well-structured, Jira-compatible tickets (Bug, Story, or Task). Also supports updating existing Jira tickets
  with new draft content. Use this skill whenever a user pastes a Slack message, bug report, feature request,
  or intake form and wants it turned into a Jira ticket — or wants to update an existing one. Trigger on phrases
  like "write a Jira ticket", "create a ticket from this", "turn this into a Jira issue", "draft a story/bug/task",
  "update this ticket", "update ENG-42", or when someone shares a Slack message or form submission and asks for
  help capturing it in Jira. Even if the user doesn't say "Jira" explicitly — if they want to convert
  a Slack message or intake form into a structured issue or ticket, or update an existing one, use this skill.
  Always draft first for human review, then offer to create or update directly in Jira.
---

# Jira Ticket Writer

Converts any Slack message into a polished, Jira-compatible ticket draft — whether it's
a structured intake form, a semi-structured report, or a raw freeform chat message.
Supports **Bug**, **Story**, and **Task** issue types. Always produces a draft for human
review first, then offers to create a new ticket or update an existing one directly in Jira.

**Before writing any ticket**, read the relevant template from `references/templates.md` for the issue type you're producing. For Jira markdown compatibility notes, consult `references/jira-markdown.md`. For worked examples showing input→output, see `references/examples.md`.

---

## Understanding the Input — Three Message Styles

Slack messages come in three levels of structure. Detect which style you're dealing with and apply the right parsing strategy.

### Style A: Structured (labeled fields)
Clear key-value pairs, often from a Slack workflow or bot form. Honor explicit fields exactly — don't infer or override them. Fill in only what's missing.

### Style B: Semi-Structured (mix of labels + narrative)
Some labeled fields, some freeform prose. Extract labeled fields as-is. Infer the rest (issue type, priority, labels) from the narrative.

### Style C: Unstructured (pure freeform)
Raw Slack messages with no labels — just someone describing a problem or request.

**Parsing strategy for unstructured input:**

1. **Read the whole message before extracting anything.** Signals are embedded in tone, urgency words, and context — not labels.
2. **Infer issue type** from the nature of the request (see Step 1 heuristics).
3. **Reconstruct the who/what/where/when** by reading between the lines:
   - *Who reported it?* — look for @mentions, "I", "we", "a customer said"
   - *What's the problem or goal?* — the core complaint or request
   - *Where does it happen?* — page, feature, user segment, environment
   - *When did it start?* — "this morning", "since Tuesday's deploy", "for a while"
   - *How bad is it?* — "3 people", "tons of users", "blocking everyone"
4. **Be generous with inferences** — unstructured messages often omit fields that are clearly implied. Make a reasonable call and flag it as inferred in the ⚠️ Missing section rather than leaving it blank.
5. **Write a cleaner, professional version** of what the reporter is describing — don't copy their casual phrasing into the ticket body.
6. **Acknowledge uncertainty** — if a field is a guess, note it. E.g., `**Priority**: High _(inferred from "blocking" language — please confirm)_`

---

## Workflow

### Step 0 — Determine Input Mode

**Mode A — Slack message link**
The user provides a Slack message URL. Parse the URL to extract `channel_id` (segment after `/archives/`) and `message_ts` (digits after `p`, with `.` inserted before last 6 digits). Fetch with `slack_read_thread`. Store both values for Step C.

**Mode B — Pasted message text**
The user pastes raw message content directly. Proceed to Step 1. `channel_id` and `message_ts` are not yet known — they will be needed later for Step C.

### Step 1 — Identify the Issue Type

Check if the input explicitly states a type. If not, infer from these heuristics:

| Type | Signals |
|------|---------|
| **Bug** | "broken", "error", "crash", "not working", "regression", "unexpected behavior", "failing" |
| **Story** | "as a user", "we need", "feature request", "would be nice", "users should be able to" |
| **Task** | "please do", "set up", "configure", "migrate", "update", "clean up", "investigate" |

If still unclear, default to **Task**. State the inferred type and invite the user to correct it.

### Step 2 — Extract Key Information

Parse the input for:
- **Problem / goal**: What's broken or what needs to happen?
- **Context**: Where does this occur? Which system, page, or user flow?
- **Impact**: Who is affected? How severely?
- **Reproducing steps** (Bugs only): What steps lead to the issue?
- **Expected vs actual** (Bugs only)
- **Acceptance criteria** (Stories/Tasks): What does "done" look like?
- **Priority signals**: Words like "urgent", "critical", "blocking", "P1", etc.
- **Labels / components**: Any team names, product areas, or tags mentioned?

If important information is missing, note it with a `⚠️ Missing:` callout at the bottom. Don't block on it — make reasonable inferences.

### Step 3 — Write the Ticket

Read `references/templates.md` for the appropriate template (Bug, Story, or Task). Produce the ticket in clearly labeled sections, formatted in clean markdown compatible with Jira's renderer (see `references/jira-markdown.md`).

Always include the `core-intake` label in the Labels field — this is a team convention for tickets created from intake messages.

### Step 4 — Priority Mapping

| Priority | Signals |
|----------|---------|
| **Critical** | Production down, data loss, security issue, "blocking everyone" |
| **High** | Core workflow broken, major feature gap, customer-escalated |
| **Medium** | Workaround exists, affects subset of users, planned feature |
| **Low** | Nice-to-have, cosmetic, low-traffic area |

Default to **Medium** if no clear signals.

### Step 5 — Present Draft & Offer to Create or Update in Jira

**Always present the draft first.** End the draft with:

> ---
> ✅ **Draft ready for review.** Does this look right?
> - You can ask me to adjust any field, reword sections, or change the issue type.
> - When you're happy with it, say **"create it"** and tell me the **Jira project key** (e.g. `ENG`, `PLAT`) and I'll submit it as a new ticket.
> - Or, say **"update `ENG-42`"** (or paste a Jira ticket URL) and I'll update that existing ticket with this draft instead.

---

#### Path 1 — Create a New Ticket

**When the user approves and provides a project key**, run these three steps in sequence:

**Step A — Create the ticket** using `createJiraIssue`:
- `summary`: the one-line summary (plain text, no markdown)
- `issueTypeName`: `"Bug"`, `"Story"`, or `"Task"`
- `projectKey`: provided by the user
- `description`: the full ticket body in ADF markdown format
- `contentFormat`: `"markdown"`

**Step B — Transition to Scoping Review** immediately after creation using `transitionJiraIssue`:
- `issueIdOrKey`: the key returned from Step A (e.g. `ENG-42`)
- `cloudId`: `17693079-31f5-490d-9cee-f2fb310416d8`
- `transition.id`: `"101"` ← verified transition ID for "Scoping Review"

**Step C — Post the Jira link back to the Slack thread** using `slack_send_message`:
- `channel_id`: the Slack channel ID where the original intake message was posted
- `thread_ts`: the timestamp of the original Slack message
- `reply_broadcast`: `false`
- `message`: `✅ Jira ticket created and moved to *Scoping Review*: <https://capitaldrive.atlassian.net/browse/ENG-42|ENG-42 — [ticket summary]>`

**How to get `channel_id` and `thread_ts`:**
- **Mode A (Slack link provided):** both values are already known — use them directly.
- **Mode B (pasted text):** ask the user for the Slack message link so you can post back.

Do all three steps automatically — do not ask the user to confirm between them.
After all three complete, confirm:
> ✅ Created **ENG-42**, moved to **Scoping Review**, and posted the link back to the Slack thread.

---

#### Path 2 — Update an Existing Ticket

**When the user provides an existing ticket key or Jira URL instead of a project key**, update that ticket with the draft content.

**Parsing the ticket identifier:**
- **Ticket key** (e.g. `ENG-42`, `PLAT-123`): use directly as `issueIdOrKey`.
- **Jira URL** (e.g. `https://capitaldrive.atlassian.net/browse/ENG-42`): extract the ticket key from the last path segment (everything after `/browse/`).

**Step A — Update the ticket** using `editJiraIssue`:
- `issueIdOrKey`: the ticket key (e.g. `ENG-42`)
- `cloudId`: `17693079-31f5-490d-9cee-f2fb310416d8`
- `summary`: the one-line summary from the draft (plain text, no markdown)
- `description`: the full ticket body in ADF markdown format
- `contentFormat`: `"markdown"`

**Step B — Transition to Scoping Review** immediately after update using `transitionJiraIssue`:
- `issueIdOrKey`: the ticket key (e.g. `ENG-42`)
- `cloudId`: `17693079-31f5-490d-9cee-f2fb310416d8`
- `transition.id`: `"101"` ← verified transition ID for "Scoping Review"

**Step C — Post the Jira link back to the Slack thread** using `slack_send_message`:
- `channel_id`: the Slack channel ID where the original intake message was posted
- `thread_ts`: the timestamp of the original Slack message
- `reply_broadcast`: `false`
- `message`: `✅ Jira ticket updated and moved to *Scoping Review*: <https://capitaldrive.atlassian.net/browse/ENG-42|ENG-42 — [ticket summary]>`

**How to get `channel_id` and `thread_ts`:**
- **Mode A (Slack link provided):** both values are already known — use them directly.
- **Mode B (pasted text):** ask the user for the Slack message link so you can post back.

Do all three steps automatically — do not ask the user to confirm between them.
After all three complete, confirm:
> ✅ Updated **ENG-42**, moved to **Scoping Review**, and posted the link back to the Slack thread.
