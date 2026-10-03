## Reasoning Flow: Tool and field probe

**Reasoning Mode:** STANDARD
**Thinking Type:** SYSTEMATIC
**Complexity:** MEDIUM
**Steps:** 3

### Reasoning Steps

### Step 1: Pure Reasoning
**Thought:** t
**Why:** w
**Action:** a
**Tool:** None
**Input:** i
**Expected Output:** o
**Validation:** v
**Dependencies:** None
**Next Step:** Step 2
**Fallback:** f
**Complexity:** LOW

### Step 2: Bad Tool
**Thought:** t
**Why:** w
**Action:** a
**Tool:** super-invented-tool
**Input:** i
**Expected Output:** o
**Validation:** v
**Dependencies:** Step 1
**Next Step:** Step 3
**Fallback:** f
**Complexity:** LOW

### Step 3: Tool Without Params And Missing Field
**Thought:** t
**Action:** a
**Tool:** shell-execution
**Input:** i
**Expected Output:** o
**Validation:** v
**Dependencies:** Step 2
**Next Step:** None
**Fallback:** f
**Exit Criteria:** orphan probe
**Escalation Policy:** orphan probe
**Complexity:** LOW

### Key Findings
1. **Finding 1:** Probe - Impact: Low - Confidence: 5/10

### Recommendations
1. **Action 1:** Probe - Priority: Low - Impact: probe
