# Opportunity Categories Reference

## The 6 Fix Categories

Every process node gets evaluated against these categories during the annotation pass. A node can have multiple tags, but assign the **primary** category based on highest impact.

---

### 1. Bottleneck `[BTL]`

**Color**: Red (`#f8cecc` fill / `#b85450` stroke)

**Definition**: A step where work piles up, waits for a single person, or has unpredictable duration that blocks downstream steps.

**Detection signals**:
- "I'm the only one who can do this"
- Step has no SLA or time estimate
- Downstream steps frequently wait on this
- Manual handoff with no notification system
- Step requires synchronous availability (e.g., live call)

**Scoring criteria**:

| Factor              | Weight | 1 (Low)           | 3 (Medium)              | 5 (High)                    |
|---------------------|--------|--------------------|--------------------------|------------------------------|
| Frequency           | 0.3    | Monthly            | Weekly                   | Daily / per-client           |
| Wait time created   | 0.3    | Minutes            | Hours                    | Days                         |
| Revenue impact      | 0.2    | Indirect           | Delays revenue           | Blocks revenue               |
| Single point of failure | 0.2 | Multiple people can do it | 2 people can do it | Only 1 person can do it      |

**Impact score** = weighted sum (max 5.0). Flag as critical if >= 4.0.

**Common fixes**: Delegate, create SOP, add async alternative, batch processing, set SLAs.

---

### 2. Automate `[AUTO]`

**Color**: Orange (`#fff2cc` fill / `#d6b656` stroke)

**Definition**: A step that is repetitive, rule-based, and could be handled by software, AI, or a scheduled automation.

**Detection signals**:
- "I do this the same way every time"
- Step involves copying data between systems
- Trigger is predictable (time-based, event-based)
- No judgment or creativity required
- Step is high-frequency, low-complexity

**Scoring criteria**:

| Factor              | Weight | 1 (Low)            | 3 (Medium)              | 5 (High)                   |
|---------------------|--------|---------------------|--------------------------|------------------------------|
| Repetitiveness      | 0.3    | Varies each time    | Mostly same              | Identical every time         |
| Frequency           | 0.25   | Monthly             | Weekly                   | Daily or more                |
| Time per occurrence  | 0.2   | < 2 min             | 5-15 min                 | > 30 min                     |
| Tool availability   | 0.15   | Custom build needed | Integration exists       | Native feature available     |
| Error rate (manual) | 0.1    | Rarely errors       | Occasional mistakes      | Frequent errors              |

**Impact score** = weighted sum (max 5.0). Prioritize if >= 3.5 AND tool availability >= 3.

**Common tools**: Zapier, Make, n8n, custom scripts, AI agents, scheduled emails, CRM automations.

---

### 3. Digital Asset `[DA]`

**Color**: Green (`#d5e8d4` fill / `#82b366` stroke) — shares the "protect" color since assets are high-value

**Definition**: A step that could be replaced or augmented by a reusable digital asset — a template, checklist, video, SOP doc, or self-service portal.

**Detection signals**:
- "I explain this to every client"
- Step involves educating or onboarding
- Information delivered is identical each time
- Step exists to answer predictable questions

**Scoring criteria**:

| Factor              | Weight | 1 (Low)            | 3 (Medium)                | 5 (High)                     |
|---------------------|--------|---------------------|----------------------------|-------------------------------|
| Reusability         | 0.35   | Unique each time    | 70% same                   | 95%+ identical                |
| Creation effort     | 0.2    | Weeks               | Days                       | Hours                         |
| Time saved per use  | 0.25   | < 5 min             | 15-30 min                  | > 1 hour                      |
| Client experience   | 0.2    | Marginal improvement| Noticeably better          | Transformative               |

**Impact score** = weighted sum (max 5.0). Quick wins: score >= 3.0 AND creation effort >= 3.

**Common assets**: Loom videos, Notion templates, intake forms, FAQ pages, onboarding portals, SOPs.

---

### 4. Delegate `[DEL]`

**Color**: Orange (`#fff2cc` fill / `#d6b656` stroke) — shares automation color since both remove owner burden

**Definition**: A step currently done by the owner that could be handed to a team member, contractor, or VA with proper training and documentation.

