# cot-reasoning Capabilities Reference

Tier 3 reference of cot-reasoning — loaded by step 2 (Mode Selection) of SKILL.md when
the mode choice needs the capability-scaled selection algorithm.

## Overview

This document describes the cot-reasoning framework's approach to enhancing model reasoning capabilities.

cot-reasoning v5.2.0 provides a **structured reasoning framework** that works with compatible Large Language Models to improve their effectiveness on complex, multi-step tasks.

**Key Principle:** The skill provides a reasoning structure that guides the model's native capabilities; the model processes and enhances this structure using its own reasoning abilities.

---

## Compatibility

### Supported Model Categories

| Model Category | Reasoning Capability | Tool-Calling | Recommended Mode | Expected Performance |
|---------------|---------------------|--------------|------------------|-------------------|
| **LLMs with Tool-Calling** | Varies | Yes | STANDARD | **Optimal** |
| **LLMs without Tool-Calling** | Varies | No | BASIC | Works well |
| **Models with Strong Native Reasoning** | High | Varies | ENHANCED | Structure without dialogue overhead |
| **Models with Limited Native Reasoning** | Low | Varies | STANDARD | Full scaffold carries the reasoning |

### Mode Selection Algorithm (capability-scaled)

<mode_selection_algorithm>

Ceremony scales to model capability:
- IF the problem is trivial (2-3 obvious steps, no evidence gathering) → **MINIMAL**
- ELSE IF no tools exist in the environment → **BASIC** (fully functional without tools)
- ELSE IF the model reasons natively and strongly → **ENHANCED** (structure and validation
  retained; the fabricated self-dialogue display is omitted — see the anti-patterns in
  `references/output-contract.md`)
- ELSE → **STANDARD** (full structure; the self-dialogue scaffold carries the reasoning)

**Why capability scaling matters:** for a strong native reasoner, a simulated
[Thought]/[Question]/[Answer] display adds tokens and can misrepresent the actual
computation. For a weak reasoner, that same scaffold is load-bearing. The mode choice
moves the ceremony to where it pays for itself.

</mode_selection_algorithm>

---

## cot-reasoning Profile

### Capabilities Provided
- **Reasoning Structure:** Step-by-step framework for complex problem-solving
- **Tool-Calling Optimization:** Excellent tool integration and parameter generation
- **Instruction Guidance:** Clear, structured guidance that models can follow
- **Context Utilization:** Effective use of available context window
- **Process Efficiency:** Streamlined step-by-step execution

### Recommended Configuration for cot-reasoning
```yaml
mode: STANDARD
self_dialogue_depth: MEDIUM (4-5 exchanges)
tool_usage: AS_NEEDED
step_granularity: MODERATE (5-7 steps)
validation: STRICT
fallback: GRACEFUL
```

### How cot-reasoning Enhances Model Capabilities

| Model Limitation | cot-reasoning Enhancement |
|----------------|---------------------------|
| Limited reasoning chain length | Step-by-step structure maintains reasoning across context |
| Weak hypothesis generation | Explicit hypothesis generation prompts in analysis steps |
| Poor multi-step planning | Pre-defined step sequences for common patterns |
| Limited context understanding | Explicit context analysis in early steps |
| Poor tool integration | Structured tool calls with complete parameters |

### Operating Rules for Models with Limited Native Reasoning

Two rules make explicit what the framework already assumes for weak reasoners:

1. **Instantiate the closed vocabulary — do not improvise.** A weak reasoner selects
   from the framework's closed vocabulary (step types, thinking types, patterns,
   templates) rather than inventing novel reasoning structures. Improvising
   low-level moves is to reasoning what chaining dozens of utility classes is to
   styling: it multiplies the search space and mutates on every retry. The semantic
   vocabulary (Step Types, Thinking Types, Patterns) keeps the structure stable
   across attempts.

2. **Plan the whole sequence, then execute (plan-then-execute).** The workflow already
   plans tool calls (step 5) before assembling the chain (step 6). For a weak reasoner
   this ordering is load-bearing: planning the full sequence up front avoids
   interleaved plan/execute context thrash, keeps the reasoning chain short, and makes
   dependencies explicit before any step runs. Interleaved reasoning-and-acting pays
   off for strong models; for weak ones, the upfront plan is the scaffold.

---

## Tool-Calling Capabilities

Tools are planned by **category**, then bound to whatever the host environment exposes
(see the tool taxonomy in SKILL.md). BASIC and MINIMAL modes are fully functional with
no tools at all.

| Category | Purpose | cot-reasoning Usage |
|----------|---------|-------------------|
| filesystem-read | Read files, logs, configs | Data collection, document analysis |
| filesystem-write | Write or edit files | Solution implementation, documentation |
| shell-execution | Run commands, verify state | System operations, verification |
| web-search | Search the web | Research, information gathering |
| code-search | Find patterns in code and logs | Code review, debugging, log analysis |

---

## Performance Expectations

### Expected Performance Improvements

For **compatible models** (those with tool-calling and reasoning capabilities):

- **Debugging tasks:** Significant improvement through structured investigation
- **Analysis tasks:** Better organization and completeness of findings
- **Design tasks:** More thorough consideration of options and constraints
- **Research tasks:** More effective data gathering and synthesis
- **Decision-making:** More systematic evaluation of alternatives
- **Code Review:** More comprehensive and consistent reviews

**Note:** Actual performance depends on:
- Model capabilities (context window size, reasoning ability)
- Task complexity
- Available tools
- Quality of input

---

## Key Insight

With cot-reasoning, **compatible models can perform complex reasoning tasks more effectively** by leveraging a structured framework that guides their native capabilities.

**For compatible models:** cot-reasoning provides an enhancing reasoning structure that, combined with the model's native abilities, enables more effective complex task performance.

**Core Principle:** The skill PROVIDES a reasoning framework. The model PROCESSES this framework using its native capabilities. Together, they achieve enhanced reasoning performance.
