# Industry Reasoning & UX Guidelines — PPTX Designer

Match presentation design to industry/audience and avoid common anti-patterns. These rules apply to both .pptx and Google Slides output.

---

## Industry → Style Matching Rules

When the user describes their topic or audience, use these rules to select the optimal palette, typography, and slide structure. This replaces guesswork with industry-informed defaults.

### Tech & SaaS
- **Palette**: Ocean Gradient or Charcoal Minimal
- **Fonts**: Arial Black / Calibri (bold corporate) or Calibri Bold / Calibri Light (clean modern)
- **Slide structure**: Problem → Solution → Demo/Product → Traction → Team → Ask
- **Design notes**: Data visualizations welcome, icon grids for features, stat callouts for metrics. Dark title + light content sandwich.
- **Anti-patterns**: Clip-art icons, overly playful fonts, busy patterned backgrounds, serif heading fonts

### Finance & Enterprise
- **Palette**: Midnight Executive or Charcoal Minimal
- **Fonts**: Georgia / Calibri (authoritative) or Palatino / Garamond (premium classic)
- **Slide structure**: Executive Summary → Key Metrics → Analysis → Recommendations → Next Steps
- **Design notes**: Fewer words per slide, big stat callouts, clean divider lines. Every data point needs a "so what." Conservative motifs (thick left border or numbered badges).
- **Anti-patterns**: Neon/bright accent colors, emoji as icons, playful animations, dark mode for content slides

### Healthcare & Wellness
- **Palette**: Sage Calm or Teal Trust
- **Fonts**: Trebuchet MS / Calibri (friendly) or Calibri Bold / Calibri Light
- **Slide structure**: Context → Impact → Approach → Evidence → Outcomes
- **Design notes**: Soft, calming visual treatment. Organic shape motifs. Generous whitespace. Avoid clinical coldness — warm but professional.
- **Anti-patterns**: Red as primary color, harsh contrast, dark themes, dense data without context, aggressive styling

### Marketing & Consumer
- **Palette**: Coral Energy or Cherry Bold
- **Fonts**: Arial Black / Arial (bold, impact) or Trebuchet MS / Calibri (friendly energy)
- **Slide structure**: Hook → Problem → Solution → Benefits → Social Proof → CTA
- **Design notes**: Bold use of accent color, gradient on title slide OK, big visual moments. Every slide should drive toward the CTA.
- **Anti-patterns**: Corporate stiffness, muted/gray palettes, dense text-heavy slides, conservative motifs

### Education & Academic
- **Palette**: Sage Calm or Warm Terracotta
- **Fonts**: Georgia / Calibri (editorial) or Palatino / Garamond (classic)
- **Slide structure**: Objective → Context → Concepts → Examples → Summary → Discussion
- **Design notes**: Clean typography with generous whitespace. Numbered sequences for step-by-step. Icon grids for key concepts. Timeline for processes.
- **Anti-patterns**: Over-animation, dark themes, dense data without explanation, marketing-style CTAs

### Sustainability & Environment
- **Palette**: Forest & Moss
- **Fonts**: Trebuchet MS / Calibri (accessible, warm) or Georgia / Calibri
- **Slide structure**: Why It Matters → Current State → Our Approach → Impact → Join Us
- **Design notes**: Earth-tone palette is essential, not decorative. Organic shape motifs (rounded corners, soft backgrounds). Stats for impact numbers.
- **Anti-patterns**: Neon colors, tech-dark aesthetics, aggressive red/orange accents, corporate blue

### Creative & Design
- **Palette**: Berry & Cream or custom bold palette
- **Fonts**: Arial Black / Arial (impact) — or user's brand fonts if provided
- **Slide structure**: Vision → Work/Portfolio → Process → Impact → What's Next
- **Design notes**: Push layout variety — use all available slide types. Oversized stat callouts. Bold color blocking on section dividers. This audience expects design craft.
- **Anti-patterns**: Generic templates, safe predictable layouts, muted corporate colors, same layout on consecutive slides

### Developer & Technical
- **Palette**: Ocean Gradient or Charcoal Minimal
- **Fonts**: Consolas / Calibri (technical) or Calibri Bold / Calibri Light
- **Slide structure**: Problem → Architecture → Implementation → Demo → Performance → Next Steps
- **Design notes**: Data density is acceptable. Diagrams and flowcharts welcome. Use Data + Insight template for metrics. Code-style monospace fonts for technical labels.
- **Anti-patterns**: Decorative design over substance, serif heading fonts, emoji-heavy styling, marketing-style hyperbole

---

## Pre-Delivery Checklist

Run through these checks before delivering ANY presentation, in addition to the standard QA checklist.

### Critical (Must Pass)
- [ ] **No emoji as icons** — use pptxgenjs shape icons (circles with initials, or Unicode symbols). Emoji render inconsistently across PowerPoint versions and platforms.
- [ ] **Text contrast** minimum 4.5:1 on all backgrounds — check dark slides especially
- [ ] **No placeholder text** remaining: "Lorem ipsum", "TODO", "[insert]", "XXXX", "YOUR TITLE HERE"
- [ ] **Consistent fonts** — same heading font and body font on every slide, no random switches
- [ ] **Consistent colors** — only palette hex values used, no off-palette colors
- [ ] **Title/closing match** — title slide and closing slide should feel like bookends (same background treatment)

