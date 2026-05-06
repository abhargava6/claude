# Draw.io XML Generation Standards

## Overview

This document defines the exact XML rules for generating valid .drawio swimlane diagrams. These rules ensure diagrams open correctly in both draw.io desktop and app.diagrams.net (web).

---

## File Structure

Every .drawio file follows this skeleton:

```xml
<mxfile host="app.diagrams.net" modified="2026-01-01T00:00:00.000Z" agent="Claude" version="24.0.0" type="device">
  <diagram id="swimlane-1" name="[Process Name]">
    <mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1600" pageHeight="900" math="0" shadow="0">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>
        <!-- Pool and lanes go here -->
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
```

**Key attributes**:
- `pageWidth="1600" pageHeight="900"` — landscape orientation, fits most screens
- `grid="1" gridSize="10"` — snap to 10px grid for alignment
- `id="0"` is the root cell (always present, never modified)
- `id="1"` is the default parent (always present, never modified)

---

## Pool and Lane Structure

### The Pool (Container)

The pool is the outer container that holds all swim lanes. **All lanes and their contents are children of the pool.**

```xml
<!-- Pool: the outer container -->
<mxCell id="pool-1" value="[Process Title]" 
  style="shape=pool;startSize=30;horizontal=1;collapsible=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=14;" 
  vertex="1" parent="1">
  <mxGeometry x="40" y="40" width="1520" height="800" as="geometry"/>
</mxCell>
```

**Critical**: The pool's `parent="1"` (the default layer). Everything else parents to the pool or to a lane.

> **⚠️ NEVER use `childLayout=stackLayout` on the pool.** This property causes draw.io to auto-recalculate the entire layout whenever the user manually edits anything (moving a node, repositioning an arrow, resizing a lane). It flips swimlanes from horizontal to vertical and destroys the diagram structure. The following properties must ALL be omitted from the pool style:
> - `childLayout=stackLayout`
> - `horizontalStack=1`
> - `resizeParent=1`
> - `resizeParentMax=0`
> - `marginBottom=0`
> - `swimlaneHead=0`
>
> Instead, manually position lanes using explicit `y` coordinates on each lane's `mxGeometry`. This gives the user full control to edit the diagram after generation.

### Swim Lanes

Each actor gets a horizontal lane inside the pool.

```xml
<!-- Lane: Owner -->
<mxCell id="lane-owner" value="Owner" 
  style="swimlane;startSize=30;horizontal=0;fillColor=#dae8fc;strokeColor=#6c8ebf;fontStyle=1;fontSize=12;collapsible=0;" 
  vertex="1" parent="pool-1">
  <mxGeometry x="30" y="0" width="1490" height="200" as="geometry"/>
</mxCell>

<!-- Lane: AI / Automation -->
<mxCell id="lane-ai" value="AI / Automation" 
  style="swimlane;startSize=30;horizontal=0;fillColor=#fff2cc;strokeColor=#d6b656;fontStyle=1;fontSize=12;collapsible=0;" 
  vertex="1" parent="pool-1">
  <mxGeometry x="30" y="200" width="1490" height="200" as="geometry"/>
</mxCell>

<!-- Lane: Team -->
<mxCell id="lane-team" value="Team" 
  style="swimlane;startSize=30;horizontal=0;fillColor=#d5e8d4;strokeColor=#82b366;fontStyle=1;fontSize=12;collapsible=0;" 
  vertex="1" parent="pool-1">
  <mxGeometry x="30" y="400" width="1490" height="200" as="geometry"/>
</mxCell>

<!-- Lane: Output -->
<mxCell id="lane-output" value="Output" 
  style="swimlane;startSize=30;horizontal=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=12;collapsible=0;" 
  vertex="1" parent="pool-1">
  <mxGeometry x="30" y="600" width="1490" height="200" as="geometry"/>
</mxCell>
```

**Lane rules**:
- `horizontal=0` makes the lane header vertical (on the left side), with content flowing left-to-right. This is the standard horizontal swimlane orientation.
- `startSize=30` is the width of the lane header.
- Lane `parent` = the pool ID.
- Lane y-positions stack vertically (0, 200, 400, 600 for 4 lanes of height 200 each).
- Lane x starts at `30` (to account for the pool header).

---

## Node Types

### Process Step (Rectangle)

```xml
<mxCell id="step-1" value="[Step Name]" 
  style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;fontSize=11;arcSize=20;" 
  vertex="1" parent="[lane-id]">
  <mxGeometry x="60" y="40" width="160" height="60" as="geometry"/>
</mxCell>
```

- Default size: `160x60`
- `rounded=1;arcSize=20` for rounded rectangles
- `parent` must be the lane ID where this step lives
- Coordinates are **relative to the lane**, not the page

### Decision Diamond

```xml
<mxCell id="dec-1" value="[Question?]" 
  style="rhombus;whiteSpace=wrap;html=1;fillColor=#e1d5e7;strokeColor=#9673a6;fontSize=10;arcSize=20;" 
  vertex="1" parent="[lane-id]">
  <mxGeometry x="280" y="20" width="120" height="100" as="geometry"/>
</mxCell>
```

