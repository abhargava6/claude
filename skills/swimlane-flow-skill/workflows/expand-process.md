# Expand Process Workflow — 3-Level Drill-Down

## Overview

When a user wants to go deeper on a specific process stage, this workflow expands it through 3 levels of detail. Each level adds specificity without losing the big picture.

**Rule**: Never skip levels. Always confirm the current level before drilling to the next.

---

## Level 1: Process Flow (WHO does it)

This is the default level from the main interview. Each node represents a step with an actor assignment.

**Node format**: `[Actor] → [Action verb] [Object]`

**Example**:
```
Owner → Conduct discovery call
Team → Send follow-up email
AI → Schedule next meeting
Output → Qualified lead in CRM
```

**Transition to Level 2**: User says "drill into [step]", "expand [step]", "show me more detail on [step]", or "what systems are involved in [step]?"

---

## Level 2: System Detail (WHICH systems and handoffs)

Each Level 1 node expands into a sub-process showing specific tools, integrations, and handoffs.

**Node format**: `[Actor] → [Action] in [System/Tool] → [Handoff/Trigger]`

**Expansion procedure**:

1. **Identify the Level 1 node** to expand.
2. **Infer the sub-steps** using archetype knowledge and confirmed tools.
3. **Map tool interactions**: Which systems are involved? What triggers the next step?
4. **Identify handoff points**: Where does responsibility shift between actors or systems?
5. **Present as inference** for confirmation.

**Script**:
> Let me expand **[Step Name]** to show the system-level detail:
>
> **[Step Name] — Expanded**:
> 1. [Actor] → [Sub-step] in [Tool]
>    ↓ triggers
> 2. [Actor/AI] → [Sub-step] in [Tool]
>    ↓ handoff to
> 3. [Actor] → [Sub-step] in [Tool]
>    → **Output**: [Result] in [System]
>
> Is this how it actually flows? Any steps or tools I'm missing?

**What to capture at Level 2**:
- Specific tool names (e.g., "Calendly" not "scheduling tool")
- Integration points (e.g., "Calendly → Zapier → HubSpot")
- Manual gaps (e.g., "I manually copy the info from email to spreadsheet" → flag as `[AUTO]`)
- Wait states (e.g., "Then I wait for the client to respond" → flag as `[BTL]`)

**Transition to Level 3**: User says "how exactly does [sub-step] work?", "walk me through the execution of [sub-step]", or "what's the exact sequence for [sub-step]?"

---

## Level 3: Execution Detail (HOW it executes)

Each Level 2 node expands into exact execution steps — click-by-click, field-by-field where relevant. This level is used for building SOPs, training materials, or identifying micro-automation opportunities.

**Node format**: `[Actor] → [Exact action] → [Expected result] → [Next trigger]`

**Expansion procedure**:

1. **Identify the Level 2 node** to expand.
2. **Map the exact execution sequence**: What literally happens, step by step?
3. **Identify decision micro-points**: Any conditional logic within this step?
4. **Time-stamp**: How long does each micro-step take?
5. **Error paths**: What happens if something goes wrong at each micro-step?

**Script**:
> Here's the execution-level breakdown of **[Sub-step Name]**:
>
> ```
> 1. [Actor] opens [Tool/Screen] (~X min)
> 2. [Actor] [exact action, e.g., "clicks New Contact, fills Name/Email/Source fields"]
> 3. IF [condition]: → [path A]
>    ELSE: → [path B]
> 4. [Actor] [next action] → triggers [automation/notification]
> 5. Output: [Exact artifact, e.g., "Contact record with status = 'Discovery Scheduled'"]
> ```
>
> Does this match your actual execution? Where do things deviate?

**What to capture at Level 3**:
- Exact time per micro-step
- Error rates and recovery procedures
- "I wish I could..." statements (indicate automation or tool gaps)
- Copy-paste operations (prime `[AUTO]` candidates)
- Judgment calls that seem binary (decision rules that could be automated)

---

## Diagram Generation for Expanded Processes

When generating draw.io XML for an expanded process:

### Level 2 Expansion: Sub-Process Container

Wrap the expanded steps in a **group container** (draw.io group) inside the parent swimlane:

```xml
<!-- Level 2 expansion sits inside the parent lane as a grouped sub-process -->
<mxCell id="subproc-group" value="[Step Name] — Detail" 
  style="group;rounded=1;strokeColor=#6c8ebf;dashed=1;dashPattern=5 5;fillColor=none;" 
  vertex="1" connectable="0" parent="[parent-lane-id]">
  <mxGeometry x="[x]" y="[y]" width="[w]" height="[h]" as="geometry"/>
</mxCell>
<!-- Sub-steps are children of this group -->
```

### Level 3 Expansion: Annotation Notes

Level 3 detail is typically too granular for the swimlane diagram itself. Instead:

1. **Generate a separate diagram** if the user wants a visual Level 3.
2. **Or add notes**: Attach draw.io "note" shapes to Level 2 nodes with the execution detail.

```xml
<!-- Execution note attached to a Level 2 node -->
<mxCell id="note-1" value="EXECUTION DETAIL:&#xa;1. Open [Tool]&#xa;2. [Action]&#xa;3. IF [x]: [path]&#xa;Time: ~X min" 
  style="shape=note;whiteSpace=wrap;html=1;size=14;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=10;align=left;" 
  vertex="1" parent="[parent-lane-id]">
  <mxGeometry x="[x]" y="[y]" width="200" height="120" as="geometry"/>
</mxCell>
<!-- Dotted connector from note to node -->
<mxCell id="note-conn-1" style="edgeStyle=orthogonalEdgeStyle;dashed=1;strokeColor=#999999;" 
  edge="1" source="note-1" target="[level2-node-id]" parent="[parent-lane-id]">
  <mxGeometry relative="1" as="geometry"/>
</mxCell>
```

---

## Drill-Down Decision Tree

```
User asks to expand a step
  │
  ├─ Is the step already at Level 1?
  │   └─ YES → Expand to Level 2 (System Detail)
  │
  ├─ Is the step already at Level 2?
  │   └─ YES → Expand to Level 3 (Execution Detail)
  │
  ├─ Is the step already at Level 3?
  │   └─ YES → "This is the most detailed level. Want me to generate an SOP document instead?"
  │
  └─ Is the step a decision node?
      └─ YES → Expand BOTH branches to the next level, showing full conditional paths
```

---

## Returning to the Main Flow

After expanding, always offer:

> We've drilled into **[Step Name]** at [Level X] detail. Want to:
> 1. **Drill deeper** into a specific sub-step?
> 2. **Go back** to the main process view and expand a different stage?
> 3. **Generate the updated diagram** with this detail included?

Update the session state YAML to reflect the current drill-down level for each expanded stage.
