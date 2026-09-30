---
template_id: step-execution-template
version: "5.0.0"
category: system-core
recommended_for: all-problems
---

# Universal Step Execution Template

## Purpose

This template defines the **standard structure for all reasoning steps** in the cot-reasoning. Every complex problem is decomposed into steps following this universal format.

**Key Principle:** Each step is a **self-contained, executable unit** that contributes to the overall reasoning flow.

---

## Template Variables

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `{{STEP_NUMBER}}` | Sequential step number | Yes | - |
| `{{STEP_NAME}}` | Descriptive name of the step | Yes | - |
| `{{THOUGHT}}` | Internal reasoning/monologue | Yes | - |
| `{{WHY}}` | Explanation of step necessity | Yes | - |
| `{{ACTION}}` | Specific instruction to execute | Yes | - |
| `{{TOOL}}` | Tool call (if applicable) | No | None |
| `{{TOOL_PARAMS}}` | Parameters for tool call | No | - |
| `{{INPUT}}` | Data/parameters for this step | No | - |
| `{{EXPECTED_OUTPUT}}` | What should be produced | Yes | - |
| `{{VALIDATION}}` | How to verify this step succeeded | Yes | - |
| `{{DEPENDENCIES}}` | What this step needs from previous steps | No | None |
| `{{NEXT_STEP}}` | What step comes next | No | Next sequential |
| `{{FALLBACK}}` | Alternative if step fails | Yes | - |
| `{{COMPLEXITY}}` | Step complexity (LOW/MEDIUM/HIGH) | No | MEDIUM |

---

## Standard Step Structure

```markdown
### Step {{STEP_NUMBER}}: {{STEP_NAME}}

**Thought:** {{THOUGHT}}

**Why:** {{WHY}}

**Action:** {{ACTION}}

**Tool:** {{TOOL}}
{% if TOOL != "None" %}
**Tool Parameters:**
```json
{{TOOL_PARAMS}}
```
{% endif %}
**Input:** {{INPUT}}

**Expected Output:** {{EXPECTED_OUTPUT}}

**Validation:** {{VALIDATION}}

**Dependencies:** {{DEPENDENCIES}}

**Next Step:** {{NEXT_STEP}}

**Fallback:** {{FALLBACK}}

**Complexity:** {{COMPLEXITY}}
```

---

## Step Design Principles

### Principle 1: Single Responsibility
Each step should have ONE clear, specific purpose. If a step does multiple things, split it.

**Good:**
- Step 1: Understand Problem
- Step 2: Collect Data
- Step 3: Analyze Data

**Bad:**
- Step 1: Understand Problem, Collect Data, and Analyze (too broad)

### Principle 2: Explicit Dependencies
Every step should clearly state what it needs from previous steps.

**Good:**
```
Step 2: Analyze Data
- Input: Data from Step 1
- Dependencies: Step 1 must complete first
```

**Bad:**
```
Step 2: Analyze Data
- Input: (implicit, not stated)
```

### Principle 3: Objective Validation
Every step must have measurable, verifiable success criteria.

**Good:**
```
- Validation: Data contains at least 100 entries with timestamps
```

**Bad:**
```
- Validation: Data looks good (subjective)
```

### Principle 4: Graceful Degradation
Every step must have at least one fallback option.

**Good:**
```
- Fallback: Try alternative data source, then use sample data
```

**Bad:**
```
- Fallback: (none specified)
```

### Principle 5: Transparency
Self-dialogue and explanations make the reasoning process understandable.

**Good:**
```
**Thought:** "Need to verify assumption X"
**Why:** "Assumption X is critical for conclusion Y"
```

**Bad:**
```
**Thought:** "Check something"
**Why:** "Because"
```

---

## Step Types with Examples

### Type 1: Understanding Step (No Tool)
**Use Case:** Clarify problem, define scope, establish context

