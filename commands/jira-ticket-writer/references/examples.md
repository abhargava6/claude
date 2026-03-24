# Worked Examples

These examples show the full input→output flow for each message style. Use them as a quality reference when writing tickets.

---

## Example 1 — Unstructured freeform message (Style C → Bug)

**Input:**
```
hey has anyone seen the dashboard loading forever for people on the free plan?
started getting reports this morning, might be the caching change we shipped tuesday
not sure how widespread it is but at least 3 people have mentioned it
```

**Output:**

---
**Summary**: Dashboard loads indefinitely for free-plan users (possible regression from Tuesday's deploy)

**Issue Type**: Bug
**Priority**: High _(inferred from recent deploy correlation and multiple reports — please confirm)_
**Labels**: core-intake, dashboard, performance, free-plan, regression

---

**Description**

Multiple users on the free plan are reporting that the dashboard fails to load, displaying a persistent loading state with no resolution. The issue began appearing this morning and may be related to a caching change shipped on Tuesday.

**Steps to Reproduce**
1. Log in as a free-plan user
2. Navigate to the Dashboard
3. Observe: page loads indefinitely, content never appears

**Expected Behavior**
Dashboard loads and displays content within normal load time.

**Actual Behavior**
Dashboard shows a loading spinner indefinitely with no content rendered.

**Environment**
- Affected segment: Free-plan users (paid plans: unconfirmed)
- Suspected cause: Caching change from Tuesday's deployment

**Impact**
At least 3 users have reported the issue. Actual scope is unknown — may affect all free-plan users.

---

⚠️ Missing: Confirmation of which specific caching change is suspected; error logs from Tuesday's deploy; whether paid-plan users are also affected; reproduction steps on a specific free-plan account.

---
✅ **Draft ready for review.** Does this look right?
- You can ask me to adjust any field, reword sections, or change the issue type.
- When you're happy with it, say **"create it"** and tell me the **Jira project key** and I'll submit it directly.

---

## Example 2 — Semi-structured Slack intake (Style B → Bug)

**Input:**
```
*Type:* Bug
*Summary:* Export to CSV broken for enterprise accounts
*Reported by:* @sarah (on behalf of Customer Success)
*Details:* Clicking "Export to CSV" on the Reports page just shows a spinner forever.
  Started happening after yesterday's deploy. Our biggest enterprise customer flagged it.
*Priority:* High
*Team:* Data / Reports
*Environment:* Production, enterprise accounts only
```

**Output:**

---
**Summary**: Export to CSV spins indefinitely on Reports page for enterprise accounts

**Issue Type**: Bug
**Priority**: High
**Labels**: core-intake, reports, enterprise, export
**Component**: Data / Reports
**Reporter**: Sarah (Customer Success)

---

**Description**

The "Export to CSV" button on the Reports page is non-functional for enterprise accounts,
displaying an infinite spinner instead of initiating a file download. The issue was
introduced in yesterday's deployment and has been flagged by a high-value enterprise customer.

**Steps to Reproduce**
1. Log in as an enterprise account user
2. Navigate to the Reports page
3. Click "Export to CSV"
4. Observe: spinner appears and never resolves

**Expected Behavior**
CSV file download begins within a few seconds of clicking the button.

**Actual Behavior**
A loading spinner appears indefinitely; no file is downloaded and no error is shown.

**Environment**
- Scope: Production, enterprise accounts only
- Other account tiers: unknown — needs verification

**Impact**
Affects all enterprise account users on the Reports page. At least one high-value customer
has reported this directly to Customer Success.

---

⚠️ Missing: Server-side error logs from yesterday's deploy; confirmation of whether other
export formats (PDF, XLSX) are also affected; list of impacted enterprise account IDs.

---
✅ **Draft ready for review.** Does this look right?
- You can ask me to adjust any field, reword sections, or change the issue type.
- When you're happy with it, say **"create it"** and tell me the **Jira project key** and I'll submit it directly.
