# Industry Reasoning & UX Guidelines — HTML Presenter v2

Adapted from UI/UX best practices. Use these rules to match presentation style to industry/audience and avoid common anti-patterns.

---

## Industry → Style Matching Rules

When the user describes their topic or audience, use these rules to select the optimal palette, typography, animation level, and slide structure. This avoids generic defaults.

### Tech & SaaS
- **Style**: Deep Ocean, Neon Circuit, or Charcoal Minimal
- **Typography mood**: Clean, modern, geometric sans-serif (Space Grotesk, Outfit, DM Sans)
- **Animation**: Rich — stat counters, staggered card grids, code syntax highlighting
- **Key effects**: Gradient mesh backgrounds, subtle floating particles, card hover lifts
- **Anti-patterns**: Clip-art style icons, overly playful fonts, busy backgrounds
- **Slide structure**: Problem → Solution → Demo/Product → Traction → Team → Ask

### Finance & Enterprise
- **Style**: Midnight Executive, Charcoal Minimal
- **Typography mood**: Authoritative, conservative (Playfair Display + Source Sans, Cormorant Garamond + Lato)
- **Animation**: Minimal — fade-in, stat counters only. No particles or flashy transitions
- **Key effects**: Clean divider lines, muted accent colors, data visualizations
- **Anti-patterns**: Neon colors, dark mode unless specifically requested, emoji as icons, playful animations
- **Slide structure**: Executive Summary → Key Metrics → Analysis → Recommendations → Next Steps

### Healthcare & Wellness
- **Style**: Sage Calm, Teal Trust
- **Typography mood**: Calming, humanist (Nunito Sans, Karla, Lato)
- **Animation**: Gentle — slow fades, no abrupt transitions, respect reduced-motion
- **Key effects**: Soft shadows, organic shapes, muted green/blue palettes
- **Anti-patterns**: Harsh contrast, red as primary color, fast animations, dark themes
- **Slide structure**: Context → Impact → Approach → Evidence → Outcomes

### Marketing & Consumer
- **Style**: Coral Punch, Cherry Bold, Electric Violet
- **Typography mood**: Bold, energetic (Syne, Bebas Neue + Karla)
- **Animation**: Rich — big reveals, stat counters with emphasis, card lifts, gradient shifts
- **Key effects**: Gradient backgrounds, bold accent colors, dynamic layouts
- **Anti-patterns**: Corporate stiffness, muted colors, dense text slides
- **Slide structure**: Hook → Problem → Solution → Benefits → Social Proof → CTA

### Education & Academic
- **Style**: Warm Editorial, Paper & Ink, Sage Calm
- **Typography mood**: Readable, editorial (Fraunces + Inter Tight, Cormorant Garamond + Lato)
- **Animation**: Moderate — fragment reveals for step-by-step learning, timeline animations
- **Key effects**: Clean typography, generous whitespace, numbered sequences
- **Anti-patterns**: Over-animation, dark themes, dense data without explanation
- **Slide structure**: Objective → Context → Concepts → Examples → Summary → Discussion

### Creative & Design
- **Style**: Electric Violet, Neon Circuit, or custom bold palette
- **Typography mood**: Distinctive, unexpected (Syne, Clash Display, or editorial serif)
- **Animation**: Rich and expressive — morph transitions, clip-path reveals, kinetic typography
- **Key effects**: Asymmetric layouts, oversized typography, bold color blocking
- **Anti-patterns**: Conservative corporate palettes, predictable grid layouts, safe font choices
- **Slide structure**: Vision → Work/Portfolio → Process → Impact → What's Next

### Sustainability & Environment
- **Style**: Forest & Moss
- **Typography mood**: Organic, warm (Fraunces, Cormorant Garamond)
- **Animation**: Subtle — nature-inspired timing, gentle reveals
- **Key effects**: Organic shapes, earth-tone gradients, textured backgrounds
- **Anti-patterns**: Neon colors, tech-focused aesthetics, aggressive animations
- **Slide structure**: Why It Matters → Current State → Our Approach → Impact → Join Us

### Developer & Technical
- **Style**: Terminal Dark, Neon Circuit
- **Typography mood**: Monospace-influenced (JetBrains Mono + IBM Plex Sans)
- **Animation**: Code-focused — syntax highlighting, terminal typing effects, line-by-line reveals
- **Key effects**: Code blocks with highlighting, dark backgrounds, terminal aesthetics
- **Anti-patterns**: Overly corporate palettes, serif fonts, clip-art icons
- **Slide structure**: Problem → Architecture → Implementation → Demo → Performance → Next Steps