- Default size: `120x100`
- Keep question text short (< 30 chars)

### Start / End Terminals

```xml
<!-- Start -->
<mxCell id="start-1" value="Start" 
  style="ellipse;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;fontStyle=1;" 
  vertex="1" parent="[lane-id]">
  <mxGeometry x="10" y="50" width="60" height="40" as="geometry"/>
</mxCell>

<!-- End -->
<mxCell id="end-1" value="End" 
  style="ellipse;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;fontStyle=1;" 
  vertex="1" parent="[lane-id]">
  <mxGeometry x="1380" y="50" width="60" height="40" as="geometry"/>
</mxCell>
```

### Output / Artifact (Document shape)

```xml
<mxCell id="output-1" value="[Artifact Name]" 
  style="shape=document;whiteSpace=wrap;html=1;fillColor=#f5f5f5;strokeColor=#666666;fontSize=10;boundedLbl=1;size=0.12;" 
  vertex="1" parent="lane-output">
  <mxGeometry x="[x]" y="40" width="140" height="60" as="geometry"/>
</mxCell>
```

### Annotated Node (with opportunity tag)

Apply the annotation color and add the tag prefix to the value:

```xml
<!-- Bottleneck example -->
<mxCell id="step-btl-1" value="[BTL] Send Proposal" 
  style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;arcSize=20;" 
  vertex="1" parent="lane-owner">
  <mxGeometry x="400" y="40" width="160" height="60" as="geometry"/>
</mxCell>

<!-- Automation opportunity example -->
<mxCell id="step-auto-1" value="[AUTO] Follow-up Email" 
  style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" 
  vertex="1" parent="lane-ai">
  <mxGeometry x="400" y="40" width="160" height="60" as="geometry"/>
</mxCell>

<!-- High-value example -->
<mxCell id="step-hv-1" value="[HV] Discovery Call" 
  style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;arcSize=20;" 
  vertex="1" parent="lane-owner">
  <mxGeometry x="240" y="40" width="160" height="60" as="geometry"/>
</mxCell>
```

---

## Arrow / Connection Rules

### Same-Lane Arrow (horizontal flow)

```xml
<mxCell id="arrow-1" value="" 
  style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" 
  edge="1" source="step-1" target="step-2" parent="[lane-id]">
  <mxGeometry relative="1" as="geometry"/>
</mxCell>
```

- Same-lane arrows: `parent` = the lane ID
- Use `orthogonalEdgeStyle` for clean right-angle routing

### Cross-Lane Arrow (CRITICAL)

**This is the most common source of broken diagrams.** Cross-lane arrows must parent to the **pool**, not to either lane.

```xml
<!-- Cross-lane arrow: Owner lane → AI lane -->
<mxCell id="xarrow-1" value="" 
  style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" 
  edge="1" source="step-1" target="step-auto-1" parent="pool-1">
  <mxGeometry relative="1" as="geometry"/>
</mxCell>
```

**Why `parent="pool-1"`?** Because draw.io resolves coordinates relative to the parent. If a cross-lane arrow parents to `lane-owner`, it can't correctly locate nodes in `lane-ai`. The pool is the common ancestor of all lanes, so coordinates resolve correctly.

**Rule**: If `source` and `target` are in different lanes → `parent` = pool ID. Always.

### Decision Branch Arrows

```xml
<!-- Yes branch -->
<mxCell id="dec-yes" value="Yes" 
  style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#82b366;strokeWidth=1.5;fontColor=#82b366;fontSize=10;fontStyle=1;" 
  edge="1" source="dec-1" target="step-yes" parent="[common-parent]">
  <mxGeometry relative="1" as="geometry"/>
</mxCell>

<!-- No branch -->
<mxCell id="dec-no" value="No" 
  style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#b85450;strokeWidth=1.5;fontColor=#b85450;fontSize=10;fontStyle=1;" 
  edge="1" source="dec-1" target="step-no" parent="[common-parent]">
  <mxGeometry relative="1" as="geometry"/>
</mxCell>
```

- Yes branches: green stroke (`#82b366`)
- No branches: red stroke (`#b85450`)
- `parent` follows the same rule: same lane = lane ID, cross-lane = pool ID

---

## The 5-Step Swimlane Placement Algorithm

This algorithm prevents messy, overlapping diagrams. Run it every time you generate XML.

### Step 1: Build the Connection Map

Before placing any nodes, catalog every connection:

```
connections = [
  { source: "start", target: "step-1", type: "same-lane" },
  { source: "step-1", target: "step-2", type: "same-lane" },
  { source: "step-2", target: "dec-1", type: "same-lane" },
  { source: "dec-1", target: "step-3", type: "cross-lane", label: "Yes" },
  { source: "dec-1", target: "step-4", type: "same-lane", label: "No" },
  ...
]
```

