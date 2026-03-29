# Slide Templates (pptxgenjs)

Ready-to-use pptxgenjs code templates for each slide type. Copy and adapt — don't write from scratch.

All templates assume:
- Slide size: 10" × 5.63"
- `PALETTE` object defined (see color-palettes.md)
- `FONTS` object: `{ heading: 'Arial Black', body: 'Calibri' }`

---

## Boilerplate Setup

```javascript
const pptxgen = require('pptxgenjs');
const pptx = new pptxgen();

pptx.layout = 'LAYOUT_16x9'; // 10" x 5.63" — NEVER use LAYOUT_WIDE (that is 13.33"x7.5" and leaves the right ~25% of every slide blank)

// Define palette and fonts as constants
const P = {
  primary:    '1E2761',
  secondary:  'CADCFC',
  accent:     '4F8EF7',
  background: 'FFFFFF',
  text:       '1A1A2E',
  darkBg:     '1E2761',
  muted:      '888888',
};
const F = { heading: 'Arial Black', body: 'Calibri' };

// ... add slides ...

pptx.writeFile({ fileName: 'output.pptx' })
  .then(() => console.log('Done'))
  .catch(err => console.error(err));
```

---

## Template 1: Title Slide (Dark)

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.darkBg };

// Main title
slide.addText('YOUR TITLE HERE', {
  x: 0.8, y: 1.6, w: 8.4, h: 1.2,
  fontSize: 44, bold: true,
  color: 'FFFFFF',
  fontFace: F.heading,
  align: 'center',
});

// Subtitle
slide.addText('Subtitle or Presenter Name', {
  x: 0.8, y: 2.9, w: 8.4, h: 0.5,
  fontSize: 20,
  color: P.secondary,
  fontFace: F.body,
  align: 'center',
});

// Date bottom right
slide.addText('Month Year', {
  x: 7.5, y: 5.0, w: 2.0, h: 0.35,
  fontSize: 12, color: '8899BB',
  fontFace: F.body, align: 'right',
});
```

---

## Template 2: Section Divider

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.primary };

// Large faded section number (visual motif)
slide.addText('02', {
  x: 6.5, y: 0.3, w: 3.0, h: 3.0,
  fontSize: 120, bold: true,
  color: '2A3880', // slightly lighter than bg
  fontFace: F.heading,
  align: 'right',
  transparency: 60,
});

// Section title
slide.addText('Section Title', {
  x: 0.7, y: 1.8, w: 6.0, h: 1.0,
  fontSize: 40, bold: true,
  color: 'FFFFFF',
  fontFace: F.heading,
});

// Short description
slide.addText('Brief description of what this section covers', {
  x: 0.7, y: 2.9, w: 5.5, h: 0.6,
  fontSize: 18,
  color: P.secondary,
  fontFace: F.body,
});
```

---

## Template 3: Two-Column (Text + Image)

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.background };

// Slide title
slide.addText('Slide Title', {
  x: 0.5, y: 0.3, w: 9.0, h: 0.6,
  fontSize: 28, bold: true,
  color: P.primary,
  fontFace: F.heading,
});

// Left: body text
slide.addText([
  { text: 'Key Point One\n', options: { bold: true, fontSize: 16 } },
  { text: 'Supporting detail or explanation goes here.\n\n', options: { fontSize: 15 } },
  { text: 'Key Point Two\n', options: { bold: true, fontSize: 16 } },
  { text: 'Supporting detail or explanation goes here.', options: { fontSize: 15 } },
], {
  x: 0.5, y: 1.1, w: 4.5, h: 4.0,
  color: P.text,
  fontFace: F.body,
  valign: 'top',
});

// Right: image placeholder (replace path)
slide.addImage({
  path: 'image.png',
  x: 5.3, y: 1.1, w: 4.2, h: 3.8,
  rounding: true, // rounded corners
});

