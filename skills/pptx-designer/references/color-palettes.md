# Color Palettes

Professional color palettes for presentation design. Each palette includes primary, secondary, accent, background, and text values.

---

## How to Choose a Palette

Match the palette to the **topic and audience** — not just personal preference.

| Situation | Recommended Palette |
|-----------|-------------------|
| Investor/executive pitch | Midnight Executive, Charcoal Minimal, Ocean Gradient |
| Product/tech presentation | Teal Trust, Ocean Gradient, Charcoal Minimal |
| Marketing/brand | Coral Energy, Cherry Bold, Berry & Cream |
| Sustainability/environment | Forest & Moss, Sage Calm |
| Healthcare/wellness | Sage Calm, Teal Trust |
| Startup/energy | Coral Energy, Cherry Bold |
| Finance/professional | Midnight Executive, Charcoal Minimal |

**Rule**: If you could swap your palette into a completely different presentation and it would still "work," you haven't made specific enough choices.

---

## Palettes

### Midnight Executive
*Best for: investor decks, board presentations, enterprise sales*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#1E2761` | Navy — headings, title backgrounds |
| Secondary | `#CADCFC` | Ice blue — subheads, borders, icons |
| Accent | `#4F8EF7` | Bright blue — CTAs, highlights |
| Background | `#FFFFFF` | Content slides |
| Text | `#1A1A2E` | Body text |
| Dark BG | `#1E2761` | Title/closing slides |

---

### Charcoal Minimal
*Best for: clean corporate, design-conscious audiences, SaaS*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#36454F` | Charcoal — headings |
| Secondary | `#F2F2F2` | Off-white — backgrounds |
| Accent | `#212121` | Near-black — strong emphasis |
| Background | `#FFFFFF` | Content slides |
| Text | `#2D2D2D` | Body text |
| Dark BG | `#36454F` | Title/closing slides |

---

### Ocean Gradient
*Best for: technology, data, analytics presentations*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#065A82` | Deep blue — headings |
| Secondary | `#1C7293` | Teal — subheads, icons |
| Accent | `#02C39A` | Mint — highlights, CTAs |
| Background | `#F7FBFF` | Content slides |
| Text | `#0D1B2A` | Body text |
| Dark BG | `#21295C` | Title/closing slides |

---

### Teal Trust
*Best for: healthcare, fintech, professional services*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#028090` | Teal — headings |
| Secondary | `#00A896` | Seafoam — subheads |
| Accent | `#02C39A` | Mint — highlights |
| Background | `#F5FAFA` | Content slides |
| Text | `#1A2E2E` | Body text |
| Dark BG | `#014F59` | Title/closing slides |

---

### Coral Energy
*Best for: marketing, consumer products, startups*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#F96167` | Coral — headings, key elements |
| Secondary | `#2F3C7E` | Navy — supporting elements |
| Accent | `#F9E795` | Gold — highlights |
| Background | `#FFFFFF` | Content slides |
| Text | `#1A1A1A` | Body text |
| Dark BG | `#2F3C7E` | Title/closing slides |

---

### Forest & Moss
*Best for: sustainability, environment, impact reports*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#2C5F2D` | Forest green — headings |
| Secondary | `#97BC62` | Moss — subheads, icons |
| Accent | `#F5F5DC` | Cream — backgrounds, highlights |
| Background | `#FAFAF5` | Content slides |
| Text | `#1A2A1A` | Body text |
| Dark BG | `#1A3A1B` | Title/closing slides |

---

### Warm Terracotta
*Best for: hospitality, real estate, lifestyle brands*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#B85042` | Terracotta — headings |
| Secondary | `#E7E8D1` | Sand — backgrounds |
| Accent | `#A7BEAE` | Sage — supporting elements |
| Background | `#FAFAF7` | Content slides |
| Text | `#2A1A18` | Body text |
| Dark BG | `#7A3028` | Title/closing slides |

---

### Cherry Bold
*Best for: sales, high-energy pitches, consumer brands*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#990011` | Cherry — headings, bold elements |
| Secondary | `#2F3C7E` | Navy — supporting elements |
| Accent | `#FCF6F5` | Off-white — text on dark |
| Background | `#FFFFFF` | Content slides |
| Text | `#1A0A0A` | Body text |
| Dark BG | `#660009` | Title/closing slides |

---

### Berry & Cream
*Best for: luxury, beauty, premium consumer*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#6D2E46` | Berry — headings |
| Secondary | `#A26769` | Dusty rose — subheads |
| Accent | `#ECE2D0` | Cream — backgrounds, highlights |
| Background | `#FBF8F5` | Content slides |
| Text | `#2A1020` | Body text |
| Dark BG | `#4A1E30` | Title/closing slides |

---

### Sage Calm
*Best for: wellness, healthcare, mindfulness, education*

| Role | Hex | Usage |
|------|-----|-------|
| Primary | `#84B59F` | Sage — headings |
| Secondary | `#69A297` | Eucalyptus — subheads |
| Accent | `#50808E` | Slate — highlights |
| Background | `#F5FAF8` | Content slides |
| Text | `#1A2A26` | Body text |
| Dark BG | `#2A5048` | Title/closing slides |

---

## Applying Palettes in pptxgenjs

```javascript
// Define palette as constants at top of script
const PALETTE = {
  primary:    '#1E2761',
  secondary:  '#CADCFC',
  accent:     '#4F8EF7',
  background: '#FFFFFF',
  text:       '#1A1A2E',
  darkBg:     '#1E2761',
};

// Use throughout
slide.addText('Title', {
  color: 'FFFFFF',
  fill: { color: PALETTE.primary.replace('#', '') },
});
```

---

## Contrast Quick Reference

Minimum contrast ratios (WCAG):
- **4.5:1** — Normal text (body copy)
- **3:1** — Large text (18pt+ or 14pt bold+)

Safe combinations from palettes above:
- Dark text (`#1A1A1A`) on white background → **21:1** ✓
- White on Primary `#1E2761` → **12:1** ✓
- White on Primary `#028090` → **4.6:1** ✓
- Avoid: light secondary colors as text on white backgrounds