```markdown
### Step 1: Define Problem Scope

**Thought:** "User reports system failure. Need to understand scope and impact."

**Why:** Clear problem definition prevents wasted effort and ensures relevance

**Action:** Parse user request and identify: core problem, affected systems, success criteria

**Tool:** None

**Input:** User request

**Expected Output:**
- Core Problem: One-sentence summary
- Affected Systems: List of impacted components
- Success Criteria: Measurable outcomes
- Constraints: Hard and soft limitations

**Validation:**
- [ ] Problem is clearly and specifically defined
- [ ] Success criteria are measurable
- [ ] All constraints are documented

**Dependencies:** None

**Next Step:** Step 2

**Fallback:** If problem unclear, ask user for clarification

**Complexity:** LOW
```

### Type 2: Data Collection Step (With Tool)
**Use Case:** Gather external data needed for analysis

```markdown
### Step 2: Collect Relevant Data

**Thought:** "To analyze this problem, I need data from identified sources."

**Why:** Data-driven analysis requires evidence, not assumptions

**Action:** Retrieve all relevant data using available tools

**Tool:** filesystem-read

**Tool Parameters:**
```json
{
  "path": "system/logs/errors.log",
  "limit": 1000,
  "offset": 0
}
```

**Input:** None

**Expected Output:**
- Raw data from all specified sources
- Data organized by source and type
- Timestamps and metadata preserved
- Data quality noted

**Validation:**
- [ ] All specified data sources accessed
- [ ] Data is relevant to the problem
- [ ] Data quality is assessed

**Dependencies:** None

**Next Step:** Step 3

**Fallback:**
1. Try alternative data source
2. Use sample/placeholder data with disclaimer
3. Proceed with available data, noting limitations

**Complexity:** MEDIUM
```

### Type 3: Analysis Step (With Tool)
**Use Case:** Process and interpret collected data

```markdown
### Step 3: Analyze Collected Data

**Thought:** "I have data from previous steps. Need to extract insights and identify patterns."

**Why:** Raw data must be processed to reveal meaningful insights

**Action:** Apply analytical methods: pattern recognition, trend analysis, correlation

**Tool:** code-search

**Tool Parameters:**
```json
{
  "pattern": "ERROR|FAIL|CRITICAL",
  "file": "[from Step 2 output]",
  "options": ["-n", "-A 3", "-B 1"]
}
```

**Input:** Data from Step 2

**Expected Output:**
- Key Findings: Major insights from data
- Patterns Identified: Recurring themes or trends
- Anomalies: Outliers or unexpected values
- Correlations: Relationships between data points

**Validation:**
- [ ] All data is analyzed, not just reviewed
- [ ] Patterns are statistically significant
- [ ] Anomalies are explained or investigated

**Dependencies:** Step 2 output

**Next Step:** Step 4

**Fallback:**
1. Use alternative analysis method
2. Focus on most reliable data
3. Note analysis limitations

**Complexity:** HIGH
```

### Type 4: Verification Step
**Use Case:** Validate assumptions or test solutions

```markdown
### Step 4: Verify Hypothesis

**Thought:** "Based on analysis, hypothesis is X. Need to verify with data."

**Why:** Verification prevents implementing incorrect solutions

**Action:** Test hypothesis against available data or constraints

**Tool:** code-search

**Tool Parameters:**
```json
{
  "file": "system/config/settings.yml",
  "check": "connection_pool_size"
}
```

**Input:** Hypothesis from Step 3

**Expected Output:**
- Verification Result: Pass/Fail with evidence
- Confidence Level: Based on verification quality
- Impact: How this affects the problem

**Validation:**
- [ ] Hypothesis is clearly stated
- [ ] Verification method is appropriate
- [ ] Results are conclusive

**Dependencies:** Step 3 output

**Next Step:** Step 5

**Fallback:** Gather additional data for verification

**Complexity:** MEDIUM
```

### Type 5: Solution Step
**Use Case:** Generate recommendations based on analysis

```markdown
### Step 5: Generate Solution

**Thought:** "Root causes identified. Need actionable solution that addresses them."

**Why:** Analysis without actionable output is incomplete

**Action:** Synthesize findings into clear, implementable solution

**Tool:** None

**Input:** Analysis from previous steps

**Expected Output:**
- Primary Solution: Recommended approach
- Alternative Solutions: Backup options
- Implementation Steps: Detailed plan
- Success Criteria: Measurable outcomes
- Risk Assessment: Potential issues and mitigations

**Validation:**
- [ ] Solution addresses all root causes
- [ ] Implementation is feasible
- [ ] Success criteria are measurable

**Dependencies:** All previous steps

**Next Step:** None (final step)

**Fallback:** Propose diagnostic steps to gather more information

**Complexity:** HIGH
```

