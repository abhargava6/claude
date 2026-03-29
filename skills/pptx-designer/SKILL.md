---
name: pptx-designer
description: >
  Use this skill any time the user wants to create, design, or produce a presentation, slide deck, pitch deck, or slides — especially when they care about visual quality, design, or polish. Trigger on phrases like "make a deck", "create slides", "build a presentation", "pitch deck", "slide deck", "PowerPoint", "Google Slides", or any request to communicate an idea visually across multiple slides. Also trigger when a user mentions a topic and wants it "presented", "visualized", or "turned into slides". Prefer this skill over the basic pptx skill whenever design quality is important or when Google Slides output is desired. This skill produces professional, visually designed presentations — not just functional ones.
---

# PPTX Designer

A skill for creating **visually compelling, professionally designed** presentations — as local `.pptx` files or Google Slides.

## Quick Reference

| Goal | Guide |
|------|-------|
| Design system & principles | [references/design-system.md](references/design-system.md) |
| Slide layout templates (pptxgenjs) | [references/slide-templates.md](references/slide-templates.md) |
| Color palettes | [references/color-palettes.md](references/color-palettes.md) |
| Industry matching & UX rules | [references/industry-ux-rules.md](references/industry-ux-rules.md) |
| QA checklist | [references/qa-checklist.md](references/qa-checklist.md) |

---

## Step 0 — Understand the Brief

Before writing a single slide, gather:

1. **Topic** — What is this presentation about?
2. **Audience** — Technical team? Executives? Investors? Customers?
3. **Goal** — Inform, persuade, sell, report?
4. **Slide count** — How many slides? (Default: 8-12 if not specified)
5. **Output format** — Local `.pptx` or Google Slides in Drive?
6. **Brand/style** — Any specific colors, fonts, or existing brand guide?

If the user hasn't provided these, ask for audience and goal at minimum. The rest can be inferred.

**Audience shapes everything:**
- **Executives/investors** → fewer words, big numbers, clear so-what, premium feel
- **Technical teams** → diagrams, specifics, data density is OK
- **Customers** → benefits over features, warm tone, clean visuals

---

## Step 1 — Design Decisions

Before generating, make conscious design decisions. Read [references/design-system.md](references/design-system.md) for the full system.

**Always decide upfront:**
- Industry/audience → style match (see [references/industry-ux-rules.md](references/industry-ux-rules.md) for reasoning rules)
- Color palette (see [references/color-palettes.md](references/color-palettes.md))
- Font pairing (heading + body)
- Visual motif (one repeating element across all slides)
- Dark vs light vs sandwich (dark title/end, light content)

**Industry matching matters.** A healthcare report and a startup pitch need completely different palettes, fonts, and slide structures. Use the industry reasoning rules to make informed defaults instead of guessing.

**Never start without a plan.** Default choices produce forgettable slides.

---

## Step 2 — Plan the Slide Structure

Draft a slide-by-slide outline before building. Use industry-specific slide structures from [references/industry-ux-rules.md](references/industry-ux-rules.md) if the topic matches an industry pattern. Otherwise, use this default:

```
1. Title slide — [topic + subtitle]
2. Agenda/Overview
3-N. Content slides (vary layouts — never repeat same layout twice in a row)
N-1. Key takeaway
N. Call to action / closing
```

Use a variety of slide types from [references/slide-templates.md](references/slide-templates.md):
- Two-column (text + visual)
- Data + insight (chart + callout)
- Icon grid (3-4 key points)
- Comparison (before/after, option A vs B)
- Big stat callout
- Timeline / process flow
- Key takeaway (single message)

---

## Step 3 — Build

### Local .pptx output

Use pptxgenjs. Install if needed:
```bash
npm install -g pptxgenjs
```

Follow the templates in [references/slide-templates.md](references/slide-templates.md) for each slide type. The templates include precise coordinates, font sizes, and color assignments.