// Accent left border motif
slide.addShape(pptx.shapes.RECTANGLE, {
  x: 0.3, y: 1.1, w: 0.08, h: 4.0,
  fill: { color: P.accent },
  line: { color: P.accent },
});
```

---

## Template 4: Icon Grid (3 points)

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.background };

slide.addText('Slide Title', {
  x: 0.5, y: 0.3, w: 9.0, h: 0.6,
  fontSize: 28, bold: true,
  color: P.primary, fontFace: F.heading,
});

const cols = [
  { x: 0.5,  icon: '⚡', header: 'Point One',   body: 'Description of this key point in two or three lines.' },
  { x: 3.65, icon: '🎯', header: 'Point Two',   body: 'Description of this key point in two or three lines.' },
  { x: 6.8,  icon: '📈', header: 'Point Three', body: 'Description of this key point in two or three lines.' },
];

cols.forEach(col => {
  // Icon circle background
  slide.addShape(pptx.shapes.OVAL, {
    x: col.x + 0.85, y: 1.2, w: 0.7, h: 0.7,
    fill: { color: P.primary }, line: { color: P.primary },
  });
  // Icon
  slide.addText(col.icon, {
    x: col.x + 0.85, y: 1.2, w: 0.7, h: 0.7,
    fontSize: 20, align: 'center', valign: 'middle',
  });
  // Header
  slide.addText(col.header, {
    x: col.x, y: 2.1, w: 2.9, h: 0.5,
    fontSize: 18, bold: true,
    color: P.primary, fontFace: F.heading, align: 'center',
  });
  // Body
  slide.addText(col.body, {
    x: col.x, y: 2.7, w: 2.9, h: 1.8,
    fontSize: 14, color: P.text,
    fontFace: F.body, align: 'center', valign: 'top',
  });
});
```

---

## Template 4b: Icon Grid (4 points)

Use this when you have exactly 4 items. Do NOT squeeze 4 items into Template 4's 3-column layout.

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.background };

slide.addText('Slide Title', {
  x: 0.5, y: 0.3, w: 9.0, h: 0.6,
  fontSize: 28, bold: true,
  color: P.primary, fontFace: F.heading,
});

// 4-column layout: 2.15" per column, 0.2" gutter
const cols = [
  { x: 0.5,  icon: '⚡', header: 'Point One',   body: 'Description in two or three lines.' },
  { x: 2.85, icon: '🎯', header: 'Point Two',   body: 'Description in two or three lines.' },
  { x: 5.2,  icon: '📈', header: 'Point Three', body: 'Description in two or three lines.' },
  { x: 7.55, icon: '🔒', header: 'Point Four',  body: 'Description in two or three lines.' },
];

cols.forEach(col => {
  slide.addShape(pptx.shapes.OVAL, {
    x: col.x + 0.55, y: 1.3, w: 0.85, h: 0.85,
    fill: { color: P.primary }, line: { color: P.primary },
  });
  slide.addText(col.icon, {
    x: col.x + 0.55, y: 1.3, w: 0.85, h: 0.85,
    fontSize: 22, align: 'center', valign: 'middle',
  });
  slide.addText(col.header, {
    x: col.x, y: 2.3, w: 2.15, h: 0.5,
    fontSize: 16, bold: true,
    color: P.primary, fontFace: F.heading, align: 'center',
  });
  // Body extends to y≈4.8 to fill slide
  slide.addText(col.body, {
    x: col.x, y: 2.9, w: 2.15, h: 1.9,
    fontSize: 13, color: P.text,
    fontFace: F.body, align: 'center', valign: 'top',
    lineSpacingMultiple: 1.25,
  });
});