---

## Pre-Delivery Checklist

Run through these checks before delivering ANY presentation. Inspired by UUPM's delivery validation.

### Critical (Must Pass)
- [ ] **No emoji as icons** — use SVG or CSS shapes. Emoji render differently across platforms
- [ ] **cursor: pointer** on all clickable/interactive elements
- [ ] **Hover states** with smooth transitions (150-300ms) on all interactive cards/buttons
- [ ] **Text contrast** minimum 4.5:1 on all backgrounds (use devtools to verify)
- [ ] **Focus states** visible for keyboard navigation (`:focus-visible` with outline)
- [ ] **prefers-reduced-motion** respected — all `@keyframes` wrapped
- [ ] **Responsive** tested at 375px, 768px, 1024px, 1440px widths
- [ ] **Keyboard navigation** works end-to-end (arrow keys through all slides)

### High Priority
- [ ] **No placeholder text** remaining (Lorem ipsum, TODO, [insert], XXXX)
- [ ] **Consistent spacing** — uses CSS variable spacing scale throughout
- [ ] **Consistent colors** — only palette variables used, no off-palette hex
- [ ] **Font loaded** — Google Fonts `@import` present and valid
- [ ] **Slide counter** accurate and visible
- [ ] **Progress bar** fills correctly from 0% to 100%
- [ ] **No horizontal scroll** on any viewport size
- [ ] **Print stylesheet** included

### Design Quality
- [ ] **No AI-slop patterns**: no purple gradients on white, no Inter/Roboto/Arial, no generic card-on-gray
- [ ] **Visual motif** consistently applied across all slides
- [ ] **Layout variety** — no two consecutive slides share the same template
- [ ] **Every slide has a visual** — no text-only slides
- [ ] **Typography hierarchy** clear: title > subtitle > body > caption
- [ ] **Dark/light consistency** — all dark slides match, all light slides match
- [ ] **Slide fills viewport** — no awkward empty quadrants

---

## UX Guidelines by Priority

### Priority 1: Accessibility (CRITICAL)

These are non-negotiable for any presentation:

- **Color contrast**: 4.5:1 minimum for body text, 3:1 for large text (24px+)
- **Don't convey info by color alone**: always pair with text or icon
- **Keyboard navigation**: Tab order matches visual order, arrow keys work
- **Focus rings**: 2-4px visible outlines on interactive elements
- **Reduced motion**: Respect `prefers-reduced-motion`, provide instant state
- **Semantic HTML**: Use `<section>`, `<h1>`-`<h3>`, `<p>`, `<blockquote>`, `<figure>`
- **ARIA roles**: `role="region"` on slides, `aria-label` where needed

### Priority 2: Interaction (CRITICAL)

- **Touch targets**: Minimum 44×44px for any clickable/tappable element
- **Touch spacing**: Minimum 8px gap between interactive elements
- **Don't rely on hover alone**: all hover information must be accessible via tap/click
- **Loading feedback**: Show visual feedback within 100ms of user action
- **Error feedback**: Clear messages near the source of the problem
- **Press feedback**: Subtle scale (0.95-1.05) on press for tappable cards

### Priority 3: Animation (HIGH)

- **Duration**: 150-300ms for micro-interactions; 300-600ms for transitions; never >800ms
- **Easing**: `ease-out` for entering (fast start, slow settle); `ease-in` for exiting
- **Performance**: Only animate `transform` and `opacity`. Never animate `width`, `height`, `top`, `left`
- **Stagger**: List/grid items entrance staggered by 80-120ms per item
- **One hero per slide**: One element gets the dramatic animation; everything else is subtle
- **Interruptible**: User action should be able to interrupt any animation
- **Exit < Enter**: Exit animations should be 60-70% the duration of entrance
- **No blocking**: Never block user input during animation

### Priority 4: Typography (MEDIUM)

- **Base size**: Minimum 16px (1rem) body text — avoids iOS auto-zoom
- **Line height**: 1.5-1.75 for body text
- **Line length**: 35-60 characters on mobile, 60-75 on desktop
- **Font scale**: Consistent scale: `--text-caption` < `--text-small` < `--text-body` < `--text-subtitle` < `--text-title` < `--text-hero`
- **Weight hierarchy**: Bold (700) headings, Regular (400) body, Medium (500) labels
- **No orphans**: Avoid single words on their own line in headings (use `text-wrap: balance`)