**Detection signals**:
- Owner does the step but it doesn't require owner-level judgment
- Step is trainable in < 2 hours
- No proprietary knowledge required
- Output quality is binary (done correctly or not)
- Owner mentions "I should really hand this off"

**Scoring criteria**:

| Factor              | Weight | 1 (Low)             | 3 (Medium)              | 5 (High)                     |
|---------------------|--------|----------------------|--------------------------|-------------------------------|
| Owner time freed    | 0.3    | < 30 min/week        | 1-3 hrs/week             | > 5 hrs/week                  |
| Trainability        | 0.25   | Complex, nuanced     | SOP-able                 | Already documented            |
| Risk if delegated   | 0.2    | High (client-facing) | Medium                   | Low (internal, reversible)    |
| Cost to delegate    | 0.15   | Expensive specialist  | Moderate VA/contractor   | Existing team can absorb      |
| Owner enjoyment     | 0.1    | Loves doing it       | Neutral                  | Dreads doing it               |

**Impact score** = weighted sum (max 5.0). Prioritize if >= 3.5 AND trainability >= 3.

---

### 5. Protect `[HV]`

**Color**: Green (`#d5e8d4` fill / `#82b366` stroke)

**Definition**: A high-value activity that should be protected from delegation or automation. This is where the owner's unique genius creates disproportionate value.

**Detection signals**:
- Step directly creates revenue or client trust
- Requires owner's unique expertise, voice, or relationship
- Clients specifically value this interaction
- Removing the owner would degrade quality significantly
- Step is energizing for the owner

**Annotation behavior**: These nodes get the green color AND a note: "PROTECT — Owner's unique value. Optimize surrounding steps to maximize time here."

**Common examples**: Strategy sessions, high-ticket sales calls, creative direction, key relationship management, thought leadership content.

---

### 6. Eliminate `[ELIM]`

**Color**: Grey with strikethrough styling (`#f5f5f5` fill / `#666666` stroke, dashed border)

**Definition**: A step that can be removed entirely without meaningful impact on outcomes.

**Detection signals**:
- "We've always done it this way but I'm not sure why"
- Step produces output nobody uses
- Step is a workaround for a problem that no longer exists
- Removing the step wouldn't change the client experience
- Step duplicates work done elsewhere

**Scoring criteria**:

| Factor              | Weight | 1 (Keep)            | 3 (Maybe)               | 5 (Eliminate)                |
|---------------------|--------|----------------------|--------------------------|-------------------------------|
| Impact if removed   | 0.4    | Noticeable degradation| Minimal impact           | Zero impact                   |
| Time currently spent | 0.3   | < 5 min              | 15-30 min                | > 1 hour                      |
| Historical inertia  | 0.15   | Recently added       | Been there a while       | "Always done this"            |
| Workaround status   | 0.15   | Solves real problem  | Problem partially exists | Problem no longer exists      |

**Impact score** = weighted sum (max 5.0). Recommend elimination if >= 4.0.

---

## Annotation Pass Procedure

After generating a swimlane diagram, run this pass on every node:

1. **Scan each process node** (rectangles in actor lanes).
2. **Ask internally**: Does this node match any of the 6 categories? Check detection signals.
3. **Score the top match** using the scoring table.
4. **Apply the annotation**:
   - Change fill/stroke to category color
   - Add label prefix (e.g., `[BTL]`, `[AUTO]`)
   - Add a tooltip or note with the score and recommended fix
5. **Generate the opportunity summary** after all nodes are annotated:

```
## Opportunity Summary

| # | Node | Category | Score | Recommended Action | Time Saved/Week |
|---|------|----------|-------|-------------------|-----------------|
| 1 | ...  | ...      | X.X   | ...               | ...             |
```

6. **Prioritize**: Sort by score descending. Group into "Quick Wins" (score >= 3.5, low effort) and "Strategic Projects" (score >= 4.0, higher effort).

## Cross-Category Rules

- A node tagged `[BTL]` that is also automatable gets **both** tags: `[BTL][AUTO]` — fix the bottleneck via automation.
- A node tagged `[HV]` should **never** also be tagged `[DEL]` or `[ELIM]`. If there's tension, the owner decides.
- `[ELIM]` overrides all other tags — if a step should be eliminated, don't bother automating or delegating it.
- Maximum 2 tags per node to keep diagrams readable.