// Bottom anchor — CTA or tagline at y≈5.05
slide.addText('Bottom anchor text here — CTA, tagline, or link', {
  x: 0.5, y: 5.05, w: 9.0, h: 0.35,
  fontSize: 11, color: P.accent, bold: true,
  fontFace: F.body, align: 'center',
});
```

---

## Template 5: Big Stat Callout (3 stats)

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.background };

slide.addText('Slide Title', {
  x: 0.5, y: 0.3, w: 9.0, h: 0.6,
  fontSize: 28, bold: true,
  color: P.primary, fontFace: F.heading,
});

const stats = [
  { x: 0.5,  value: '47%',  label: 'Year-over-year growth' },
  { x: 3.65, value: '$2.4M', label: 'ARR as of Q4' },
  { x: 6.8,  value: '12',   label: 'New enterprise customers' },
];

stats.forEach(stat => {
  // Big number
  slide.addText(stat.value, {
    x: stat.x, y: 1.4, w: 2.9, h: 1.6,
    fontSize: 64, bold: true,
    color: P.accent, fontFace: F.heading, align: 'center',
  });
  // Label
  slide.addText(stat.label, {
    x: stat.x, y: 3.1, w: 2.9, h: 0.6,
    fontSize: 15, color: P.muted,
    fontFace: F.body, align: 'center',
  });
  // Divider between stats (not after last)
  if (stat.x !== 6.8) {
    slide.addShape(pptx.shapes.RECTANGLE, {
      x: stat.x + 2.95, y: 1.6, w: 0.05, h: 1.6,
      fill: { color: 'E0E0E0' }, line: { color: 'E0E0E0' },
    });
  }
});

// Supporting note below stats
slide.addText('As of [date] — [source or caveat if needed]', {
  x: 0.5, y: 4.8, w: 9.0, h: 0.4,
  fontSize: 11, color: P.muted,
  fontFace: F.body, align: 'center',
});
```

---

## Template 5b: Big Stat Callout (4 stats)

Use this when you have exactly 4 stats. Do NOT squeeze 4 stats into Template 5's 3-column layout.

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.background };

slide.addText('Slide Title', {
  x: 0.5, y: 0.3, w: 9.0, h: 0.6,
  fontSize: 28, bold: true,
  color: P.primary, fontFace: F.heading,
});

// 4-column layout: 2.15" per column, 0.2" gutter
const stats = [
  { x: 0.5,  value: '47%',  label: 'Year-over-year growth' },
  { x: 2.85, value: '$2.4M', label: 'ARR as of Q4' },
  { x: 5.2,  value: '340+', label: 'Markets worldwide' },
  { x: 7.55, value: '12',   label: 'Enterprise customers' },
];

stats.forEach((stat, i) => {
  slide.addText(stat.value, {
    x: stat.x, y: 1.3, w: 2.15, h: 1.4,
    fontSize: 48, bold: true,
    color: P.accent, fontFace: F.heading, align: 'center',
  });
  slide.addText(stat.label, {
    x: stat.x, y: 2.8, w: 2.15, h: 0.9,
    fontSize: 13, color: P.muted,
    fontFace: F.body, align: 'center', lineSpacingMultiple: 1.2,
  });
  if (i < 3) {
    slide.addShape(pptx.shapes.RECTANGLE, {
      x: stat.x + 2.25, y: 1.5, w: 0.03, h: 1.8,
      fill: { color: 'E0E0E0' }, line: { color: 'E0E0E0' },
    });
  }
});

// Divider line to separate stats from bottom section
slide.addShape(pptx.shapes.RECTANGLE, {
  x: 0.5, y: 4.1, w: 9.0, h: 0.03,
  fill: { color: 'E8E8E8' }, line: { color: 'E8E8E8' },
});

// Bottom anchor — trust statement or supporting content at y≈4.3+
slide.addText('Supporting note, trust statement, or client logos here', {
  x: 0.5, y: 4.3, w: 9.0, h: 0.5,
  fontSize: 14, color: P.muted,
  fontFace: F.body, align: 'center', italic: true,
});
```

---

## Template 6: Data + Insight

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.background };

slide.addText('Slide Title', {
  x: 0.5, y: 0.3, w: 9.0, h: 0.6,
  fontSize: 28, bold: true,
  color: P.primary, fontFace: F.heading,
});

// Chart placeholder (left 60%)
// Replace with actual pptx.charts.BAR / LINE / PIE as needed
slide.addText('[Chart goes here]', {
  x: 0.5, y: 1.1, w: 5.8, h: 3.8,
  fill: { color: 'F0F4FF' },
  color: '999999', fontSize: 14,
  align: 'center', valign: 'middle',
  fontFace: F.body,
});

// Insight box (right 40%)
slide.addShape(pptx.shapes.RECTANGLE, {
  x: 6.5, y: 1.1, w: 3.0, h: 3.8,
  fill: { color: P.primary }, line: { color: P.primary },
});
slide.addText('The key\ninsight headline', {
  x: 6.6, y: 1.3, w: 2.8, h: 1.2,
  fontSize: 22, bold: true,
  color: 'FFFFFF', fontFace: F.heading,
});
slide.addText('Supporting context or explanation of what this means and why it matters to the audience.', {
  x: 6.6, y: 2.6, w: 2.8, h: 2.0,
  fontSize: 14, color: P.secondary,
  fontFace: F.body, valign: 'top',
});
```

