# Reusable Patterns

This file catalogs proven component patterns from previous release notes. Use these patterns instead of inventing new ones. Append new patterns as they're discovered.

---

## Badge pill
A small uppercase label that categorizes each section.

```html
<tr><td align="center" style="padding:0 24px 12px;">
  <table role="presentation" cellpadding="0" cellspacing="0" border="0"><tr>
    <td style="font-family:'DM Sans',Arial,sans-serif;font-size:10px;font-weight:600;color:[ACCENT_COLOR];text-transform:uppercase;letter-spacing:0.15em;padding:4px 14px;border:1px solid [ACCENT_PILL_BORDER];border-radius:20px;">[BADGE TEXT]</td>
  </tr></table>
</td></tr>
```

Color assignments:
- Primary feature: copper (#B87333), border rgba(184,115,51,0.2), text "Now Available"
- Secondary feature: amber (#F59E0B), border rgba(245,158,11,0.2), text "Also Shipping"
- Bug fixes: green (#4ADE80), border rgba(74,222,128,0.2), text "Improvements"

---

## Step card with screenshot
A numbered step with a screenshot on the left and copy + bullets on the right.

Screenshot width: 200px. Use `class="stack-col"` for mobile stacking. Include `class="step-img"` on the image.

Bullets use `<span style="color:[ACCENT];">&#9679;</span>` — 3 bullets per step.

---

## Step card without screenshot
For steps that don't have a visual (like "Every share is a lead"). Full-width text card.

---

## App-only callout
A tinted banner with phone emoji.

```html
<span style="font-family:'DM Sans',Arial,sans-serif;font-size:11px;color:#D4956B;">&#128241; Available exclusively on the Savoya app — not yet on the Client Portal</span>
```

Wrapping: 8px 16px padding, border-radius 8px, tinted background + border in accent color.

---

## App update notice
A green-tinted info banner about when the update is available.

```html
<span style="font-family:'DM Sans',Arial,sans-serif;font-size:11px;color:#4ADE80;">&#9432; The update will be available [DATE] on the App Store and Google Play. Clients will need to update their app to access these features.</span>
```

---

## Who can share / Who can view card
A two-column info card with a vertical divider. Uses ▶ (&#9656;) for list items.

Left column: "WHO CAN SHARE" header + role list
Right column: "WHO CAN VIEW" header + role list (with border-left divider)

---

## Safeguard / feature pills (3-column grid)
Small pills with Unicode icon + label. Use ◆ (&#9670;) in accent color.

Layout: 3 columns using `width="33%"` table cells. Two rows = 6 pills.

---

## Scenario info card
An info card with a Unicode icon, bold title, and description. Used for driver warning scenarios.

Icon goes in the title line as colored Unicode (e.g., ⚠ for warning, 📍 for location).

---

## "How it works" details card
A card with an uppercase amber header and bulleted list using ● in accent color.

---

## Notable fix callout
A highlighted box inside the bug fixes section with a star icon.

```html
<span style="color:#4ADE80;">&#11088; Notable:</span>
<span style="color:#A09890;"> [Description of the notable fix]</span>
```

---

## Lead gen CTA
A highlighted box inside a step card with a lightbulb icon.

```html
<div style="...padding:10px 14px;background:rgba(184,115,51,0.08);border:1px solid rgba(184,115,51,0.15);border-radius:8px;">
  &#128161; [CTA text]
</div>
```

---

## Enablement doc CTA (prominent)
A full-width copper gradient card with:
- Left: file icon (Cloudinary PNG) in frosted glass circle
- Center: title + description + "Read the full guide →" button
- Background: `linear-gradient(135deg,#B87333,#8B4513)`
- Button: `background-color:rgba(255,255,255,0.15)` with white text

This should always stand out visually from the rest of the email.

---

## Contributor / Business Partner section
Centered avatar circles with initials, name, and role below.

Lead contributor uses copper gradient background. Others use neutral gray gradient.

Spacing: 16px between each avatar.

---

## Section divider
Copper gradient line between major sections:
- Padding: 40px top/bottom, 60px left/right
- 1px height with gradient: `linear-gradient(90deg,transparent,rgba(184,115,51,0.25),transparent)`
