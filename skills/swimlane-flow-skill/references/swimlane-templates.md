# Swimlane Templates Reference

## How to Use Templates

Templates are starting points, not finished diagrams. The workflow is:

1. Detect the archetype and process area.
2. Pull the closest template from this file.
3. Modify nodes, lanes, and connections based on the interview.
4. Apply annotation colors from the opportunity pass.
5. Run the 5-step Swimlane Placement Algorithm to finalize layout.

---

## Template 1: Content Creation Pipeline

**Fits**: Coach, Course Creator, Creator archetypes
**Process**: Content ideation → creation → distribution → measurement

```xml
<mxfile host="app.diagrams.net" modified="2026-01-01T00:00:00.000Z" agent="Claude" version="24.0.0" type="device">
  <diagram id="swimlane-1" name="Content Creation Pipeline">
    <mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1600" pageHeight="900" math="0" shadow="0">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>

        <!-- Pool -->
        <mxCell id="pool-content" value="Content Creation Pipeline" style="shape=pool;startSize=30;horizontal=1;childLayout=stackLayout;horizontalStack=1;resizeParent=1;resizeParentMax=0;collapsible=0;marginBottom=0;swimlaneHead=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=14;" vertex="1" parent="1">
          <mxGeometry x="40" y="40" width="1520" height="820" as="geometry"/>
        </mxCell>

        <!-- Lane: Owner -->
        <mxCell id="lane-owner" value="Owner" style="swimlane;startSize=30;horizontal=0;fillColor=#dae8fc;strokeColor=#6c8ebf;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-content">
          <mxGeometry x="30" y="0" width="1490" height="200" as="geometry"/>
        </mxCell>

        <!-- Lane: AI -->
        <mxCell id="lane-ai" value="AI / Automation" style="swimlane;startSize=30;horizontal=0;fillColor=#fff2cc;strokeColor=#d6b656;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-content">
          <mxGeometry x="30" y="200" width="1490" height="200" as="geometry"/>
        </mxCell>

        <!-- Lane: Team -->
        <mxCell id="lane-team" value="Team" style="swimlane;startSize=30;horizontal=0;fillColor=#d5e8d4;strokeColor=#82b366;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-content">
          <mxGeometry x="30" y="400" width="1490" height="200" as="geometry"/>
        </mxCell>

        <!-- Lane: Output -->
        <mxCell id="lane-output" value="Output" style="swimlane;startSize=30;horizontal=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-content">
          <mxGeometry x="30" y="600" width="1490" height="200" as="geometry"/>
        </mxCell>

        <!-- === NODES === -->

        <!-- Start -->
        <mxCell id="start-content" value="Start" style="ellipse;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;fontStyle=1;" vertex="1" parent="lane-owner">
          <mxGeometry x="40" y="80" width="60" height="40" as="geometry"/>
        </mxCell>

        <!-- Step 1: Ideation (Owner, HV) -->
        <mxCell id="step-c1" value="[HV] Content Ideation" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;arcSize=20;" vertex="1" parent="lane-owner">
          <mxGeometry x="140" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 2: Draft / Record (Owner, HV) -->
        <mxCell id="step-c2" value="[HV] Draft / Record" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;arcSize=20;" vertex="1" parent="lane-owner">
          <mxGeometry x="340" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 3: Edit / Polish (Team) -->
        <mxCell id="step-c3" value="Edit / Polish" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;fontSize=11;arcSize=20;" vertex="1" parent="lane-team">
          <mxGeometry x="540" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 4: Repurpose (AI, AUTO) -->
        <mxCell id="step-c4" value="[AUTO] Repurpose&#xa;for Platforms" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="740" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 5: Schedule / Publish (AI, AUTO) -->
        <mxCell id="step-c5" value="[AUTO] Schedule&#xa;&amp; Publish" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="940" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 6: Track Analytics (AI, AUTO) -->
        <mxCell id="step-c6" value="[AUTO] Track&#xa;Analytics" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="1140" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Output: Published Content -->
        <mxCell id="output-published" value="Published Content&#xa;Across Platforms" style="shape=document;whiteSpace=wrap;html=1;fillColor=#f5f5f5;strokeColor=#666666;fontSize=10;boundedLbl=1;size=0.12;" vertex="1" parent="lane-output">
          <mxGeometry x="940" y="60" width="160" height="70" as="geometry"/>
        </mxCell>

        <!-- Output: Performance Report -->
        <mxCell id="output-report" value="Performance&#xa;Report" style="shape=document;whiteSpace=wrap;html=1;fillColor=#f5f5f5;strokeColor=#666666;fontSize=10;boundedLbl=1;size=0.12;" vertex="1" parent="lane-output">
          <mxGeometry x="1140" y="60" width="160" height="70" as="geometry"/>
        </mxCell>

        <!-- End -->
        <mxCell id="end-content" value="End" style="ellipse;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;fontStyle=1;" vertex="1" parent="lane-output">
          <mxGeometry x="1380" y="80" width="60" height="40" as="geometry"/>
        </mxCell>

        <!-- === ARROWS === -->

        <!-- Same-lane: Start → Ideation -->
        <mxCell id="arrow-start-c1" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="start-content" target="step-c1" parent="lane-owner">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Same-lane: Ideation → Draft -->
        <mxCell id="arrow-c1-c2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-c1" target="step-c2" parent="lane-owner">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Cross-lane: Draft (Owner) → Edit (Team) -->
        <mxCell id="xarrow-c2-c3" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-c2" target="step-c3" parent="pool-content">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Cross-lane: Edit (Team) → Repurpose (AI) -->
        <mxCell id="xarrow-c3-c4" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-c3" target="step-c4" parent="pool-content">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Same-lane: Repurpose → Schedule -->
        <mxCell id="arrow-c4-c5" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-c4" target="step-c5" parent="lane-ai">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Same-lane: Schedule → Track -->
        <mxCell id="arrow-c5-c6" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-c5" target="step-c6" parent="lane-ai">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Cross-lane: Schedule → Published Content (Output) -->
        <mxCell id="xarrow-c5-out1" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#999999;strokeWidth=1;dashed=1;" edge="1" source="step-c5" target="output-published" parent="pool-content">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Cross-lane: Track → Report (Output) -->
        <mxCell id="xarrow-c6-out2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#999999;strokeWidth=1;dashed=1;" edge="1" source="step-c6" target="output-report" parent="pool-content">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Same-lane: Report → End -->
        <mxCell id="arrow-out2-end" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="output-report" target="end-content" parent="lane-output">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
```

