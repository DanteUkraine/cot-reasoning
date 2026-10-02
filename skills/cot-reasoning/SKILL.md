---
name: cot-reasoning
description: "Structured chain-of-thought reasoning framework for complex, multi-step problems: decomposes the problem into auditable steps with self-dialogue, environment-neutral tool integration, and result tracking, then validates the output flow. Use for production incident investigation, root cause analysis, debugging that requires evidence before conclusions, architecture and design decisions, code review and risk assessment, and trade-off or option comparison. NOT for: greetings and small talk; simple factual or single-word questions; trivial tasks with a direct answer; formatting, rewriting, or translation; domain-fact lookup - route those to the relevant domain skill, only the reasoning procedure routes here. Activate only when the request genuinely needs multi-step analysis, not merely because it contains a word like analyze or fix."
metadata:
  author: DanteUkraine
  version: "5.1.0"
  category: reasoning
  complexity: universal
  maturity: production-ready
  tags: "reasoning cot-reasoning engineering complex-systems universal thinking-chain self-dialogue tool-integration"
  invocation: both
  auto-detection: "(root[- ]cause|production incident|post[- ]mortem|risk assessment|trade[- ]offs?|architecture (decision|review)|design (decision|options?)|decide between|compare [^.]*(options|alternatives|solutions)|investigate (why|and)|debug (why|this)|troubleshoot [^.]*(issue|failure|incident)|multi[- ]step)"
  allowed-tools: ["filesystem-read", "filesystem-write", "shell-execution", "web-search", "code-search"]
---

<purpose>
CoT-reasoning: Provides a structured reasoning framework that enhances model capabilities
for complex, multi-step problem-solving.

CORE VALUE PROPOSITION:
- For models with tool-calling: Enables effective data gathering and analysis;
- For models with reasoning abilities: Provides structure for better organization and clarity;
- For all compatible models: Enhances complex task performance through guided reasoning;

RESULT: Compatible models can perform multi-step reasoning tasks more effectively, building
and analyzing complex systems through structured, auditable reasoning chains.

The framework exists because models vary in their ability to perform complex, multi-step
reasoning — some struggle to connect ideas, maintain context across steps, or structure
their thinking. The skill generates step-by-step reasoning chains with self-dialogue, tool
integration, and result tracking; the model uses its native capabilities to process and
enhance this structure.

cot-reasoning = Step Structure + Self-Dialogue + Tool Integration + Result Tracking
MODEL + cot-reasoning = Enhanced Reasoning Capability

Its four components: the Reasoning Flow Generator decomposes the problem into ordered,
executable steps, each with single responsibility and clear dependencies; the Self-Dialogue
Engine produces a transparent internal monologue in the format
Thought → Analysis → Question → Answer → Conclusion → Decision, making the chain
followable; the Tool Integration Layer plans tools category-first with explicit parameters,
response processing, and error recovery (see the tool taxonomy in <tool_integration_layer>);
the Result Tracking System tracks every step's input, output, status, and validation,
carries intermediate results forward, and applies objective checks at each step.

This is a reasoning framework that enhances model capabilities, not a replacement for native reasoning.
</purpose>

<references>

| When | File |
|------|------|
| Step 2 — the mode choice needs the capability-scaled selection algorithm and the model categories | `references/model-capabilities.md` (§ mode_selection_algorithm) |
| Step 3 — the thinking-type choice is not obvious: intent keywords, scoring matrices, selection algorithm | `references/intent-context-matrix.md` (§ thinking_type_matrix) |
| Step 3 — the pattern choice needs detailed guidance and worked selection rules | `references/reasoning-patterns-analysis.md` (§ pattern_selection) |
| Step 3 — flow generation needs the framework's core principles and the four pillars | `references/reasoning-simulation.md` (§ framework_pillars) |
| Step 3 — a thinking-type framework template is loaded for the chosen type | `templates/thinking-types/` (analytical, creative, critical, systematic, ethical, strategic) |
| Step 4 — worked self-dialogue examples for debugging, design, and decision domains | `templates/system-flows/self-dialogue-template.md` |
| Step 6 — worked step examples for assembling flows in a new domain | `templates/system-flows/step-execution-template.md` |
| Step 6 — the universal adaptive reasoning flow with pattern configuration | `templates/adaptive-flows/unified-reasoning-flow.md` |
| Step 7 — the full tiered output contract: core and extended templates, per-tier requirements, MINIMAL budget, anti-patterns | `references/output-contract.md` (§ output_contract) |
| Step 8 — validate a produced flow, a flow directory, or the example suite | `scripts/validate-system-flow.sh` |
| Step 8 — engineering example flows (incident, architecture, code review) to run the validator against | `assets/system-examples.json` |
</references>

<workflow>
0. Input Analysis — parse the request, extract the problem, determine reasoning needs ✓ <step_gates> r0 → <activation_rules>, <input_output_system>
1. Problem Decomposition — break the complex problem into logical, executable components ✓ <step_gates> r1 → <step_structure_system>
2. Mode Selection — pick MINIMAL/BASIC/STANDARD/ENHANCED per the mode rules in <reasoning_modes> ✓ <step_gates> r2 → <reasoning_modes>
3. Step Generation — create the structured reasoning flow with dependencies, thinking type, and pattern ✓ <step_gates> r3 → <thinking_type_system>, <reasoning_pattern_system>
4. Self-Dialogue Integration — add transparent reasoning context to each step (mode-dependent) ✓ <step_gates> r4 → <self_dialogue_system>
5. Tool Call Planning — identify data needs and plan tool operations, category-first (STANDARD/ENHANCED only) ✓ <step_gates> r5 → <tool_integration_layer>
6. Flow Assembly — combine the steps into a complete executable reasoning chain ✓ <step_gates> r6 → <step_structure_system>
7. Output Formatting — structure results at the tier the mode requires ✓ <step_gates> r7 → <input_output_system>
8. Quality Validation — verify completeness, consistency, and actionability ✓ <step_gates> r8 → <quality_gate>
9. Report — hand back the flow with findings, recommendations, and closing notes ✓ <step_gates> r9 → <reporting_requirements>
</workflow>

