---
name: cot-reasoning
description: "Structured chain-of-thought reasoning framework for complex, multi-step problems: decomposes the problem into auditable steps with self-dialogue, environment-neutral tool integration, and result tracking, then validates the output flow. Use for production incident investigation, root cause analysis, debugging that requires evidence before conclusions, architecture and design decisions, code review and risk assessment, and trade-off or option comparison. NOT for: greetings and small talk; simple factual or single-word questions; trivial tasks with a direct answer; formatting, rewriting, or translation; domain-fact lookup - route those to the relevant domain skill, only the reasoning procedure routes here. Activate only when the request genuinely needs multi-step analysis, not merely because it contains a word like analyze or fix."
metadata:
  author: DanteUkraine
  version: "6.0.0"
  category: reasoning
  complexity: universal
  maturity: production-ready
  tags: "reasoning cot-reasoning engineering complex-systems universal thinking-chain self-dialogue tool-integration"
  invocation: both
  auto-detection: "(root[- ]cause|production incident|post[- ]mortem|risk assessment|trade[- ]offs?|architecture (decision|review)|design (decision|options?)|decide between|compare [^.]*(options|alternatives|solutions)|investigate (why|and)|debug (why|this)|troubleshoot [^.]*(issue|failure|incident)|multi[- ]step)"
  allowed-tools: ["filesystem-read", "filesystem-write", "shell-execution", "web-search", "code-search"]
---

<purpose>
CoT-reasoning: a structured reasoning framework for complex, multi-step
problem-solving, built as a symbiosis between the model's native reasoning
channel and an explicit Finite State Machine (FSM) router.

CORE VALUE PROPOSITION:
- For models with tool-calling: the FSM's observe/act states drive effective data gathering;
- For models with native reasoning: the native reasoning channel does the live reasoning; the skill adds routing, structure, and validation;
- For all compatible models: enhanced multi-step performance through guided, auditable reasoning chains.

cot-reasoning = FSM Routing + Native Think + Tool Integration + Result Tracking
MODEL + cot-reasoning = Enhanced Reasoning Capability

Its four components: the FSM Router (see <workflow>) moves work through four
uncompressed states — observe, reason, act, verify — preserving the ReAct loop
explicitly; Native Cognition Delegation (see <cognitive_protocol>) runs all
live reasoning in the model's native reasoning channel — the skill defines
no custom thought tags; the Tool Integration Layer plans tools category-first
with explicit parameters, response processing, and error recovery (see
<tool_integration_layer>); the Result Tracking System tracks every step's
input, output, status, and validation, and blocks every terminal transition
behind the <verification_gate>.

The externalized reasoning disciplines (since v5.2.0) are procedural rules layered
over these four components — not a fifth component and not new ontology; see
<reasoning_disciplines> and `references/reasoning-disciplines.md`.

This is a reasoning framework that enhances model capabilities, not a replacement for native reasoning.
</purpose>

<references>

| When Condition Fires | File Path | Tag Anchor |
|----------------------|-----------|------------|
| The `reason` state needs the capability-scaled mode selection algorithm and the model categories | `references/model-capabilities.md` | mode_selection_algorithm |
| The thinking-type choice is not obvious: intent keywords, scoring matrices, selection algorithm | `references/intent-context-matrix.md` | thinking_type_matrix |
| The pattern choice needs detailed guidance and worked selection rules | `references/reasoning-patterns-analysis.md` | pattern_selection |
| Flow generation needs the framework's core principles and the four pillars | `references/reasoning-simulation.md` | framework_pillars |
| A discipline's full procedure or worked example is needed (formalization, verification loop, confidence gate, edge coverage) | `references/reasoning-disciplines.md` | discipline_procedures |
| A thinking-type framework template is loaded for the chosen type | `templates/thinking-types/` | analytical, creative, critical, systematic, ethical, strategic |
| The self-dialogue display scaffold, component definitions, or depth guidelines are needed (BASIC/STANDARD) | `templates/system-flows/self-dialogue-template.md` | Dialogue Structure |
| Worked step examples for assembling flows in a new domain, plus the Formalization Step, Verification Loop Step, and Edge-Case Derivation patterns | `templates/system-flows/step-execution-template.md` | Formalization Step |
| The universal adaptive reasoning flow with pattern configuration is needed | `templates/adaptive-flows/unified-reasoning-flow.md` | Formalized Contract |
| The `verify` state needs the full tiered output contract: core and extended templates, per-tier requirements, MINIMAL budget, anti-patterns | `references/output-contract.md` | output_contract |
| A produced flow, a flow directory, or the example suite must be validated | `scripts/validate-system-flow.sh` | — |
| Engineering example flows (incident, architecture, code review) to run the validator against | `assets/system-examples.json` | — |
</references>