---

## Template 2: Sales Pipeline

**Fits**: Coach, Agency, Service Provider archetypes
**Process**: Lead qualification → Discovery → Proposal → Close

```xml
<mxfile host="app.diagrams.net" modified="2026-01-01T00:00:00.000Z" agent="Claude" version="24.0.0" type="device">
  <diagram id="swimlane-1" name="Sales Pipeline">
    <mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1600" pageHeight="900" math="0" shadow="0">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>

        <!-- Pool -->
        <mxCell id="pool-sales" value="Sales Pipeline" style="shape=pool;startSize=30;horizontal=1;childLayout=stackLayout;horizontalStack=1;resizeParent=1;resizeParentMax=0;collapsible=0;marginBottom=0;swimlaneHead=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=14;" vertex="1" parent="1">
          <mxGeometry x="40" y="40" width="1520" height="820" as="geometry"/>
        </mxCell>

        <!-- Lane: Owner -->
        <mxCell id="lane-owner" value="Owner" style="swimlane;startSize=30;horizontal=0;fillColor=#dae8fc;strokeColor=#6c8ebf;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-sales">
          <mxGeometry x="30" y="0" width="1490" height="220" as="geometry"/>
        </mxCell>

        <!-- Lane: AI -->
        <mxCell id="lane-ai" value="AI / Automation" style="swimlane;startSize=30;horizontal=0;fillColor=#fff2cc;strokeColor=#d6b656;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-sales">
          <mxGeometry x="30" y="220" width="1490" height="200" as="geometry"/>
        </mxCell>

        <!-- Lane: Team -->
        <mxCell id="lane-team" value="Team" style="swimlane;startSize=30;horizontal=0;fillColor=#d5e8d4;strokeColor=#82b366;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-sales">
          <mxGeometry x="30" y="420" width="1490" height="200" as="geometry"/>
        </mxCell>

        <!-- Lane: Output -->
        <mxCell id="lane-output" value="Output" style="swimlane;startSize=30;horizontal=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-sales">
          <mxGeometry x="30" y="620" width="1490" height="180" as="geometry"/>
        </mxCell>

        <!-- === NODES === -->

        <!-- Start -->
        <mxCell id="start-sales" value="Start" style="ellipse;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;fontStyle=1;" vertex="1" parent="lane-ai">
          <mxGeometry x="40" y="80" width="60" height="40" as="geometry"/>
        </mxCell>

        <!-- Step 1: Lead Capture (AI, AUTO) -->
        <mxCell id="step-s1" value="[AUTO] Lead&#xa;Capture" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="140" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 2: Lead Scoring (AI, AUTO) -->
        <mxCell id="step-s2" value="[AUTO] Lead&#xa;Scoring" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="340" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Decision: Qualified? -->
        <mxCell id="dec-s1" value="Qualified?" style="rhombus;whiteSpace=wrap;html=1;fillColor=#e1d5e7;strokeColor=#9673a6;fontSize=10;" vertex="1" parent="lane-ai">
          <mxGeometry x="550" y="50" width="120" height="100" as="geometry"/>
        </mxCell>

        <!-- Step 3: Nurture Sequence (AI, AUTO) — No branch -->
        <mxCell id="step-s3-nurture" value="[AUTO] Nurture&#xa;Sequence" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="550" y="160" width="120" height="40" as="geometry"/>
        </mxCell>

        <!-- Step 3: Discovery Call (Owner, HV) — Yes branch -->
        <mxCell id="step-s3" value="[HV] Discovery&#xa;Call" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;arcSize=20;" vertex="1" parent="lane-owner">
          <mxGeometry x="720" y="80" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 4: Send Proposal (Owner, BTL) -->
        <mxCell id="step-s4" value="[BTL] Send&#xa;Proposal" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;arcSize=20;" vertex="1" parent="lane-owner">
          <mxGeometry x="920" y="80" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 5: Follow-up (AI, AUTO) -->
        <mxCell id="step-s5" value="[AUTO] Follow-up&#xa;Sequence" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="920" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Decision: Closed? -->
        <mxCell id="dec-s2" value="Closed?" style="rhombus;whiteSpace=wrap;html=1;fillColor=#e1d5e7;strokeColor=#9673a6;fontSize=10;" vertex="1" parent="lane-owner">
          <mxGeometry x="1140" y="60" width="120" height="100" as="geometry"/>
        </mxCell>

        <!-- Output: Signed Contract -->
        <mxCell id="output-contract" value="Signed Contract&#xa;+ Payment" style="shape=document;whiteSpace=wrap;html=1;fillColor=#f5f5f5;strokeColor=#666666;fontSize=10;boundedLbl=1;size=0.12;" vertex="1" parent="lane-output">
          <mxGeometry x="1140" y="50" width="160" height="70" as="geometry"/>
        </mxCell>

        <!-- End -->
        <mxCell id="end-sales" value="End" style="ellipse;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;fontStyle=1;" vertex="1" parent="lane-output">
          <mxGeometry x="1380" y="65" width="60" height="40" as="geometry"/>
        </mxCell>

        <!-- === ARROWS === -->

        <mxCell id="arrow-start-s1" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="start-sales" target="step-s1" parent="lane-ai">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="arrow-s1-s2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-s1" target="step-s2" parent="lane-ai">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="arrow-s2-dec1" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-s2" target="dec-s1" parent="lane-ai">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Decision: No → Nurture -->
        <mxCell id="dec-s1-no" value="No" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#b85450;strokeWidth=1.5;fontColor=#b85450;fontSize=10;fontStyle=1;" edge="1" source="dec-s1" target="step-s3-nurture" parent="lane-ai">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Decision: Yes → Discovery Call (cross-lane) -->
        <mxCell id="dec-s1-yes" value="Yes" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#82b366;strokeWidth=1.5;fontColor=#82b366;fontSize=10;fontStyle=1;" edge="1" source="dec-s1" target="step-s3" parent="pool-sales">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Discovery → Proposal (same lane) -->
        <mxCell id="arrow-s3-s4" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-s3" target="step-s4" parent="lane-owner">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Proposal → Follow-up (cross-lane) -->
        <mxCell id="xarrow-s4-s5" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-s4" target="step-s5" parent="pool-sales">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Follow-up → Closed? (cross-lane) -->
        <mxCell id="xarrow-s5-dec2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-s5" target="dec-s2" parent="pool-sales">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Closed? Yes → Contract (cross-lane) -->
        <mxCell id="dec-s2-yes" value="Yes" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#82b366;strokeWidth=1.5;fontColor=#82b366;fontSize=10;fontStyle=1;" edge="1" source="dec-s2" target="output-contract" parent="pool-sales">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Contract → End -->
        <mxCell id="arrow-contract-end" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="output-contract" target="end-sales" parent="lane-output">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
```