### Step 2: Identify the Main Flow Path

Find the longest path from Start to End that doesn't branch. This is your **spine** — it gets placed first and determines the horizontal spread of the diagram.

### Step 3: Place Main Path Nodes

Place main-path nodes left-to-right with consistent spacing:

```
x_start = 60 (after lane header)
x_spacing = 200 (160px node + 40px gap)
y_center = (lane_height - node_height) / 2  (vertically centered in lane)
```

For each main-path node:
- `x = x_start + (position_index * x_spacing)`
- `y = y_center` (centered in its lane)
- If a node is in a different lane than the previous node, same x-position logic applies (horizontal position represents sequence, vertical position represents actor)

### Step 4: Place Branch Nodes

For each decision point on the main path:
1. The "continue" branch follows the main path (already placed).
2. The "alternate" branch places nodes **below or above** the main path's x-position:
   - If branching to a lower lane: place at the same x as the decision node
   - If branching within the same lane: offset y by +80 from the main path node

### Step 5: Arrow Audit

After all nodes are placed, audit every arrow:

1. **Overlap check**: No arrow should cross through a node it's not connected to. If it does, add waypoints:
   ```xml
   <mxCell id="arrow-rerouted" ...>
     <mxGeometry relative="1" as="geometry">
       <Array as="points">
         <mxPoint x="350" y="180"/>
         <mxPoint x="350" y="320"/>
       </Array>
     </mxGeometry>
   </mxCell>
   ```

2. **Direction check**: Arrows should primarily flow left-to-right. Back-arrows (right-to-left) are allowed for loops but should route below/above the main flow to avoid confusion.

3. **Cross-lane parent check**: Re-verify every cross-lane arrow has `parent="pool-1"`.

4. **Label collision check**: Arrow labels (Yes/No) should not overlap with nodes. Offset label position if needed using `x` and `y` on the geometry.

---

## Coordinate System Reference

All coordinates are relative to the parent element:

| Element | Parent | Coordinate origin |
|---------|--------|-------------------|
| Pool | `id="1"` (default layer) | Page top-left (0,0) |
| Lane | Pool | Pool content area top-left (after pool header) |
| Node | Lane | Lane content area top-left (after lane header, x=30) |
| Same-lane arrow | Lane | Lane content area |
| Cross-lane arrow | Pool | Pool content area |

**Common mistake**: Placing a cross-lane arrow with `parent="[lane-id]"` causes the arrow to render in the wrong position because the coordinates are resolved relative to the lane, not the pool.

---

## Sizing Guidelines

| Element | Width | Height | Notes |
|---------|-------|--------|-------|
| Pool | 1520 | Sum of lane heights | Fit within 1600px page width |
| Lane | 1490 | 150-250 | Depends on content density |
| Process step | 160 | 60 | Standard |
| Decision diamond | 120 | 100 | Keep text short |
| Start/End ellipse | 60 | 40 | |
| Output document | 140 | 60 | |
| Note (Level 3) | 200 | 120 | Attached to nodes |

**Spacing**: 40px minimum between nodes horizontally, 20px minimum vertically from lane edges.

---

## ID Naming Convention

Use descriptive, dash-separated IDs:

| Element | Pattern | Example |
|---------|---------|---------|
| Pool | `pool-[process]` | `pool-sales` |
| Lane | `lane-[actor]` | `lane-owner` |
| Step | `step-[stage]-[seq]` | `step-lead-1` |
| Decision | `dec-[stage]-[seq]` | `dec-sales-1` |
| Arrow (same-lane) | `arrow-[src]-[tgt]` | `arrow-lead1-lead2` |
| Arrow (cross-lane) | `xarrow-[src]-[tgt]` | `xarrow-lead2-auto1` |
| Start | `start-[process]` | `start-sales` |
| End | `end-[process]` | `end-sales` |
| Output | `output-[name]` | `output-contract` |

---

## Validation Checklist

Before delivering XML, verify:

- [ ] **Pool does NOT contain `childLayout=stackLayout`** ← BREAKS MANUAL EDITING (causes lanes to flip/restack on any user edit)
- [ ] File opens without errors in draw.io (well-formed XML)
- [ ] Pool exists with `parent="1"`
- [ ] All lanes have `parent="[pool-id]"`
- [ ] All nodes have `parent="[lane-id]"` (the lane they belong to)
- [ ] All same-lane arrows have `parent="[lane-id]"`
- [ ] All cross-lane arrows have `parent="[pool-id]"` ← MOST COMMON BUG
- [ ] No two nodes overlap (x/y don't collide)
- [ ] Main flow reads left-to-right
- [ ] Decision diamonds have exactly 2 outgoing arrows (labeled)
- [ ] Start node exists, End node exists
- [ ] Annotation colors match the category (red=BTL, orange=AUTO, green=HV)
- [ ] All IDs are unique
- [ ] `mxfile` → `diagram` → `mxGraphModel` → `root` structure is intact
