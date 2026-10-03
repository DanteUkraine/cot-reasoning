---
template_id: unified-reasoning-flow
version: "5.2.0"
category: adaptive-flow
recommended_for: all-problems
---

# Universal Adaptive Reasoning Flow

## Dynamic Configuration
```yaml
Flow ID: {{FLOW_ID:-auto-generate}}
Timestamp: {{TIMESTAMP:-current}}
User Input: {{USER_REQUEST}}

# Detected Parameters
Intent: {{INTENT:-analyze}}
Context: {{CONTEXT:-technical}}
Complexity: {{COMPLEXITY:-medium}}
Thinking Type: {{THINKING_TYPE:-analytical}}
CoT Pattern: {{COT_PATTERN:-zero-shot}}

# Pattern Configuration (Adaptive)
Pattern Settings:
  {{#if eq COT_PATTERN "zero-shot"}}
  pattern: Zero-Shot CoT
  settings: {}
  {{/if}}
  {{#if eq COT_PATTERN "few-shot"}}
  pattern: Few-Shot CoT
  settings:
    num_examples: {{NUM_EXAMPLES:-2}}
    examples_file: {{EXAMPLES_FILE:-null}}
  {{/if}}
  {{#if eq COT_PATTERN "auto-cot"}}
  pattern: Auto-CoT
  settings:
    num_examples: {{NUM_EXAMPLES:-2}}
    difficulty: {{DIFFICULTY:-medium}}
  {{/if}}
  {{#if eq COT_PATTERN "tree-of-thoughts"}}
  pattern: Tree of Thoughts
  settings:
    branches: {{BRANCHES:-3}}
    depth: {{DEPTH:-3}}
    threshold: {{THRESHOLD:-5}}
  {{/if}}
  {{#if eq COT_PATTERN "react"}}
  pattern: ReAct
  settings:
    max_iterations: {{MAX_ITERATIONS:-4}}
    tool_budget: {{TOOL_BUDGET:-5}}
    available_tools: {{AVAILABLE_TOOLS:-[]}}
  {{/if}}

# System Adaptation
Adaptation Rules:
  {{#if eq COMPLEXITY "LOW"}}
  strategy: streamlined
  depth_limit: {{DEPTH_LIMIT:-3}}
  branch_limit: {{BRANCH_LIMIT:-2}}
  example_limit: {{EXAMPLE_LIMIT:-2}}
  {{/if}}
  {{#if eq COMPLEXITY "MEDIUM"}}
  strategy: balanced
  depth_limit: {{DEPTH_LIMIT:-4}}
  branch_limit: {{BRANCH_LIMIT:-3}}
  example_limit: {{EXAMPLE_LIMIT:-3}}
  {{/if}}
  {{#if in COMPLEXITY "HIGH" "VERY_HIGH"}}
  strategy: comprehensive
  depth_limit: {{DEPTH_LIMIT:-6}}
  branch_limit: {{BRANCH_LIMIT:-5}}
  example_limit: {{EXAMPLE_LIMIT:-4}}
  {{/if}}
```

---

## Phase 1: Problem Understanding (Universal - All Patterns)

**Objective:** Establish clear understanding of the problem, intent, and constraints.

### Problem Framing
```
Core Problem: [Extracted primary issue from {{USER_REQUEST}}]
  - Original Statement: "{{USER_REQUEST}}"
  - Paraphrased: [Problem restated in own words]
  
Instruction Type: [Direct | Task-specific | Open-ended]
  - Signal: [What made the classification clear]
  - Open-ended handling (STANDARD/ENHANCED): formalize before decomposing — see below

Intent Classification: {{INTENT}}
  - Primary Intent: [Main user goal]
  - Secondary Intents: [Additional detected intents, if any]
  - Confidence: [X%] (How clear the intent is)

Domain Context: {{CONTEXT}}
  - Primary Domain: [Classified domain]
  - Sub-domain: [Specific area, if applicable]
  - Domain Confidence: [X%]

Complexity Assessment: {{COMPLEXITY}}
  - Complexity Score: [X/100]
  - Complexity Factors:
    - Entity Count: [Number of entities involved]
    - Interdependencies: [Number of relationships]
    - Constraints: [Number of limitations]
    - Open-endedness: [High/Medium/Low]
```