---

## Template 3: Client Onboarding

**Fits**: Coach, Agency, Service Provider, SaaS archetypes
**Process**: Welcome → Access setup → Kickoff → First deliverable

```xml
<mxfile host="app.diagrams.net" modified="2026-01-01T00:00:00.000Z" agent="Claude" version="24.0.0" type="device">
  <diagram id="swimlane-1" name="Client Onboarding">
    <mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1600" pageHeight="900" math="0" shadow="0">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>

        <mxCell id="pool-onboard" value="Client Onboarding" style="shape=pool;startSize=30;horizontal=1;childLayout=stackLayout;horizontalStack=1;resizeParent=1;resizeParentMax=0;collapsible=0;marginBottom=0;swimlaneHead=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=14;" vertex="1" parent="1">
          <mxGeometry x="40" y="40" width="1520" height="820" as="geometry"/>
        </mxCell>

        <mxCell id="lane-owner" value="Owner" style="swimlane;startSize=30;horizontal=0;fillColor=#dae8fc;strokeColor=#6c8ebf;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-onboard">
          <mxGeometry x="30" y="0" width="1490" height="200" as="geometry"/>
        </mxCell>

        <mxCell id="lane-ai" value="AI / Automation" style="swimlane;startSize=30;horizontal=0;fillColor=#fff2cc;strokeColor=#d6b656;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-onboard">
          <mxGeometry x="30" y="200" width="1490" height="200" as="geometry"/>
        </mxCell>

        <mxCell id="lane-team" value="Team" style="swimlane;startSize=30;horizontal=0;fillColor=#d5e8d4;strokeColor=#82b366;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-onboard">
          <mxGeometry x="30" y="400" width="1490" height="200" as="geometry"/>
        </mxCell>

        <mxCell id="lane-output" value="Output" style="swimlane;startSize=30;horizontal=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-onboard">
          <mxGeometry x="30" y="600" width="1490" height="200" as="geometry"/>
        </mxCell>

        <!-- Start -->
        <mxCell id="start-onboard" value="Contract&#xa;Signed" style="ellipse;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=10;fontStyle=1;" vertex="1" parent="lane-ai">
          <mxGeometry x="40" y="75" width="70" height="50" as="geometry"/>
        </mxCell>

        <!-- Step 1: Welcome Email (AI) -->
        <mxCell id="step-o1" value="[AUTO] Welcome&#xa;Email + Intake" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="160" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 2: Collect Assets (Team, BTL) -->
        <mxCell id="step-o2" value="[BTL] Collect&#xa;Client Assets" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;arcSize=20;" vertex="1" parent="lane-team">
          <mxGeometry x="360" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 3: Setup Systems (AI) -->
        <mxCell id="step-o3" value="[AUTO] Setup&#xa;Project in Tools" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="560" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 4: Kickoff Call (Owner, HV) -->
        <mxCell id="step-o4" value="[HV] Kickoff&#xa;Call" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;arcSize=20;" vertex="1" parent="lane-owner">
          <mxGeometry x="760" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 5: Internal Briefing (Team) -->
        <mxCell id="step-o5" value="Internal&#xa;Team Brief" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;fontSize=11;arcSize=20;" vertex="1" parent="lane-team">
          <mxGeometry x="960" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 6: First Deliverable (Team) -->
        <mxCell id="step-o6" value="First&#xa;Deliverable" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;fontSize=11;arcSize=20;" vertex="1" parent="lane-team">
          <mxGeometry x="1160" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Output: Active Client -->
        <mxCell id="output-active" value="Active Client&#xa;in System" style="shape=document;whiteSpace=wrap;html=1;fillColor=#f5f5f5;strokeColor=#666666;fontSize=10;boundedLbl=1;size=0.12;" vertex="1" parent="lane-output">
          <mxGeometry x="760" y="60" width="160" height="70" as="geometry"/>
        </mxCell>

        <!-- End -->
        <mxCell id="end-onboard" value="Onboarded" style="ellipse;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;fontStyle=1;" vertex="1" parent="lane-output">
          <mxGeometry x="1380" y="75" width="70" height="50" as="geometry"/>
        </mxCell>

        <!-- Arrows -->
        <mxCell id="arrow-start-o1" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="start-onboard" target="step-o1" parent="lane-ai">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-o1-o2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-o1" target="step-o2" parent="pool-onboard">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-o2-o3" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-o2" target="step-o3" parent="pool-onboard">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-o3-o4" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-o3" target="step-o4" parent="pool-onboard">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-o4-out" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#999999;strokeWidth=1;dashed=1;" edge="1" source="step-o4" target="output-active" parent="pool-onboard">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-o4-o5" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-o4" target="step-o5" parent="pool-onboard">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="arrow-o5-o6" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-o5" target="step-o6" parent="lane-team">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-o6-end" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-o6" target="end-onboard" parent="pool-onboard">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
```

