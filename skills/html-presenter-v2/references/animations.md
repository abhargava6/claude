# Animation & Interaction Patterns — HTML Presenter v2

Ready-to-use CSS and JS patterns for slide animations, transitions, and interactive elements.

All animations MUST be wrapped in `@media (prefers-reduced-motion: no-preference)` for accessibility.

---

## Slide Entrance Animations

### Fade In (default — elegant, universal)
```css
@media (prefers-reduced-motion: no-preference) {
  .slide.active .fade-in {
    animation: fadeIn var(--duration-normal) var(--ease-out-expo) both;
  }
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
```

### Slide Up (content entering from below)
```css
@keyframes slideUp {
  from { opacity: 0; transform: translateY(40px); }
  to { opacity: 1; transform: translateY(0); }
}
```

### Scale In (zoom from center)
```css
@keyframes scaleIn {
  from { opacity: 0; transform: scale(0.9); }
  to { opacity: 1; transform: scale(1); }
}
```

### Clip Reveal (content revealed by expanding clip-path)
```css
@keyframes clipReveal {
  from { clip-path: inset(0 100% 0 0); }
  to { clip-path: inset(0 0 0 0); }
}
```

### Text Char-by-Char Reveal
```css
@keyframes charReveal {
  from { opacity: 0; transform: translateY(20px) rotateX(-30deg); }
  to { opacity: 1; transform: translateY(0) rotateX(0); }
}
```

JS to split text into spans:
```javascript
function splitTextIntoChars(element) {
  const text = element.textContent;
  element.innerHTML = text.split('').map((char, i) =>
    `<span style="animation-delay: ${i * 0.03}s; display: inline-block;">${char === ' ' ? '&nbsp;' : char}</span>`
  ).join('');
}
```

---

## Fragment Animations (Staggered Reveals)

Elements within a slide that appear one by one when the user presses arrow keys or clicks.

### CSS for fragments
```css
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

/* Stagger delay via nth-child */
.fragment:nth-child(1) { transition-delay: 0s; }
.fragment:nth-child(2) { transition-delay: 0.1s; }
.fragment:nth-child(3) { transition-delay: 0.2s; }
.fragment:nth-child(4) { transition-delay: 0.3s; }
.fragment:nth-child(5) { transition-delay: 0.4s; }
```

### JS fragment controller
```javascript
function advanceFragments(slide) {
  const fragments = slide.querySelectorAll('.fragment:not(.visible)');
  if (fragments.length > 0) {
    fragments[0].classList.add('visible');
    return true; // consumed the keypress
  }
  return false; // no more fragments, move to next slide
}
```

---

## Stat Counter Animation

Numbers that count up from 0 when the slide becomes active.

```javascript
function animateCounter(element, target, duration = 2000) {
  const start = 0;
  const startTime = performance.now();
  const prefix = element.dataset.prefix || '';
  const suffix = element.dataset.suffix || '';
  const decimals = parseInt(element.dataset.decimals || '0');

  function update(currentTime) {
    const elapsed = currentTime - startTime;
    const progress = Math.min(elapsed / duration, 1);
    // Ease-out expo
    const eased = 1 - Math.pow(1 - progress, 4);
    const current = start + (target - start) * eased;
    element.textContent = prefix + current.toFixed(decimals) + suffix;
    if (progress < 1) requestAnimationFrame(update);
  }
  requestAnimationFrame(update);
}
```

Usage in HTML:
```html
<span class="counter" data-target="2400000" data-prefix="$" data-suffix="" data-decimals="0">0</span>
```

---

## Background Animations

