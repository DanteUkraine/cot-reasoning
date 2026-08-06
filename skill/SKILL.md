---
name: system-reasoning-brain
description: |
  SYSTEM REASONING BRAIN - The central thinking system that enables ANY model to perform
  complex, multi-step reasoning by providing structured thinking chains with self-dialogue,
  tool integration, and intermediate result tracking.
  
  CORE FUNCTION: Acts as the "system brain" that compensates for limitations in models
  that cannot build complex reasoning chains natively. Provides the complete reasoning
  structure that transforms any model into a capable reasoning agent.
  
  WHEN TO ACTIVATE:
  - Complex problems requiring multi-step analysis, reasoning, or decision-making
  - Tasks needing systematic thinking, decomposition, and structured execution
  - Any request where the model would benefit from explicit reasoning guidance
  - Engineering tasks requiring system-level thinking and planning
  
  WHEN NOT TO ACTIVATE:
  - Simple factual questions with direct answers
  - Trivial tasks requiring no analysis or reasoning
  - Greetings, small talk, or single-word inputs
  - Input shorter than 10 characters
  
  MANDATORY INPUTS:
  - Problem statement, question, or task description (minimum 10 characters)
  - Clear intent requiring reasoning, analysis, or problem-solving
  
  CORE ACTION:
  - Analyze problem and generate structured reasoning flow
  - Decompose into executable steps with explicit dependencies
  - Generate self-dialogue for transparent reasoning process
  - Integrate tool calls for data operations
  - Track intermediate results for auditability
  - Produce structured, actionable output
  
  SYSTEM BRAIN PRINCIPLE:
  The skill IS the brain. The model is the executor.
  The skill provides the complete reasoning structure; the model simply follows instructions.
  Result: Any model can perform complex reasoning tasks as effectively as a system engineer.
  
  STATE-MUTATION: Generates structured reasoning flows and may invoke tools.
  
  UNIVERSAL COMPATIBILITY:
  - Works with ANY LLM framework or system
  - Provides reasoning structure for models that lack native reasoning
  - Enhances reasoning for models with native capability
  - No model-specific adaptations required
compatibility: ALL Agent Skills Open Standard v1 compliant systems, any LLM framework, any agent system
metadata:
  author: system-reasoning-consortium
  version: "5.0.0"
  last_updated: "2026-08-06"
  category: reasoning
  complexity: universal
  maturity: production-ready
  tags: "reasoning system-brain engineering complex-systems universal thinking-chain self-dialogue tool-integration"
  invocation: both
  auto-detection: "(analyze|evaluate|assess|review|examine|audit|diagnose|investigate|solve|fix|debug|troubleshoot|resolve|design|architect|create|build|develop|invent|draft|outline|validate|verify|test|confirm|check|ensure|compare|select|choose|decide|prioritize|rank|approve|explain|describe|understand|clarify|elaborate|define|predict|forecast|estimate|optimize|improve|enhance|research|explore|study|gather)"
  allowed-tools: web_search,code_analyzer,file_read,file_write
  model_requirements: "Any LLM - universal reasoning structure provider"
---

<purpose>
SYSTEM REASONING BRAIN: Enable ANY Large Language Model to perform complex, system-level reasoning
by providing a complete thinking framework that compensates for any limitations in native reasoning capability.

CORE VALUE PROPOSITION:
- For models that CANNOT reason natively: Provides the complete reasoning structure
- For models that CAN reason natively: Enhances with better structure, transparency, and tool integration
- For ALL models: Enables system-level thinking for complex engineering tasks

RESULT: Every model can perform as a system engineer, building and analyzing complex systems
through structured, auditable reasoning chains.

This is not just a reasoning assistant - this is the SYSTEM BRAIN that powers reasoning for any model.
</purpose>

<references>
| Reference | File | Purpose |
|-----------|------|---------|
| Core reasoning simulation mechanics | `references/reasoning-simulation.md` | System brain architecture |
| Intent detection and context classification | `references/intent-context-matrix.md` | Problem understanding |
| Pattern organization and flow structuring | `references/reasoning-patterns-analysis.md` | Reasoning organization |
| Step execution templates | `templates/system-flows/step-execution-template.md` | Executable reasoning steps |
| Self-dialogue generation | `templates/system-flows/self-dialogue-template.md` | Transparent reasoning |
| Tool integration patterns | `templates/tool-integration/` | Data operations |
| Thinking type frameworks | `templates/thinking-types/` | Domain-specific reasoning |
| System reasoning examples | `assets/system-examples.json` | Real-world usage patterns |
| Validation and verification | `scripts/validate-system-flow.sh` | Quality assurance |
</references>