---

## Template 4: Service Fulfillment

**Fits**: Service Provider, Agency archetypes
**Process**: Work execution → QA → Delivery → Invoice

```xml
<mxfile host="app.diagrams.net" modified="2026-01-01T00:00:00.000Z" agent="Claude" version="24.0.0" type="device">
  <diagram id="swimlane-1" name="Service Fulfillment">
    <mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1600" pageHeight="900" math="0" shadow="0">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>

        <mxCell id="pool-fulfill" value="Service Fulfillment" style="shape=pool;startSize=30;horizontal=1;childLayout=stackLayout;horizontalStack=1;resizeParent=1;resizeParentMax=0;collapsible=0;marginBottom=0;swimlaneHead=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=14;" vertex="1" parent="1">
          <mxGeometry x="40" y="40" width="1520" height="820" as="geometry"/>
        </mxCell>

        <mxCell id="lane-owner" value="Owner" style="swimlane;startSize=30;horizontal=0;fillColor=#dae8fc;strokeColor=#6c8ebf;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-fulfill">
          <mxGeometry x="30" y="0" width="1490" height="200" as="geometry"/>
        </mxCell>

        <mxCell id="lane-ai" value="AI / Automation" style="swimlane;startSize=30;horizontal=0;fillColor=#fff2cc;strokeColor=#d6b656;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-fulfill">
          <mxGeometry x="30" y="200" width="1490" height="200" as="geometry"/>
        </mxCell>

        <mxCell id="lane-team" value="Team" style="swimlane;startSize=30;horizontal=0;fillColor=#d5e8d4;strokeColor=#82b366;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-fulfill">
          <mxGeometry x="30" y="400" width="1490" height="200" as="geometry"/>
        </mxCell>

        <mxCell id="lane-output" value="Output" style="swimlane;startSize=30;horizontal=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-fulfill">
          <mxGeometry x="30" y="600" width="1490" height="200" as="geometry"/>
        </mxCell>

        <!-- Start -->
        <mxCell id="start-fulfill" value="Project&#xa;Kickoff" style="ellipse;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=10;fontStyle=1;" vertex="1" parent="lane-team">
          <mxGeometry x="40" y="75" width="70" height="50" as="geometry"/>
        </mxCell>

        <!-- Step 1: Execute Work (Team) -->
        <mxCell id="step-f1" value="Execute&#xa;Deliverables" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;fontSize=11;arcSize=20;" vertex="1" parent="lane-team">
          <mxGeometry x="160" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 2: Status Update (AI, AUTO) -->
        <mxCell id="step-f2" value="[AUTO] Status&#xa;Update to Client" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="360" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 3: QA Review (Owner, HV) -->
        <mxCell id="step-f3" value="[HV] QA /&#xa;Creative Review" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;arcSize=20;" vertex="1" parent="lane-owner">
          <mxGeometry x="560" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Decision: Approved? -->
        <mxCell id="dec-f1" value="Approved?" style="rhombus;whiteSpace=wrap;html=1;fillColor=#e1d5e7;strokeColor=#9673a6;fontSize=10;" vertex="1" parent="lane-owner">
          <mxGeometry x="770" y="50" width="120" height="100" as="geometry"/>
        </mxCell>

        <!-- Revision loop (No branch) -->
        <mxCell id="step-f-revise" value="[BTL] Revisions" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;arcSize=20;" vertex="1" parent="lane-team">
          <mxGeometry x="560" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 4: Client Delivery (Team) -->
        <mxCell id="step-f4" value="Deliver to&#xa;Client" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;fontSize=11;arcSize=20;" vertex="1" parent="lane-team">
          <mxGeometry x="940" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 5: Invoice (AI, AUTO) -->
        <mxCell id="step-f5" value="[AUTO] Generate&#xa;Invoice" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="1140" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Output: Completed Work -->
        <mxCell id="output-work" value="Completed&#xa;Deliverable" style="shape=document;whiteSpace=wrap;html=1;fillColor=#f5f5f5;strokeColor=#666666;fontSize=10;boundedLbl=1;size=0.12;" vertex="1" parent="lane-output">
          <mxGeometry x="940" y="60" width="140" height="70" as="geometry"/>
        </mxCell>

        <!-- Output: Paid Invoice -->
        <mxCell id="output-invoice" value="Paid&#xa;Invoice" style="shape=document;whiteSpace=wrap;html=1;fillColor=#f5f5f5;strokeColor=#666666;fontSize=10;boundedLbl=1;size=0.12;" vertex="1" parent="lane-output">
          <mxGeometry x="1140" y="60" width="140" height="70" as="geometry"/>
        </mxCell>

        <!-- End -->
        <mxCell id="end-fulfill" value="Done" style="ellipse;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;fontStyle=1;" vertex="1" parent="lane-output">
          <mxGeometry x="1380" y="75" width="60" height="40" as="geometry"/>
        </mxCell>

        <!-- Arrows -->
        <mxCell id="arrow-start-f1" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="start-fulfill" target="step-f1" parent="lane-team">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-f1-f2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-f1" target="step-f2" parent="pool-fulfill">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-f2-f3" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-f2" target="step-f3" parent="pool-fulfill">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="arrow-f3-dec" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-f3" target="dec-f1" parent="lane-owner">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- No → Revisions (cross-lane) -->
        <mxCell id="dec-f1-no" value="No" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#b85450;strokeWidth=1.5;fontColor=#b85450;fontSize=10;fontStyle=1;" edge="1" source="dec-f1" target="step-f-revise" parent="pool-fulfill">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Revisions → QA again (cross-lane loop) -->
        <mxCell id="xarrow-revise-f3" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-f-revise" target="step-f3" parent="pool-fulfill">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="670" y="430"/>
            </Array>
          </mxGeometry>
        </mxCell>

        <!-- Yes → Deliver (cross-lane) -->
        <mxCell id="dec-f1-yes" value="Yes" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#82b366;strokeWidth=1.5;fontColor=#82b366;fontSize=10;fontStyle=1;" edge="1" source="dec-f1" target="step-f4" parent="pool-fulfill">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-f4-out" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#999999;strokeWidth=1;dashed=1;" edge="1" source="step-f4" target="output-work" parent="pool-fulfill">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-f4-f5" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-f4" target="step-f5" parent="pool-fulfill">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-f5-outinv" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#999999;strokeWidth=1;dashed=1;" edge="1" source="step-f5" target="output-invoice" parent="pool-fulfill">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="arrow-outinv-end" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="output-invoice" target="end-fulfill" parent="lane-output">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
```