### High Priority
- [ ] **No accent lines under titles** — this is the #1 tell of AI-generated slides. Use whitespace instead.
- [ ] **Every slide has a visual** — no text-only slides. Add shapes, dividers, icon circles, or background elements.
- [ ] **Content fills the slide** — no empty lower thirds. Content should reach y≥4.8" on every slide.
- [ ] **Layout variety** — no same layout used on two consecutive slides
- [ ] **At least 3 different slide types** used across the deck
- [ ] **4 items use 4-column layout** — never squeeze 4 items into 3-column spacing

### Design Quality
- [ ] **Motif consistency** — the chosen visual motif appears on every content slide
- [ ] **Color dominance** — primary color at 60-70%, secondary 20-30%, accent <10%
- [ ] **Stat callouts centered** — big numbers and their labels are horizontally centered
- [ ] **Body text left-aligned** — only titles and single-line callouts are centered
- [ ] **Minimum font sizes respected** — body ≥18pt, captions ≥11pt, titles ≥36pt
- [ ] **Slide prints well** — content readable when printed in grayscale

---

## UX Principles for Presentations

These translate web/app UX wisdom into presentation design decisions.

### Visual Hierarchy (from UI/UX Priority 1)
- Size creates hierarchy: title (36-44pt) > subhead (24-28pt) > body (18-20pt) > caption (11-13pt)
- Weight reinforces hierarchy: Bold headings, Regular body, Light captions
- Color reinforces hierarchy: Primary for headings, Text for body, Muted for captions
- One message per slide — if you can't summarize in one sentence, split it

### Spatial Design (from UI/UX Priority 5)
- 0.5" minimum margins from all edges — non-negotiable
- Consistent gutters between columns (0.25" standard)
- Content blocks have 0.3-0.5" breathing room between them
- Alignment is everything — tops of columns match, bottoms of grids match
- White space is a design element, not wasted space — 15-20% of every slide should be empty

### Typography (from UI/UX Priority 6)
- Maximum two font families (heading + body)
- Use weight for emphasis (Bold, Semibold) — never underline, rarely italic
- Body text minimum 18pt for back-of-room readability
- Stat callout numbers: 60-72pt bold for maximum impact
- Match font personality to industry (see industry rules above)

### Animation (from UI/UX Priority 7)
- 80% of slides: NO animation
- Only safe animations: Appear, Fade. Never Fly In, Bounce, Spin, Zoom
- Transitions between slides: Fade only. No wipes, swooshes, or pushes.
- Builds (step-by-step reveals): Max 1 animated element per slide
- Animation should clarify sequence, not decorate

### Data Presentation (from UI/UX chart rules)
- Every chart needs the "so what" — a callout explaining what it means
- Don't rely on color alone to convey meaning in charts — add labels
- Legends must be readable (12pt minimum)
- Stat callouts: show the number BIG, explain below SMALL
- Comparison slides: highlight the winner/recommended option with accent color

---

## Anti-Pattern Catalog

The most common AI-generated presentation problems. Actively avoid ALL of these:

| Anti-Pattern | Why It's Bad | Fix |
|---|---|---|
| Accent line under title | Universal AI-tell, looks generated | Use whitespace below titles instead |
| Every slide is bullet points | Lazy, boring, hard to scan | Convert to icon grids, two-column, or stat callouts |
| Emoji as icons (🚀📈💡) | Renders differently across PowerPoint/Google Slides/Mac/Windows | Use pptxgenjs shapes (OVAL, RECTANGLE) with text or Unicode |
| `LAYOUT_WIDE` instead of `LAYOUT_16x9` | Leaves right 25% of slide blank | Always use `pptx.layout = 'LAYOUT_16x9'` (10"×5.63") |
| Same layout on consecutive slides | Monotonous, looks template-generated | Alternate between at least 3 different slide types |
| Defaulting to blue | Generic, no personality | Match palette to topic/industry using the rules above |
| Purple gradient backgrounds | AI-slop signal | Use solid colors from palette, gradient only on title slide |
| Text-only slides | No visual interest, hard to remember | Add shapes, dividers, background elements, icon circles |
| Centering body text | Looks amateur, hard to scan | Left-align body text; center only titles and single-line callouts |
| Low-contrast muted text | Unreadable, fails accessibility | Muted text must still pass 4.5:1 contrast on its background |
| Empty lower third | Slide looks unfinished | Fill to y≥4.8" with content, anchors, or supporting elements |
| Dense paragraphs of text | Audience won't read it | Max 6 lines per text block; use "less is more" |
| Inconsistent motif | Some slides have it, some don't | Apply the chosen motif to EVERY content slide, same position |
| Random color choices | Feels undesigned, chaotic | Only use hex values from the defined palette constants |