### Floating Particles (subtle, ambient)
```javascript
function createParticles(container, count = 30) {
  for (let i = 0; i < count; i++) {
    const particle = document.createElement('div');
    particle.className = 'particle';
    particle.style.cssText = `
      position: absolute;
      width: ${Math.random() * 4 + 2}px;
      height: ${Math.random() * 4 + 2}px;
      background: var(--color-accent);
      border-radius: 50%;
      opacity: ${Math.random() * 0.3 + 0.1};
      left: ${Math.random() * 100}%;
      top: ${Math.random() * 100}%;
      animation: float ${Math.random() * 10 + 10}s ease-in-out infinite;
      animation-delay: ${Math.random() * -10}s;
    `;
    container.appendChild(particle);
  }
}
```

```css
@keyframes float {
  0%, 100% { transform: translate(0, 0) rotate(0deg); }
  25% { transform: translate(20px, -30px) rotate(90deg); }
  50% { transform: translate(-10px, -60px) rotate(180deg); }
  75% { transform: translate(30px, -20px) rotate(270deg); }
}
```

### Gradient Shift (slow background color animation)
```css
@keyframes gradientShift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.animated-gradient {
  background: linear-gradient(-45deg, var(--color-primary), var(--color-accent), var(--color-secondary), var(--color-primary));
  background-size: 400% 400%;
  animation: gradientShift 15s ease infinite;
}
```

### Noise Texture Overlay
```css
.noise-overlay::after {
  content: '';
  position: absolute;
  inset: 0;
  opacity: 0.04;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)'/%3E%3C/svg%3E");
  pointer-events: none;
  z-index: 1;
}
```

---

## Slide Transitions

### Crossfade Between Slides
```css
.slide {
  opacity: 0;
  transition: opacity var(--duration-slow) var(--ease-in-out);
  position: absolute;
  inset: 0;
}
.slide.active {
  opacity: 1;
  z-index: 1;
}
```

### Push Transition (slide pushes the previous one away)
Best handled by scroll-snap-type (natural browser scrolling).

### Morph Transition (matching elements animate between slides)
Use `data-morph-id` attributes and JavaScript to calculate position differences:

```javascript
function morphTransition(fromSlide, toSlide) {
  const fromElements = fromSlide.querySelectorAll('[data-morph-id]');
  const toElements = toSlide.querySelectorAll('[data-morph-id]');

  toElements.forEach(toEl => {
    const id = toEl.dataset.morphId;
    const fromEl = fromSlide.querySelector(`[data-morph-id="${id}"]`);
    if (!fromEl) return;

    const fromRect = fromEl.getBoundingClientRect();
    const toRect = toEl.getBoundingClientRect();

    const dx = fromRect.left - toRect.left;
    const dy = fromRect.top - toRect.top;
    const sw = fromRect.width / toRect.width;
    const sh = fromRect.height / toRect.height;

    toEl.animate([
      { transform: `translate(${dx}px, ${dy}px) scale(${sw}, ${sh})`, opacity: 0.5 },
      { transform: 'translate(0, 0) scale(1, 1)', opacity: 1 }
    ], { duration: 600, easing: 'cubic-bezier(0.16, 1, 0.3, 1)' });
  });
}
```

---

## Interactive Elements

### Hover Card Lift
```css
.card {
  transition: transform var(--duration-fast) var(--ease-out-expo),
              box-shadow var(--duration-fast) var(--ease-out-expo);
}
.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 40px rgba(0,0,0,0.12);
}
```

### Progress Bar
```css
.progress-bar {
  position: fixed;
  top: 0;
  left: 0;
  height: 3px;
  background: var(--color-accent);
  transition: width var(--duration-fast) var(--ease-out-expo);
  z-index: 100;
}
```

### Tooltip on Hover
```css
[data-tooltip] {
  position: relative;
  cursor: help;
}
[data-tooltip]::after {
  content: attr(data-tooltip);
  position: absolute;
  bottom: 100%;
  left: 50%;
  transform: translateX(-50%) translateY(-8px);
  padding: 0.5rem 1rem;
  background: var(--color-text);
  color: var(--color-bg);
  border-radius: var(--border-radius-sm);
  font-size: var(--text-caption);
  white-space: nowrap;
  opacity: 0;
  pointer-events: none;
  transition: opacity var(--duration-fast);
}
[data-tooltip]:hover::after {
  opacity: 1;
}
```

