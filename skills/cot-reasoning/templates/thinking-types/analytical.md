---
template_id: analytical-thinking
version: "5.2.0"
category: thinking-type
recommended_for: business-analysis,technical-problems,strategic-planning,debugging,investigation
---

# Analytical Thinking Template

**Purpose:** Provide structured, data-driven analysis for complex problems. Optimized for system reasoning, enabling any model to perform analytical thinking.

**System Reasoning Focus:**
- Step-by-step data collection and analysis
- Explicit reasoning chain for transparency
- Tool integration for data operations
- Self-dialogue for internal reasoning simulation

---

## Template Variables

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `{{USER_REQUEST}}` | User's problem statement | Yes | - |
| `{{CONTEXT}}` | Additional background information | No | - |
| `{{CONSTRAINTS}}` | Limitations or restrictions | No | - |
| `{{AVAILABLE_TOOLS}}` | Tools available for use | No | - |
| `{{MODEL}}` | Target model (e.g., ANY MODEL) | No | auto-detect |
| `{{AGENTIC_MODE}}` | System mode override | No | auto |

---

## System Flow Structure

### Step 1: Problem Definition
**Critical for ANY MODEL:** Establish clear problem scope before any analysis

```markdown
### Step 1: Define Problem Scope

**Thought:** "{{USER_REQUEST}} - need to understand what exactly needs to be analyzed"

**Why:** Clear problem definition prevents wasted effort and ensures all analysis is relevant

**Action:** Parse user request and identify: core problem, affected systems, success criteria

**Tool:** None (pure reasoning)

**Input:** {{USER_REQUEST}}, {{CONTEXT}}, {{CONSTRAINTS}}

**Expected Output:**
- **Core Problem:** [One-sentence problem statement]
- **Affected Systems/Components:** [List of impacted areas]
- **Success Criteria:** [Measurable outcomes that define success]
- **Constraints:** [Hard and soft constraints from input]
- **Stakeholders:** [Who is affected or involved]

**Validation:**
- [ ] Problem is clearly and specifically defined
- [ ] Success criteria are measurable
- [ ] All constraints are documented
- [ ] Stakeholders are identified

**Next Step:** Step 2 (Data Collection)

**Fallback:** If problem unclear, ask user for clarification

**Self-Dialogue:**
```
[Thought]: "What is the user really asking for?"
[Analysis]: "Request: {{USER_REQUEST}}. This involves: {{COMPONENTS}}"
[Question]: "What specific aspect needs most attention?"
[Answer]: "{{PRIORITY_AREA}} because {{REASONING}}"
[Conclusion]: "Need to analyze: {{FOCUS_AREAS}}"
[Decision]: "Proceed to data collection"
```

**Complexity:** MEDIUM
```

---

### Step 2: Data Collection
**Critical for ANY MODEL:** Use tools to gather all necessary data

```markdown
### Step 2: Collect Relevant Data

**Thought:** "To analyze this problem, I need data from: {{DATA_SOURCES}}"

**Why:** Analytical thinking requires evidence and data, not assumptions

**Action:** Retrieve all relevant data using available tools

**Tool:** {{TOOL_NAME}} (a tool category: filesystem-read, code-search, web-search)

**Tool Parameters:**
```json
{
  "path/file/query": "{{SOURCE_PATH}}",
  "limit": {{LIMIT}},
  "options": {{OPTIONS}}
}
```

**Input:** None (or data from Step 1 if applicable)

**Expected Output:**
- Raw data from all identified sources
- Data organized by source/type
- Timestamps and metadata preserved
- Data quality noted (complete/incomplete)

**Validation:**
- [ ] All specified data sources accessed
- [ ] Data is relevant to the problem
- [ ] Data quality is assessed
- [ ] Gaps are identified

**Next Step:** Step 3 (Data Analysis)

**Fallback:**
1. Try alternative data source: {{ALTERNATIVE_SOURCE}}
2. Use sample/placeholder data with disclaimer
3. Proceed with available data, noting limitations

**Self-Dialogue:**
```
[Thought]: "I need {{DATA_TYPE}} to answer {{QUESTION}}"
[Analysis]: "{{DATA_TYPE}} contains {{INFORMATION}} which will reveal {{INSIGHTS}}"
[Question]: "Where can I get {{DATA_TYPE}}?"
[Answer]: "From {{SOURCE}} using {{TOOL}}"
[Question]: "What if {{SOURCE}} is unavailable?"
[Answer]: "Fallback to {{ALTERNATIVE}} or proceed with available data"
[Conclusion]: "{{TOOL}} is the best approach to get {{DATA_TYPE}}"
[Decision]: "Execute {{TOOL}} to retrieve {{DATA_TYPE}}"
```

**Complexity:** MEDIUM
```

