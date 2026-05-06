# Progressive Interview Workflow

## Overview

A 12-step interview that maps a business owner's operations using an **inference-first** approach. Claude guesses, the user confirms or corrects. Total time: 15-25 minutes for a complete operational map.

---

## Step 1: Opening

**Goal**: Set expectations and build rapport.

**Script**:
> I'm going to map out your business operations as a professional swimlane diagram — showing who does what, where things get stuck, and where you can automate or delegate.
>
> Here's how this works: I'll make educated guesses about your business, and you just tell me what's right and what's wrong. Much faster than starting from scratch.
>
> To start — what's your business? Just a sentence or two is fine. (e.g., "I run a coaching business helping executives with leadership" or "I have a design agency with 4 team members")

**Capture**: Raw business description.

**Transition**: Move to Step 2.

---

## Step 2: Business Type Detection

**Goal**: Detect archetype and confirm.

**Procedure**:
1. Run the archetype detection algorithm (see `references/business-archetypes.md`).
2. Present the detected archetype with confidence.

**Script (confident match)**:
> Got it — you're running a **[Archetype]** business. [One sentence about why this matches.]

**Script (ambiguous)**:
> Your business sounds like it could be a **[Archetype A]** or a **[Archetype B]**. Which feels closer? (Or tell me if it's something else entirely.)

**Capture**: Confirmed archetype. Store in session state.

**Transition**: Move to Step 3.

---

## Step 3: Context Extraction

**Goal**: Gather the 5 key context dimensions without asking 5 separate questions.

**The 5 dimensions**:
1. **Team size**: Solo, small team (2-5), or larger team (6+)
2. **Revenue model**: How money comes in (packages, subscriptions, project-based, etc.)
3. **Tech stack**: Key tools (CRM, email, PM tool, payment processor)
4. **Volume**: Approximate clients/customers per month
5. **Stage**: Startup, growth, established, scaling

**Script (inference-first)**:
> Based on [Archetype] businesses at your level, here's what I'd guess:
>
> - **Team**: [Guess — e.g., "Solo or maybe 1 VA"]
> - **Revenue**: [Guess — e.g., "$5K-$15K/mo from 1:1 coaching packages"]
> - **Tools**: [Guess — e.g., "Calendly, Zoom, maybe a basic CRM like HoneyBook"]
> - **Volume**: [Guess — e.g., "5-10 active clients at a time"]
> - **Stage**: [Guess — e.g., "Growth — you've proven the model, now you're capacity-constrained"]
>
> How close am I? Just correct what's wrong.

**Capture**: Confirmed context dimensions. Update session state.

**Transition**: Move to Step 4.

---

## Step 4: Revenue Stream Mapping

**Goal**: Identify all revenue streams and their relative importance.

**Script**:
> Let me guess your revenue streams:
>
> 1. **[Primary stream]** — [Guess % of revenue]
> 2. **[Secondary stream, if likely]** — [Guess %]
> 3. **[Tertiary, if likely]** — [Guess %]
>
> Did I get them? Any I'm missing?

**Capture**: Ranked revenue streams with approximate percentages.

**Transition**: Move to Step 5.

---

## Step 5: Customer Journey Overview

**Goal**: Map the high-level customer journey for the primary revenue stream.

**Script**:
> For your main revenue stream (**[Primary stream]**), here's the customer journey I'd expect:
>
> [Present the archetype's default process map from `references/business-archetypes.md`, formatted as a numbered journey]
>
> 1. **[Stage 1]**: [Default description]
> 2. **[Stage 2]**: [Default description]
> 3. ...
>
> Walk me through what's right and what's different in your version.

**Capture**: Confirmed/modified customer journey stages.

**Transition**: Move to Step 6.

---

## Step 6: Actor Assignment

**Goal**: For each journey stage, confirm WHO does it.

**The 4 actor lanes**:
- **Owner**: The business owner / founder
- **AI**: Automated systems, AI tools, software
- **Team**: Employees, contractors, VAs
- **Output**: Deliverables, artifacts, results (not an actor — this is the output lane)

**Script**:
> Now let me guess who handles each step. Tell me where I'm wrong:
>
> | Step | Who I Think Does It | Notes |
> |------|---------------------|-------|
> | [Step 1] | [Owner/AI/Team] | [Brief note] |
> | [Step 2] | [Owner/AI/Team] | [Brief note] |
> | ... | ... | ... |

**Capture**: Confirmed actor assignments for every step.

**Transition**: Move to Step 7.

---

## Step 7: Process Mapping (Per Stage)

**Goal**: For each journey stage, capture the specific steps as process nodes.

**Procedure**: Work through one stage at a time. For each stage:

1. Present the archetype's default steps for this stage.
2. User confirms, adds, removes, or reorders.
3. Confirm actor for each step.
4. Identify any decision points (branches).

**Script (per stage)**:
> Let's detail out **[Stage Name]**. Here's what I'd expect:
>
> 1. [Actor] → [Step description]
> 2. [Actor] → [Step description]
> 3. **Decision**: [Branch point] → Yes: [path] / No: [path]
> 4. [Actor] → [Step description]
> → **Output**: [What gets produced]
>
> What would you change?

**Capture**: Detailed process steps with actors and decision points per stage.

**Transition**: After all stages, move to Step 8.

---

## Step 8: Pain Point Discovery

**Goal**: Identify where things break, slow down, or frustrate.

**Script**:
> Based on the map so far, here are the spots I'd flag as potential pain points:
>
> 1. **[Step]** — [Why it's likely painful: e.g., "Manual and time-consuming, probably delayed when you're busy"]
> 2. **[Step]** — [Why: e.g., "Client-dependent — you're probably chasing people for this"]
> 3. **[Step]** — [Why: e.g., "Single point of failure — only you can do this"]
>
> Which of these resonate? What else causes you pain that I haven't guessed?

**Capture**: Confirmed pain points mapped to specific process nodes.

**Transition**: Move to Step 9.

---

## Step 9: Decision Points & Branches

**Goal**: Map conditional logic in the processes.

**Script**:
> Let me identify the key decision points in your workflow:
>
> 1. **At [Step]**: What determines [outcome A] vs [outcome B]?
> 2. **At [Step]**: [Inferred decision logic]
>
> Are there other "if this, then that" moments I'm missing?

**Capture**: Decision nodes with branch conditions and paths.

**Transition**: Move to Step 10.

---

## Step 10: Tool & System Mapping

**Goal**: Attach specific tools/systems to each process step (Level 2 detail).

**Script**:
> Let me guess which tools you use at each step:
>
> | Step | Tool I'd Guess | Actual Tool |
> |------|----------------|-------------|
> | [Step] | [Guess] | [Confirm] |
> | ... | ... | ... |
>
> Correct anything that's wrong, and fill in any blanks.

**Capture**: Tool assignments per process step.

**Transition**: Move to Step 11.

---

## Step 11: Annotation Review

**Goal**: Run the opportunity scan and confirm annotations.

**Procedure**:
1. Reference `references/opportunity-categories.md`.
2. Scan every node against the 6 categories.
3. Present findings for user confirmation.

**Script**:
> I've scanned your process map for opportunities. Here's what I found:
>
> **Bottlenecks (Red)**:
> - [Node] — [Why] — Score: [X.X/5.0]
>
> **Automation Opportunities (Orange)**:
> - [Node] — [Why] — Score: [X.X/5.0]
>
> **High-Value / Protect (Green)**:
> - [Node] — [Why these should stay with you]
>
> **Potential Eliminations**:
> - [Node] — [Why this might not be needed]
>
> Does this feel right? Anything you'd reclassify?

**Capture**: Confirmed annotations with scores.

**Transition**: Move to Step 12.

---

## Step 12: Diagram Generation

**Goal**: Generate the .drawio XML swimlane diagram.

**Procedure**:
1. Read `references/drawio-standards.md` for XML rules.
2. Read `references/swimlane-templates.md` for the closest template.
3. Apply the 5-step Swimlane Placement Algorithm.
4. Generate complete XML.
5. Present the XML in a code block.
6. Emit the session state YAML block.

**Script**:
> Here's your swimlane diagram. Copy the XML below into a file named `[business-name]-[process].drawio` and open it in draw.io (desktop app or app.diagrams.net):
>
> ```xml
> [Generated XML]
> ```
>
> **Opportunity Summary**:
> [Table of annotated nodes with scores and recommendations]
>
> **Next steps I'd recommend**:
> 1. [Top quick win]
> 2. [Second priority]
> 3. [Strategic project]
>
> Want me to drill deeper into any of these processes? I can expand any stage into a detailed sub-process diagram.

**Capture**: Emit YAML session state.

---

## Interview Principles

### The Inference-First Pattern

For EVERY question:
1. **Guess first**: Use archetype defaults, context clues, and business logic to propose an answer.
2. **Present confidently**: "Here's what I'd expect..." not "Can you tell me about...?"
3. **Invite correction**: "How close am I?" or "What would you change?"
4. **Absorb corrections gracefully**: "Got it — [restate correction]. That changes [implication]."

### Pacing Rules

- Never ask more than 3 things at once.
- After the user responds, confirm what you heard before moving on.
- If the user gives a long, detailed answer, extract the data and summarize: "Let me make sure I captured this right: [summary]"
- If the user is brief, that's fine — fill in gaps with inferences.

### Branching Rules

- If the user wants to skip ahead to diagram generation, jump to Step 12 with best-available data.
- If the user wants to drill into a specific area, switch to `workflows/expand-process.md`.
- If the user provides a YAML state block, parse it and resume from the indicated step.

### Error Recovery

- If a guess is way off, apologize briefly and ask directly: "I was off on that one — what does [X] actually look like for you?"
- Never guess more than twice on the same topic. If two guesses miss, ask directly.
- Track correction rate. If > 50% of guesses are wrong, switch to more direct questioning for remaining steps.
