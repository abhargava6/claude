# Feedback Log

Accumulated learnings from previous release notes. Every entry here is a hard constraint — do not repeat these mistakes.

---

## 2026-05-05 (Initial release — Trip Sharing + Driver Location Warnings)

- **Inline SVGs get stripped in Front and Outlook.** Never use `<svg>` elements in the HTML email. Use Unicode characters (●, ◆, ⚠, 📍, 📱, 💡, ⭐, →, ⓘ, ▶) or Cloudinary-hosted PNG images instead.
- **"Stakeholders" is too vague for internal teams.** Always list specific roles on first mention: other TCs, passengers, security teams, group contacts, coordinators, executive assistants, family members.
- **Passengers need explicit distinction.** Passengers can be both sharers (they have the app) and viewers (trips shared with them). Call this out explicitly in the relevant step.
- **App download language must handle both cases.** If stakeholders already have the app, they're taken directly to the shared trip. Only new users go to the app store. Never say "download the app" without this nuance.
- **Empty space next to screenshots looks unfinished.** Always fill the right column with: step number, title, description paragraph, AND 3 bullet highlights with copper accent dots.
- **The enablement doc CTA must be visually prominent.** Use a full-width copper gradient card with white text and a clear "Read the full guide →" button. A subtle dark card blends in and gets missed.
- **Always mention app update requirements.** If clients need to update via app stores, add a green info banner with the go-live date.
- **Lead generation CTA.** When a feature captures contact details, include a callout: "Want to convert a viewer lead into a client? Reach out to Product for next steps."
- **DM Sans font import must be in the `<head>`.** Use `@import` in a `<style>` block in the head, not inline.
- **Images from `/user-files/` or local paths don't work.** All images must use full `https://` URLs (Cloudinary or similar CDN).
- **Google Drive image URLs can be unreliable in email.** Prefer Cloudinary over Google Drive for hosting email images.