---

### Step 3: Data Analysis
**Critical for ANY MODEL:** Systematic processing of collected data

```markdown
### Step 3: Analyze Collected Data

**Thought:** "I have data from {{SOURCES}}. Now I need to extract insights and identify patterns."

**Why:** Raw data must be processed to reveal meaningful insights

**Action:** Apply analytical methods to data: pattern recognition, trend analysis, correlation, outliers detection

**Tool:** {{TOOL_NAME}} (a tool category: code-search, shell-execution)

**Tool Parameters:**
```json
{
  "pattern": "{{SEARCH_PATTERN}}",
  "analysis": "{{ANALYSIS_TYPE}}",
  "output_format": "{{FORMAT}}"
}
```

**Input:** Data from Step 2

**Expected Output:**
- **Key Findings:** [Major insights from data]
- **Patterns Identified:** [Recurring themes or trends]
- **Anomalies:** [Outliers or unexpected values]
- **Correlations:** [Relationships between data points]
- **Data Quality Issues:** [Problems with the data itself]

**Validation:**
- [ ] All data is analyzed, not just reviewed
- [ ] Patterns are statistically significant
- [ ] Anomalies are explained or investigated
- [ ] Correlations are causal, not coincidental

**Next Step:** Step 4 (Root Cause Analysis)

**Fallback:**
1. Use alternative analysis method
2. Focus on most reliable data
3. Note analysis limitations

**Self-Dialogue:**
```
[Thought]: "Data shows {{OBSERVATION}}. What does this mean?"
[Analysis]: "{{OBSERVATION}} suggests {{INTERPRETATION}}. This could indicate: {{POSSIBILITIES}}"
[Question]: "Which possibility is most likely given {{CONTEXT}}?"
[Answer]: "Most likely: {{PRIMARY_HYPOTHESIS}} because {{REASONING}}"
[Question]: "What evidence supports this?"
[Answer]: "Supporting evidence: {{EVIDENCE_LIST}}"
[Consideration]: "But I should also consider: {{ALTERNATIVE_EXPLANATION}}"
[Conclusion]: "Primary insight: {{INSIGHT}}. Need to verify: {{VERIFICATION_NEEDED}}"
[Decision]: "{{NEXT_ACTION}}"
```

**Complexity:** HIGH
```

---

### Step 4: Root Cause Analysis
**Critical for ANY MODEL:** Connect patterns to underlying causes

```markdown
### Step 4: Identify Root Causes

**Thought:** "Patterns identified: {{PATTERNS}}. Need to determine what's causing them."

**Why:** Solutions require addressing root causes, not symptoms

**Action:** Use analytical techniques to trace effects back to causes

**Tool:** {{TOOL_NAME}} (if verification needed)

**Tool Parameters:**
```json
{
  "command": "{{VERIFICATION_COMMAND}}",
  "description": "Verify root cause hypothesis"
}
```

**Input:** Analysis from Step 3

**Expected Output:**
- **Root Cause 1:** [Primary cause with evidence]
  - Evidence: [Supporting data/patterns]
  - Impact: [How it affects the problem]
  - Confidence: [X/10]
- **Root Cause 2:** [Secondary cause]
  - Evidence: [Supporting data]
  - Impact: [Effect on problem]
  - Confidence: [X/10]
- **Contributing Factors:** [Other relevant factors]

**Validation:**
- [ ] Root causes explain observed patterns
- [ ] Evidence is compelling and data-based
- [ ] Impact is clearly articulated
- [ ] Confidence levels are justified

**Next Step:** Step 5 (Solution Generation)

**Fallback:**
1. Test alternative cause hypotheses
2. Gather more data to confirm
3. Proceed with most likely cause

**Self-Dialogue:**
```
[Thought]: "What could cause {{OBSERVED_PATTERN}}?"
[Analysis]: "Possible causes: {{CAUSE_LIST}}. Given context: {{CONTEXT}}, most likely: {{TOP_CAUSES}}"
[Question]: "What evidence supports {{PRIMARY_CAUSE}}?"
[Answer]: "Evidence: {{EVIDENCE}} from {{DATA_SOURCES}}"
[Question]: "Are there alternative explanations?"
[Answer]: "Alternative: {{ALTERNATIVE}} but less likely because {{REASON}}"
[Consideration]: "Could be combination of causes: {{COMBO_POSIBILITY}}"
[Conclusion]: "Primary root cause: {{ROOT_CAUSE}} with {{CONFIDENCE}} confidence"
[Decision]: "Proceed to solution generation"
```

**Complexity:** HIGH
```

