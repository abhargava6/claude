# Business Archetypes Reference

## How Archetypes Work

When a user describes their business, Claude detects the closest archetype and uses it to **seed the inference**. Instead of asking 30 questions from scratch, Claude proposes the archetype's default process map and the user confirms or corrects.

Detection happens by matching **signal words** in the user's description. If multiple archetypes match, ask one clarifying question to disambiguate.

---

## Archetype 1: Coach

**Signal words**: coaching, 1:1, group program, discovery call, transformation, accountability, session, package, high-ticket

**Default revenue model**: High-ticket packages ($2K-$25K), 1:1 or small group

**Default process map**:

```
Lead Generation:
  Owner: Create content (social/podcast/email) → [HV]
  AI: Repurpose content across platforms → [AUTO]
  Output: Published content

Lead Nurture:
  AI: Email sequence (value + case studies) → [AUTO]
  Owner: Engage in DMs / comments → [HV]
  Output: Warm lead list

Sales:
  Owner: Discovery call → [HV]
  Owner: Send proposal → [BTL] (often delayed)
  AI: Follow-up sequence → [AUTO]
  Output: Signed contract + payment

Onboarding:
  Team: Send welcome kit + intake form → [DEL]
  Owner: Kickoff call → [HV]
  AI: Schedule recurring sessions → [AUTO]
  Output: Client in system, sessions booked

Fulfillment:
  Owner: Deliver coaching sessions → [HV]
  Owner: Between-session support (Voxer/Slack) → [BTL]
  Team: Session notes + action items → [DEL]
  Output: Client progress documented

Retention:
  AI: Progress check-in emails → [AUTO]
  Owner: Renewal conversation → [HV]
  Output: Renewal or referral
```

**Common bottlenecks**: Proposal sending, between-session support, session scheduling
**Common automation wins**: Content repurposing, email sequences, scheduling, session notes

---

## Archetype 2: Course Creator

**Signal words**: course, modules, enrollment, cohort, evergreen, students, curriculum, launch, membership, community

**Default revenue model**: Course sales ($200-$2K), memberships, or cohort-based ($500-$5K)

**Default process map**:

```
Content Creation:
  Owner: Design curriculum / record lessons → [HV]
  Team: Edit video / build course platform → [DEL]
  AI: Generate supplementary materials → [AUTO]
  Output: Course modules live

Marketing:
  Owner: Launch content (webinars, emails) → [HV]
  AI: Ad copy + email sequences → [AUTO]
  Team: Manage ad spend / optimize → [DEL]
  Output: Traffic to sales page

Sales:
  AI: Sales page + checkout flow → [AUTO]
  AI: Cart abandonment emails → [AUTO]
  Owner: Live Q&A / webinar close → [HV]
  Output: Enrolled student

Onboarding:
  AI: Welcome email + platform access → [AUTO]
  AI: Drip content schedule → [AUTO]
  Output: Student active in course

Fulfillment:
  Team: Community moderation → [DEL]
  Owner: Live calls / office hours → [HV]
  AI: Progress tracking + nudge emails → [AUTO]
  Output: Student completing modules

Retention:
  AI: Completion celebration + upsell → [AUTO]
  Owner: Testimonial request → [BTL] (often forgotten)
  Output: Testimonial + upsell revenue
```

**Common bottlenecks**: Video editing backlog, testimonial collection, community response time
**Common automation wins**: Enrollment flow, drip content, progress nudges, cart recovery

---

## Archetype 3: Agency

**Signal words**: client, deliverables, SOW, retainer, project, team, creative, strategy, account manager, sprint

**Default revenue model**: Retainers ($2K-$20K/mo) or project-based ($5K-$100K)

**Default process map**:

```
Lead Generation:
  Owner: Thought leadership + networking → [HV]
  Team: Outbound prospecting → [DEL]
  AI: Lead research + personalization → [AUTO]
  Output: Qualified lead list

Sales:
  Owner: Strategy / pitch call → [HV]
  Team: Proposal / SOW creation → [BTL] (slow turnaround)
  Owner: Negotiation + close → [HV]
  Output: Signed SOW + deposit

Onboarding:
  Team: Kickoff deck + timeline → [DEL]
  Owner: Kickoff call → [HV]
  Team: Access + asset collection → [BTL] (client delays)
  AI: Project setup in PM tool → [AUTO]
  Output: Project live in system

Fulfillment:
  Team: Execute deliverables → Core work
  Owner: Creative direction / QA → [HV]
  Team: Client review rounds → [BTL] (revision cycles)
  AI: Status updates to client → [AUTO]
  Output: Approved deliverables

Reporting:
  AI: Pull metrics + generate report → [AUTO]
  Owner: Strategic insights layer → [HV]
  Team: Send report + schedule review → [DEL]
  Output: Monthly report delivered

Retention:
  Owner: QBR / relationship management → [HV]
  AI: Upsell triggers (usage patterns) → [AUTO]
  Output: Expanded retainer or referral
```

**Common bottlenecks**: SOW creation, client asset collection, revision cycles
**Common automation wins**: Lead research, project setup, status updates, reporting

---

## Archetype 4: SaaS

**Signal words**: signup, onboarding, churn, MRR, ARR, trial, freemium, feature, user, subscription, activation

**Default revenue model**: Monthly subscriptions ($10-$500/mo), annual plans

**Default process map**:

```
Acquisition:
  Team: Content marketing + SEO → Core work
  AI: Ad optimization + copy → [AUTO]
  Owner: Product-led growth strategy → [HV]
  Output: Traffic to signup page

Signup:
  AI: Signup flow + email verification → [AUTO]
  AI: Welcome email + quick-start guide → [AUTO]
  Output: New user in system

Activation:
  AI: Onboarding checklist / product tour → [AUTO]
  AI: Behavioral trigger emails → [AUTO]
  Team: High-touch onboarding (enterprise) → [DEL]
  Output: User hits activation milestone

Fulfillment (Product):
  Team: Feature development → Core work
  Owner: Product direction + prioritization → [HV]
  AI: Bug triage + routing → [AUTO]
  Output: Product updates shipped

Support:
  AI: Help docs + chatbot tier 1 → [AUTO]
  Team: Ticket resolution tier 2 → Core work
  Owner: Escalation / VIP support → [BTL]
  Output: Resolved tickets

Retention:
  AI: Churn prediction + intervention → [AUTO]
  Team: Customer success check-ins → [DEL]
  Owner: Strategic account management → [HV]
  Output: Renewed subscriptions, reduced churn
```

**Common bottlenecks**: Onboarding drop-off, support escalation, feature prioritization
**Common automation wins**: Signup flow, onboarding, tier-1 support, churn prediction

---

## Archetype 5: Service Provider

**Signal words**: quote, booking, appointment, fulfillment, invoice, schedule, on-site, consultation, estimate

**Default revenue model**: Per-service ($100-$10K), packages, or hourly

**Default process map**:

```
Lead Generation:
  AI: Google Business / directory listings → [AUTO]
  Owner: Referral network + local marketing → [HV]
  Team: Social media presence → [DEL]
  Output: Inbound inquiries

Quoting:
  Owner: Assessment / consultation → [HV]
  Owner: Create quote → [BTL] (manual, slow)
  AI: Quote template + auto-pricing → [AUTO]
  Output: Quote sent to prospect

Booking:
  AI: Online scheduling + deposit collection → [AUTO]
  AI: Confirmation + prep instructions → [AUTO]
  Output: Booked appointment

Fulfillment:
  Owner/Team: Deliver service → Core work
  Team: Document work (photos, notes) → [BTL] (often skipped)
  Output: Service completed

Follow-up:
  AI: Satisfaction survey → [AUTO]
  AI: Review request (Google, Yelp) → [AUTO]
  AI: Invoice + payment processing → [AUTO]
  Output: Paid invoice + review

Retention:
  AI: Maintenance reminders → [AUTO]
  AI: Re-engagement campaigns → [AUTO]
  Owner: VIP client relationship → [HV]
  Output: Repeat booking
```

**Common bottlenecks**: Quoting speed, documentation during service, invoice follow-up
**Common automation wins**: Scheduling, quote templates, review requests, reminders

---

## Archetype 6: Creator

**Signal words**: content, audience, followers, sponsor, monetize, brand, platform, newsletter, community, merch

**Default revenue model**: Ad revenue, sponsorships, digital products, community membership

**Default process map**:

```
Content Creation:
  Owner: Ideation + creation → [HV]
  Team: Editing + post-production → [DEL]
  AI: Thumbnails, titles, SEO optimization → [AUTO]
  Output: Published content

Distribution:
  AI: Cross-platform repurposing → [AUTO]
  AI: Scheduled posting → [AUTO]
  Team: Community engagement → [DEL]
  Output: Content live across platforms

Audience Growth:
  Owner: Collaborations + guest appearances → [HV]
  AI: Analytics + content strategy insights → [AUTO]
  Output: Growing audience metrics

Monetization — Sponsorships:
  Owner: Sponsor relationship + negotiation → [HV]
  Team: Media kit + rate card → [DEL]
  Owner: Sponsor content integration → [HV]
  Output: Sponsor revenue

Monetization — Products:
  Owner: Design digital product → [HV]
  AI: Sales page + checkout → [AUTO]
  AI: Delivery + email sequence → [AUTO]
  Output: Product revenue

Community:
  Owner: Exclusive content / live sessions → [HV]
  AI: Member onboarding + drip content → [AUTO]
  Team: Community moderation → [DEL]
  Output: Membership revenue
```

**Common bottlenecks**: Editing backlog, sponsor negotiation time, content ideation burnout
**Common automation wins**: Repurposing, scheduling, analytics, product delivery

---

## Archetype Detection Algorithm

When a user describes their business:

1. **Tokenize** the description into keywords.
2. **Match** keywords against each archetype's signal words.
3. **Score**: Count matches per archetype.
4. **Threshold**: If top archetype has >= 2 signal word matches AND >= 1.5x the second-place score, auto-detect.
5. **Disambiguate**: If scores are close (< 1.5x), present top 2 archetypes and ask: "Your business sounds like it could be a [X] or a [Y]. Which feels closer?"
6. **Hybrid**: Some businesses span archetypes (e.g., Coach + Course Creator). Acknowledge this and merge the default maps.

## Using Archetypes in the Interview

Once detected, present the default map as an inference:

> "Based on what you've described, you're running a **[Coach]** business. Here's what I'd expect your operations look like — tell me what's right, what's wrong, and what's missing:
>
> [Present default map as a numbered list]"

This lets the user confirm 80% and correct 20%, rather than building from zero.
