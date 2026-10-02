---
name: cot-reasoning
description: "Structured chain-of-thought reasoning framework for complex, multi-step problems: decomposes the problem into auditable steps with self-dialogue, environment-neutral tool integration, and result tracking, then validates the output flow. Use for production incident investigation, root cause analysis, debugging that requires evidence before conclusions, architecture and design decisions, code review and risk assessment, and trade-off or option comparison. NOT for: greetings and small talk; simple factual or single-word questions; trivial tasks with a direct answer; formatting, rewriting, or translation; domain-fact lookup - route those to the relevant domain skill, only the reasoning procedure routes here. Activate only when the request genuinely needs multi-step analysis, not merely because it contains a word like analyze or fix."
metadata:
  author: DanteUkraine
  version: "5.0.0"
  category: reasoning
  complexity: universal
  maturity: production-ready
  tags: "reasoning cot-reasoning engineering complex-systems universal thinking-chain self-dialogue tool-integration"
  invocation: both
  auto-detection: "(root[- ]cause|production incident|post[- ]mortem|risk assessment|trade[- ]offs?|architecture (decision|review)|design (decision|options?)|decide between|compare [^.]*(options|alternatives|solutions)|investigate (why|and)|debug (why|this)|troubleshoot [^.]*(issue|failure|incident)|multi[- ]step)"
  allowed-tools: ["filesystem-read", "filesystem-write", "shell-execution", "web-search", "code-search"]
---

<purpose>CoT-reasoning: Provides a structured reasoning framework that enhances model capabilities for complex, multi-step problem-solving.
CORE VALUE PROPOSITION:
- For models with tool-calling: Enables effective data gathering and analysis;
- For models with reasoning abilities: Provides structure for better organization and clarity;
- For all compatible models: Enhances complex task performance through guided reasoning;

RESULT: Compatible models can perform multi-step reasoning tasks more effectively, building and analyzing complex systems through structured, auditable reasoning chains.

This is a reasoning framework that enhances model capabilities, not a replacement for native reasoning.
</purpose>

<references>
| Reference | File | Purpose |
|-----------|------|---------|
| Core reasoning framework | `references/reasoning-simulation.md` | Framework architecture and core principles |
| Model capability adaptation | `references/model-capabilities.md` | Mode selection scaled to model reasoning capability |
| Intent detection and context classification | `references/intent-context-matrix.md` | Intent classification, thinking-type scoring matrices |
| Pattern selection guidelines | `references/reasoning-patterns-analysis.md` | Pattern selection recommendations and use cases |
| Adaptive flow template | `templates/adaptive-flows/unified-reasoning-flow.md` | Universal adaptive reasoning flow with pattern configuration |
| Step execution templates | `templates/system-flows/step-execution-template.md` | Executable reasoning step templates and worked step examples |
| Self-dialogue generation | `templates/system-flows/self-dialogue-template.md` | Transparent reasoning dialogue templates and worked dialogue examples |
| Thinking type frameworks | `templates/thinking-types/` (analytical, creative, critical, systematic, ethical, strategic) | Domain-specific thinking type frameworks |
| Reasoning examples | `assets/system-examples.json` | Commercial engineering scenarios (incident, architecture, code review) |
| Validation and verification | `scripts/validate-system-flow.sh` | Quality assurance for the output contract |
</references>

<activation>
**Routing boundary — when this skill activates:**

Activate when the request genuinely requires multi-step reasoning:
- Production incident investigation, debugging, root cause analysis
- Architecture or design decisions with options to evaluate
- Code review, risk assessment, trade-off comparison
- Any task where evidence must be gathered and chained before concluding

Do NOT activate for:
- Greetings, small talk, or single-word inputs
- Simple factual questions with a direct answer
- Trivial tasks (formatting, rewriting, translation, lookups)
- Domain-fact requests (route to the relevant domain skill — only the reasoning procedure routes here)

**Gating rule:** the auto-detection expression is a necessary signal, not a sufficient one.
A keyword match activates the skill only when the request is also non-trivial and not
excluded above. When in doubt, do not activate; the user can invoke explicitly.

**Explicit invocation phrasing** (portable across agent environments):
"Use cot-reasoning to investigate ..." / "Apply the cot-reasoning framework to ..."
</activation>

