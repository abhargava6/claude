---
name: release-notes-email
description: Create polished, dark-themed HTML release notes emails for internal teams. Generates copy-paste-ready emails with feature walkthroughs, screenshots, bug fixes, contributors, and enablement doc links — all in Savoya's branded copper/dark aesthetic. Use this skill whenever someone mentions "release notes", "release email", "release announcement", "feature announcement email", "shipping email", "what's new email", "app update email", or wants to create an internal communication about a product release. Also trigger when someone says "new release going out", "we're shipping", "create the release email", or references announcing features to internal teams. Even if they just say "release notes" without specifying email, use this skill.
---

# Release Notes Email Generator

Generate polished, copy-paste-ready HTML release notes emails for internal teams. The output uses a dark-themed Savoya-branded design with copper, amber, and green accent colors, real app screenshots, and a layout optimized for Front, Outlook, and Gmail.

## Before you begin

1. Read `references/design-system.md` for colors, typography, and icon rules
2. Read `references/copy-guidelines.md` for internal team copy framing
3. Read `references/patterns.md` for reusable component patterns
4. Read `feedback.md` if it exists — every entry is a hard constraint from previous runs
5. Read `assets/hosted-assets.md` for Cloudinary URLs of the Savoya logo and icons

## Step 1: Gather release information

Use `ask_user_input` where appropriate to collect the following. Don't ask everything at once — group into logical chunks.

### Round 1: Release overview
Ask the user:
- What features are in this release? (names + one-line descriptions)
- How many bug fixes / minor improvements?
- When is the release going live? (already live, tomorrow, specific date)
- Do clients need to update the app via app stores?
- Is there an enablement doc or detailed guide to link to?

### Round 2: Feature details (for each feature)
For each feature listed, ask:
- Detailed description of what it does
- Who can use it? (sharers vs viewers, specific roles)
- Is it app-only, portal-only, or both?
- Are there screenshots to include? (prompt upload or ask for Cloudinary URLs)
- What are 3-4 key bullet highlights for this feature?
- What color accent should this feature use? (suggest copper for primary, amber for secondary, green for tertiary — but let user decide)

### Round 3: Bug fixes / improvements
Ask:
- How many total?
- Any notable fixes to call out by name? (e.g., specific client issues resolved)
- Categories to highlight? (default: Stability, Edge cases, UI polish)

### Round 4: People and links
Ask:
- Contributors: names and roles (Engineering, QA, Design, etc.)
- Business partners: names and roles (Sales, CSM, etc.) — optional
- Enablement doc URL (if not already provided)
- Any other links to include?

## Step 2: Process screenshots

If the user uploads screenshots:
1. Note that images must be hosted externally (Cloudinary recommended)
2. If the user hasn't hosted them yet, provide instructions:
   - "Upload your screenshots to cloudinary.com (free tier) and share the URLs"
   - "Or I can save them as files for you to upload"
3. Use the provided Cloudinary URLs in the HTML output

If no screenshots are provided for a feature:
- Do NOT use placeholder images
- Use a text-only step card layout (like the "Every share is a lead" card)

## Step 3: Generate the HTML email

Read `references/template.html` as the structural starting point. Then customize based on the gathered information.

### Critical HTML rules (non-negotiable)
These rules come from real-world testing in Front and Outlook:

