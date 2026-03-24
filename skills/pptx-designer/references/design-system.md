# Design System

A professional presentation design system. Read this before making any design decisions.

---

## Core Principles

1. **Visual Hierarchy** — Size, weight, color, and placement tell the audience what matters most. Title largest, subheads smaller, body smallest. Never let body text compete with titles.
2. **Contrast** — Every text element must pass a 4.5:1 contrast ratio. Test dark on light and light on dark. Avoid red-green combinations (colorblind accessibility).
3. **Whitespace** — Leave 15-20% of every slide empty. Cramped slides signal lack of confidence. Wider margins signal authority.
4. **Consistency** — Same fonts, same colors, same margins, same motif — across every slide. One deviation destroys the illusion of craft.
5. **One message per slide** — If a slide can't be summarized in one sentence, split it.
6. **Dominance** — One color dominates (60-70%), one supports (20-30%), one accents (<10%). Never equal weight.

---

## Typography System

### Font Rules
- Use **sans-serif only** for projected slides (serifs blur on screens)
- Maximum **two fonts**: one for headings, one for body
- Use **weight** (bold/semibold) for emphasis — not italics or underline
- Body text minimum **18pt** for readability from back of room

### Type Scale

| Element | Size | Weight | Alignment |
|---------|------|--------|-----------|
| Slide title | 36-44pt | Bold | Left (or center on title/section slides) |
| Section header | 24-28pt | Semibold | Left |
| Body text | 18-20pt | Regular | Left |
| Captions / labels | 11-13pt | Regular | Left |
| Key stat callout | 60-72pt | Bold | Center |
| Stat label (below callout) | 14-16pt | Regular | Center |

### Recommended Font Pairs

| Heading | Body | Tone |
|---------|------|------|
| Georgia | Calibri | Authoritative, editorial |
| Arial Black | Arial | Bold, corporate |
| Calibri Bold | Calibri Light | Clean, modern |
| Trebuchet MS | Calibri | Friendly, accessible |
| Palatino | Garamond | Premium, classic |
| Consolas | Calibri | Technical, developer |

---

## Layout System

### Slide Dimensions
- **16:9 Widescreen**: 10" × 5.63" (default — use this always)
- Set dimensions before building anything

### Grid & Margins
- **Outer margin**: 0.5" minimum from all edges
- **Content area**: 9" × 4.63" (within margins)
- **Column gutter**: 0.25" between columns
- **Block spacing**: 0.3-0.5" between content blocks
- Enable grid guides during design; disable for final export

### Two-Column Split Options
| Name | Left | Right | Best for |
|------|------|-------|----------|
| 50/50 | 4.37" | 4.37" | Comparison, text + image |
| 60/40 | 5.25" | 3.5" | Text-heavy content |
| 40/60 | 3.5" | 5.25" | Image-led content |

---

## Slide Type Patterns

### 1. Title Slide
- Full-width background (primary color or dark)
- Large title centered: 40-48pt bold
- Subtitle: 20-22pt, lighter weight
- Date/presenter bottom-right or bottom-center
- Logo if applicable, bottom-right

### 2. Section Divider
- Solid background using primary or accent color
- Section number (optional): large, faded, 80-100pt
- Section title: 36-44pt bold, white
- Short description: 18pt, lighter weight

### 3. Two-Column (Text + Visual)
- Left: headline + body text or bullet points
- Right: image, chart, or icon illustration
- Align tops of both columns
- Image should fill column with no extra whitespace

### 4. Data + Insight
- Chart takes 60% of slide (left or center)
- Insight callout takes 40% (right or bottom)
- Insight should be the "so what" — not a repeat of what the chart shows
- Use large bold text for insight (24-28pt)

### 5. Icon Grid (3-4 key points)
- 3 or 4 equally-spaced columns
- Each column: icon (48-64px) + bold header (20pt) + 2-3 line description (16pt)
- Icons in colored circles matching palette
- All columns same width and height

### 6. Big Stat Callout
- 1-3 stats maximum per slide
- Number: 60-72pt bold, primary or accent color
- Label: 14-16pt regular, below number
- Optional supporting text: 16pt, muted color
- Use for impact moments — revenue, growth, users

### 7. Comparison
- Two columns with identical structure
- Clear header per column (Option A / Option B, Before / After)
- Highlight the winner or preferred option with accent color border or background
- Differences only — don't repeat shared attributes

### 8. Timeline / Process Flow
- Horizontal: left to right for chronological
- Vertical: top to bottom for sequential steps
- Numbered circles or icons at each node
- Keep to 4-6 steps max per slide
- Current step highlighted

### 9. Key Takeaway
- Single message, centered
- 28-36pt, bold
- Dark slide or high-contrast treatment
- No more than two lines of text
- Optional: supporting icon above

### 10. Closing / CTA
- Similar treatment to title slide
- Clear action or contact
- Avoid "Thank You" as only content — add next step or question prompt

---

## Background Strategies

### Light (default for content slides)
- Background: `#FFFFFF` or `#F7F7F7`
- Text: `#1A1A1A` or `#2D2D2D`
- Good for readability, printing, and data-heavy slides

### Dark (title, section, closing slides)
- Background: primary dark color or `#1A1A2E`
- Text: `#FFFFFF` or light tint of secondary color
- Signals importance, premium feel

### Sandwich Structure (recommended default)
- Title slide: dark
- Content slides: light
- Closing slide: dark
- Creates visual rhythm and bookends the deck

### Gradient (use sparingly)
- One gradient across title slide only
- Never on content slides — hard to read
- Keep subtle: two adjacent shades, not extreme contrast

---

## Visual Motifs

Pick ONE motif and apply it consistently across every slide:

| Motif | How to Apply |
|-------|-------------|
| **Thick left border** | 6-8px vertical line in accent color, left edge of content area |
| **Colored icon circles** | All icons sit in a filled circle (primary or accent color) |
| **Rounded image frames** | All images clipped to rounded rectangle (corner radius 8-12px) |
| **Corner accent shape** | Small colored rectangle or triangle, top-right corner |
| **Numbered section badges** | Slide number in bold circle, top-left, accent color |
| **Subtle background shape** | Large faded geometric shape behind content (10-15% opacity) |

---

## Animation Rules (80/20)

- **80% of slides**: no animation
- **Safe animations**: Appear, Fade only
- **Never use**: Fly In, Bounce, Spin, Zoom
- **Builds**: Only for step-by-step reveals; max 1 animated element per slide
- **Transitions**: Fade between slides maximum; no wipes or swooshes
