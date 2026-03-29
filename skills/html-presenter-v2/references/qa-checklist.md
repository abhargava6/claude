# QA Checklist — HTML Presenter v2

Use this checklist after generating every presentation. Assume there are problems — your job is to find them.

---

## Step 1: Open and Navigate

Save the HTML file and open it in a browser:

```bash
cp presentation.html /mnt/user-data/outputs/presentation.html
```

Then manually navigate through every slide using arrow keys and verify the experience.

---

## Visual Inspection Checklist

For each slide, check:

### Layout & Spacing
- [ ] No text overflows its container or gets clipped
- [ ] All content has at least 5vw / 5vh breathing room from edges
- [ ] Content blocks have consistent spacing between them
- [ ] Columns and grid items are properly aligned
- [ ] No content hidden behind UI chrome (counter, progress bar)
- [ ] Slide feels balanced — no awkward empty quadrants
- [ ] Cards / grid items are evenly sized and spaced

### Typography
- [ ] Same heading font used consistently on all slides
- [ ] Same body font used consistently on all slides
- [ ] Title sizes are consistent across content slides
- [ ] Body text is at least `1rem` (readable without squinting)
- [ ] No random bold or color emphasis in body text
- [ ] Line height is comfortable (1.5-1.8 for body text)
- [ ] No orphaned single words on their own line in titles

### Color & Contrast
- [ ] Only palette colors used — no off-palette hex values
- [ ] Primary color used for headings consistently
- [ ] Accent color used sparingly (<10% of slide area)
- [ ] Dark slides match each other in tone (title, sections, closing)
- [ ] Light slides match each other in tone (content slides)
- [ ] All text passes WCAG contrast check (4.5:1 body, 3:1 large)
- [ ] Muted text is still readable, not too faded

### Motif & Consistency
- [ ] Visual motif applied consistently on all content slides
- [ ] Card styles (radius, shadow, padding) are identical everywhere
- [ ] Icon treatment is consistent (all emoji, or all SVG, or all colored circles)

### Slide Variety
- [ ] No same layout used on two consecutive slides
- [ ] Every slide has at least one non-text visual element
- [ ] At least 3 different slide types used in the deck

---

## Navigation & Interaction Checks

- [ ] Arrow keys (left/right or up/down) navigate between all slides
- [ ] Space bar advances to next slide or next fragment
- [ ] Home key goes to first slide
- [ ] End key goes to last slide
- [ ] Slide counter updates correctly on every slide
- [ ] Progress bar fills accurately from 0% to 100%
- [ ] Fragments (if used) reveal in correct order
- [ ] Stat counters animate from 0 to target value
- [ ] No JavaScript errors in console
- [ ] Scroll-snap works smoothly (no stuck positions)

---

## Animation Checks

- [ ] Entrance animations play when slide becomes active
- [ ] Animations are staggered (not all at once)
- [ ] No animation plays on page load (only on slide activation)
- [ ] Animations feel smooth (no jank, no stuttering)
- [ ] Duration is in the 300-800ms range (not too fast, not too slow)
- [ ] Card hover effects work on all cards
- [ ] Reduced motion: test with `prefers-reduced-motion: reduce` — layout should still be correct and all content visible

To test reduced motion in Chrome DevTools:
1. Open DevTools → Rendering tab
2. Set "Emulate CSS media feature prefers-reduced-motion" to "reduce"
3. Verify all slides still look correct (content visible, no layout breaks)

---

## Responsive Checks

Test at these viewport sizes:
- [ ] 1920×1080 (Full HD — projector/monitor)
- [ ] 1366×768 (Common laptop)
- [ ] 1024×768 (Tablet landscape)
- [ ] 768×1024 (Tablet portrait)
- [ ] 375×812 (Mobile — if shared as a link)

Key things to verify at smaller sizes:
- [ ] Two-column layouts stack vertically on mobile
- [ ] Card grids collapse to single column on mobile
- [ ] Text remains readable at all sizes
- [ ] No horizontal scrolling on any slide
- [ ] Stat rows stack vertically on narrow screens

---

## Content QA

- [ ] No placeholder text: "Lorem ipsum", "[insert]", "TODO", "XXXX", "placeholder"
- [ ] No leftover template text: "YOUR TITLE HERE", "Subtitle or Presenter Name"
- [ ] Slide count in counter matches actual number of slides
- [ ] Title slide and closing slide feel like bookends (same treatment)
- [ ] Spelling and grammar check on all visible text

---

## Code Quality

- [ ] Single `.html` file (no external CSS/JS files, no CDN links except Google Fonts)
- [ ] All CSS variables defined on `:root`
- [ ] Google Fonts loaded via `@import` in `<style>`
- [ ] Semantic HTML used: `<section>`, `<h1>`-`<h3>`, `<p>`, `<blockquote>`, `<figure>`
- [ ] `lang="en"` on `<html>` tag
- [ ] `<meta charset="UTF-8">` and `<meta viewport>` present
- [ ] `<title>` tag has meaningful title
- [ ] Print stylesheet included (`@media print`)
- [ ] All `@keyframes` animations wrapped in `@media (prefers-reduced-motion: no-preference)`
- [ ] No inline styles except for animation delays (use classes instead)
- [ ] Comments explain non-obvious CSS/JS decisions

---

## Common Bugs to Fix

| Bug | Fix |
|-----|-----|
| Text overflows on mobile | Use `clamp()` for font sizes; add `word-break: break-word` |
| Animations play on page load | Only add `.active` class after navigation init |
| Slide counter says "1 / NaN" | Ensure counter JS runs after DOM is ready |
| Progress bar doesn't reach 100% | Fix the math: `((current + 1) / total) * 100` |
| Scroll-snap skips slides | Add `scroll-snap-align: start` on every `.slide` |
| Cards have different heights | Use `align-items: stretch` on grid and set `min-height` |
| Stat counter shows NaN | Check `data-target` attribute has a valid number |
| Focus trap in slide | Ensure `tabindex` management is correct |
| Reduced motion breaks layout | Move layout-critical transforms out of animation media query |
| Gradient looks banded | Add `background-size: 400% 400%` and use more color stops |

---

## Verification Loop

1. Generate the HTML file
2. Open in browser, navigate through all slides
3. Check every item on the visual, navigation, animation, and responsive checklists
4. Fix issues found
5. Re-open and verify fixes
6. Repeat until a full pass finds no new issues

**Do not deliver until you've verified navigation works end-to-end and there are no console errors.**