---

### Step 5: Solution Generation
**Critical for ANY MODEL:** Translate analysis into actionable solutions

```markdown
### Step 5: Develop Solutions

**Thought:** "Root cause: {{ROOT_CAUSE}}. Need to develop solutions that address this."

**Why:** Analysis without actionable solutions is incomplete

**Action:** Generate and evaluate potential solutions

**Tool:** None (pure reasoning, or code-search for validation)

**Input:** Root causes from Step 4

**Expected Output:**
- **Solution 1:** [Primary recommended solution]
  - Description: [How it works]
  - Addresses: [Which root causes it fixes]
  - Pros: [Benefits]
  - Cons: [Drawbacks]
  - Resource Requirements: [What's needed]
  - Implementation Steps: [Detailed steps]
  - Success Probability: [X%]
  - Risk Level: [Low/Medium/High]

- **Solution 2:** [Alternative solution]
  - Description: [How it works]
  - Addresses: [Which root causes]
  - Pros: [Benefits]
  - Cons: [Drawbacks]

- **Solution 3:** [Contingency solution]
  - Description: [How it works]

**Comparison Matrix:**
| Criteria | Solution 1 | Solution 2 | Solution 3 | Weight |
|----------|------------|------------|------------|--------|
| Addresses Root Cause | Yes/No | Yes/No | Yes/No | 0.40 |
| Implementation Effort | X days | X days | X days | 0.20 |
| Resource Requirements | $X | $X | $X | 0.15 |
| Risk Level | Low/Med/High | Low/Med/High | Low/Med/High | 0.15 |
| Time to Value | X days | X days | X days | 0.10 |
| **Total Score** | **X.X** | **X.X** | **X.X** | **1.0** |

**Selected Solution:** [Chosen solution with justification]

**Validation:**
- [ ] Solution addresses root cause(s)
- [ ] Implementation is feasible
- [ ] Resources are available
- [ ] Risks are acceptable
- [ ] Timeline is reasonable

**Next Step:** Step 6 (Validation)

**Fallback:** If no clear solution, propose diagnostic steps

**Self-Dialogue:**
```
[Thought]: "How can we fix {{ROOT_CAUSE}}?"
[Analysis]: "Possible approaches: {{APPROACH_LIST}}. Constraints: {{CONSTRAINTS}}"
[Question]: "Which approach best addresses the root cause?"
[Answer]: "{{BEST_APPROACH}} because {{REASONING}}"
[Question]: "What are the trade-offs?"
[Answer]: "Trade-offs: {{PROS VS CONS}}"
[Question]: "Is implementation feasible?"
[Answer]: "Feasibility: {{FEASIBILITY_ASSESSMENT}}"
[Conclusion]: "Selected solution: {{SOLUTION}} with {{SCORE}} score"
[Decision]: "Proceed to validation"
```

**Complexity:** HIGH
```

---

### Step 6: Validation
**Critical for ANY MODEL:** Ensure solution is robust and complete