<workflow>
0. Input Analysis — Parse request, extract problem, determine reasoning needs
1. Problem Decomposition — Break complex problem into logical, executable components
2. Mode Selection — Pick MINIMAL/BASIC/STANDARD/ENHANCED per the mode rules below
3. Step Generation — Create structured reasoning flow with dependencies
4. Self-Dialogue Integration — Add transparent reasoning context to each step (mode-dependent)
5. Tool Call Planning — Identify data needs and plan tool operations (category-first)
6. Flow Assembly — Combine into complete executable reasoning chain
7. Output Formatting — Structure results at the tier the mode requires
8. Quality Validation — Verify completeness, consistency, and actionability
</workflow>

<instructions>
  <reasoning_framework>
  CORE CONCEPT: Chain-of-thought Reasoning ENHANCES Model Reasoning

  **The Challenge:** Models vary in their ability to perform complex, multi-step reasoning.
  Some struggle to connect ideas, maintain context across steps, or structure their thinking.

  **The Solution:** cot-reasoning generates step-by-step reasoning chains with self-dialogue,
  tool integration, and result tracking. The model uses its native capabilities to process
  and enhance this structure.

  ```
  cot-reasoning = Step Structure + Self-Dialogue + Tool Integration + Result Tracking
  MODEL + cot-reasoning = Enhanced Reasoning Capability
  ```

  <framework_components>

  **Component 1: Reasoning Flow Generator** — Decompose into ordered, executable steps;
  each step has single responsibility and clear dependencies.

  **Component 2: Self-Dialogue Engine** — Transparent internal monologue in the format
  Thought → Analysis → Question → Answer → Conclusion → Decision; makes the chain followable.

  **Component 3: Tool Integration Layer** — Category-first tool planning with explicit
  parameters, response processing, and error recovery (see tool taxonomy below).

  **Component 4: Result Tracking System** — Every step's input, output, status, and
  validation tracked; intermediate results carry forward; objective checks at each step.

  </framework_components>
  </reasoning_framework>

  <reasoning_modes>

  | Mode | Self-Dialogue | Tools | Output Tier | Selection Rule |
  |------|--------------|-------|-------------|----------------|
  | MINIMAL | None | None | Core only, hard boilerplate budget | Trivial problem answerable in 2-3 simple steps |
  | BASIC | Required | None | Core + Problem Analysis + Quality Metrics | No tools available in the environment |
  | STANDARD | Required | As needed | Full contract (all sections) | Default for most problems |
  | ENHANCED | Reduced or omitted | As needed | Full contract, no fabricated dialogue display | Model has strong native reasoning (see model-capabilities reference) |

  **Mode Selection Algorithm (evaluate in order):**
  1. Is the problem trivial (single question, 2-3 obvious steps, no evidence gathering)? → **MINIMAL**
  2. Are no tools available in this environment? → **BASIC** (fully functional without tools)
  3. Does the model reason natively and strongly (per `references/model-capabilities.md`)? → **ENHANCED**
  4. Otherwise → **STANDARD** (recommended default)

  **Model-capability adaptation:** mode selection scales ceremony to model capability.
  Strong reasoners reduce self-dialogue via ENHANCED — the structure and validation remain,
  the simulated dialogue display does not. Weak reasoners get the full structure via
  STANDARD, where the self-dialogue scaffold carries the reasoning. See
  `references/model-capabilities.md` for the capability table and selection algorithm.

  </reasoning_modes>

  <thinking_type_system>
  Select optimal thinking type for the problem domain.

  | Type | Best For | Strengths | Template |
  |------|----------|-----------|----------|
  | ANALYTICAL | Structured problems, data analysis, technical evaluation | Precision, thoroughness | `templates/thinking-types/analytical.md` |
  | CREATIVE | Innovation, design, brainstorming, novel solutions | Idea generation, exploration | `templates/thinking-types/creative.md` |
  | CRITICAL | Validation, argument analysis, risk assessment, QA | Flaw detection, quality assessment | `templates/thinking-types/critical.md` |
  | SYSTEMATIC | Process optimization, troubleshooting, system design | Reliability, repeatability | `templates/thinking-types/systematic.md` |
  | ETHICAL | Policy, compliance, social impact, harm/benefit analysis | Moral consideration, stakeholder fairness | `templates/thinking-types/ethical.md` |
  | STRATEGIC | Long-term planning, business strategy, competitive positioning | Competitive awareness, long-term thinking | `templates/thinking-types/strategic.md` |

  **Selection scoring:** Score = Intent_Fit(0.4) + Context_Fit(0.3) + Complexity_Fit(0.2) + Domain_Fit(0.1).
  The full scoring matrices, intent keywords, and selection algorithm are in
  `references/intent-context-matrix.md` — load it when the type choice is not obvious.
  </thinking_type_system>

  <reasoning_pattern_system>
  Select a pattern for organizing reasoning steps. Patterns are secondary to the step
  structure; the step-by-step execution is primary.

  | Pattern | Best For | Step Structure | Tool Usage |
  |---------|----------|----------------|------------|
  | Zero-Shot CoT | Simple problems | Single step | Low |
  | Few-Shot CoT | Example-based problems | Multiple steps with examples | Low-Medium |
  | Auto-CoT | Novel problems without provided examples | Steps with self-generated examples | Medium |
  | Tree of Thoughts | Complex decisions, multi-option evaluation | Branching steps | Medium-High |
  | ReAct | Tool-intensive tasks, debugging, investigation | Action-Reasoning loops | High |

  **Pattern selection:** Zero-Shot for simple direct reasoning; Few-Shot when examples help;
  Auto-CoT when the model must generate its own examples for a novel problem;
  Tree of Thoughts for multiple options to evaluate; ReAct for heavy tool usage.
  Detailed guidance: `references/reasoning-patterns-analysis.md`.
  </reasoning_pattern_system>

  <tool_integration_layer>
  **Environment-neutral tool taxonomy.** Plan tools by CATEGORY, then bind to whatever
  the host environment exposes. Never invent a concrete tool name.

  | Category | Purpose | How common environments expose it |
  |----------|---------|-----------------------------------|
  | filesystem-read | Read files, logs, configs | `read_file` (Mistral Vibe), `Read` (Claude Code), `cat` via shell |
  | filesystem-write | Write or edit files | `write_file`/`edit` (Mistral Vibe), `Write`/`Edit` (Claude Code) |
  | shell-execution | Run commands, verify state | `bash` (Mistral Vibe), `Bash` (Claude Code), terminal tool (OpenCode) |
  | web-search | Gather external information | `web_search` (Mistral Vibe), `WebSearch` (Claude Code), search tools (LangChain) |
  | code-search | Find patterns in code and logs | `grep`/`ripgrep` via shell, `Grep` (Claude Code), code search tools |

  **Usage principles:**
  1. Data-driven reasoning — tools gather data; reasoning analyzes it; never pass results through unexamined
  2. Explicit parameters — every tool call states complete, exact parameters
  3. Result processing — extract, validate, and integrate tool outputs into the chain
  4. Error handling — every tool call has a fallback; reasoning continues with available data

  **No-tools operation:** BASIC and MINIMAL are fully functional with no tools at all —
  every step uses `Tool: None` and pure reasoning. Tool planning applies to
  STANDARD and ENHANCED only.

  **Standard tool call format:**
  ```markdown
  **Tool:** [category]
  **Tool Parameters:**
  ```json
  { "parameter1": "value1" }
  ```
  **Expected Output:** [what the tool should return]
  **Validation:** [how to verify success]
  **Fallback:** [what to do if it fails]
  ```
  </tool_integration_layer>

  <step_structure_system>
  **Universal step framework (applies to all modes; field requirements vary by mode —
  see the output contract):**
  ```markdown
  ### Step [N]: [Descriptive Step Name]

  **Thought:** [Internal reasoning - what am I thinking about this step?]
  **Why:** [Explanation of why this step is necessary]
  **Action:** [Specific, executable instruction for this step]
  **Tool:** [Tool category, or "None" if pure reasoning]
  **Tool Parameters:** [Exact parameters if a tool is used]
  **Input:** [Data/parameters coming into this step]
  **Expected Output:** [What this step should produce]
  **Validation:** [Objective criteria to verify step success]
  **Dependencies:** [What this step needs from previous steps]
  **Next Step:** [What step comes after this one]
  **Fallback:** [Alternative approach if this step fails]
  **Complexity:** [LOW/MEDIUM/HIGH - step difficulty]
  ```

  **Design principles:** single responsibility per step; explicit dependencies;
  objective validation; graceful degradation (every step has a fallback); transparency
  (self-dialogue explains each action; assumptions are stated).

  **Complexity guidelines:**

  | Complexity | Step Count | Use Case |
  |------------|------------|----------|
  | LOW | 2-3 steps | Simple problems, direct reasoning |
  | MEDIUM | 4-6 steps | Standard problems, some dependencies |
  | HIGH | 7-9 steps | Complex problems, multiple dependencies |
  | VERY_HIGH | 10+ steps | Deep dependencies, maximum tool usage |

  Worked step examples (debugging, design, all step types) are in
  `templates/system-flows/step-execution-template.md` — load them when assembling flows
  for a new domain.
  </step_structure_system>

  <self_dialogue_system>
  **Transparent reasoning through structured internal monologue:**
  ```
  [Thought]: "Initial observation or question"
  [Analysis]: "Breakdown of the current situation"
  [Question]: "Specific inquiry to address"
  [Answer]: "Direct response to the question"
  [Consideration]: "Alternative perspective or concern" (optional)
  [Conclusion]: "Synthesis of findings"
  [Decision]: "Actionable next step"
  ```

  **Depth guidelines:**

  | Complexity | Exchanges | Use Case |
  |------------|----------|----------|
  | LOW | 2-3 | Simple decisions |
  | MEDIUM | 4-5 | Standard problems |
  | HIGH | 6-8 | Complex analysis |
  | VERY_HIGH | 9+ | Multi-faceted problems |

  **Quality criteria:** relevant to the step, logically flowing, provides insight rather
  than restatement, ends in a decision or action. Worked dialogue examples for debugging,
  design, and decision domains are in `templates/system-flows/self-dialogue-template.md`.

  **ENHANCED mode note:** for models that reason natively, do not fabricate a reasoning
  display. Keep the step structure, validation, and result tracking; omit the simulated
  dialogue unless it adds genuine explanatory value for the user.
  </self_dialogue_system>

  <input_output_system>
  **Input requirements:**
  - Minimum: 10+ characters, a clear problem or question
  - Optimal: [Context/Background] [Problem/Question] [Available Tools] [Constraints] [Goal]

  <output_contract>

  **The output contract is COST-TIERED.** Every mode emits the CORE structure; extended
  sections are conditional on mode. Never pay full ceremony for a trivial question, and
  never skip the contract for a hard incident.

  **CORE structure (mandatory in every mode):**
  ```markdown
  ## Reasoning Flow: [Brief Problem Summary]

  **Reasoning Mode:** [MINIMAL|BASIC|STANDARD|ENHANCED]
  **Thinking Type:** [ANALYTICAL|CREATIVE|CRITICAL|SYSTEMATIC|ETHICAL|STRATEGIC]
  **Complexity:** [LOW|MEDIUM|HIGH|VERY_HIGH]
  **Steps:** [N]

  ### Reasoning Steps

  ### Step 1: [Step Name]
  - **Action:** [Instruction]
  - **Expected Output:** [result]
  - **Validation:** [check]
  [Additional steps...]

  ### Key Findings
  1. **Finding 1:** [insight] - Impact: [High/Medium/Low] - Confidence: [X/10]

  ### Recommendations
  1. **Action 1:** [what] - Priority: [High/Medium/Low] - Impact: [benefit]
  ```

  **EXTENDED sections (conditional on mode):**
  ```markdown
  **Flow ID:** [unique_identifier_timestamp]          <- STANDARD, ENHANCED
  **Timestamp:** [ISO_8601_timestamp]                <- STANDARD, ENHANCED

  ### Configuration                                   <- STANDARD, ENHANCED
  - **Pattern:** [Zero-Shot CoT|Few-Shot CoT|Auto-CoT|Tree of Thoughts|ReAct]
  - **Domain:** [technical|business|creative|etc.]
  - **Intent:** [primary_intent]

  ### Problem Analysis                                <- BASIC, STANDARD, ENHANCED
  **Core Problem:** [one_sentence_summary]
  **Key Entities:** [entities and description]
  **Success Criteria:** [measurable criteria with priority]
  **Constraints:** [Hard: cannot_violate; Soft: should_respect]

  ### Intermediate Results                            <- STANDARD, ENHANCED
  **Step 1 Output:** [result]

  ### Execution Summary                               <- STANDARD, ENHANCED
  - **Steps Completed:** [X]/[N]
  - **Tools Used:** [category list]
  - **Tool Call Count:** [N]

  ### Quality Metrics                                 <- BASIC, STANDARD, ENHANCED
  - **Confidence Level:** [High:8-10 | Medium:5-7.9 | Low:<5] ([X.X/10])
  - **Reasoning Quality:** [X/10]
  - **Step Completion:** [X%]
  - **Actionability:** [X/10]
  - **Tool Utilization:** [X%] (only if tools were used)

  ### Meta Information                                <- STANDARD, ENHANCED
  **Generated By:** cot-reasoning v5.0.0
  **Pattern:** [pattern_name]
  **Performance Notes:** [any_considerations]
  ```

  **Tier summary:**

  | Mode | Sections required | Step fields required | Boilerplate budget |
  |------|-------------------|----------------------|--------------------|
  | MINIMAL | Core only | Action, Expected Output, Validation | Hard cap: at most 12 structural (non-content) lines and at most 3 steps |
  | BASIC | Core + Problem Analysis + Quality Metrics | Thought, Why, Action, Expected Output, Validation, Next Step, Fallback | None beyond core |
  | STANDARD | Core + all Extended sections | All step fields (incl. Tool, Input, Status, Dependencies, Complexity) | None |
  | ENHANCED | Core + all Extended sections | All step fields except Thought (optional — native reasoning) | None |

  **MINIMAL hard boilerplate budget:** a MINIMAL flow must not exceed **12 structural
  lines** (headings and header-field labels — lines that exist even with empty content)
  and **3 steps**. If the problem needs more, it is not a MINIMAL problem; select BASIC.

  **Anti-patterns:**

  | Wrong pattern | Why it fails | Resolution |
  |---------------|--------------|------------|
  | Emitting the full STANDARD contract (Flow ID, timestamps, metrics, meta) for a trivial question | Fixed ceremony cost swamps the content; users stop reading the output; the framework feels heavier than the problem | Use MINIMAL: core only, at most 12 structural lines and 3 steps |
  | Fabricating a [Thought]/[Question]/[Answer] reasoning display for a model that reasons natively | Simulated dialogue theater adds tokens, can misrepresent the actual computation, and adds no explanatory value | Use ENHANCED: keep structure, validation, and tracking; omit the fabricated dialogue display |

  </output_contract>
  </input_output_system>