<cognitive_protocol>
All live reasoning is delegated to the model's native reasoning channel —
whatever mechanism the host model exposes for private reasoning: a think-tag
channel (for example `<|think|>` or `<think>`), an extended-thinking mode, or
fully hidden chain-of-thought. This skill defines no custom thought tags and
emits no simulated thought framework; the native reasoning channel is the
single reasoning engine.

| Rule | Directive |
|------|-----------|
| Native reasoning channel | Every act of reasoning — analyzing evidence, comparing options, planning — runs in the model's native reasoning channel, never in custom tags or fabricated dialogue emitted to the transcript |
| FSM processing | Before every state transition: read the Current State's rows in <workflow>, evaluate their conditions against gathered evidence, and plan the next state transition plus its gate discharge inside the native reasoning channel — then move |
| No fabricated dialogue | For a model that reasons natively (ENHANCED mode), never fabricate a [Thought]/[Question]/[Answer] display; keep the structure, validation, and result tracking |
| Display scaffold (BASIC/STANDARD) | Weak-reasoner environments may render the self-dialogue display per `templates/system-flows/self-dialogue-template.md`; depth scales with complexity (LOW 2-3 exchanges up to VERY_HIGH 9+) |
| Audit artifact | The flow document's `**Thought:**` step field records a summary of the reasoning that produced the step — an audit artifact required by the output contract, not a substitute for the native reasoning channel |
</cognitive_protocol>

<workflow>
Strict FSM router. The ReAct loop is preserved explicitly as four distinct,
uncompressed states: `observe` (gather context) → `reason` (analyze without
mutating) → `act` (execute) → `verify` (validate on raw evidence) → `reason`
(loop on failure). States are never merged or skipped; every transition fires
the gate named in its row.

| Current State | Condition | Next State | Mandatory Action / Gate | Unfolds in |
|--------------|-----------|------------|-------------------------|------------|
| START | request is non-trivial, multi-step, and not excluded by the NOT-conditions | observe | Parse the request; classify the instruction type; state the activation verdict | <activation_rules>, <input_output_system> |
| START | request is trivial, single-answer, or excluded | DONE | Do not activate; answer directly or route to the domain skill | <activation_rules> |
| observe | context gathered via read tools; open-ended statement formalized into a closed contract (STANDARD/ENHANCED) | reason | Name every artifact gathered; formalize per the disciplines before any decomposition | <reasoning_disciplines>, <tool_integration_layer> |
| observe | required context is missing or unreadable | observe | Re-gather via tool categories; record the gap explicitly; never invent data | <tool_integration_layer> |
| reason | decomposition, mode, thinking type, and pattern chosen — no mutation performed | act | Emit the planned flow: steps, dependencies, tool categories, typed outputs | <reasoning_modes>, <thinking_type_system>, <reasoning_pattern_system>, <step_structure_system> |
| reason | planning reveals missing data | observe | Return to gathering; carry the named gap forward | <tool_integration_layer> |
| act | flow assembled and output emitted at the mode's tier | verify | Paste raw artifacts; discharge every <verification_gate> row — no row may be skipped | <verification_gate>, `references/output-contract.md` |
| verify | every <verification_gate> row passes on raw evidence | report | Assemble the reporting sections from the evidence already pasted | <reporting_requirements> |
| verify | any gate row fails or is UNVERIFIED | reason | Feed the RAW failure evidence into the next attempt; on repeated failure change strategy, not parameters | <verification_gate>, <reasoning_disciplines> |
| report | all reporting sections present | DONE | Hand back the flow, findings, recommendations, and closing notes | <reporting_requirements> |
</workflow>