### Priority 5: Layout (MEDIUM)

- **Mobile-first**: Design for narrow first, scale up
- **Viewport meta**: Always include `width=device-width, initial-scale=1`
- **Consistent breakpoints**: 375 / 768 / 1024 / 1440px
- **Spacing scale**: Use 4px/8px incremental system via CSS variables
- **No horizontal scroll**: Ensure all content fits viewport width
- **Z-index scale**: Define layers: 0 (base) / 10 (cards) / 50 (modals) / 100 (chrome/progress)
- **Viewport units**: Prefer `min-height: 100dvh` over `100vh` on mobile

---

## Modern UI Styles Reference

Beyond our core palettes, these named styles can inspire presentation aesthetics:

| Style | Best For | Key CSS Techniques |
|-------|----------|-------------------|
| **Glassmorphism** | Modern SaaS, financial | `backdrop-filter: blur(20px)`, semi-transparent backgrounds, subtle borders |
| **Neumorphism** | Wellness, calm apps | Dual box-shadows (light + dark), soft insets, muted palette |
| **Bento Grid** | Dashboards, feature showcases | CSS Grid with varying spans, card-based layouts, rounded corners |
| **Kinetic Typography** | Hero sections, marketing | Animated text reveals, varying weights, clip-path on text |
| **Editorial Grid** | News, thought leadership | Magazine-style columns, drop caps, pull quotes, serif fonts |
| **Gradient Mesh** | Premium, creative | Multi-stop radial gradients, animated background positions |
| **Soft UI** | Wellness, premium services | Soft shadows, subtle depth, organic shapes, warm palette |
| **Brutalism** | Design portfolios, art | Raw borders, system fonts, high contrast, intentional roughness |
| **Dark Mode (OLED)** | Dev tools, night mode | True black (#000) backgrounds, careful contrast, subtle borders |
| **Swiss Modern** | Corporate, architecture | Strict grid, Helvetica-inspired type, minimal color, precise spacing |

### Applying Styles to Presentations

When a style is chosen, it affects three things:
1. **Background treatment** — gradient type, texture, solid vs. layered
2. **Card/content container styling** — borders, shadows, radius, opacity
3. **Animation character** — spring vs. linear, speed, amount of motion

Example: A "Glassmorphism" presentation would use:
```css
.card {
  background: rgba(255, 255, 255, 0.15);
  backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: var(--border-radius-lg);
}
```

While a "Brutalist" presentation would use:
```css
.card {
  background: var(--color-bg);
  border: 3px solid var(--color-text);
  border-radius: 0;
  box-shadow: 4px 4px 0 var(--color-text);
}
```

---

## Anti-Pattern Catalog

These are the most common AI-generated presentation problems. Actively avoid all of them:

| Anti-Pattern | Why It's Bad | Fix |
|---|---|---|
| Purple gradient on white | Universal AI-slop signal | Use industry-matched palette from color-palettes.md |
| Inter/Roboto/Arial as primary | Generic, forgettable | Choose from recommended font pairings |
| Emoji as icons (🚀 📈 💡) | Renders inconsistently across platforms | Use CSS shapes, SVG, or Unicode symbols with careful fallbacks |
| Every card identical | No hierarchy, boring | Vary card sizes, highlight one card, use different layouts |
| Animation on everything | Distracting, hurts performance | One hero animation per slide, everything else subtle |
| Decorative-only animation | No purpose, wastes attention | Every animation must guide attention or show hierarchy |
| Gray text on gray background | Unreadable, fails contrast | Use `--color-text-muted` that passes 4.5:1 on its background |
| Centering all text | Looks amateur, hard to scan | Left-align body text; center only titles and single-line callouts |
| No reduced-motion support | Accessibility violation | Wrap all `@keyframes` in `@media (prefers-reduced-motion: no-preference)` |
| Fixed heights that clip text | Content gets cut off at different sizes | Use `min-height` and flexible containers |
| Mixing serif and sans-serif randomly | Inconsistent, unpolished | Pick one heading + one body font and stick to them |
| Too many colors | Visual chaos | Maximum 3 core colors: primary (60%), secondary (30%), accent (10%) |