---

## Template 7: Comparison (A vs B)

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.background };

slide.addText('Comparison Title', {
  x: 0.5, y: 0.3, w: 9.0, h: 0.6,
  fontSize: 28, bold: true,
  color: P.primary, fontFace: F.heading,
});

// Option A (left)
slide.addShape(pptx.shapes.RECTANGLE, {
  x: 0.5, y: 1.1, w: 4.3, h: 4.1,
  fill: { color: 'F5F7FF' },
  line: { color: P.secondary, width: 1.5 },
});
slide.addText('Option A', {
  x: 0.6, y: 1.2, w: 4.1, h: 0.55,
  fontSize: 20, bold: true,
  color: P.primary, fontFace: F.heading, align: 'center',
});
slide.addText('• Characteristic one\n• Characteristic two\n• Characteristic three\n• Characteristic four', {
  x: 0.7, y: 1.9, w: 3.9, h: 2.8,
  fontSize: 15, color: P.text,
  fontFace: F.body, valign: 'top',
});

// Option B (right — highlighted as winner)
slide.addShape(pptx.shapes.RECTANGLE, {
  x: 5.2, y: 1.1, w: 4.3, h: 4.1,
  fill: { color: P.primary },
  line: { color: P.primary, width: 2 },
});
slide.addText('Option B ✓', {
  x: 5.3, y: 1.2, w: 4.1, h: 0.55,
  fontSize: 20, bold: true,
  color: 'FFFFFF', fontFace: F.heading, align: 'center',
});
slide.addText('• Characteristic one\n• Characteristic two\n• Characteristic three\n• Characteristic four', {
  x: 5.4, y: 1.9, w: 3.9, h: 2.8,
  fontSize: 15, color: P.secondary,
  fontFace: F.body, valign: 'top',
});
```

---

## Template 8: Key Takeaway

```javascript
const slide = pptx.addSlide();
slide.background = { color: P.darkBg };

// Large subtle shape as visual motif
slide.addShape(pptx.shapes.OVAL, {
  x: 6.0, y: -1.0, w: 5.5, h: 5.5,
  fill: { color: '2A3880' },
  line: { color: '2A3880' },
});

// Takeaway message
slide.addText('The single most important\nthing to remember.', {
  x: 0.8, y: 1.5, w: 8.4, h: 2.0,
  fontSize: 34, bold: true,
  color: 'FFFFFF',
  fontFace: F.heading, align: 'center',
});

// Optional supporting line
slide.addText('Supporting context or implication in one short sentence.', {
  x: 1.5, y: 3.6, w: 7.0, h: 0.6,
  fontSize: 17,
  color: P.secondary,
  fontFace: F.body, align: 'center',
});
```

---

## Tips for Using Templates

1. **Adapt, don't copy blindly** — adjust coordinates and text to fit actual content
2. **Test overflow** — always check text doesn't overflow its box; reduce font size or rewrite
3. **Replace placeholder images** — `addImage` requires a real file path
4. **Charts** — replace `[Chart goes here]` boxes with actual `slide.addChart(pptx.charts.BAR, data, opts)`
5. **Vary across slides** — never use the same template on consecutive slides
6. **Keep motif consistent** — if you use the left border accent in Template 3, use it on all content slides
7. **Match item count to template** — use Template 4b/5b for 4 items, Template 4/5 for 3 items. Never squeeze 4 items into a 3-column template.
8. **Fill the slide vertically** — content must reach y≥4.8". If main content ends above y=4.0", add bottom anchors AND spread main content down.