<workflow>
0. Input Analysis — Parse request, extract problem, determine reasoning needs
1. Problem Decomposition — Break complex problem into logical, executable components
2. Step Generation — Create structured reasoning flow with dependencies
3. Self-Dialogue Integration — Add transparent reasoning context to each step
4. Tool Call Planning — Identify data needs and plan tool operations
5. Flow Assembly — Combine into complete executable reasoning chain
6. Output Formatting — Structure results with full traceability
7. Quality Validation — Verify completeness, consistency, and actionability
</workflow>

<instructions>

  <system_brain_architecture>
  **CORE CONCEPT: The Skill IS the Brain, the Model is the Executor**
  
  **The Problem:**
  Some models cannot build complex reasoning chains, connect multiple ideas, or maintain
  multi-step thinking processes. This limits their effectiveness for system engineering tasks.
  
  **The Solution:**
  The System Reasoning Brain provides the complete thinking structure. The model doesn't need
  to reason - it just needs to follow the structured instructions provided by the skill.
  
  **How It Works:**
  
  1. **System Brain Activation:** When a complex problem is detected, the skill activates
  2. **Thinking Structure Generation:** The skill creates a complete reasoning flow
  3. **Step Execution:** The model follows each step like a recipe
  4. **Result Aggregation:** Intermediate results build toward final solution
  5. **Output Delivery:** Structured, auditable reasoning chain is produced
  
  **System Brain Formula:**
  ```
  SYSTEM BRAIN = Step Structure + Self-Dialogue + Tool Integration + Result Tracking
  
  MODEL + SYSTEM BRAIN = Capable Reasoning Agent
  ```
  
  **For Any Model:**
  - Models WITHOUT native reasoning: System Brain provides ALL reasoning capability
  - Models WITH native reasoning: System Brain provides ENHANCED reasoning capability
  - Result: ALL models can perform complex system engineering tasks
  
  <brain_components>
  
  **Component 1: Reasoning Flow Generator**
  - Input: Problem statement
  - Process: Decompose into logical steps
  - Output: Ordered sequence of executable reasoning steps
  - Key: Each step has single responsibility and clear dependencies
  
  **Component 2: Self-Dialogue Engine**
  - Purpose: Make reasoning process transparent and followable
  - Mechanism: Internal monologue simulating thinking
  - Format: Thought → Analysis → Question → Answer → Conclusion → Decision
  - Result: Users can follow and understand the reasoning chain
  
  **Component 3: Tool Integration Layer**
  - Purpose: Enable data operations for reasoning
  - Capability: Automatic tool detection and parameter generation
  - Execution: Tool calls at appropriate steps with explicit parameters
  - Handling: Response processing, validation, and error recovery
  
  **Component 4: Result Tracking System**
  - Purpose: Maintain audit trail of reasoning process
  - Tracking: Every step's input, output, status, and validation
  - Building: Intermediate results carry forward to subsequent steps
  - Verification: Objective checks at each step ensure quality
  
  </brain_components>
  
  <reasoning_modes>
  
  | Mode | Description | Use Case | Characteristics |
  |------|-------------|----------|----------------|
  | STANDARD | Complete reasoning with self-dialogue and tool calls | Most problems | Full capability |
  | BASIC | Self-dialogue without tools | No tools available | Reasoning only |
  | ENHANCED | Optimized for capable models | Models with reasoning | Enhanced patterns |
  | MINIMAL | Simple step structure only | Simple problems | Basic guidance |
  
  **Mode Selection:**
  - STANDARD: Default for most problems (recommended)
  - BASIC: When no tools are available
  - ENHANCED: When model has native reasoning capability
  - MINIMAL: For very simple problems
  
  </reasoning_modes>
  
  </system_brain_architecture>

  <step_structure_system>
  **CORE: Universal Step Execution Framework**
  
  **Step Structure (Applies to ALL models, ALL problems):**
  ```markdown
  ### Step [N]: [Descriptive Step Name]
  
  **Thought:** [Internal reasoning - what am I thinking about this step?]
  **Why:** [Explanation of why this step is necessary in the overall reasoning]
  **Action:** [Specific, executable instruction for this step]
  **Tool:** [Tool to use, or "None" if pure reasoning]
  **Tool Parameters:** [Exact parameters if tool is used]
  **Input:** [Data/parameters coming into this step]
  **Expected Output:** [What this step should produce]
  **Validation:** [Objective criteria to verify step success]
  **Dependencies:** [What this step needs from previous steps]
  **Next Step:** [What step comes after this one]
  **Fallback:** [Alternative approach if this step fails]
  **Complexity:** [LOW/MEDIUM/HIGH - step difficulty]
  ```
  
  <step_design_principles>
  
  **Principle 1: Single Responsibility**
  - Each step does ONE thing and does it well
  - Complex operations are split into multiple steps
  - Clear purpose for each step
  
  **Principle 2: Explicit Dependencies**
  - Dependencies between steps are clearly stated
  - Data flow between steps is documented
  - No implicit or hidden dependencies
  
  **Principle 3: Objective Validation**
  - Every step has measurable validation criteria
  - Validation is objective, not subjective
  - Failed validations trigger fallback paths
  
  **Principle 4: Graceful Degradation**
  - Every step has at least one fallback option
  - Fallbacks maintain reasoning continuity
  - Limitations are clearly documented
  
  **Principle 5: Transparency**
  - Self-dialogue explains reasoning behind each action
  - Tool usage is justified and documented
  - Assumptions are explicitly stated
  
  </step_design_principles>

  <step_complexity_guidelines>
  
  **Complexity Levels:**
  
  | Complexity | Step Count | Use Case | Characteristics |
  |------------|------------|----------|----------------|
  | LOW | 2-3 steps | Simple problems | Direct reasoning, minimal dependencies |
  | MEDIUM | 4-6 steps | Standard problems | Some dependencies, moderate tool usage |
  | HIGH | 7-9 steps | Complex problems | Multiple dependencies, heavy tool usage |
  | VERY_HIGH | 10+ steps | Very complex | Deep dependencies, maximum tool usage |
  
  **Complexity Determination:**
  - Problem scope and impact
  - Number of variables and unknowns
  - Required depth of analysis
  - Number of interdependent components
  - Available time and resources
  
  </step_complexity_guidelines>

  <step_examples>
  
  **Example 1: System Debugging**
  ```markdown
  ### Step 1: Understand System State
  - Thought: "Need to establish baseline system state before investigation"
  - Why: Cannot debug without understanding normal operation
  - Action: Gather current system metrics and status
  - Tool: None (or system monitoring tool)
  - Input: User request
  - Expected Output: Current system state description
  - Validation: System state is clearly defined
  - Dependencies: None
  - Next Step: Step 2
  - Fallback: Use user-provided context
  - Complexity: LOW
  
  ### Step 2: Identify Anomalies
  - Thought: "With baseline established, can identify what's abnormal"
  - Why: Anomalies indicate potential issues
  - Action: Compare current state with expected/normal state
  - Tool: code_analyzer (or similar)
  - Input: System state from Step 1
  - Expected Output: List of anomalies with severity
  - Validation: Anomalies are clearly identified and prioritized
  - Dependencies: Step 1 output
  - Next Step: Step 3
  - Fallback: Manual comparison with known good state
  - Complexity: MEDIUM
  
  ### Step 3: Analyze Root Causes
  - Thought: "Anomalies identified, need to find underlying causes"
  - Why: Solutions require addressing root causes, not symptoms
  - Action: Trace each anomaly to its potential root cause
  - Tool: file_read, grep (for log analysis)
  - Input: Anomalies from Step 2
  - Expected Output: Hypothesized root causes with supporting evidence
  - Validation: Each cause has compelling evidence
  - Dependencies: Step 2 output
  - Next Step: Step 4
  - Fallback: Focus on highest-severity anomaly first
  - Complexity: HIGH
  ```
  
  **Example 2: System Design**
  ```markdown
  ### Step 1: Define Requirements
  - Thought: "Need clear requirements before designing"
  - Why: Design without requirements leads to rework
  - Action: Extract and organize all requirements from input
  - Tool: None
  - Input: User request
  - Expected Output: Complete requirement specification
  - Validation: All requirements are captured and categorized
  - Dependencies: None
  - Next Step: Step 2
  - Fallback: Ask user for clarification
  - Complexity: LOW
  
  ### Step 2: Identify Constraints
  - Thought: "Requirements defined, need to understand limitations"
  - Why: Constraints shape the design space
  - Action: Extract all constraints and limitations
  - Tool: None
  - Input: Requirements from Step 1
  - Expected Output: Complete constraint list with impact assessment
  - Validation: All constraints are documented
  - Dependencies: Step 1 output
  - Next Step: Step 3
  - Fallback: Proceed with known constraints, note missing ones
  - Complexity: LOW
  
  ### Step 3: Generate Design Options
  - Thought: "With requirements and constraints, can generate viable designs"
  - Why: Multiple options enable better decision making
  - Action: Create 2-3 design options that meet requirements
  - Tool: None (or web_search for inspiration)
  - Input: Requirements and constraints
  - Expected Output: Multiple design options with pros/cons
  - Validation: Each option meets all requirements
  - Dependencies: Steps 1-2 output
  - Next Step: Step 4
  - Fallback: Generate at least one viable option
  - Complexity: HIGH
  
  ### Step 4: Evaluate and Select
  - Thought: "Need to select best design based on criteria"
  - Why: Objective evaluation leads to optimal choice
  - Action: Evaluate options against criteria, select best
  - Tool: None
  - Input: Design options from Step 3
  - Expected Output: Selected design with justification
  - Validation: Selection criteria are objective and well-applied
  - Dependencies: Step 3 output
  - Next Step: None
  - Fallback: Present options to user for selection
  - Complexity: MEDIUM
  ```
  
  </step_examples>

  </step_structure_system>

  <self_dialogue_system>
  **TRANSPARENT REASONING THROUGH STRUCTURED INTERNAL MONOLOGUE**
  
  **Purpose:**
  - Make reasoning process visible and understandable
  - Enable users to follow the thinking chain
  - Compensate for lack of native reasoning in models
  - Provide audit trail of decision making
  
  **Dialogue Structure:**
  ```
  [Thought]: "Initial observation or question"
  [Analysis]: "Breakdown of the current situation"
  [Question]: "Specific inquiry to address"
  [Answer]: "Direct response to the question"
  [Consideration]: "Alternative perspective or concern" (optional)
  [Conclusion]: "Synthesis of findings"
  [Decision]: "Actionable next step"
  ```
  
  <dialogue_depth_guidelines>
  
  | Complexity | Exchanges | Depth | Use Case |
  |------------|----------|-------|----------|
  | LOW | 2-3 | Brief | Simple decisions |
  | MEDIUM | 4-5 | Moderate | Standard problems |
  | HIGH | 6-8 | Detailed | Complex analysis |
  | VERY_HIGH | 9+ | Extensive | Multi-faceted problems |
  
  **Depth Selection:**
  - Match depth to problem complexity
  - More depth = more transparency but longer output
  - Balance between clarity and conciseness
  
  </dialogue_depth_guidelines>

  <dialogue_quality_criteria>
  
  **Good Self-Dialogue:**
  - Relevant to the current step's purpose
  - Logically flows from one exchange to the next
  - Provides insights, not just restatements
  - Leads to clear decision or action
  - Transparent and easy to follow
  
  **Poor Self-Dialogue:**
  - Vague or non-specific
  - Not relevant to the step
  - Circular reasoning
  - Doesn't lead to action
  - Artificial or forced
  
  </dialogue_quality_criteria>

  <dialogue_examples>
  
  **Debugging Dialogue:**
  ```
  [Thought]: "System is returning 500 errors for API endpoint"
  [Analysis]: "500 errors indicate server-side failure. Could be: database, code, configuration, resources"
  [Question]: "What are the most likely causes given the context?"
  [Answer]: "Database connection issues are most likely because errors started after deployment"
  [Question]: "What data would confirm this?"
  [Answer]: "Need to check: database connection logs, deployment changes, resource usage"
  [Conclusion]: "Primary hypothesis: database connection pool exhaustion"
  [Decision]: "Retrieve database logs and check connection metrics"
  ```
  
  **Design Dialogue:**
  ```
  [Thought]: "Need to design a scalable authentication system"
  [Analysis]: "Scalability implies: high concurrency, low latency, distributed system, fault tolerance"
  [Question]: "What are the key design decisions?"
  [Answer]: "Main decisions: token vs session, stateless vs stateful, centralized vs distributed"
  [Question]: "Which approach best meets the requirements?"
  [Answer]: "JWT with distributed validation seems optimal for this scale"
  [Consideration]: "But need to consider: security implications, revocation, performance"
  [Conclusion]: "JWT with Redis for token storage is the baseline design"
  [Decision]: "Propose JWT+Redis architecture with detailed specification"
  ```
  
  </dialogue_examples>

  </self_dialogue_system>

  <tool_integration_layer>
  **ENABLE DATA OPERATIONS FOR REASONING**
  
  **Purpose:**
  - Enable reasoning to access external data
  - Provide data for analysis and decision making
  - Extend model capabilities beyond its training data
  - Verify assumptions and hypotheses
  
  <tool_usage_principles>
  
  **Principle 1: Data-Driven Reasoning**
  - Use tools to gather data, not to replace reasoning
  - Data informs reasoning, doesn't replace it
  - Always analyze tool results, don't just pass them through
  
  **Principle 2: Explicit Parameters**
  - Every tool call has complete, exact parameters
  - Parameters are derived from context and previous steps
  - No implicit or vague parameters
  
  **Principle 3: Result Processing**
  - Extract relevant information from tool outputs
  - Validate tool results for completeness and relevance
  - Integrate results into the reasoning chain
  
  **Principle 4: Error Handling**
  - Every tool call has fallback options
  - Errors are documented and handled gracefully
  - Reasoning continues with available data
  
  </tool_usage_principles>

  <tool_classification>
  
  | Tool Category | Tools | Purpose | Usage Pattern |
  |---------------|-------|---------|---------------|
  | Data Retrieval | file_read, web_search | Get external data | Frequent for data collection |
  | Data Analysis | grep, code_analyzer | Process and analyze | Moderate for analysis steps |
  | Data Manipulation | file_write | Modify data | Occasional for solutions |
  | System Operations | bash | Execute commands | As needed for verification |
  
  </tool_classification>

  <tool_call_structure>
  
  **Standard Tool Call Format:**
  ```markdown
  **Tool:** tool_name
  **Tool Parameters:**
  ```json
  {
    "parameter1": "value1",
    "parameter2": "value2"
  }
  ```
  **Expected Output:** [What the tool should return]
  **Validation:** [How to verify the tool succeeded]
  **Fallback:** [What to do if tool fails]
  ```
  
  </tool_call_structure>

  </tool_integration_layer>

  <thinking_type_system>
  Select optimal thinking type for the problem domain.
  
  **Thinking Types:**
  | Type | Best For | Strengths | Reasoning Approach |
  |------|----------|-----------|-------------------|
  | ANALYTICAL | Structured problems, data analysis, technical evaluation | Precision, thoroughness | Step-by-step data analysis |
  | CREATIVE | Innovation, design, brainstorming, novel solutions | Idea generation, exploration | Divergent thinking + convergence |
  | CRITICAL | Validation, argument analysis, risk assessment, QA | Flaw detection, quality | Hypothesis testing + verification |
  | SYSTEMATIC | Process optimization, troubleshooting, system design | Reliability, repeatability | Sequential cause-effect analysis |
  | ETHICAL | Policy, compliance, social impact, moral decisions | Moral consideration | Stakeholder analysis + principles |
  | STRATEGIC | Long-term planning, business strategy, resource allocation | Competitive awareness | Scenario analysis + trade-offs |
  
  <type_selection_algorithm>
  
  **Scoring Formula:**
  ```
  Score = Intent_Fit(0.4) + Context_Fit(0.3) + Complexity_Fit(0.2) + Domain_Fit(0.1)
  ```
  
  **Intent Fit (0-1):**
  | Type | ANALYZE | DESIGN | SOLVE | VALIDATE | DECIDE | EXPLAIN | PREDICT | RESEARCH |
  |------|---------|--------|-------|----------|--------|---------|---------|----------|
  | ANALYTICAL | 0.9 | 0.7 | 0.8 | 0.9 | 0.8 | 0.8 | 0.8 | 0.7 |
  | CREATIVE | 0.6 | 0.9 | 0.7 | 0.6 | 0.7 | 0.6 | 0.7 | 0.8 |
  | CRITICAL | 0.8 | 0.6 | 0.7 | 0.9 | 0.8 | 0.7 | 0.7 | 0.8 |
  | SYSTEMATIC | 0.8 | 0.7 | 0.9 | 0.8 | 0.7 | 0.7 | 0.8 | 0.9 |
  | ETHICAL | 0.7 | 0.6 | 0.6 | 0.8 | 0.9 | 0.7 | 0.7 | 0.7 |
  | STRATEGIC | 0.7 | 0.8 | 0.7 | 0.7 | 0.9 | 0.8 | 0.8 | 0.6 |
  
  **Context Fit (0-1):**
  | Type | TECHNICAL | BUSINESS | CREATIVE | ETHICAL | SYSTEMIC | SCIENTIFIC |
  |------|-----------|----------|----------|---------|----------|-----------|
  | ANALYTICAL | 0.9 | 0.8 | 0.6 | 0.8 | 0.8 | 0.9 |
  | CREATIVE | 0.7 | 0.7 | 0.9 | 0.6 | 0.7 | 0.7 |
  | CRITICAL | 0.8 | 0.8 | 0.6 | 0.9 | 0.7 | 0.8 |
  | SYSTEMATIC | 0.9 | 0.7 | 0.6 | 0.7 | 0.9 | 0.8 |
  | ETHICAL | 0.7 | 0.8 | 0.6 | 0.9 | 0.7 | 0.7 |
  | STRATEGIC | 0.6 | 0.9 | 0.8 | 0.8 | 0.7 | 0.7 |
  
  **Complexity Fit (0-1):**
  | Type | LOW | MEDIUM | HIGH | VERY_HIGH |
  |------|-----|--------|------|-----------|
  | ANALYTICAL | 0.9 | 0.9 | 0.8 | 0.7 |
  | CREATIVE | 0.6 | 0.8 | 0.9 | 0.9 |
  | CRITICAL | 0.7 | 0.8 | 0.9 | 0.8 |
  | SYSTEMATIC | 0.8 | 0.9 | 0.9 | 0.8 |
  | ETHICAL | 0.6 | 0.8 | 0.9 | 0.9 |
  | STRATEGIC | 0.6 | 0.8 | 0.9 | 0.9 |
  
  </type_selection_algorithm>
  
  </thinking_type_system>

  <reasoning_pattern_system>
  Select pattern for organizing reasoning steps.
  
  **Note:** In System Reasoning Brain, patterns are secondary to the step structure.
  Patterns provide organizing principles, but the step-by-step execution is primary.
  
  | Pattern | Best For | Step Structure | Tool Usage |
  |---------|----------|----------------|------------|
  | Zero-Shot CoT | Simple problems | Single step | Low |
  | Few-Shot CoT | Example-based | Multiple steps with examples | Low-Medium |
  | Tree of Thoughts | Complex decisions | Branching steps | Medium-High |
  | ReAct | Tool-intensive tasks | Action-Reasoning loops | High |
  
  **Pattern Selection:**
  - Zero-Shot CoT: Simple, direct reasoning
  - Few-Shot CoT: When examples would help
  - Tree of Thoughts: Multiple options to evaluate
  - ReAct: Heavy tool usage required
  
  </reasoning_pattern_system>

  <input_output_system>
  **STANDARDIZED SYSTEM BRAIN OUTPUT**
  
  <input_requirements>
  
  **Minimum:**
  - Length: 10+ characters
  - Clear problem or question
  
  **Optimal:**
  ```
  [Context/Background]
  [Problem/Question]
  [Available Tools]  # If known
  [Constraints]
  [Goal/Desired Outcome]
  ```
  
  **Template Variables:**
  - `{{USER_REQUEST}}`: Problem statement (required)
  - `{{CONTEXT}}`: Additional background (optional)
  - `{{AVAILABLE_TOOLS}}`: Available tools (optional)
  - `{{CONSTRAINTS}}`: Limitations (optional)
  - `{{GOAL}}`: Desired outcome (optional)
  
  </input_requirements>

  <output_structure>
  
  **MANDATORY STRUCTURE:**
  ```markdown
  ## System Reasoning Flow: [Brief Problem Summary]
  
  **Flow ID:** [unique_identifier_timestamp]
  **Timestamp:** [ISO_8601_timestamp]
  **Reasoning Mode:** [STANDARD|BASIC|ENHANCED|MINIMAL]
  **Thinking Type:** [ANALYTICAL|CREATIVE|CRITICAL|SYSTEMATIC|ETHICAL|STRATEGIC]
  **Complexity:** [LOW|MEDIUM|HIGH|VERY_HIGH]
  **Steps:** [N]
  
  ### Configuration
  - **Pattern:** [Zero-Shot|Few-Shot|Tree-of-Thoughts|ReAct]
  - **Domain:** [technical|business|creative|etc.]
  - **Intent:** [primary_intent]
  
  ### Problem Analysis
  **Core Problem:** [one_sentence_summary]
  
  **Key Entities:**
  - Entity 1: [description]
  - Entity 2: [description]
  
  **Success Criteria:**
  - [ ] Criterion 1: [measurable] - Priority: [High/Medium/Low]
  - [ ] Criterion 2: [measurable] - Priority: [High/Medium/Low]
  
  **Constraints:**
  - Hard: [cannot_violate]
  - Soft: [should_respect]
  
  ### Reasoning Steps
  
  **Step 1: [Step Name]**
  - **Thought:** [Internal reasoning]
  - **Why:** [Explanation]
  - **Action:** [Instruction]
  - **Tool:** [tool_or_None]
  - **Tool Parameters:** [if applicable]
  - **Input:** [data]
  - **Expected Output:** [result]
  - **Validation:** [check]
  - **Status:** [pending|completed|failed]
  - **Actual Output:** [if completed]
  - **Next Step:** [dependency]
  - **Fallback:** [alternative]
  - **Complexity:** [LOW|MEDIUM|HIGH]
  
  [Additional steps...]
  
  ### Intermediate Results
  **Step 1 Output:** [result]
  **Step 2 Output:** [result]
  [etc.]
  
  ### Key Findings
  1. **Finding 1:** [insight] - Impact: [High/Medium/Low] - Confidence: [X/10]
  2. **Finding 2:** [insight] - Impact: [High/Medium/Low] - Confidence: [X/10]
  
  **Root Causes:**
  - Cause 1: [issue] - Evidence: [facts]
  
  ### Recommendations
  1. **Action 1:** [what] - Priority: [High/Medium/Low] - Impact: [benefit]
  2. **Action 2:** [what] - Priority: [High/Medium/Low] - Impact: [benefit]
  
  ### Execution Summary
  - **Steps Completed:** [X]/[N]
  - **Tools Used:** [list]
  - **Tool Call Count:** [N]
  
  ### Quality Metrics
  - **Confidence Level:** [High:8-10 | Medium:5-7.9 | Low:<5] ([X.X/10])
  - **Reasoning Quality:** [X/10]
  - **Tool Utilization:** [X%] (if tools used)
  - **Step Completion:** [X%]
  - **Actionability:** [X/10]
  
  ### Meta Information
  **Generated By:** System Reasoning Brain v5.0.0
  **Pattern:** [pattern_name]
  **Performance Notes:** [any_considerations]
  ```
  
  </output_structure>

  </input_output_system>