<instructions>

  <step_gate_protocol>
  Cross-cutting. This governs every Gate cell in the FSM router and every row
  of the <verification_gate>, at every state.

  | Rule | Detail |
  |------|--------|
  | Evidence, not assertion | A gate is discharged by output you paste, an artifact you name, or a judgment you state in the report. "Verified" on its own discharges nothing |
  | Unrunnable is UNVERIFIED | A check that cannot run here is labelled `UNVERIFIED` with the reason and the command that would settle it. It is never recorded as passed |
  | No silent advance | Failing a gate stops the state. Fix, or record the failure and say what it invalidates downstream — never proceed quietly |
  | A gate never reads its own subject | A check whose expected value comes from the artifact it validates passes at every value of that artifact, including the broken one. The same holds for produced artifacts: expected values derive from the original contract (the formalized contract of the observe state), never from the artifact being validated |
  | Verify the computed result, not the written text | Validation criteria reference the observable result of executing the step — tool output, pasted artifact, measured value — never the step's own description of its output. Re-reading the produced text is not verification |
  | Ambiguous validation is failed validation | A check that could pass under more than one interpretation of success has checked nothing; it is recorded as failed, never as passed |
  </step_gate_protocol>

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

  **Discipline tiering (since v5.2.0):** the externalized reasoning disciplines in
  <reasoning_disciplines> are mode-conditional — Contract Formalization, Verification
  Loop, and Edge Coverage apply in STANDARD/ENHANCED; Typed Step Outputs and the
  Confidence Gate apply from BASIC up; none applies in MINIMAL.

  </reasoning_modes>

  <reasoning_disciplines>
  **Externalized reasoning disciplines.** These replace capabilities a weak reasoner
  lacks — ambiguity tolerance, self-correction, metacognition, completeness intuition —
  with external procedure. They are procedural discipline for existing steps, not new
  ontology: no new thinking types, patterns, or tool categories. None applies in MINIMAL.

  | Discipline | Replaces | MINIMAL | BASIC | STANDARD | ENHANCED |
  |------------|-----------|---------|-------|----------|----------|
  | Contract Formalization | ambiguity tolerance | — | — | yes | yes |
  | Typed Step Outputs | free-form drift control | — | yes | yes | yes |
  | Verification Loop | one-shot fallback | — | — | yes | yes |
  | Confidence Gate | metacognition | — | yes | yes | yes |
  | Edge Coverage | completeness intuition | — | — | yes | yes |

  One line each: Contract Formalization converts an open-ended statement into a
  closed contract before decomposition; Typed Step Outputs declares each step's
  Expected Output as a typed structure; Verification Loop iterates failed checks
  on RAW evidence under a declared budget; Confidence Gate makes the confidence
  value a gate, not a report; Edge Coverage derives validation cases by covering
  every state, transition, and guard. Full procedures, budgets, and worked
  examples: `references/reasoning-disciplines.md` (§ discipline_procedures).
  </reasoning_disciplines>

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

  **Thought:** [Summary of the reasoning that produced this step — audit artifact; the live reasoning ran in the model's native reasoning channel]
  **Why:** [Explanation of why this step is necessary]
  **Action:** [Specific, executable instruction for this step]
  **Tool:** [Tool category, or "None" if pure reasoning]
  **Tool Parameters:** [Exact parameters if a tool is used]
  **Input:** [Data/parameters coming into this step]
  **Expected Output:** [What this step should produce]
  **Output Schema:** [Optional, BASIC and up: the typed structure of the expected output — fields, enums, ranges]
  **Validation:** [Objective criteria to verify step success]
  **Dependencies:** [What this step needs from previous steps]
  **Next Step:** [What step comes after this one]
  **Fallback:** [Alternative approach if this step fails]
  **Max Iterations:** [Verification steps, STANDARD/ENHANCED: the verification loop budget — see <reasoning_disciplines>]
  **Exit Criteria:** [Verification steps: conditions that end the loop — all checks pass, or budget exhausted]
  **Escalation Policy:** [Verification steps: what changes on a repeated failure — strategy, not just parameters]
  **Complexity:** [LOW/MEDIUM/HIGH - step difficulty]
  ```

  **Design principles:** single responsibility per step; explicit dependencies;
  objective validation; graceful degradation (every step has a fallback); transparency
  (assumptions are stated); behavior-first validation (verify the semantic or behavioral
  state first, surface properties second).

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

  <input_output_system>
  **Input requirements:**
  - Minimum: 10+ characters, a clear problem or question
  - Optimal: [Context/Background] [Problem/Question] [Available Tools] [Constraints] [Goal]

  **Instruction-type taxonomy (observe state):** classify the request before reasoning begins.

  | Type | Signal | Handling |
  |------|--------|----------|
  | Direct | Explicit constraints, measurable goal, one allowed reading | Reason directly; do not inflate ceremony |
  | Task-specific | Narrow goal, may benefit from examples | Standard flow; Few-Shot/Auto-CoT when examples help |
  | Open-ended | Vague scope, unmeasurable success, terms left to interpretation | STANDARD/ENHANCED: triggers Contract Formalization (<reasoning_disciplines>) before decomposition; BASIC: ask the open questions |

  An open-ended request decomposed without formalization is an observe-state gate
  failure, not a style choice.

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

  <verification_gate>
  **Shift-Left QA for the `verify` state.** The only path from `act` to a terminal state
  runs through this gate: `verify` → `report` is blocked until every row below is
  discharged on RAW artifact evidence — pasted CLI exit codes, log outputs, test
  results — never paraphrase, never silent assumption. A row that cannot run here is
  recorded `UNVERIFIED` with the reason and the command that would settle it; it is
  never recorded as passed. Every row is judged under <step_gate_protocol>.

  | Gate | Check | Raw Evidence Required | Fails if |
  |------|-------|-----------------------|----------|
  | activation | request is non-trivial, multi-step, and not excluded | the parsed problem statement with the activation verdict | the request is trivial, single-answer, or excluded |
  | contract | open-ended statement formalized before decomposition (STANDARD/ENHANCED) | the formalized contract text next to the step list | an open-ended statement was decomposed directly |
  | decomposition | step count fits the complexity tier | the step list with its complexity label | the count is outside the tier guideline |
  | mode | mode matches complexity, tool availability, and model capability | the mode decision naming the selection rule that fired | the algorithm was applied out of order or the mode mismatches |
  | step fields | every step carries its tier-required fields | the generated step list | a required field is missing |
  | self-dialogue | dialogue is relevant and logical (BASIC/STANDARD only) | the dialogue exchanges per step | restatement instead of insight |
  | tools | tools are planned by category only | the tool call list | a concrete invented tool name appears |
  | dependencies | every step's dependencies resolve | the assembled flow | a dependency points at a step that does not exist |
  | output tier | output has all tier-required sections; MINIMAL budget respected | `scripts/validate-system-flow.sh` exit code 0 with the pasted script output | exit code 1 or 2, required sections missing, or the budget exceeded |
  | confidence | confidence meets the action threshold (default 7.0/10) | the Confidence Gate verdict in the metrics block | the verdict is absent, below threshold, or FAIL without a named action |
  | edge coverage | validation cases cover the state/transition graph when one exists (STANDARD/ENHANCED) | the derived case list mapped to states, transitions, and guards | a graph exists and the cases cover only the happy path |
  | reporting | the reply carries every required reporting section | the reply itself | a required section is missing |

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
  </verification_gate>

  <reporting_requirements>
  Hand back exactly these, in this order, where the reader will see them.

  | Section | Content | Omitted only when |
  |---------|---------|-------------------|
  | Reasoning Flow | the flow document, shaped by the mode's tier per the contract in `references/output-contract.md` | never |
  | Key Findings and Recommendations | findings with impact and confidence; recommendations with priority and impact | never |
  | Closing notes | one line each on compatibility (works with compatible LLMs, particularly those with tool-calling) and cost tiering (ceremony scales with problem complexity and model capability), plus whether `scripts/validate-system-flow.sh` was run and its result | the user asked for the flow only |
  </reporting_requirements>

</instructions>
