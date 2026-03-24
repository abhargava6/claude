# Jira Ticket Templates

Use the appropriate template below based on the issue type identified in Step 1. Fill in all sections; for any information that isn't available, note it in the ⚠️ Missing section rather than leaving blanks.

---

## Bug Template

```
**Summary**: [One-line description of the bug — specific and scannable]

**Issue Type**: Bug
**Priority**: [Critical / High / Medium / Low]
**Labels**: core-intake, [additional inferred labels, e.g. frontend, auth, payments]
**Component**: [inferred component if available]

---

**Description**

[2–4 sentence summary of the problem, written in third person for ticket clarity.]

**Steps to Reproduce**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Expected Behavior**
[What should happen]

**Actual Behavior**
[What actually happens]

**Environment** (if known)
- Browser / OS / App version: [value]
- User type / role: [value]

**Impact**
[Who is affected and how severely? E.g. "All users on the checkout flow", "Intermittent for ~10% of users"]

---

⚠️ Missing: [List any info that would strengthen the ticket, e.g. "Error logs", "Affected user IDs", "Screenshot"]
```

---

## Story Template

Stories use the user story format ("As a… I want… So that…") to clearly express the user-facing value.

```
**Summary**: [One-line user-facing capability statement]

**Issue Type**: Story
**Priority**: [High / Medium / Low]
**Labels**: core-intake, [additional inferred labels]

---

**Description**

**As a** [type of user],
**I want** [to do something],
**So that** [I achieve some goal].

[1–3 sentences of additional context from the Slack message.]

**Acceptance Criteria**
- [ ] [Criterion 1 — observable, testable]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

**Out of Scope** (if applicable)
- [Anything explicitly excluded]

---

⚠️ Missing: [e.g. "Design mockups", "Edge cases for X"]
```

---

## Task Template

Task summaries should start with an action verb (e.g. "Migrate…", "Set up…", "Investigate…").

```
**Summary**: [One-line action-oriented title, starting with a verb]

**Issue Type**: Task
**Priority**: [High / Medium / Low]
**Labels**: core-intake, [additional inferred labels]

---

**Description**

[What needs to be done and why. 2–4 sentences.]

**Definition of Done**
- [ ] [Deliverable 1]
- [ ] [Deliverable 2]
- [ ] [Deliverable 3]

**Dependencies / Blockers** (if any)
- [Any upstream work or teams needed]

---

⚠️ Missing: [e.g. "Owner / assignee", "Target sprint"]
```