---

## Common Step Patterns

### Investigation Pattern
```
Step 1: Define Problem → Step 2: Collect Data → Step 3: Analyze → Step 4: Verify → Step 5: Solve
```

### Design Pattern
```
Step 1: Define Requirements → Step 2: Identify Constraints → Step 3: Generate Options → Step 4: Evaluate → Step 5: Select
```

### Decision Pattern
```
Step 1: Understand Options → Step 2: Gather Criteria → Step 3: Evaluate → Step 4: Compare → Step 5: Decide
```

### Optimization Pattern
```
Step 1: Baseline → Step 2: Measure → Step 3: Identify Bottlenecks → Step 4: Propose Fix → Step 5: Verify
```

---

## Step Quality Checklist

**Before Finalizing Each Step:**

- [ ] **Thought** is clear and relevant
- [ ] **Why** explains necessity effectively
- [ ] **Action** is specific and executable
- [ ] **Tool** (if any) is appropriate with correct parameters
- [ ] **Input** is properly defined
- [ ] **Expected Output** is measurable and clearly defined
- [ ] **Validation** criteria are objective and testable
- [ ] **Dependencies** are explicit
- [ ] **Next Step** is defined
- [ ] **Fallback** provides viable alternative
- [ ] **Complexity** level is appropriate

---

## Complexity Guidelines

| Complexity | Characteristics | Tool Usage | Dialogue Depth |
|------------|----------------|------------|----------------|
| LOW | Simple, single action | Optional | 2-3 exchanges |
| MEDIUM | Moderate, some dependencies | Recommended | 4-5 exchanges |
| HIGH | Complex, multiple dependencies | Required | 6-8 exchanges |

---

## Error Recovery Patterns

### Tool Failure
1. Primary: Retry with original parameters
2. Fallback 1: Try with modified parameters
3. Fallback 2: Try alternative tool
4. Fallback 3: Use cached/assumed data with disclaimer

### Data Unavailable
1. Primary: Use specified data source
2. Fallback 1: Try alternative data source
3. Fallback 2: Use sample/placeholder data
4. Fallback 3: Make reasonable assumptions with disclaimer

### Logic Error
1. Primary: Execute step as designed
2. Fallback 1: Re-examine previous step outputs
3. Fallback 2: Simplify step requirements
4. Fallback 3: Split into sub-steps

---

## Best Practices

1. **Be Specific:** Vague steps produce vague results
2. **Single Purpose:** Each step should do one thing well
3. **Explicit Dependencies:** Clearly state what each step needs
4. **Measurable Validation:** Every step should have objective checks
5. **Graceful Fallbacks:** Always provide alternative paths
6. **Appropriate Complexity:** Match step to problem complexity
7. **Clear Tool Usage:** Use tools when they add value
8. **Transparent Reasoning:** Self-dialogue explains the thinking

---

## Quick Reference

| Element | Required? | Purpose |
|---------|-----------|---------|
| Thought | Yes | Internal reasoning context |
| Why | Yes | Justification for step |
| Action | Yes | Specific instruction |
| Tool | No | Data operation tool |
| Tool Parameters | If tool used | Exact parameters |
| Input | No | Data for this step |
| Expected Output | Yes | Success criteria |
| Validation | Yes | Quality check |
| Dependencies | No | Prerequisites |
| Next Step | No | Flow continuity |
| Fallback | Yes | Error recovery |
| Complexity | No | Step difficulty |

---

## Notes

- This template is **universal** - works with any problem, any domain
- Step count should **scale with complexity**: 2-3 (LOW), 4-6 (MEDIUM), 7-9 (HIGH)
- Each step should take **1-3 minutes** to execute
- Total flow should not exceed **15 minutes** without user confirmation
- Always include **validation** and **fallback** for robustness