### Formalized Contract (STANDARD/ENHANCED, open-ended requests only)
```
Entities: [Named actors/systems/data involved]
Hard Constraints: [Cannot be violated]
Soft Constraints: [Should be respected, with flexibility]
Success Criteria: [Measurable, prioritized]
Not Open to Interpretation: [Terms with exactly one allowed meaning]
Open Questions: [Genuinely underspecified — ask, do not assume]
```

### Success Criteria Definition
**Required Outcomes:**
- [ ] **Criterion 1:** [Primary success metric] - Priority: [High/Medium/Low]
- [ ] **Criterion 2:** [Secondary success metric] - Priority: [High/Medium/Low]
- [ ] **Criterion 3:** [Tertiary success metric] - Priority: [High/Medium/Low]

**Quality Standards:**
- Completeness: [What constitutes a complete answer]
- Accuracy: [Required accuracy level]
- Actionability: [What makes the output useful]

### Constraints and Limitations
**Hard Constraints:**
- Constraint 1: [Cannot be violated] - Impact: [What happens if violated]
- Constraint 2: [Cannot be violated] - Impact: [What happens if violated]

**Soft Constraints:**
- Constraint 1: [Should be respected] - Flexibility: [How much can bend]
- Constraint 2: [Should be respected] - Flexibility: [How much can bend]

**Resource Limitations:**
- Time Limit: [Maximum allowed time] - Current: [Elapsed so far]
- Token Budget: [Maximum tokens] - Used: [Tokens consumed]
- Tool Budget: [Maximum tool calls] - Used: [Tool calls made]

---

## Phase 2: Context Analysis (Universal - All Patterns)

**Objective:** Gather and organize all relevant information for reasoning.

### Known Facts Extraction
**Established Information:**
- Fact 1: [Verified information] - Source: [Where it came from] - Reliability: [High/Medium/Low]
- Fact 2: [Verified information] - Source: [Where it came from] - Reliability: [High/Medium/Low]
- Fact 3: [Verified information] - Source: [Where it came from] - Reliability: [High/Medium/Low]
- Fact 4: [Verified information] - Source: [Where it came from] - Reliability: [High/Medium/Low]

**Domain-Specific Knowledge:**
- Knowledge 1: [Relevant domain fact] - Relevance: [How it applies]
- Knowledge 2: [Relevant domain fact] - Relevance: [How it applies]
- Knowledge 3: [Relevant domain fact] - Relevance: [How it applies]

### Assumptions Identification
**Explicit Assumptions:** (Stated in the problem)
- Assumption 1: [What we're told to assume] - Justification: [Why it's reasonable]
- Assumption 2: [What we're told to assume] - Justification: [Why it's reasonable]