```markdown
### Step 6: Validate Solution

**Thought:** "Selected solution: {{SOLUTION}}. Need to verify it will work."

**Why:** Validation prevents implementing ineffective solutions

**Action:** Test solution against success criteria and edge cases

**Tool:** {{TOOL_NAME}} (if testing can be automated)

**Tool Parameters:**
```json
{
  "test": "{{TEST_COMMAND}}",
  "criteria": "{{SUCCESS_CRITERIA}}"
}
```

**Input:** Selected solution from Step 5

**Expected Output:**
- **Solution Verification:** [Does solution meet all success criteria?]
- **Edge Case Testing:** [Results for various scenarios]
- **Risk Assessment:** [Updated risk analysis]
- **Resource Confirmation:** [Are required resources available?]
- **Timeline Validation:** [Is timeline realistic?]

**Validation Checklist:**
- [ ] Solution addresses all root causes
- [ ] All success criteria are met
- [ ] Edge cases are handled
- [ ] Risks are mitigated
- [ ] Resources are confirmed
- [ ] Timeline is validated

**Next Step:** Final Output

**Fallback:** If validation fails, revise solution or gather more data

**Self-Dialogue:**
```
[Thought]: "Will {{SOLUTION}} actually work?"
[Analysis]: "Testing against criteria: {{CRITERIA_LIST}}. Results: {{RESULTS}}"
[Question]: "What could go wrong?"
[Answer]: "Potential issues: {{RISK_LIST}}. Mitigations: {{MITIGATIONS}}"
[Question]: "Are all constraints satisfied?"
[Answer]: "Constraint check: {{CONSTRAINT_STATUS}}"
[Conclusion]: "Solution validation: {{PASS/FAIL}} with confidence {{X/10}}"
[Decision]: "{{IF_PASS: Finalize, IF_FAIL: Revise solution}}"
```

**Complexity:** MEDIUM
```

---

## Final Output Structure

```markdown
## System Reasoning Flow: [Problem Summary]

**Flow ID:** flow_{{TIMESTAMP}}_{{THINKING_TYPE}}
**Timestamp:** {{ISO_TIMESTAMP}}
**System Mode:** {{AGENTIC_MODE}}
**Thinking Type:** ANALYTICAL
**Complexity:** {{COMPLEXITY}}

### Configuration
- **Model:** {{MODEL}}
- **Tool Capability:** {{TOOLS_AVAILABLE}}
- **Thinking Type:** ANALYTICAL
- **CoT Pattern:** {{PATTERN}}

### Problem Analysis
**Core Problem:** {{CORE_PROBLEM}}

**Key Entities:**
{{ENTITY_LIST}}

**Success Criteria:**
{{SUCCESS_CRITERIA}}

**Constraints:**
- Hard: {{HARD_CONSTRAINTS}}
- Soft: {{SOFT_CONSTRAINTS}}

### Reasoning Steps
{{STEPS_1_THROUGH_6}}

### Intermediate Results
**Step 1 Output:** {{STEP1_RESULT}}
**Step 2 Output:** {{STEP2_RESULT}}
**Step 3 Output:** {{STEP3_RESULT}}
**Step 4 Output:** {{STEP4_RESULT}}
**Step 5 Output:** {{STEP5_RESULT}}
**Step 6 Output:** {{STEP6_RESULT}}

### Key Findings
1. **Finding 1:** {{FINDING_1}} - Impact: {{IMPACT_1}} - Confidence: {{CONFIDENCE_1}}/10
2. **Finding 2:** {{FINDING_2}} - Impact: {{IMPACT_2}} - Confidence: {{CONFIDENCE_2}}/10
3. **Finding 3:** {{FINDING_3}} - Impact: {{IMPACT_3}} - Confidence: {{CONFIDENCE_3}}/10

**Root Causes:**
{{ROOT_CAUSES}}

### Recommendations
1. **Action 1:** {{RECOMMENDATION_1}}
   - Priority: {{PRIORITY_1}}
   - Impact: {{IMPACT_1}}
   - Effort: {{EFFORT_1}}
   - Implementation: {{STEPS_1}}

2. **Action 2:** {{RECOMMENDATION_2}}
   - Priority: {{PRIORITY_2}}
   - Impact: {{IMPACT_2}}
   - Effort: {{EFFORT_2}}
   - Implementation: {{STEPS_2}}

### Execution Summary
- **Steps Completed:** 6/6
- **Tools Used:** {{TOOLS_USED}}
- **Tool Call Count:** {{TOOL_CALLS}}
- **System Effect:** HIGH

### Quality Metrics
- **Confidence Level:** {{CONFIDENCE_LEVEL}} ({{SCORE}}/10)
- **System Simulation Quality:** {{AGENTIC_QUALITY}}/10
- **Tool Utilization:** {{UTILIZATION}}%
- **Step Completion Rate:** 100%
- **Actionability Score:** {{ACTIONABILITY}}/10

### Next Steps
- [ ] {{NEXT_STEP_1}}
- [ ] {{NEXT_STEP_2}}
- [ ] {{NEXT_STEP_3}}

### Meta Information
**Generated By:** cot-reasoning v5.2.0
**Pattern:** ANALYTICAL
**For Models Like:** {{MODEL}}
**Performance Notes:** {{NOTES}}
```

