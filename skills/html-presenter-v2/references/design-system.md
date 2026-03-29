# Design System — HTML Presenter v2

A comprehensive UI/UX design system for web-based presentations. Read this before making any design decisions.

---

## Core Principles

1. **Visual Hierarchy** — Size, weight, color, and animation timing tell the audience what matters. Titles largest and first to animate, body text appears after, supporting elements last.
2. **Contrast** — Every text element must pass WCAG 4.5:1 contrast ratio. Test dark-on-light and light-on-dark. Avoid red-green combinations.
3. **Breathing Room** — Leave 15-20% of every slide empty. Use `padding: 5vw 6vw` minimum on slide containers. Cramped slides signal lack of confidence.
4. **Consistency** — Same fonts, same colors, same spacing tokens, same animation timings, same motif — across every slide. One deviation destroys the illusion of craft.
5. **One Message Per Slide** — If a slide can't be summarized in one sentence, split it.
6. **Color Dominance** — One color dominates (60-70%), one supports (20-30%), one accents (<10%). Never equal weight.
7. **Motion With Purpose** — Every animation must serve a purpose: reveal hierarchy, guide attention, create continuity. Gratuitous animation is worse than no animation.
8. **Progressive Disclosure** — Content should appear in reading order. Use fragment animations to control what the audience sees and when.

---

## CSS Architecture

### Variable System

All design tokens are CSS custom properties on `:root`. This makes the entire theme swappable with one block of overrides.

```css
:root {
  /* === Color Palette === */
  --color-primary: #1E2761;
  --color-secondary: #CADCFC;
  --color-accent: #4F8EF7;
  --color-bg: #FFFFFF;
  --color-bg-dark: #1E2761;
  --color-text: #1A1A2E;
  --color-text-light: #FFFFFF;
  --color-text-muted: #6B7280;
  --color-surface: #F8F9FA;
  --color-border: #E5E7EB;

  /* === Typography === */
  --font-heading: 'Playfair Display', serif;
  --font-body: 'Source Sans 3', sans-serif;
  --font-mono: 'JetBrains Mono', monospace;

  /* === Type Scale (fluid) === */
  --text-hero: clamp(3rem, 6vw, 5rem);
  --text-title: clamp(2rem, 4vw, 3.5rem);
  --text-subtitle: clamp(1.4rem, 2.5vw, 2rem);
  --text-body: clamp(1rem, 1.5vw, 1.3rem);
  --text-small: clamp(0.8rem, 1vw, 1rem);
  --text-caption: clamp(0.7rem, 0.9vw, 0.85rem);

  /* === Spacing === */
  --space-xs: 0.5rem;
  --space-sm: 1rem;
  --space-md: 2rem;
  --space-lg: 4rem;
  --space-xl: 6rem;
  --slide-padding: 5vw 6vw;

  /* === Animation === */
  --ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);
  --ease-out-back: cubic-bezier(0.34, 1.56, 0.64, 1);
  --ease-in-out: cubic-bezier(0.65, 0, 0.35, 1);
  --duration-fast: 0.3s;
  --duration-normal: 0.6s;
  --duration-slow: 1s;
  --duration-dramatic: 1.5s;
  --stagger-delay: 0.1s;

  /* === Layout === */
  --slide-max-width: 1200px;
  --slide-aspect-ratio: 16 / 9;
  --border-radius-sm: 8px;
  --border-radius-md: 16px;
  --border-radius-lg: 24px;
  --border-radius-xl: 32px;
}
```

### Slide Container System

Every slide is a full-viewport section with scroll-snap alignment:

```css
.slides-container {
  width: 100vw;
  height: 100vh;
  overflow-y: auto;
  scroll-snap-type: y mandatory;
  scroll-behavior: smooth;
}

.slide {
  width: 100vw;
  height: 100vh;
  scroll-snap-align: start;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: var(--slide-padding);
  position: relative;
  overflow: hidden;
}

.slide-content {
  max-width: var(--slide-max-width);
  margin: 0 auto;
  width: 100%;
}
```

### Responsive Breakpoints

```css
/* Tablet */
@media (max-width: 1024px) {
  :root {
    --slide-padding: 4vw 5vw;
  }
}

/* Mobile */
@media (max-width: 768px) {
  :root {
    --slide-padding: 6vw 5vw;
  }
  .two-col { flex-direction: column; }
  .card-grid { grid-template-columns: 1fr; }
}
```

---

## Typography System

### Font Selection Rules

- Use **Google Fonts** embedded via `@import` — never system fonts as primary
- Maximum **two font families** + optional monospace for code
- Heading font: distinctive, characterful (display, serif, or bold sans-serif)
- Body font: highly readable, clean (sans-serif or humanist serif)
- NEVER use Inter, Roboto, Arial, or system-ui as primary fonts

### Recommended Font Pairings

