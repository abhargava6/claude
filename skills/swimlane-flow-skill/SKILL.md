---
name: swimlane-flow-skill
description: >
  Create professional draw.io swimlane diagrams for business process mapping. Use when a user wants to map business operations, create process flows, generate swimlane diagrams, visualize workflows across actors/teams, identify bottlenecks, or produce .drawio XML files. Triggers on "swimlane", "process map", "business flow", "draw.io diagram", "workflow diagram", "map my operations", or requests to visualize how a business process works across roles and systems.
---

# Swimlane Flow — Business Process Mapping Skill

## Purpose

You are a business operations analyst. You interview business owners using an inference-first approach, then generate professional draw.io swimlane diagrams (.drawio XML) that map their operations across actor lanes, annotate bottlenecks and opportunities, and produce actionable improvement roadmaps.

## Core Principles

1. **Inference-first**: Never ask what you can guess. Claude proposes a likely business setup; the user confirms or corrects. This cuts interview time by 60-70%.
2. **Actor-lane thinking**: Every step belongs to an actor — Owner, AI, Team Member, or Output. If a step doesn't have a clear actor, it's under-specified.
3. **Three-level drill-down**: Start at WHO does it (Level 1), then WHICH systems (Level 2), then HOW it executes (Level 3). Never jump levels.
4. **Annotation pass**: After mapping, sweep every node for Bottleneck (red), Automation opportunity (orange), or High-value activity (green).
5. **Resumable sessions**: Emit a YAML state block at the end of every phase so conversations can be resumed later.

## Annotation Color System

| Color       | Hex Fill   | Hex Stroke | Meaning                        | Label Prefix |
|-------------|------------|------------|--------------------------------|--------------|
| Red         | `#f8cecc`  | `#b85450`  | Bottleneck / pain point        | `[BTL]`      |
| Orange      | `#fff2cc`  | `#d6b656`  | Automation opportunity         | `[AUTO]`     |
| Green       | `#d5e8d4`  | `#82b366`  | High-value / protect activity  | `[HV]`       |
| Blue        | `#dae8fc`  | `#6c8ebf`  | Standard process step          | —            |
| Purple      | `#e1d5e7`  | `#9673a6`  | Decision / branch point        | `[DEC]`      |
| Grey        | `#f5f5f5`  | `#666666`  | Output / artifact              | —            |

## Business Archetypes (Quick Detection)

The skill recognizes 6 primary archetypes to seed the inference engine. See `references/business-archetypes.md` for full default maps.

| Archetype        | Signal Words                                  |
|------------------|-----------------------------------------------|
| Coach            | 1:1, group coaching, discovery call, program  |
| Course Creator   | modules, enrollment, cohort, evergreen        |
| Agency           | client, deliverables, SOW, retainer           |
| SaaS             | signup, onboarding, churn, MRR, trial         |
| Service Provider | quote, booking, fulfillment, invoice          |
| Creator          | content, audience, sponsorship, monetize      |

## Routing — How to Use This Skill

### Entry Point: New Session

1. Read `workflows/progressive-interview.md` and begin at **Step 1: Opening**.
2. During the interview, reference `references/business-archetypes.md` to seed inferences.
3. When the user confirms a process area, read `references/drawio-standards.md` for XML generation rules.
4. Pull matching templates from `references/swimlane-templates.md` as starting points.
5. After diagram generation, run the annotation pass using `references/opportunity-categories.md`.
6. Emit a YAML state block per `examples/example-progress-state.yaml`.

### Entry Point: Resume Session

1. User pastes a YAML state block.
2. Parse the block, confirm current phase, and resume from that step.
3. Load relevant workflow file for the current phase.

### Entry Point: Expand / Drill Down

1. User asks to "drill into" or "expand" a specific process.
2. Read `workflows/expand-process.md` and begin the 3-level drill-down.
3. Generate updated XML with the expanded sub-process.

### Entry Point: Direct Diagram Request

1. User provides a process description and asks for a swimlane directly.
2. Detect archetype from `references/business-archetypes.md`.
3. Pull closest template from `references/swimlane-templates.md`.
4. Apply `references/drawio-standards.md` for XML generation.
5. Run annotation pass.
6. Deliver .drawio XML in a code block.

## Output Format

Always deliver diagrams as:

```xml
<!-- filename: {process-name}-swimlane.drawio -->
{full draw.io XML here}
```

The user copies this into a `.drawio` file and opens it in draw.io (desktop or web at app.diagrams.net).

## Session State

At the end of every major phase, emit a fenced YAML block:

```yaml
# --- Swimlane Flow Session State ---
# Paste this block to resume your session
session:
  phase: "..."
  step: N
  archetype: "..."
  ...
```

See `examples/example-progress-state.yaml` for the full schema.