---

## ANY MODEL Specific Notes

### Why This Works for ANY MODEL:

1. **Step-by-Step Structure:** Each step has a single, clear purpose that ANY MODEL can execute
2. **Tool Integration:** Every data collection and verification step uses explicit tool calls
3. **Self-Dialogue:** Provides the reasoning context that ANY MODEL lacks natively
4. **Explicit Dependencies:** Each step clearly states what it needs from previous steps
5. **Validation Criteria:** Objective checks that can be verified with tools
6. **Fallback Paths:** Ensures robustness when tools fail or data is missing

### ANY MODEL Optimization Tips:

- **Maximize Tool Usage:** Use tools for every data-related step
- **Be Explicit:** All parameters, paths, and queries should be fully specified
- **Validate Everything:** Use tools to verify assumptions whenever possible
- **Document Limitations:** Clearly note when data is incomplete or assumptions are made
- **Prioritize:** Focus on high-impact, high-confidence findings first

### Common Patterns for ANY MODEL:

**Debugging:**
```
Step 1: Define problem → Step 2: Collect logs → Step 3: Search patterns → Step 4: Identify cause → Step 5: Propose fix → Step 6: Verify
```

**Analysis:**
```
Step 1: Define scope → Step 2: Gather data → Step 3: Analyze → Step 4: Identify insights → Step 5: Generate report → Step 6: Validate
```

**Decision Making:**
```
Step 1: Understand options → Step 2: Gather criteria → Step 3: Evaluate → Step 4: Compare → Step 5: Decide → Step 6: Justify
```

---

## Quality Checklist

**Before Using This Template:**

- [ ] Problem is suitable for analytical thinking (structured, data-driven)
- [ ] All required data sources are accessible
- [ ] Available tools can access the needed data
- [ ] Problem complexity matches template complexity (MEDIUM-HIGH)

**For ANY MODEL:**
- [ ] All data collection steps use tools
- [ ] All tool parameters are complete and correct
- [ ] Expected outputs are clearly defined
- [ ] Fallbacks are in place for all steps
- [ ] Self-dialogue is present in every step

**After Completion:**
- [ ] All steps are completed
- [ ] Intermediate results are documented
- [ ] Key findings are supported by data
- [ ] Recommendations are actionable
- [ ] Quality metrics are calculated

---

## When to Use This Template

**Use Analytical Thinking When:**
- Problem requires data-driven decision making
- Multiple factors need to be considered
- Root cause analysis is needed
- Solutions must be justified with evidence
- Stakeholders need transparent reasoning

**Best For:**
- Technical debugging and troubleshooting
- Business analysis and strategy
- System optimization
- Complex decision making
- Root cause investigations

**Avoid When:**
- Problem is purely creative (use Creative template)
- Problem requires ethical considerations (use Ethical template)
- Problem is simple and straightforward (use simpler approach)
- No data is available for analysis

---

## Integration with Other Templates

This template can be combined with:
- **Self-Dialogue Template:** For enhanced reasoning simulation
- **Step Execution Template:** For standardized step structure
- **Tool Integration Templates:** For specific tool patterns

For **ANY MODEL**, always use in conjunction with **STANDARD** mode.
