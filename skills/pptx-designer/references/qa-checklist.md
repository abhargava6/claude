# QA Checklist

Use this checklist after generating every presentation. Assume there are problems — your job is to find them.

---

## Convert to Images First

Always inspect visually. Run:

```bash
python scripts/office/soffice.py --headless --convert-to pdf output.pptx
rm -f slide-*.jpg
pdftoppm -jpeg -r 150 output.pdf slide
ls -1 "$PWD"/slide-*.jpg
```

Pass the absolute paths to a subagent with fresh eyes. Never self-inspect without a fix-and-verify cycle.

---

## Visual Inspection Prompt (for subagent)

```
Visually inspect these slides. Assume there are issues — find them.

Look for:
- Overlapping elements (text through shapes, lines through words)
- Text overflow or cut off at edges or box boundaries
- Elements too close to slide edges (< 0.5" margin)
- Content blocks nearly touching (< 0.3" gap)
- Uneven spacing (large empty area one side, cramped the other)
- Low-contrast text (light on light, dark on dark)
- Low-contrast icons (dark icons on dark backgrounds)
- Text boxes too narrow causing excessive wrapping
- Columns or rows not aligned with each other
- Inconsistent motif application (some slides have it, some don't)
- Different font faces or sizes that break consistency
- Leftover placeholder text: "Lorem ipsum", "[insert]", "TODO", "XXXX"
- Title slide doesn't match closing slide treatment
- Accent lines under titles (remove these — they're an AI tell)
- All-text slides with no visual element
- Empty lower third — content should reach y≥4.8" on every slide
- Gap between main content and bottom anchor (>1" empty space)
- 4 items squeezed into 3-column spacing (uneven column widths)

For each slide, list issues found, even minor ones.
Number each issue. If you find none, look harder.

Images to inspect:
[paste absolute paths here]
```

---

## Content QA

```bash
# Extract all text for review
python -m markitdown output.pptx

# Check for leftover placeholders
python -m markitdown output.pptx | grep -iE "\bx{3,}\b|lorem|ipsum|\bTODO|\[insert|this.*(page|slide).*layout|placeholder"
```

If grep returns results → fix before proceeding.

---

## Design Consistency Checklist

### Typography
- [ ] Same heading font used on all slides
- [ ] Same body font used on all slides
- [ ] Title sizes consistent (36-44pt) across content slides
- [ ] Body text 18pt minimum
- [ ] No random bold or color emphasis in body text

### Color
- [ ] Only palette colors used — no off-palette hex values
- [ ] Primary color used for headings consistently
- [ ] Accent color used sparingly (< 10% of slide area)
- [ ] Dark slides match each other (title, sections, closing)
- [ ] Light slides match each other (content slides)

### Layout
- [ ] All text elements have minimum 0.5" from slide edges
- [ ] Content blocks have 0.3-0.5" breathing room between them
- [ ] Two-column slides have aligned tops and bottoms
- [ ] Icon grid items are evenly spaced and aligned
- [ ] Stat callouts are horizontally centered
- [ ] **Every slide has content reaching y≥4.8"** — no empty lower thirds
- [ ] 4-item slides use proper 4-column spacing (2.15" columns, x: 0.5/2.85/5.2/7.55) — not 3-column spacing with items squeezed in
- [ ] Bottom anchors (CTAs, taglines) don't create a visual gap above them — if there's >1" empty space between main content and the anchor, spread the main content down

### Motif
- [ ] Visual motif applied consistently across all content slides
- [ ] Motif is the same element (not different variations)
- [ ] Motif doesn't interfere with content readability

### Slide Variety
- [ ] No same layout used on two consecutive slides
- [ ] Every slide has at least one non-text visual element
- [ ] At least 3 different slide types used in the deck

---

## Common Bugs to Fix

| Bug | Fix |
|-----|-----|
| Text overflows box | Reduce font size by 2pt or rewrite text shorter |
| Element too close to edge | Move inward; maintain 0.5" margin |
| Accent line under title | Delete it — use whitespace instead |
| All-bullet slide | Convert to icon grid or two-column layout |
| Low contrast | Use palette's text/background safe combinations |
| Motif missing on slide | Add the motif shape/element to that slide |
| Placeholder image | Replace with actual image or colored shape |
| Empty lower third | Add bottom anchor (CTA, tagline, divider + sub-content) at y≈5.0" AND spread main content down with larger fonts/spacing |
| 4 items in 3-column layout | Switch to 4-column template (2.15" cols at x: 0.5, 2.85, 5.2, 7.55) |
| Gap between content and bottom anchor | Increase vertical spacing between main content items, increase font sizes, or add sub-labels to fill the gap |

---

## Verification Loop

1. Generate slides
2. Convert to images
3. Inspect with subagent
4. **List all issues found** (if none found, look again more critically)
5. Fix issues
6. Re-convert to images
7. Re-inspect affected slides
8. Repeat until a full pass finds no new issues

**Do not declare success until you've completed at least one fix-and-verify cycle.**