| Heading | Body | Tone | Google Fonts import |
|---------|------|------|---------------------|
| Playfair Display | Source Sans 3 | Elegant, editorial | `Playfair+Display:wght@700;900&family=Source+Sans+3:wght@300;400;600` |
| Space Grotesk | DM Sans | Modern, tech | `Space+Grotesk:wght@500;700&family=DM+Sans:wght@400;500` |
| Fraunces | Inter Tight | Warm, approachable | `Fraunces:wght@700;900&family=Inter+Tight:wght@400;500` |
| Syne | Work Sans | Bold, creative | `Syne:wght@700;800&family=Work+Sans:wght@300;400;600` |
| Bebas Neue | Karla | Impact, modern | `Bebas+Neue&family=Karla:wght@400;500;700` |
| Cormorant Garamond | Lato | Classic, premium | `Cormorant+Garamond:wght@600;700&family=Lato:wght@300;400` |
| Outfit | Nunito Sans | Friendly, SaaS | `Outfit:wght@600;800&family=Nunito+Sans:wght@400;600` |
| Clash Display | General Sans | Startup, bold | Use `@font-face` with variable fonts from Fontshare |
| JetBrains Mono | IBM Plex Sans | Developer, technical | `JetBrains+Mono:wght@400;700&family=IBM+Plex+Sans:wght@300;400;600` |

### Type Scale Usage

| Element | Variable | Weight | Alignment |
|---------|----------|--------|-----------|
| Hero title (title slide) | `--text-hero` | 900/Black | Center or Left |
| Slide title | `--text-title` | 700/Bold | Left |
| Subtitle / section header | `--text-subtitle` | 600/Semibold | Left |
| Body text | `--text-body` | 400/Regular | Left |
| Captions / labels | `--text-small` | 400/Regular | Left |
| Stat callout number | `--text-hero` | 900/Black | Center |
| Stat label | `--text-caption` | 400/Regular | Center |
| Code | `--text-body` | 400/Regular (mono) | Left |

---

## Layout System

### Slide Types & Grid Patterns

#### Full-Screen Hero
```css
.slide-hero {
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  background: var(--color-bg-dark);
  color: var(--color-text-light);
}
```

#### Two-Column (50/50, 60/40, 40/60)
```css
.two-col {
  display: grid;
  grid-template-columns: 1fr 1fr; /* or 3fr 2fr, or 2fr 3fr */
  gap: var(--space-lg);
  align-items: center;
}
```

#### Card Grid (3 or 4 columns)
```css
.card-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* or repeat(4, 1fr) */
  gap: var(--space-md);
}

.card {
  background: var(--color-surface);
  border-radius: var(--border-radius-md);
  padding: var(--space-md);
}
```

#### Stat Row
```css
.stat-row {
  display: flex;
  justify-content: space-around;
  text-align: center;
  gap: var(--space-lg);
}
```

---

## Background Strategies

### Light (content slides)
```css
.slide-light {
  background: var(--color-bg);
  color: var(--color-text);
}
```

### Dark (title, section, closing slides)
```css
.slide-dark {
  background: var(--color-bg-dark);
  color: var(--color-text-light);
}
```

### Gradient (use sparingly — title/closing only)
```css
.slide-gradient {
  background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-accent) 100%);
  color: var(--color-text-light);
}
```

### Mesh Gradient (premium feel)
```css
.slide-mesh {
  background:
    radial-gradient(at 20% 80%, hsla(210, 80%, 40%, 0.3) 0%, transparent 50%),
    radial-gradient(at 80% 20%, hsla(280, 60%, 50%, 0.2) 0%, transparent 50%),
    radial-gradient(at 50% 50%, hsla(340, 70%, 50%, 0.1) 0%, transparent 50%),
    var(--color-bg-dark);
  color: var(--color-text-light);
}
```

### Sandwich Structure (recommended default)
- Title slide: dark/gradient
- Content slides: light
- Section dividers: dark
- Closing slide: dark/gradient

---

## Visual Motifs

Pick ONE motif and apply consistently across every content slide:

| Motif | CSS Implementation |
|-------|-------------------|
| **Thick left border** | `border-left: 4px solid var(--color-accent)` on content containers |
| **Corner accent** | `::before` pseudo-element with accent-colored rectangle, top-right |
| **Dot grid background** | `radial-gradient(circle, var(--color-border) 1px, transparent 1px)` with `background-size: 20px 20px` |
| **Diagonal stripe** | Repeating-linear-gradient at 45deg |
| **Floating shapes** | Absolutely-positioned SVG circles/blobs with low opacity, subtle animation |
| **Gradient line** | Thin gradient border-bottom on slide titles |
| **Card elevation** | All content in cards with `box-shadow` and `border-radius` |
| **Numbered badges** | Slide number in a colored circle, top-left of each content slide |

---

## Accessibility Requirements

These are non-negotiable:

1. **Keyboard navigation** — Arrow keys (and Space) navigate between slides. Focus management is correct.
2. **Reduced motion** — All animations wrapped in `@media (prefers-reduced-motion: no-preference) { ... }`. Layout must work without animation.
3. **Contrast** — 4.5:1 minimum for body text, 3:1 for large text (>24px).
4. **Focus styles** — Visible `:focus-visible` outlines on all interactive elements.
5. **Semantic HTML** — Headings, paragraphs, lists, figures used correctly.
6. **ARIA** — `role="region"` and `aria-label` on slides. `aria-current="true"` on active slide indicator.

---

## Print / PDF Export

Include a print stylesheet so the user can File > Print > Save as PDF:

```css
@media print {
  .slides-container {
    overflow: visible;
    scroll-snap-type: none;
  }
  .slide {
    page-break-after: always;
    height: auto;
    min-height: 100vh;
    scroll-snap-align: unset;
  }
  .slide-counter, .progress-bar, .nav-controls { display: none; }
  * { animation: none !important; transition: none !important; }
}
```