</instructions>

<verify>

| Target | Method | Criteria |
|--------|--------|----------|
| Input validation | Length, clarity | Min 10 chars, clear problem |
| Problem decomposition | Complexity analysis | Appropriate step count |
| Step generation | Structure check | All required fields present |
| Self-dialogue | Content check | Relevant and logical |
| Tool integration | Placement check | Tools in appropriate steps |
| Output format | Structure validation | All required sections |
| Quality metrics | Calculation | All metrics computed |

**Commands:**
```bash
# Validate single flow
/srb-validate --input="[user_request]"

# Validate complete flow
/srb-validate --full

# Force specific mode
/srb --mode=STANDARD --input="[query]"

# Force specific pattern
/srb --pattern=ReAct --input="[query]"
```

</verify>

<notes>
  - **System Brain Concept**: The skill provides the complete reasoning structure for any model
  - **Universal Compatibility**: Works with ANY LLM, regardless of native capabilities
  - **Step Structure**: Every problem decomposed into executable steps
  - **Self-Dialogue**: Makes reasoning process transparent and auditable
  - **Tool Integration**: Enables data operations for comprehensive analysis
  - **Result Tracking**: Maintains complete audit trail of reasoning process
  
  **SYSTEM BRAIN GUARANTEE:**
  - ANY model can perform complex reasoning tasks
  - Complete reasoning chains with full traceability
  - Universal compatibility - no model limitations
  - Structured output for easy parsing and integration
  - Quality metrics for every reasoning flow
  - Auditable reasoning process for all stakeholders
</notes>
