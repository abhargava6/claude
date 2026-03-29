# Slide Templates — HTML Presenter v2

Ready-to-use HTML/CSS templates for each slide type. Copy and adapt — don't write from scratch.

## Table of Contents
- [Boilerplate HTML Structure](#boilerplate-html-structure) — Shell for every presentation
- [Template 1: Title Slide (Dark Hero)](#template-1-title-slide-dark-hero)
- [Template 2: Section Divider](#template-2-section-divider)
- [Template 3: Two-Column (Text + Visual)](#template-3-two-column-text--visual)
- [Template 4: Card Grid (3 items)](#template-4-card-grid-3-items)
- [Template 4b: Card Grid (4 items)](#template-4b-card-grid-4-items)
- [Template 5: Big Stat Callout](#template-5-big-stat-callout)
- [Template 6: Comparison (A vs B)](#template-6-comparison-a-vs-b)
- [Template 7: Timeline / Process Flow](#template-7-timeline--process-flow)
- [Template 8: Key Takeaway](#template-8-key-takeaway)
- [Template 9: Quote / Testimonial](#template-9-quote--testimonial)
- [Template 10: Closing / CTA](#template-10-closing--cta)
- [Tips for Using Templates](#tips-for-using-templates)

All templates assume:
- CSS variables defined on `:root` (see design-system.md)
- Navigation engine JS included (see animations.md)
- Google Fonts imported at top of `<style>`

---

## Boilerplate HTML Structure

Every presentation starts with this shell:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PRESENTATION TITLE</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=HEADING_FONT:wght@700;900&family=BODY_FONT:wght@300;400;600&display=swap');

    /* === Reset === */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    /* === CSS Variables === */
    :root {
      /* Paste palette from color-palettes.md */
      /* Paste type scale from design-system.md */
      /* Paste spacing from design-system.md */
      /* Paste animation tokens from design-system.md */
    }

    /* === Base === */
    html { font-size: 16px; scroll-behavior: smooth; }
    body {
      font-family: var(--font-body);
      color: var(--color-text);
      background: var(--color-bg);
      overflow: hidden;
      -webkit-font-smoothing: antialiased;
    }

    /* === Slides Container === */
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
      min-height: 100vh;
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
      position: relative;
      z-index: 2;
    }

    /* === UI Chrome === */
    .progress-bar {
      position: fixed; top: 0; left: 0; height: 3px;
      background: var(--color-accent);
      transition: width var(--duration-fast) var(--ease-out-expo);
      z-index: 100;
    }

    .slide-counter {
      position: fixed; bottom: 2rem; right: 2rem;
      font-family: var(--font-body);
      font-size: var(--text-caption);
      color: var(--color-text-muted);
      z-index: 100;
      opacity: 0.7;
    }

    /* Dark slide overrides counter color */
    .slide-dark ~ .slide-counter,
    .slide-gradient ~ .slide-counter {
      color: rgba(255,255,255,0.5);
    }

    /* === Fragment animations === */
    .fragment {
      opacity: 0;
      transform: translateY(20px);
      transition: opacity var(--duration-normal) var(--ease-out-expo),
                  transform var(--duration-normal) var(--ease-out-expo);
    }
    .fragment.visible {
      opacity: 1;
      transform: translateY(0);
    }
    .fragment:nth-child(2) { transition-delay: 0.1s; }
    .fragment:nth-child(3) { transition-delay: 0.2s; }
    .fragment:nth-child(4) { transition-delay: 0.3s; }
    .fragment:nth-child(5) { transition-delay: 0.4s; }

    /* === Entrance animations === */
    @media (prefers-reduced-motion: no-preference) {
      .slide.active .animate-in {
        animation: slideUp var(--duration-normal) var(--ease-out-expo) both;
      }
      .slide.active .animate-in:nth-child(2) { animation-delay: 0.1s; }
      .slide.active .animate-in:nth-child(3) { animation-delay: 0.2s; }
      .slide.active .animate-in:nth-child(4) { animation-delay: 0.3s; }
    }

    @keyframes slideUp {
      from { opacity: 0; transform: translateY(40px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    @keyframes scaleIn {
      from { opacity: 0; transform: scale(0.9); }
      to { opacity: 1; transform: scale(1); }
    }

    @keyframes clipRevealLR {
      from { clip-path: inset(0 100% 0 0); }
      to { clip-path: inset(0 0 0 0); }
    }

    /* === Responsive === */
    @media (max-width: 768px) {
      :root { --slide-padding: 6vw 5vw; }
      .two-col { flex-direction: column !important; grid-template-columns: 1fr !important; }
      .card-grid { grid-template-columns: 1fr !important; }
      .stat-row { flex-direction: column; gap: var(--space-md); }
    }

    /* === Print === */
    @media print {
      .slides-container { overflow: visible; scroll-snap-type: none; }
      .slide { page-break-after: always; height: auto; min-height: 100vh; }
      .slide-counter, .progress-bar { display: none; }
      * { animation: none !important; transition: none !important; }
    }

    /* === SLIDE SPECIFIC STYLES GO HERE === */
  </style>
</head>
<body>

  <div class="progress-bar" style="width: 0%"></div>
  <div class="slide-counter">1 / N</div>

  <div class="slides-container">
    <!-- SLIDES GO HERE -->
  </div>

  <script>
    /* === NAVIGATION ENGINE + ANIMATIONS GO HERE === */
    /* Paste from animations.md */
  </script>
</body>
</html>
```

---

## Template 1: Title Slide (Dark Hero)

```html
<section class="slide slide-dark slide-hero" id="slide-1">
  <div class="hero-bg-shapes">
    <div class="hero-circle"></div>
    <div class="hero-circle hero-circle-2"></div>
  </div>
  <div class="slide-content" style="text-align: center;">
    <h1 class="hero-title animate-in">YOUR TITLE HERE</h1>
    <p class="hero-subtitle animate-in">Subtitle or Presenter Name</p>
    <p class="hero-date animate-in">Month Year</p>
  </div>
</section>
```

```css
.slide-hero {
  background: var(--color-bg-dark);
  color: var(--color-text-light);
}

.hero-bg-shapes {
  position: absolute; inset: 0; overflow: hidden; z-index: 0;
}

.hero-circle {
  position: absolute;
  width: 50vw; height: 50vw;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(255,255,255,0.04) 0%, transparent 70%);
  top: -10vw; right: -15vw;
}

.hero-circle-2 {
  width: 30vw; height: 30vw;
  top: auto; bottom: -8vw; right: auto; left: -10vw;
  background: radial-gradient(circle, rgba(255,255,255,0.03) 0%, transparent 70%);
}

.hero-title {
  font-family: var(--font-heading);
  font-size: var(--text-hero);
  font-weight: 900;
  line-height: 1.1;
  margin-bottom: var(--space-md);
  letter-spacing: -0.02em;
}

.hero-subtitle {
  font-size: var(--text-subtitle);
  font-weight: 300;
  opacity: 0.8;
  margin-bottom: var(--space-sm);
}

.hero-date {
  font-size: var(--text-small);
  opacity: 0.5;
}
```

---

## Template 2: Section Divider

```html
<section class="slide slide-dark slide-section" id="slide-N">
  <div class="section-number">02</div>
  <div class="slide-content">
    <h2 class="section-title animate-in">Section Title</h2>
    <p class="section-desc animate-in">Brief description of what this section covers.</p>
  </div>
</section>
```

```css
.slide-section { background: var(--color-primary); color: var(--color-text-light); }

.section-number {
  position: absolute;
  top: 10%; right: 8%;
  font-family: var(--font-heading);
  font-size: clamp(6rem, 12vw, 10rem);
  font-weight: 900;
  opacity: 0.08;
  line-height: 1;
}

.section-title {
  font-family: var(--font-heading);
  font-size: var(--text-title);
  font-weight: 700;
  margin-bottom: var(--space-sm);
}

.section-desc {
  font-size: var(--text-body);
  opacity: 0.75;
  max-width: 60%;
}
```

---

## Template 3: Two-Column (Text + Visual)

```html
<section class="slide slide-light" id="slide-N">
  <div class="slide-content">
    <h2 class="slide-title animate-in">Slide Title</h2>
    <div class="two-col">
      <div class="col-text animate-in">
        <h3>Key Point One</h3>
        <p>Supporting detail or explanation goes here.</p>
        <h3>Key Point Two</h3>
        <p>Supporting detail or explanation goes here.</p>
      </div>
      <div class="col-visual animate-in">
        <div class="visual-placeholder">
          <!-- Image, SVG, chart, or decorative element -->
          <svg viewBox="0 0 400 300" style="width:100%; border-radius: var(--border-radius-md);">
            <rect width="400" height="300" fill="var(--color-surface)" rx="16"/>
            <text x="200" y="150" text-anchor="middle" fill="var(--color-text-muted)" font-size="14">Visual Element</text>
          </svg>
        </div>
      </div>
    </div>
  </div>
</section>
```

```css
.slide-light { background: var(--color-bg); color: var(--color-text); }

.slide-title {
  font-family: var(--font-heading);
  font-size: var(--text-title);
  font-weight: 700;
  margin-bottom: var(--space-lg);
  color: var(--color-primary);
}

.two-col {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-lg);
  align-items: center;
}

.col-text h3 {
  font-family: var(--font-heading);
  font-size: var(--text-subtitle);
  font-weight: 600;
  color: var(--color-primary);
  margin-bottom: var(--space-xs);
  margin-top: var(--space-md);
}
.col-text h3:first-child { margin-top: 0; }

.col-text p {
  font-size: var(--text-body);
  line-height: 1.7;
  color: var(--color-text);
}
```

---

## Template 4: Card Grid (3 items)

```html
<section class="slide slide-light" id="slide-N">
  <div class="slide-content">
    <h2 class="slide-title animate-in">Three Key Points</h2>
    <div class="card-grid">
      <div class="card animate-in">
        <div class="card-icon">⚡</div>
        <h3>Point One</h3>
        <p>Description of this key point in two or three lines.</p>
      </div>
      <div class="card animate-in">
        <div class="card-icon">🎯</div>
        <h3>Point Two</h3>
        <p>Description of this key point in two or three lines.</p>
      </div>
      <div class="card animate-in">
        <div class="card-icon">📈</div>
        <h3>Point Three</h3>
        <p>Description of this key point in two or three lines.</p>
      </div>
    </div>
  </div>
</section>
```

```css
.card-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--space-md);
}

.card {
  background: var(--color-surface);
  border-radius: var(--border-radius-md);
  padding: var(--space-md);
  transition: transform var(--duration-fast) var(--ease-out-expo),
              box-shadow var(--duration-fast) var(--ease-out-expo);
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 40px rgba(0,0,0,0.08);
}

.card-icon {
  font-size: 2rem;
  margin-bottom: var(--space-sm);
  width: 3rem; height: 3rem;
  display: flex; align-items: center; justify-content: center;
  background: var(--color-primary);
  color: var(--color-text-light);
  border-radius: var(--border-radius-sm);
}

.card h3 {
  font-family: var(--font-heading);
  font-size: calc(var(--text-body) * 1.1);
  font-weight: 700;
  color: var(--color-primary);
  margin-bottom: var(--space-xs);
}

.card p {
  font-size: var(--text-body);
  line-height: 1.6;
  color: var(--color-text-muted);
}
```

---

## Template 4b: Card Grid (4 items)

Same as Template 4 but use `grid-template-columns: repeat(4, 1fr)` and smaller padding.

```css
.card-grid-4 {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--space-sm);
}
.card-grid-4 .card { padding: var(--space-sm) var(--space-md); }
```

---

## Template 5: Big Stat Callout

```html
<section class="slide slide-light" id="slide-N">
  <div class="slide-content">
    <h2 class="slide-title animate-in">By the Numbers</h2>
    <div class="stat-row">
      <div class="stat animate-in">
        <span class="stat-value counter" data-target="47" data-suffix="%">0%</span>
        <span class="stat-label">Year-over-year growth</span>
      </div>
      <div class="stat-divider"></div>
      <div class="stat animate-in">
        <span class="stat-value counter" data-target="2.4" data-prefix="$" data-suffix="M" data-decimals="1">$0M</span>
        <span class="stat-label">ARR as of Q4</span>
      </div>
      <div class="stat-divider"></div>
      <div class="stat animate-in">
        <span class="stat-value counter" data-target="12">0</span>
        <span class="stat-label">Enterprise customers</span>
      </div>
    </div>
    <p class="stat-footnote animate-in">As of December 2025</p>
  </div>
</section>
```

```css
.stat-row {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: var(--space-lg);
  margin-top: var(--space-lg);
}

.stat { text-align: center; flex: 1; }

.stat-value {
  display: block;
  font-family: var(--font-heading);
  font-size: var(--text-hero);
  font-weight: 900;
  color: var(--color-accent);
  line-height: 1;
  margin-bottom: var(--space-xs);
}

.stat-label {
  display: block;
  font-size: var(--text-small);
  color: var(--color-text-muted);
  line-height: 1.4;
}

.stat-divider {
  width: 1px;
  height: 4rem;
  background: var(--color-border);
  flex-shrink: 0;
}

.stat-footnote {
  text-align: center;
  font-size: var(--text-caption);
  color: var(--color-text-muted);
  margin-top: var(--space-lg);
}
```

---

## Template 6: Comparison (A vs B)

```html
<section class="slide slide-light" id="slide-N">
  <div class="slide-content">
    <h2 class="slide-title animate-in">Comparison Title</h2>
    <div class="comparison">
      <div class="compare-card animate-in">
        <h3>Option A</h3>
        <ul>
          <li>Characteristic one</li>
          <li>Characteristic two</li>
          <li>Characteristic three</li>
        </ul>
      </div>
      <div class="compare-vs animate-in">VS</div>
      <div class="compare-card compare-winner animate-in">
        <div class="winner-badge">Recommended</div>
        <h3>Option B</h3>
        <ul>
          <li>Characteristic one</li>
          <li>Characteristic two</li>
          <li>Characteristic three</li>
        </ul>
      </div>
    </div>
  </div>
</section>
```

```css
.comparison {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  gap: var(--space-md);
  align-items: stretch;
  margin-top: var(--space-lg);
}

.compare-card {
  background: var(--color-surface);
  border-radius: var(--border-radius-md);
  padding: var(--space-md);
  border: 2px solid var(--color-border);
  position: relative;
}

.compare-winner {
  border-color: var(--color-accent);
  background: linear-gradient(135deg, var(--color-surface), rgba(var(--color-accent), 0.05));
}

.winner-badge {
  position: absolute;
  top: -0.8rem; right: var(--space-sm);
  background: var(--color-accent);
  color: var(--color-text-light);
  padding: 0.25rem 0.75rem;
  border-radius: 999px;
  font-size: var(--text-caption);
  font-weight: 600;
}

.compare-vs {
  display: flex;
  align-items: center;
  font-family: var(--font-heading);
  font-size: var(--text-subtitle);
  font-weight: 700;
  color: var(--color-text-muted);
  opacity: 0.4;
}

.compare-card h3 {
  font-family: var(--font-heading);
  font-size: var(--text-subtitle);
  font-weight: 700;
  color: var(--color-primary);
  margin-bottom: var(--space-sm);
}

.compare-card ul {
  list-style: none;
  padding: 0;
}

.compare-card li {
  padding: var(--space-xs) 0;
  border-bottom: 1px solid var(--color-border);
  font-size: var(--text-body);
}
.compare-card li:last-child { border-bottom: none; }
```

---

## Template 7: Timeline / Process Flow

```html
<section class="slide slide-light" id="slide-N">
  <div class="slide-content">
    <h2 class="slide-title animate-in">Our Process</h2>
    <div class="timeline">
      <div class="timeline-item animate-in">
        <div class="timeline-marker">1</div>
        <div class="timeline-content">
          <h3>Step One</h3>
          <p>Description of this step and what happens.</p>
        </div>
      </div>
      <div class="timeline-item animate-in">
        <div class="timeline-marker">2</div>
        <div class="timeline-content">
          <h3>Step Two</h3>
          <p>Description of this step and what happens.</p>
        </div>
      </div>
      <div class="timeline-item animate-in">
        <div class="timeline-marker">3</div>
        <div class="timeline-content">
          <h3>Step Three</h3>
          <p>Description of this step and what happens.</p>
        </div>
      </div>
      <div class="timeline-item animate-in">
        <div class="timeline-marker active">4</div>
        <div class="timeline-content">
          <h3>Current Step</h3>
          <p>Where we are right now.</p>
        </div>
      </div>
    </div>
  </div>
</section>
```

```css
.timeline {
  display: flex;
  gap: var(--space-md);
  margin-top: var(--space-lg);
  position: relative;
}

/* Connecting line */
.timeline::before {
  content: '';
  position: absolute;
  top: 1.5rem;
  left: 1.5rem;
  right: 1.5rem;
  height: 2px;
  background: var(--color-border);
  z-index: 0;
}

.timeline-item {
  flex: 1;
  text-align: center;
  position: relative;
  z-index: 1;
}

.timeline-marker {
  width: 3rem; height: 3rem;
  border-radius: 50%;
  background: var(--color-surface);
  border: 2px solid var(--color-border);
  display: flex; align-items: center; justify-content: center;
  font-family: var(--font-heading);
  font-weight: 700;
  font-size: var(--text-body);
  color: var(--color-text-muted);
  margin: 0 auto var(--space-sm);
}

.timeline-marker.active {
  background: var(--color-accent);
  border-color: var(--color-accent);
  color: var(--color-text-light);
}

.timeline-content h3 {
  font-family: var(--font-heading);
  font-size: calc(var(--text-body) * 1.1);
  font-weight: 700;
  color: var(--color-primary);
  margin-bottom: var(--space-xs);
}

.timeline-content p {
  font-size: var(--text-small);
  color: var(--color-text-muted);
  line-height: 1.5;
}
```

---

## Template 8: Key Takeaway

```html
<section class="slide slide-dark slide-takeaway" id="slide-N">
  <div class="takeaway-shape"></div>
  <div class="slide-content" style="text-align: center;">
    <p class="takeaway-label animate-in">Key Takeaway</p>
    <h2 class="takeaway-message animate-in">The single most important thing to remember.</h2>
    <p class="takeaway-support animate-in">Supporting context in one short sentence.</p>
  </div>
</section>
```

```css
.slide-takeaway {
  background: var(--color-bg-dark);
  color: var(--color-text-light);
}

.takeaway-shape {
  position: absolute;
  width: 50vw; height: 50vw;
  border-radius: 50%;
  background: rgba(255,255,255,0.03);
  right: -15vw; top: -10vw;
}

.takeaway-label {
  font-size: var(--text-small);
  text-transform: uppercase;
  letter-spacing: 0.2em;
  color: var(--color-accent);
  margin-bottom: var(--space-md);
}

.takeaway-message {
  font-family: var(--font-heading);
  font-size: var(--text-title);
  font-weight: 700;
  line-height: 1.3;
  max-width: 80%;
  margin: 0 auto var(--space-md);
}

.takeaway-support {
  font-size: var(--text-body);
  opacity: 0.65;
  max-width: 60%;
  margin: 0 auto;
}
```

---

## Template 9: Quote / Testimonial

```html
<section class="slide slide-light" id="slide-N">
  <div class="slide-content" style="text-align: center;">
    <blockquote class="quote animate-in">
      <p class="quote-text">"The best way to predict the future is to invent it."</p>
      <footer class="quote-attr">
        <strong>Alan Kay</strong>
        <span>Computer Scientist</span>
      </footer>
    </blockquote>
  </div>
</section>
```

```css
.quote {
  max-width: 80%;
  margin: 0 auto;
}

.quote-text {
  font-family: var(--font-heading);
  font-size: var(--text-title);
  font-weight: 700;
  line-height: 1.4;
  color: var(--color-primary);
  margin-bottom: var(--space-lg);
  font-style: italic;
}

.quote-attr {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.quote-attr strong {
  font-family: var(--font-body);
  font-size: var(--text-body);
  font-weight: 600;
  color: var(--color-text);
}

.quote-attr span {
  font-size: var(--text-small);
  color: var(--color-text-muted);
}
```

---

## Template 10: Closing / CTA

```html
<section class="slide slide-dark slide-hero" id="slide-N">
  <div class="hero-bg-shapes">
    <div class="hero-circle"></div>
  </div>
  <div class="slide-content" style="text-align: center;">
    <h2 class="hero-title animate-in" style="font-size: var(--text-title);">Ready to Get Started?</h2>
    <p class="hero-subtitle animate-in">Contact us or visit our website to learn more.</p>
    <div class="cta-links animate-in">
      <span class="cta-item">📧 hello@example.com</span>
      <span class="cta-divider">·</span>
      <span class="cta-item">🌐 example.com</span>
      <span class="cta-divider">·</span>
      <span class="cta-item">📱 @handle</span>
    </div>
  </div>
</section>
```

```css
.cta-links {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: var(--space-sm);
  margin-top: var(--space-lg);
  flex-wrap: wrap;
}

.cta-item {
  font-size: var(--text-body);
  opacity: 0.8;
}

.cta-divider {
  opacity: 0.3;
}
```

---

## Tips for Using Templates

1. **Adapt, don't copy blindly** — adjust content, colors, and spacing to fit actual slide content.
2. **Vary across slides** — never use the same template on two consecutive slides.
3. **Keep motif consistent** — if you use cards on one slide, the card style (radius, shadow, padding) must match everywhere.
4. **Match item count to template** — use 4-col grid for 4 items, 3-col for 3. Never squeeze.
5. **Test at multiple sizes** — resize the browser window. Everything should remain legible.
6. **Fill the viewport** — every slide should feel balanced. If there's too much empty space, increase font sizes or add supporting elements.
7. **Interactive where possible** — hover effects on cards, count-up on stats, staggered entrance on grids.
