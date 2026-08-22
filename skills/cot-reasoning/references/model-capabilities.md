# cot-reasoning Capabilities Reference

## Overview

This document describes the cot-reasoning framework's approach to enhancing model reasoning capabilities.

cot-reasoning v5.0 provides a **structured reasoning framework** that works with compatible Large Language Models to improve their effectiveness on complex, multi-step tasks.

**Key Principle:** The skill provides a reasoning structure that guides the model's native capabilities; the model processes and enhances this structure using its own reasoning abilities.

---

## Compatibility

### Supported Model Categories

| Model Category | Reasoning Capability | Tool-Calling | Recommended Mode | Expected Performance |
|---------------|---------------------|--------------|------------------|-------------------|
| **LLMs with Tool-Calling** | Varies | Yes | STANDARD | **Optimal** |
| **LLMs without Tool-Calling** | Varies | No | BASIC | Works well |
| **Models with Strong Native Reasoning** | High | Varies | STANDARD | Enhanced structure |

### Mode Selection Algorithm

For models with tool-calling capability:
- IF tools exist and are relevant → **STANDARD**
- ELSE → **BASIC**

For models without tool-calling:
- → **BASIC** (self-dialogue only, no tool integration)

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

---

## Tool-Calling Capabilities

| Tool | Purpose | cot-reasoning Usage |
|------|---------|-------------------|
| file_read | Read file contents | Data collection, document analysis |
| file_write | Write file contents | Solution implementation, documentation |
| code_analyzer | Analyze code | Code review, debugging |
| web_search | Search web | Research, information gathering |
| grep | Search in files | Pattern identification, log analysis |
| bash | Execute commands | System operations, verification |

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