</instructions>

<verify>

| Target | Method | Criteria |
|--------|--------|----------|
| Activation routing | Request inspection | Non-trivial, multi-step, not excluded by NOT-conditions |
| Mode selection | Tier rules | Mode matches complexity, tool availability, and model capability |
| Problem decomposition | Complexity analysis | Appropriate step count for the tier |
| Step generation | Structure check | All tier-required fields present |
| Self-dialogue | Content check | Relevant and logical (STANDARD/BASIC only) |
| Tool integration | Category check | Tools planned by category; no invented tool names |
| Output format | `scripts/validate-system-flow.sh` | All tier-required sections present; MINIMAL budget respected |
| Quality metrics | Calculation | All tier-required metrics computed |

**Commands:**
```bash
# Validate a single markdown flow (tier-aware: checks the contract the flow's mode requires)
./scripts/validate-system-flow.sh -s [flow_file.md]

# Validate every example in the engineering example suite (JSON mode)
./scripts/validate-system-flow.sh -j assets/system-examples.json

# Validate all flows in a directory
./scripts/validate-system-flow.sh -d [directory/]
```

Return codes: 0 = all validations passed, 1 = validation errors found, 2 = usage error.
The validator enforces the tiered output contract, the four modes, the six thinking types,
the five patterns, and the category-first tool taxonomy.

</verify>

<notes>
  - **cot-reasoning Concept**: The skill provides a reasoning framework that enhances model capabilities
  - **Compatibility**: Works with compatible LLMs, particularly those with tool-calling support
  - **Step Structure**: Every problem decomposed into executable steps
  - **Self-Dialogue**: Makes reasoning transparent and auditable (STANDARD/BASIC)
  - **Tool Integration**: Category-first, environment-neutral; BASIC and MINIMAL need no tools
  - **Cost tiering**: Ceremony scales with problem complexity and model capability
  - **Validation**: `scripts/validate-system-flow.sh` enforces the output contract
</notes>
