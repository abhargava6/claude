---
name: html-presenter-v2
description: >
  Use this skill when the user wants an interactive, web-based HTML presentation with animations, transitions, scroll effects, or modern web aesthetics. Trigger on "HTML presentation", "web slides", "interactive deck", "animated slides", "browser presentation", "HTML slides", or requests for a single-file presentation with features beyond PowerPoint. Also trigger on "reveal.js style", "frontend slides", or "present in browser". Prefer over pptx-designer when the user values interactivity, animations, web sharing, or modern design over PowerPoint compatibility. Produces single-file, zero-dependency, production-quality HTML presentations with professional animations and a curated design system.
---

# HTML Presenter v2

A skill for creating **interactive, animation-rich, web-based HTML presentations** — single-file, zero-dependency, production-quality.

## Quick Reference

| Goal | Guide |
|------|-------|
| Design system & CSS architecture | [references/design-system.md](references/design-system.md) |
| Slide type HTML templates | [references/slide-templates.md](references/slide-templates.md) |
| Color palettes & theming | [references/color-palettes.md](references/color-palettes.md) |
| Animation & interaction patterns | [references/animations.md](references/animations.md) |
| Industry matching & UX rules | [references/industry-ux-rules.md](references/industry-ux-rules.md) |
| QA checklist | [references/qa-checklist.md](references/qa-checklist.md) |

---

## Philosophy

1. **Single file, zero dependencies.** Every presentation is ONE `.html` file with inline CSS and JS. No npm, no CDN, no build tools. It will work in 10 years.
2. **Web-native power.** Leverage what the web can do that PowerPoint cannot: scroll-driven animations, embedded interactive widgets, live data, particle effects, CSS Grid/Flexbox layouts, view transitions.
3. **Anti-AI-slop.** Every deck should feel custom-crafted. No purple gradients on white. No Inter font. No cookie-cutter layouts. Distinctive, memorable, intentional design.
4. **Show, don't tell.** Let the user pick from visual style previews rather than describing preferences in words.
5. **Accessible by default.** Keyboard navigation, reduced-motion support, semantic HTML, good contrast ratios.

---

## Step 0 — Understand the Brief

Before writing a single slide, gather:

1. **Topic** — What is this presentation about?
2. **Audience** — Technical team? Executives? Investors? Students? Conference?
3. **Goal** — Inform, persuade, sell, report, teach?
4. **Slide count** — How many slides? (Default: 8-12 if not specified)
5. **Interaction level** — Minimal (keyboard nav only), Standard (animations + fragments), Rich (scroll effects, interactive widgets, particle backgrounds)?
6. **Brand/style** — Any specific colors, fonts, or existing brand guide?
7. **Delivery context** — Projector? Screen share? Self-paced reading? Shared link?

If the user hasn't provided these, ask for audience and goal at minimum. The rest can be inferred.

**Delivery context shapes interaction choices:**
- **Projector/stage** → keyboard-driven, large type, fewer scroll effects, speaker notes
- **Screen share** → moderate animations, focus on clarity
- **Self-paced / shared link** → rich scroll animations, interactive elements, progress indicators
- **Conference talk** → speaker notes panel, timer, slide count

---

## Step 1 — Design Decisions

Before generating, make conscious design decisions. Read [references/design-system.md](references/design-system.md) for the full system.

**Always decide upfront:**
- Industry/audience → style match (see [references/industry-ux-rules.md](references/industry-ux-rules.md) for reasoning rules)
- Color palette (see [references/color-palettes.md](references/color-palettes.md))
- Font pairing — use Google Fonts embedded via `@import` (heading + body)
- Visual motif (one repeating design element across all slides)
- Animation philosophy (minimal/elegant vs. rich/dynamic — matched to industry)
- Navigation model (keyboard arrows, scroll-snap, or hybrid)

**Industry matching matters.** A healthcare deck and a startup pitch should look and feel completely different. Use the industry reasoning rules to select palette, typography, and animation intensity automatically based on the user's topic and audience.

**Never start without a plan.** Default choices produce forgettable presentations.

---

## Step 2 — Plan the Slide Structure

Draft a slide-by-slide outline before building:

```
1. Title slide — [topic + subtitle + animated entrance]
2. Agenda/Overview — [interactive progress or card grid]
3-N. Content slides (vary layouts — never repeat same layout twice in a row)
N-1. Key takeaway — [full-screen statement with emphasis animation]
N. Call to action / closing — [contact + links]
```

Use a variety of slide types from [references/slide-templates.md](references/slide-templates.md):
- Hero with animated text reveal
- Two-column (text + visual)
- Stat callout with counting animation
- Icon/card grid with stagger entrance
- Timeline / process flow with scroll reveal
- Comparison (side-by-side cards)
- Full-bleed image with overlay text
- Interactive data visualization
- Code showcase with syntax highlighting
- Quote / testimonial with large typography
- Key takeaway (single bold message)