**Implicit Assumptions:** (Necessary for the problem to make sense)
- Assumption 1: [What we must assume] - Justification: [Why it's necessary] - Risk: [What if wrong]
- Assumption 2: [What we must assume] - Justification: [Why it's necessary] - Risk: [What if wrong]
- Assumption 3: [What we must assume] - Justification: [Why it's necessary] - Risk: [What if wrong]

### Information Gaps
**Missing Information:**
- Gap 1: [What we need to know] - Importance: [High/Medium/Low] - Impact: [How it affects solution]
- Gap 2: [What we need to know] - Importance: [High/Medium/Low] - Impact: [How it affects solution]
- Gap 3: [What we need to know] - Importance: [High/Medium/Low] - Impact: [How it affects solution]

**Information Sources:**
- Source 1: [Where to get missing info] - Accessibility: [High/Medium/Low]
- Source 2: [Where to get missing info] - Accessibility: [High/Medium/Low]

---

## Phase 3: Core Reasoning (Pattern-Specific)

**Objective:** Apply the selected CoT pattern and thinking type to solve the problem.

### Pattern: {{COT_PATTERN}}
### Thinking Type: {{THINKING_TYPE}}

{{#if eq COT_PATTERN "zero-shot"}}
### Zero-Shot Chain of Thought Execution

**Reasoning Instructions:**
Think through the following problem systematically and provide a detailed reasoning chain.

**Reasoning Steps:**
1. **Problem Analysis**
   - Core issue: [What's the fundamental problem]
   - Root cause: [What's causing it]
   - Impact: [How serious it is]

2. **Information Synthesis**
   - Known facts: [What we know for sure]
   - Critical assumptions: [What we're assuming]
   - Missing information: [What we don't know]

3. **Solution Exploration**
   - Approach 1: [First potential solution] - Pros: [Benefits] - Cons: [Drawbacks]
   - Approach 2: [Second potential solution] - Pros: [Benefits] - Cons: [Drawbacks]
   - Approach 3: [Third potential solution] - Pros: [Benefits] - Cons: [Drawbacks]

4. **Solution Selection**
   - Selected approach: [Chosen solution] - Rationale: [Why this is best]
   - Expected outcome: [What will happen]
   - Risk assessment: [Potential issues]

5. **Implementation Planning**
   - Step 1: [First action] - Owner: [Who] - Timeline: [When]
   - Step 2: [Second action] - Owner: [Who] - Timeline: [When]
   - Step 3: [Third action] - Owner: [Who] - Timeline: [When]

{{/if}}

{{#if eq COT_PATTERN "few-shot"}}
### Few-Shot Chain of Thought Execution

**Example 1:**
```
Problem: [Similar problem 1]
Thinking:
  1. [Reasoning step 1]
  2. [Reasoning step 2]
  3. [Reasoning step 3]
Answer: [Solution to problem 1]
```

**Example 2:**
```
Problem: [Similar problem 2]
Thinking:
  1. [Reasoning step 1]
  2. [Reasoning step 2]
  3. [Reasoning step 3]
Answer: [Solution to problem 2]
```

**Target Problem: {{USER_REQUEST}}**

**Pattern Recognition:**
- Similarity to Example 1: [X%] - Matching aspects: [What's similar]
- Similarity to Example 2: [X%] - Matching aspects: [What's similar]
- Common pattern: [What approach both examples use]

**Applying Pattern to Target:**
1. **Step 1:** [Apply pattern step 1 to target] - Insight: [What we learn]
2. **Step 2:** [Apply pattern step 2 to target] - Insight: [What we learn]
3. **Step 3:** [Apply pattern step 3 to target] - Insight: [What we learn]

**Solution:** [Applying learned pattern to solve target problem]

{{/if}}

{{#if eq COT_PATTERN "auto-cot"}}
### Auto Chain of Thought Execution

**Phase 1: Example Generation ({{NUM_EXAMPLES}} examples)**

**Generated Example 1:**
- Problem: [Auto-generated similar problem]
- Thinking: [Step-by-step reasoning]
- Answer: [Solution]

**Generated Example 2:**
- Problem: [Auto-generated similar problem]
- Thinking: [Step-by-step reasoning]
- Answer: [Solution]

**Phase 2: Pattern Extraction**
- Pattern 1: [Identified reasoning pattern] - Structure: [How it works]
- Pattern 2: [Identified reasoning pattern] - Structure: [How it works]
- Selected Pattern: [Chosen pattern for target] - Rationale: [Why it's most appropriate]

**Phase 3: Applying to Target Problem {{USER_REQUEST}}**

Following the extracted pattern:
1. **Reasoning Step 1:** [Applying pattern] - Conclusion: [Insight 1]
2. **Reasoning Step 2:** [Applying pattern] - Conclusion: [Insight 2]
3. **Reasoning Step 3:** [Applying pattern] - Conclusion: [Insight 3]

**Final Answer:** [Solution based on learned pattern]

{{/if}}

{{#if eq COT_PATTERN "tree-of-thoughts"}}
### Tree of Thoughts Execution

**Configuration:** Branches={{BRANCHES}}, Depth={{DEPTH}}, Threshold={{THRESHOLD}}

**Branch 1: [Approach Name]**
- Core Assumption: [What this assumes]
- Key Differentiator: [How it's different from others]

  **Level 1:** [Initial step]
  - Feasibility: [X/10]
  - Effectiveness: [X/10]
  - Efficiency: [X/10]
  - Risk: [X/10]
  - Novelty: [X/10]
  - Aggregate Score: [XX/50]
  
  **Level 2:** [Development step]
  - Sub-step 1: [Detail] - Score: [X/10]
  - Sub-step 2: [Detail] - Score: [X/10]

**Branch 2: [Approach Name]**
- Core Assumption: [What this assumes]
- Key Differentiator: [How it's different]

  **Level 1:** [Initial step]
  - Scores: [Feasibility, Effectiveness, Efficiency, Risk, Novelty]
  - Aggregate: [XX/50]

**Branch 3: [Approach Name]**
- Core Assumption: [What this assumes]
- Key Differentiator: [How it's different]

  **Level 1:** [Initial step]
  - Scores: [Individual scores]
  - Aggregate: [XX/50]

{{#if gt BRANCHES 3}}
**Branch 4: [Approach Name]**
- Core Assumption: [What this assumes]
  {{/if}}

**Evaluation and Pruning:**
| Branch | Total Score | Risk Profile | Status |
|--------|-------------|--------------|--------|
| Branch 1 | XX/50 | [Low/Medium/High] | [Keep/Prune] |
| Branch 2 | XX/50 | [Low/Medium/High] | [Keep/Prune] |
| Branch 3 | XX/50 | [Low/Medium/High] | [Keep/Prune] |

**Selected Optimal Path:** [Branch X] - Justification: [Why this is best]

**Comparison Analysis:**
- Branch X vs Branch Y: [Why X is better]
- Risk Assessment: [What could go wrong with X]
- Mitigation: [How to reduce risk]

{{/if}}

{{#if eq COT_PATTERN "react"}}
### ReAct (Reasoning + Acting) Execution

**Available Tools:** [{{AVAILABLE_TOOLS}}]
**Max Iterations:** {{MAX_ITERATIONS}}
**Tool Budget:** {{TOOL_BUDGET}}

**Verification loop discipline (STANDARD/ENHANCED):** a failed verification iterates
on RAW captured evidence (never a paraphrase) with a declared budget — Max Iterations,
Exit Criteria, Escalation Policy as a set. On a repeated failure, change the strategy,
not just the parameters. A stalled check fails fast and hands partial evidence to the
loop.

**Iteration 1:**
```
Thought: [Current reasoning state]
  - Problem understanding: [What I know]
  - Information needed: [What I need to find out]
  - Hypothesis: [What I think the issue/answer is]
  - Next step: [What action to take]

Action: [Tool call with parameters]
Tool: [tool_name]
Parameters: [parameters]

Observation: [Tool response]
[Raw output from tool]

Reasoning: [Analysis of observation]
  - What we learned: [Key insights]
  - How this affects our approach: [Impact on solution]
  - Updated hypothesis: [Revised understanding]
```

**Iteration 2:**
```
Thought: [Updated reasoning]
Action: [Next tool call]
Observation: [Tool response]
Reasoning: [Updated analysis]
```

{{#if gt MAX_ITERATIONS 2}}
**Iteration 3:**
```
Thought: [Further reasoning]
Action: [Tool call]
Observation: [Response]
Reasoning: [Analysis]
```
{{/if}}

**Final Synthesis:**
- Total tool calls: [X]
- Tools used: [List]
- Data gathered: [Summary of information]
- Key findings: [Major insights from tool usage]

{{/if}}

---

## Phase 4: Validation (Universal - All Patterns)

**Objective:** Ensure the solution is complete, correct, and actionable.

### Completeness Check
- [ ] **Problem Understanding:** All aspects of {{USER_REQUEST}} addressed
- [ ] **Success Criteria:** All defined criteria met
- [ ] **Constraints:** All hard constraints respected, soft constraints considered
- [ ] **Assumptions:** All assumptions identified and validated or noted
- [ ] **Information Gaps:** All critical gaps acknowledged or filled
- [ ] **Edge Coverage:** When the problem contains states and transitions, validation cases were derived by covering the graph (every state, transition, guard both ways, terminal states, failure paths) — not by intuition

### Quality Check
- [ ] **Logical Consistency:** No contradictions in reasoning
- [ ] **Evidence Quality:** All claims supported by facts or assumptions
- [ ] **Actionability:** Recommendations are clear and implementable
- [ ] **Relevance:** All content directly relates to the problem

### Confidence Assessment
**Scoring:**
| Factor | Score (0-10) | Weight | Weighted Score |
|--------|--------------|--------|----------------|
| Pattern Match Quality | [X] | 0.3 | [X.X] |
| Reasoning Depth | [X] | 0.25 | [X.X] |
| Output Completeness | [X] | 0.25 | [X.X] |
| Model Capability Fit | [X] | 0.2 | [X.X] |
| **Total** | - | **1.0** | **[X.X/10]** |

**Confidence Level:** [High: 8.0-10.0 / Medium: 5.0-7.9 / Low: < 5.0]

**Confidence Gate:** [PASS | FAIL → iterate|escalate|ask] (threshold: 7.0/10 unless the user set one; below it the flow is NOT done)

### Risk Assessment
**Primary Risks:**
- Risk 1: [What could go wrong] - Likelihood: [X%] - Impact: [High/Medium/Low] - Mitigation: [How to reduce]
- Risk 2: [What could go wrong] - Likelihood: [X%] - Impact: [High/Medium/Low] - Mitigation: [How to reduce]

**Residual Uncertainty:**
- Uncertainty 1: [What we're not sure about] - Effect: [How it affects confidence]
- Uncertainty 2: [What we're not sure about] - Effect: [How it affects confidence]

---

## Phase 5: Final Output (Universal - All Patterns)

**Objective:** Deliver structured, actionable response with full transparency.

### Execution Summary
```
Flow ID: {{FLOW_ID}}
Timestamp: [Completion time]
Duration: [Time taken]

Configuration:
  Thinking Type: {{THINKING_TYPE}}
  CoT Pattern: {{COT_PATTERN}}
  Complexity: {{COMPLEXITY}}
  Intent: {{INTENT}}
  Context: {{CONTEXT}}
```

### Key Findings
**Primary Insights:**
1. **Finding 1:** [Most important discovery] - Impact: [How significant] - Confidence: [X/10]
2. **Finding 2:** [Second important discovery] - Impact: [How significant] - Confidence: [X/10]
3. **Finding 3:** [Third important discovery] - Impact: [How significant] - Confidence: [X/10]

**Root Causes (if applicable):**
- Cause 1: [Underlying issue] - Evidence: [Supporting facts]
- Cause 2: [Underlying issue] - Evidence: [Supporting facts]

### Recommendations
**Action Items:**
1. **Recommendation 1:** [What to do] - Priority: [High/Medium/Low] - Impact: [Expected benefit] - Effort: [High/Medium/Low]
2. **Recommendation 2:** [What to do] - Priority: [High/Medium/Low] - Impact: [Expected benefit] - Effort: [High/Medium/Low]
3. **Recommendation 3:** [What to do] - Priority: [High/Medium/Low] - Impact: [Expected benefit] - Effort: [High/Medium/Low]

**Implementation Roadmap:**
- **Immediate (0-7 days):** [Actions to take now]
- **Short-term (1-4 weeks):** [Actions to take soon]
- **Long-term (1+ months):** [Actions for later]

### Quality Metrics
```
Pattern Applied: {{COT_PATTERN}}
Thinking Type: {{THINKING_TYPE}}

Confidence Level: [High/Medium/Low]
Confidence Gate: [PASS | FAIL → iterate|escalate|ask] (threshold: 7.0/10 unless user-set)
Estimated Accuracy Improvement: +[X]%
Token Usage: [Actual tokens] / [Budget tokens]
Execution Time: [Time taken]

Quality Scores:
  - Clarity: [X/10]
  - Completeness: [X/10]
  - Logical Consistency: [X/10]
  - Actionability: [X/10]
  - Overall: [X/10]
```

### Next Steps
- [ ] [Immediate next action]
- [ ] [Follow-up consideration]
- [ ] [Long-term planning item]

### Meta Information
```
Flow Template: unified-reasoning-flow
Adaptation Applied: [List of adaptations based on complexity]
Warnings: [Any issues or limitations encountered]
```

---

**Quality Metrics Summary**
| Metric | Score | Notes |
|--------|-------|-------|
| Adaptation Quality | X/10 | [How well adapted to model] |
| Pattern Selection | X/10 | [Appropriateness of chosen pattern] |
| Reasoning Depth | X/10 | [Quality of reasoning] |
| Output Completeness | X/10 | [All requirements met] |
| Actionability | X/10 | [Readiness to implement] |