**Key rules while building:**
- Set slide dimensions first: `pptx.layout = 'LAYOUT_16x9'` (10"×5.63"). NEVER use `LAYOUT_WIDE` — it is 13.33"×7.5" and leaves the right ~25% of every slide blank
- Define master colors and fonts as constants at top of script
- Every slide needs at least one non-text visual element
- Left-align body text; center only titles and key stat callouts
- Minimum 0.5" margins from all edges

### Google Slides output

After generating the `.pptx` locally, upload and convert:

```bash
gws drive files create \
  --upload output.pptx \
  --json '{"name": "PRESENTATION_TITLE", "mimeType": "application/vnd.google-apps.presentation"}'
```

Return the Google Slides URL from the response.

---

## Step 4 — QA

**Assume there are visual problems. Your job is to find them.**

Read [references/qa-checklist.md](references/qa-checklist.md) for the full visual inspection checklist.
Read [references/industry-ux-rules.md](references/industry-ux-rules.md) § "Pre-Delivery Checklist" for the anti-pattern validation.

Convert to images for visual inspection:
```bash
python scripts/office/soffice.py --headless --convert-to pdf output.pptx
rm -f slide-*.jpg
pdftoppm -jpeg -r 150 output.pdf slide
ls -1 "$PWD"/slide-*.jpg
```

Use a subagent with fresh eyes to inspect. Never self-certify without at least one fix-and-verify cycle.

---

## Step 5 — Deliver

For `.pptx`: State the file path clearly.

For Google Slides: Return the full URL so the user can open it directly.

Always summarize:
- Design choices made (palette, fonts, motif)
- Industry reasoning applied (which rules guided the design)
- Slide count and structure
- Any assumptions about audience/tone

---

## Common Mistakes to Avoid

- **Wrong layout constant** — ALWAYS use `pptx.layout = 'LAYOUT_16x9'` (10"×5.63"). `LAYOUT_WIDE` is 13.33"×7.5" — content clusters in the left 75%, entire right side blank.
- **Leaving the bottom third empty** — Content must reach y≥4.8" on every slide. If a slide looks half-empty after the main content, use one or more of these fixes: increase font sizes by 2-4pt, increase line spacing to 1.4-1.5, add a supporting tagline or CTA anchored at y≈5.05", add a subtle divider line, or add a row of supporting elements (client logos, badges, icons). The lower third of a slide should never sit blank — it signals unfinished work.
- **Using a 3-column template for 4 items** — When you have 4 items (4 stats, 4 audience segments, 4 features), use proper 4-column spacing: 2.15" per column with 0.2" gutters (x positions: 0.5, 2.85, 5.2, 7.55). Never squeeze 4 items into 3-column coordinates — it creates cramped content on the left and wasted space on the right.
- **Adding bottom anchors but leaving a gap above them** — A CTA or tagline at y=5.0 doesn't fix the problem if there's a 1.5" empty gap between the main content and the anchor. Spread the main content to fill the space: increase vertical spacing between items, increase font sizes, or add sub-labels beneath stat callouts.
- **Ignoring industry context** — A healthcare deck should not look like a startup pitch. Use the industry reasoning rules to select appropriate palette, fonts, and structure.
- Repeating the same layout on consecutive slides
- Using bullet lists when icons + headers would be clearer
- Defaulting to blue — pick colors that match the topic
- Accent lines under titles (hallmark of AI-generated slides — never do this)
- Text-only slides — every slide needs a visual element
- Light text on light backgrounds or dark on dark
- Centering body text (only center titles and single-line callouts)
- **Emoji as icons** — renders inconsistently across PowerPoint versions and platforms. Use pptxgenjs shapes (OVAL, RECTANGLE with text) instead.
- **Purple gradient backgrounds** — AI-slop signal. Use solid palette colors; gradient only sparingly on title slide.
- **Dense paragraphs** — max 6 lines per text block. If the audience has to read a paragraph, you've lost them.

---

## Dependencies

- `npm install -g pptxgenjs` — slide generation
- `pip install "markitdown[pptx]"` — reading existing files
- `pip install Pillow` — thumbnail generation
- LibreOffice (`soffice`) — PDF conversion for QA
- Poppler (`pdftoppm`) — PDF to images
- `gws` CLI — Google Slides upload (optional)
