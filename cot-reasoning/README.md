# cot-reasoning

A structured reasoning framework that provides step-by-step thinking chains for complex problem-solving. This skill enhances model capabilities by providing a clear, auditable reasoning structure.

## Installation

```bash
npx skills add cot-reasoning
```

## Overview

cot-reasoning provides a **structured reasoning framework** that guides models through complex, multi-step tasks. It generates step-by-step reasoning chains with:

- **Self-Dialogue**: Transparent internal monologue for followable reasoning
- **Tool Integration**: Automatic tool detection and parameter generation
- **Result Tracking**: Complete audit trail of the reasoning process
- **Fallback Paths**: Graceful degradation when tools fail

## Features

### Reasoning Modes
- **STANDARD**: Complete reasoning with self-dialogue and tool calls (default)
- **BASIC**: Self-dialogue without tools (for models without tool-calling)

### Thinking Types
- **ANALYTICAL**: Structured problems, data analysis, technical evaluation
- **CREATIVE**: Innovation, design, brainstorming, novel solutions
- **CRITICAL**: Validation, argument analysis, risk assessment, QA
- **SYSTEMATIC**: Process optimization, troubleshooting, system design

### Reasoning Patterns
- **ReAct**: Tool-intensive tasks, debugging, analysis (recommended for tool-capable models)
- **Tree of Thoughts**: Complex decisions, multi-option evaluation
- **Few-Shot CoT**: Problems with examples, domain-specific
- **Zero-Shot CoT**: Simple problems, quick analysis

## Usage

The skill **automatically activates** when it detects complex reasoning needs in your input. It works best with:

- Complex problem-solving requests
- Debugging and troubleshooting tasks
- Multi-step analysis and investigation
- Design and architecture tasks
- Decision-making with multiple options

### Example Inputs
```
"Debug why our API is returning 500 errors"
"Design a scalable authentication system"
"Analyze this code for security vulnerabilities"
"Compare these three solutions and recommend the best"
```

## Output Structure

Every reasoning flow produces a structured output with:

```
## Reasoning Flow: [Problem Summary]

**Flow ID:** [unique_id]
**Timestamp:** [ISO_8601]
**Reasoning Mode:** [STANDARD|BASIC]
**Thinking Type:** [ANALYTICAL|CREATIVE|CRITICAL|SYSTEMATIC]
**Complexity:** [LOW|MEDIUM|HIGH|VERY_HIGH]

### Configuration
- Pattern: [Zero-Shot|Few-Shot|Tree-of-Thoughts|ReAct]
- Domain: [technical|business|creative|etc.]

### Problem Analysis
[Structured problem breakdown]

### Reasoning Steps
[Step-by-step execution with thought, action, tools, validation]

### Key Findings
[Main insights and discoveries]

### Recommendations
[Actionable solutions with priorities]

### Execution Summary
[Step completion, tools used, metrics]

### Quality Metrics
[Confidence level, reasoning quality, tool utilization]
```

## Requirements

### Compatible Models
cot-reasoning works best with models that have:
- **Tool-calling capability** (for STANDARD mode)
- **Reasoning abilities** (for better results)
- **Context window** of at least 8K tokens (recommended)

### Supported Frameworks
- Mistral Vibe
- CrewAI
- AutoGen
- LangChain
- LlamaIndex

## Configuration

You can influence the skill's behavior through your input:

```
# Explicit configuration
"Use STANDARD mode with ReAct pattern to debug this issue"

# Provide context
"Context: We're using Node.js v18. Problem: API returns 500 errors."

# Specify constraints
"Constraints: Cannot restart service during peak hours"
```

## Validation

The skill includes a validation script to check reasoning flows:

```bash
# Validate a single flow
./scripts/validate-system-flow.sh -s flow_output.md

# Validate all flows in a directory
./scripts/validate-system-flow.sh -d ./flows/

# Show help
./scripts/validate-system-flow.sh --help
```

## Examples

See `assets/system-examples.json` for real-world usage examples.

## Documentation

- **SKILL.md**: Complete skill definition and architecture
- **references/**: Detailed documentation on capabilities, patterns, and simulation
- **templates/**: Reusable templates for reasoning flows

## Version

**v5.0.0** - Last updated: 2026-08-22

## License

This skill is provided as-is for use with compatible agent frameworks.