<instructions>

  <step_gate_protocol>
  Cross-cutting. This governs every Gate cell in the router, at every step.

  | Rule | Detail |
  |------|--------|
  | Evidence, not assertion | A gate is discharged by output you paste, an artifact you name, or a judgment you state in the report. "Verified" on its own discharges nothing |
  | Unrunnable is UNVERIFIED | A check that cannot run here is labelled `UNVERIFIED` with the reason and the command that would settle it. It is never recorded as passed |
  | No silent advance | Failing a step gate stops the step. Fix, or record the failure and say what it invalidates downstream — never proceed quietly |
  | A gate never reads its own subject | A check whose expected value comes from the artifact it validates passes at every value of that artifact, including the broken one |
  </step_gate_protocol>

  <step_gates>
  One row per step. Do not leave a step until its row passes, under <step_gate_protocol>.
  Every row carries a fallback: a failed check degrades gracefully, it never ends the work silently.

  | After step | Check | Evidence | Fails if | Fallback |
  |------------|-------|----------|----------|----------|
  | 0 | Request is non-trivial, multi-step, and not excluded by the NOT-conditions | the parsed problem statement with the activation verdict | the request is trivial, single-answer, or excluded | do not activate; answer directly or route to the domain skill |
  | 1 | Decomposition matches the complexity tier | the step list with its complexity label | step count outside the tier guideline | re-decompose per the complexity table in <step_structure_system> |
  | 2 | Mode matches complexity, tool availability, and model capability | the mode decision naming the selection rule that fired | the algorithm was applied out of order or the mode mismatches | re-run the mode selection algorithm in <reasoning_modes> |
  | 3 | Flow carries tier-required step fields, a chosen thinking type, and a chosen pattern | the generated step list | a required field, type, or pattern is missing | regenerate per <step_structure_system>, <thinking_type_system>, <reasoning_pattern_system> |
  | 4 | Self-dialogue is relevant and logical (STANDARD/BASIC only) | the dialogue exchanges per step | restatement instead of insight | rewrite per the quality criteria in <self_dialogue_system> |
  | 5 | Tools are planned by category only | the tool call list | a concrete invented tool name appears | rebind to category per <tool_integration_layer> |
  | 6 | The chain is complete: every step's dependencies resolve | the assembled flow | a dependency points at a step that does not exist | re-assemble; fill the gap or re-decompose |
  | 7 | Output has all tier-required sections; MINIMAL budget respected | the emitted flow document | sections missing or the structural budget exceeded | re-emit per the contract in `references/output-contract.md` |
  | 8 | `scripts/validate-system-flow.sh` returns 0 on the produced flow | pasted script output | return code 1 (validation errors) or 2 (usage error) | fix the flow per the script output and re-run |
  | 9 | The reply carries every required reporting section | the reply itself | a required section is missing | complete the missing section and re-check |
  </step_gates>

  <activation_rules>
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
  </activation_rules>

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

  **Output contract (compact):** the output contract is COST-TIERED. Every mode emits the
  CORE structure; extended sections are conditional on mode. Never pay full ceremony for a
  trivial question, and never skip the contract for a hard incident. The full contract —
  the CORE and EXTENDED templates, the per-tier section and step-field requirements, the
  MINIMAL hard boilerplate budget (at most 12 structural lines and 3 steps), and the
  anti-patterns — lives in the canonical reference below.

    <canonical_reference>
    READ the full tiered output contract from: `references/output-contract.md` (§ output_contract).
    </canonical_reference>
  </input_output_system>

  <quality_gate>
  Do not leave step 8 until every row passes, under <step_gate_protocol>. A row that cannot
  run is reported as UNVERIFIED, never as passed.

  | Check | Evidence that satisfies it | Fails if |
  |-------|----------------------------|----------|
  | Activation held for a non-trivial, non-excluded request | the parsed request against the NOT-conditions in <activation_rules> | the request was trivial or excluded |
  | Mode matches complexity, tool availability, and model capability | the mode decision naming the selection rule that fired | the algorithm was applied out of order or the mode mismatches |
  | Decomposition fits the tier | step count against the complexity guidelines in <step_structure_system> | the count is outside the tier guideline |
  | Every step carries its tier-required fields | the generated step list | a required field is missing |
  | Self-dialogue is relevant and logical (STANDARD/BASIC only) | the dialogue exchanges per step | restatement instead of insight |
  | Tools are planned by category only | the tool call list | a concrete invented tool name appears |
  | Output format satisfies the tier contract | `scripts/validate-system-flow.sh` output on the produced flow | required sections missing or the MINIMAL budget exceeded |
  | Quality metrics are computed for the tier | the metrics block of the flow | a required metric is absent |

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
  </quality_gate>

  <reporting_requirements>
  Hand back exactly these, in this order, where the reader will see them.

  | Section | Content | Omitted only when |
  |---------|---------|-------------------|
  | Reasoning Flow | the flow document, shaped by the mode's tier per the contract in `references/output-contract.md` | never |
  | Key Findings and Recommendations | findings with impact and confidence; recommendations with priority and impact | never |
  | Closing notes | one line each on compatibility (works with compatible LLMs, particularly those with tool-calling) and cost tiering (ceremony scales with problem complexity and model capability), plus whether `scripts/validate-system-flow.sh` was run and its result | the user asked for the flow only |
  </reporting_requirements>

</instructions>