1. **ZERO inline SVGs** — Front and Outlook strip all `<svg>` elements during copy-paste. Use Unicode characters for all icons (see design-system.md for the icon map)
2. **All images must use `<img>` tags with `https://` URLs** — no local paths, no base64, no SVGs
3. **Table-based layout only** — no flexbox, no grid, no CSS floats
4. **All CSS must be inline** — no `<style>` blocks in the body (the `<style>` in `<head>` is for `@import` font and `@media` queries only)
5. **Use `role="presentation"` on all tables** — for accessibility
6. **Dark background (#0F0F0F)** must be on the outer wrapper table, not just the body

### HTML structure (in order)
1. Savoya logo (Cloudinary PNG — see hosted-assets.md)
2. For each feature (in order of priority):
   a. Badge pill ("Now Available", "Also Shipping", "Coming Soon")
   b. Feature title (Georgia serif, large)
   c. Feature subtitle/description
   d. Role clarity card ("Who can share / Who can view") — if applicable
   e. App-only or portal-only callout — if applicable
   f. App update notice — if applicable (with go-live date)
   g. Step cards with screenshots and bullet highlights
   h. Safeguards/details grid — if applicable
   i. Copper gradient divider between features
3. Bug fixes / improvements section
   a. Green "Improvements" badge
   b. Count + description
   c. Notable fix callout — if any
   d. Category pills (Stability, Edge cases, UI polish)
4. Enablement doc CTA (copper gradient card with "Read the full guide →")
5. Contributors section (avatar circles with initials, name, role)
6. Business partners section — if any (same style as contributors)
7. Savoya footer ("Guided by principle. Grateful to serve.")

### Color accent assignments
- **Primary feature**: Copper (#B87333) — badge: "Now Available"
- **Secondary feature**: Amber (#F59E0B) — badge: "Also Shipping"
- **Tertiary feature**: Use a muted blue (#60A5FA) or keep amber — badge: "Also Shipping"
- **Bug fixes**: Green (#4ADE80) — badge: "Improvements"
- **Enablement CTA**: Copper gradient background
- **Contributors/Partners**: Copper for lead contributor, neutral for others

### Step card layout (per feature step)
Each step card is a table row with:
- Left column (200px): screenshot `<img>` tag with border-radius
- Right column: step number (Georgia serif, copper), title, description paragraph, 3 bullet highlights with copper dots
- If no screenshot: full-width text card

### Unicode icon reference
Use these instead of SVGs:
- Bullet points: `●` (&#9679;) in accent color
- Safeguard pills: `◆` (&#9670;) in accent color
- Warning: `⚠` (&#9888;)
- Location: `📍` (&#128205;)
- Phone: `📱` (&#128241;)
- Idea: `💡` (&#128161;)
- Star: `⭐` (&#11088;)
- Arrow: `→` (&#8594;)
- Info: `ⓘ` (&#9432;)
- List item: `▶` (&#9656;)

## Step 4: Visual QA (automated self-check)

Before presenting the HTML to the user, run a visual quality check:

### 4a. Render and capture screenshots

```bash
python /path/to/release-notes-email/scripts/visual_qa.py /home/claude/release-email.html /home/claude/
```

This renders the HTML in headless Chromium at two viewport widths:
- **Desktop (700px)**: simulates the email container width
- **Mobile (375px)**: checks responsive stacking behavior

### 4b. Inspect the screenshots

View both screenshots using the `view` tool and check for the following issues:

**Layout checks:**
- [ ] Savoya logo visible and centered at top
- [ ] No horizontal overflow or scrollbar (all content within 600px container)
- [ ] Step cards: screenshot aligned left, text aligned right — no overlap
- [ ] Copper gradient dividers visible between all major sections
- [ ] Even spacing between step cards (no collapsed or oversized gaps)
- [ ] Contributor avatars rendered as circles, evenly spaced

**Typography checks:**
- [ ] Section titles (Georgia serif) fully visible, not clipped or wrapped oddly
- [ ] Step numbers (large Georgia numerals) visible and colored correctly
- [ ] Body text is readable — sufficient contrast against #1A1A1A cards and #0F0F0F background
- [ ] Bullet highlights visible below each step description
- [ ] Badge pills ("Now Available", "Also Shipping", "Improvements") readable

**Image checks:**
- [ ] Savoya logo PNG renders (not a broken image icon)
- [ ] File icon in enablement CTA renders
- [ ] All app screenshots render (if Cloudinary URLs were provided)
- [ ] No broken image placeholders anywhere

**Component checks:**
- [ ] "Who can share / Who can view" card has two readable columns
- [ ] App-only callout banners visible with phone emoji
- [ ] App update notice (green) visible if applicable
- [ ] Enablement doc CTA visually stands out (copper gradient, white text)
- [ ] "Read the full guide →" button text visible
- [ ] Bug fix category pills visible and evenly spaced
- [ ] Notable fix callout box visible if applicable

**Mobile checks (from 375px screenshot):**
- [ ] Step card columns stack vertically (screenshot above text)
- [ ] No text clipping or overflow
- [ ] Safeguard pills remain readable
- [ ] Contributor avatars don't overlap

### 4c. Auto-fix issues

If any check fails:
1. Identify the specific HTML/CSS causing the issue
2. Fix it in the HTML file
3. Re-run the screenshot to verify the fix
4. Repeat until all checks pass

Common fixes:
- **Text overflow**: Add `word-break:break-word;` to the cell style
- **Image not loading**: Verify the URL is correct and uses `https://`
- **Column overlap**: Check `width` attributes on `<td>` elements
- **Spacing issues**: Adjust `padding` on the relevant `<tr>` or `<td>`
- **Mobile stacking broken**: Verify `class="stack-col"` is on screenshot `<td>` elements

### 4d. Capture final screenshots after fixes

After all fixes are applied, take final screenshots and save them alongside the HTML for the user to preview.

## Step 5: Save and present

1. Save the HTML file to `/mnt/user-data/outputs/release-email.html`
2. Save the desktop screenshot to `/mnt/user-data/outputs/release-email-preview.png`
3. Present both files to the user using `present_files`
4. Tell them: "Here's the email and a preview. Open the HTML in Chrome, select all (Ctrl/Cmd+A), copy (Ctrl/Cmd+C), and paste into Front or Outlook."

## Step 6: Post-generation review and feedback capture

After presenting the HTML output:

1. Ask: "How does this look? Any feedback or changes needed?"
2. If feedback is given:
   a. Fix the output immediately
   b. Append the feedback to `feedback.md` as a dated entry:
      ```
      ## YYYY-MM-DD
      - [What went wrong]: [The fix applied]
      ```
   c. If the fix changes the template structure, update `references/template.html`
   d. If the fix reveals a new reusable pattern, append to `references/patterns.md`
3. If the user has a follow-up question about how to send the email, provide copy-paste instructions for Front, Outlook, and Gmail

## Pre-generation checklist

Before generating HTML, verify:
- [ ] Read feedback.md — apply all accumulated constraints
- [ ] Read patterns.md — use established patterns
- [ ] Zero `<svg` tags in output
- [ ] All images use `https://` URLs
- [ ] All CSS is inline (no style blocks in body)
- [ ] Table-based layout throughout
- [ ] Savoya logo uses Cloudinary PNG
- [ ] Dark background on outer wrapper
- [ ] Unicode icons only (no SVGs, no emoji that might not render)
- [ ] Go-live date mentioned if not yet available
- [ ] App update notice included if relevant