---

## Navigation Engine (Boilerplate JS)

Include this in every presentation:

```javascript
(function() {
  const slides = document.querySelectorAll('.slide');
  const counter = document.querySelector('.slide-counter');
  const progressBar = document.querySelector('.progress-bar');
  let current = 0;

  function goToSlide(index) {
    if (index < 0 || index >= slides.length) return;
    current = index;
    slides[current].scrollIntoView({ behavior: 'smooth' });
    updateUI();
    activateSlide(slides[current]);
  }

  function updateUI() {
    if (counter) counter.textContent = `${current + 1} / ${slides.length}`;
    if (progressBar) progressBar.style.width = `${((current + 1) / slides.length) * 100}%`;
    slides.forEach((s, i) => s.classList.toggle('active', i === current));
  }

  function activateSlide(slide) {
    // Reset fragments
    slide.querySelectorAll('.fragment').forEach(f => f.classList.remove('visible'));
    // Trigger counters
    slide.querySelectorAll('.counter').forEach(el => {
      const target = parseFloat(el.dataset.target);
      if (!isNaN(target)) animateCounter(el, target);
    });
  }

  document.addEventListener('keydown', (e) => {
    if (e.key === 'ArrowRight' || e.key === 'ArrowDown' || e.key === ' ') {
      e.preventDefault();
      // Try fragments first
      if (!advanceFragments(slides[current])) {
        goToSlide(current + 1);
      }
    }
    if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') {
      e.preventDefault();
      goToSlide(current - 1);
    }
    if (e.key === 'Home') goToSlide(0);
    if (e.key === 'End') goToSlide(slides.length - 1);
  });

  // Scroll-snap sync
  const container = document.querySelector('.slides-container');
  if (container) {
    let scrollTimeout;
    container.addEventListener('scroll', () => {
      clearTimeout(scrollTimeout);
      scrollTimeout = setTimeout(() => {
        const scrollTop = container.scrollTop;
        const slideHeight = window.innerHeight;
        const newIndex = Math.round(scrollTop / slideHeight);
        if (newIndex !== current) {
          current = newIndex;
          updateUI();
          activateSlide(slides[current]);
        }
      }, 100);
    });
  }

  // Touch/swipe support
  let touchStartY = 0;
  document.addEventListener('touchstart', (e) => { touchStartY = e.touches[0].clientY; });
  document.addEventListener('touchend', (e) => {
    const diff = touchStartY - e.changedTouches[0].clientY;
    if (Math.abs(diff) > 50) {
      if (diff > 0) goToSlide(current + 1);
      else goToSlide(current - 1);
    }
  });

  // Initialize
  updateUI();
  activateSlide(slides[0]);
  slides[0].classList.add('active');
})();
```

---

## Animation Rules of Thumb

1. **Entrance > Exit** — Spend animation budget on entrances. Exits should be instant or fast fade.
2. **Stagger > Simultaneous** — Elements appearing one by one (with 80-120ms delay) feels crafted. Everything at once feels cheap.
3. **Transform > Opacity alone** — Pure opacity fade is boring. Combine with translateY, scale, or clip-path.
4. **Ease-out > Ease-in** — Elements should arrive quickly and settle slowly (ease-out-expo). Ease-in feels sluggish.
5. **300-600ms sweet spot** — Under 200ms feels instant (not animated). Over 800ms feels slow. Aim for 400-600ms for main reveals.
6. **One hero animation per slide** — One element gets the dramatic animation. Everything else is subtle. Fighting for attention = no hierarchy.
7. **Never animate text color** — It's distracting and hard to read during transition.
8. **Reduced motion = instant state** — The `prefers-reduced-motion` version should show the final state immediately, not a simplified animation.