---

## Template 5: Admin / Operations

**Fits**: All archetypes (back-office operations)
**Process**: Invoicing → Bookkeeping → Reporting → Tax prep

```xml
<mxfile host="app.diagrams.net" modified="2026-01-01T00:00:00.000Z" agent="Claude" version="24.0.0" type="device">
  <diagram id="swimlane-1" name="Admin Operations">
    <mxGraphModel dx="1422" dy="762" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1600" pageHeight="900" math="0" shadow="0">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>

        <mxCell id="pool-admin" value="Admin / Operations (Monthly Cycle)" style="shape=pool;startSize=30;horizontal=1;childLayout=stackLayout;horizontalStack=1;resizeParent=1;resizeParentMax=0;collapsible=0;marginBottom=0;swimlaneHead=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=14;" vertex="1" parent="1">
          <mxGeometry x="40" y="40" width="1520" height="820" as="geometry"/>
        </mxCell>

        <mxCell id="lane-owner" value="Owner" style="swimlane;startSize=30;horizontal=0;fillColor=#dae8fc;strokeColor=#6c8ebf;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-admin">
          <mxGeometry x="30" y="0" width="1490" height="200" as="geometry"/>
        </mxCell>

        <mxCell id="lane-ai" value="AI / Automation" style="swimlane;startSize=30;horizontal=0;fillColor=#fff2cc;strokeColor=#d6b656;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-admin">
          <mxGeometry x="30" y="200" width="1490" height="200" as="geometry"/>
        </mxCell>

        <mxCell id="lane-team" value="Team / Bookkeeper" style="swimlane;startSize=30;horizontal=0;fillColor=#d5e8d4;strokeColor=#82b366;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-admin">
          <mxGeometry x="30" y="400" width="1490" height="200" as="geometry"/>
        </mxCell>

        <mxCell id="lane-output" value="Output" style="swimlane;startSize=30;horizontal=0;fillColor=#f5f5f5;strokeColor=#666666;fontStyle=1;fontSize=12;collapsible=0;" vertex="1" parent="pool-admin">
          <mxGeometry x="30" y="600" width="1490" height="200" as="geometry"/>
        </mxCell>

        <!-- Start -->
        <mxCell id="start-admin" value="Month&#xa;Start" style="ellipse;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=10;fontStyle=1;" vertex="1" parent="lane-ai">
          <mxGeometry x="40" y="75" width="70" height="50" as="geometry"/>
        </mxCell>

        <!-- Step 1: Auto-invoice (AI) -->
        <mxCell id="step-a1" value="[AUTO] Send&#xa;Recurring Invoices" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="160" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 2: Payment Follow-up (AI) -->
        <mxCell id="step-a2" value="[AUTO] Payment&#xa;Reminders" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="360" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 3: Categorize Transactions (Team) -->
        <mxCell id="step-a3" value="Categorize&#xa;Transactions" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#dae8fc;strokeColor=#6c8ebf;fontSize=11;arcSize=20;" vertex="1" parent="lane-team">
          <mxGeometry x="560" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 4: Reconcile (Team, BTL) -->
        <mxCell id="step-a4" value="[BTL] Reconcile&#xa;Accounts" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=11;arcSize=20;" vertex="1" parent="lane-team">
          <mxGeometry x="760" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 5: Generate Reports (AI) -->
        <mxCell id="step-a5" value="[AUTO] Generate&#xa;P&amp;L / Reports" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#fff2cc;strokeColor=#d6b656;fontSize=11;arcSize=20;" vertex="1" parent="lane-ai">
          <mxGeometry x="960" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Step 6: Review Financials (Owner, HV) -->
        <mxCell id="step-a6" value="[HV] Review&#xa;Financials" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#d5e8d4;strokeColor=#82b366;fontSize=11;arcSize=20;" vertex="1" parent="lane-owner">
          <mxGeometry x="1160" y="70" width="160" height="60" as="geometry"/>
        </mxCell>

        <!-- Output: Financial Reports -->
        <mxCell id="output-reports" value="Monthly&#xa;Financial Report" style="shape=document;whiteSpace=wrap;html=1;fillColor=#f5f5f5;strokeColor=#666666;fontSize=10;boundedLbl=1;size=0.12;" vertex="1" parent="lane-output">
          <mxGeometry x="960" y="60" width="160" height="70" as="geometry"/>
        </mxCell>

        <!-- End -->
        <mxCell id="end-admin" value="Month&#xa;Close" style="ellipse;whiteSpace=wrap;html=1;fillColor=#f8cecc;strokeColor=#b85450;fontSize=10;fontStyle=1;" vertex="1" parent="lane-output">
          <mxGeometry x="1380" y="75" width="70" height="50" as="geometry"/>
        </mxCell>

        <!-- Arrows -->
        <mxCell id="arrow-start-a1" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="start-admin" target="step-a1" parent="lane-ai">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="arrow-a1-a2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-a1" target="step-a2" parent="lane-ai">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-a2-a3" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-a2" target="step-a3" parent="pool-admin">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="arrow-a3-a4" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-a3" target="step-a4" parent="lane-team">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-a4-a5" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-a4" target="step-a5" parent="pool-admin">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-a5-out" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#999999;strokeWidth=1;dashed=1;" edge="1" source="step-a5" target="output-reports" parent="pool-admin">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-a5-a6" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-a5" target="step-a6" parent="pool-admin">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <mxCell id="xarrow-a6-end" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;strokeColor=#333333;strokeWidth=1.5;" edge="1" source="step-a6" target="end-admin" parent="pool-admin">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
```

---

## Template Selection Guide

| User's Process Area | Primary Template | Secondary Template |
|--------------------|------------------|--------------------|
| Content, marketing, social media | Content Creation | — |
| Sales, leads, pipeline, closing | Sales Pipeline | — |
| New client setup, welcome, access | Client Onboarding | — |
| Delivery, projects, revisions | Service Fulfillment | — |
| Finance, invoicing, bookkeeping | Admin / Operations | — |
| Full business map | Use ALL templates | Chain them sequentially |

When chaining templates for a full business map, connect the End node of one to the Start node of the next with a cross-diagram link annotation.