---

## Step 3 — Build

Read [references/slide-templates.md](references/slide-templates.md) for ready-to-use HTML/CSS/JS templates for each slide type.

### Architecture Rules

1. **Single `.html` file** — ALL CSS in a `<style>` block, ALL JS in a `<script>` block at the end of `<body>`.
2. **CSS custom properties** — Define the palette, fonts, spacing, and animation timings as CSS variables on `:root`. Every color and font reference uses variables.
3. **Semantic HTML** — Each slide is a `<section class="slide" id="slide-N">`. Use `<h1>`-`<h3>`, `<p>`, `<figure>`, `<blockquote>` etc.
4. **Navigation engine** — Include the standard JS navigation engine (keyboard arrows, touch swipe, scroll-snap, optional progress bar). See the boilerplate in [references/slide-templates.md](references/slide-templates.md).
5. **Responsive** — Use `vw`/`vh`/`vmin` units for key dimensions. Slides must look good at 1920×1080, 1366×768, and mobile.
6. **Reduced motion** — Wrap all animations in `@media (prefers-reduced-motion: no-preference)`. Provide instant state for reduced-motion users.
7. **Google Fonts** — Embed via `@import url('https://fonts.googleapis.com/css2?family=...')` at the top of `<style>`. Choose distinctive, memorable font pairings — NEVER use Inter, Roboto, Arial, or system defaults.

### Key Rules While Building

- Every slide needs at least one non-text visual element (shape, gradient, SVG, animation, icon)
- Left-align body text; center only titles and single-line callouts
- Minimum `5vw` padding from all edges
- Use CSS Grid or Flexbox for layouts — never absolute positioning for core content
- Include slide counter (e.g., "3 / 12") in corner
- Use `scroll-snap-type: y mandatory` on the container for scroll-based navigation
- Fragment animations (elements appearing in sequence) use CSS classes toggled by JS
- All interactive elements have visible focus styles

### Font Embedding Pattern

```css
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=Source+Sans+3:wght@300;400;600&display=swap');

:root {
  --font-heading: 'Playfair Display', serif;
  --font-body: 'Source Sans 3', sans-serif;
}
```

---

## Step 4 — QA

**Assume there are visual problems. Your job is to find them.**

Read [references/qa-checklist.md](references/qa-checklist.md) for the full visual/navigation/responsive checklist.
Read [references/industry-ux-rules.md](references/industry-ux-rules.md) § "Pre-Delivery Checklist" for the critical anti-pattern checks.

Save the HTML file, then open it in a browser for visual inspection:

```bash
# Save to output
cp presentation.html /mnt/user-data/outputs/presentation.html
```

### Self-inspection checklist (run through every slide):
1. Open the file and press arrow keys through every slide
2. Check each slide for: text overflow, contrast issues, empty space, alignment problems
3. Test at 1920×1080 and resize to smaller viewport
4. Verify all animations play correctly on enter
5. Check keyboard navigation works forwards and backwards
6. Verify slide counter is accurate
7. Test that reduced-motion media query doesn't break layout

---

## Step 5 — Deliver

Save the final `.html` file to `/mnt/user-data/outputs/` and present it.

Always summarize:
- Design choices made (palette, fonts, motif, animation style)
- Slide count and structure
- Navigation instructions (arrow keys, scroll, etc.)
- Any interactive features included
- How to share (it's just a file — open in any browser)

---

## Common Mistakes to Avoid

- **Multiple files** — NEVER create separate CSS/JS files. Everything goes in one `.html` file.
- **CDN dependencies** — NEVER link to external JS libraries (reveal.js, etc.). Everything is self-contained. The ONE exception is Google Fonts `@import`.
- **Generic fonts** — NEVER use Inter, Roboto, Arial, system-ui as the primary font. Choose something distinctive.
- **Purple gradients on white** — The hallmark of AI-generated design. Avoid entirely.
- **Forgetting reduced motion** — ALWAYS wrap animations in `@media (prefers-reduced-motion: no-preference)`.
- **Broken navigation** — ALWAYS test arrow key navigation through every slide before delivering.
- **Centering body text** — Only center titles and single-line callouts. Body text is left-aligned.
- **Missing slide counter** — Every presentation needs a visible slide indicator.
- **All-text slides** — Every slide needs a visual element: gradient, shape, icon, animation, SVG.
- **Repeating layouts** — Never use the same layout on two consecutive slides.
- **Invisible focus styles** — Interactive elements must have visible `:focus` outlines.
- **Tiny text** — Minimum `1.1rem` for body text, `2.5rem` for titles (based on vw/vh slide sizing).

---

## Dependencies

- None for the output (single HTML file)
- Google Fonts (loaded via CSS `@import` — gracefully falls back to system fonts)
- For QA: a modern web browser (Chrome, Firefox, Safari, Edge)
