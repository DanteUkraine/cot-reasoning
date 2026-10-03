# Chain-of-thought Reasoning

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

**The Universal Reasoning Framework for ANY Large Language Model**.

**Chain-of-thought Reasoning** is a **model-agnostic reasoning skill** that enables **ANY** Large Language Model to perform complex, multi-step reasoning by providing a complete thinking framework.

## ✨ Features

- **🧠 Universal Compatibility**: Works with ANY LLM framework (Mistral Vibe, Claude Code, OpenCode, etc.)
- **🎯 Model-Agnostic**: No model-specific adaptations required
- **🔧 System-Level Reasoning**: Enables complex engineering tasks for any model
- **📋 Structured Step Execution**: Every problem decomposed into executable steps
- **💬 Self-Dialogue**: Transparent, auditable reasoning process
- **🔌 Tool Integration**: Seamless integration with available tools
- **🎨 Multiple Thinking Types**: Analytical, Creative, Critical, Systematic, Ethical, Strategic
- **🌳 Reasoning Patterns**: Zero-Shot CoT, Few-Shot CoT, Auto-CoT, Tree of Thoughts, ReAct

## 📦 Installation

```bash
npx skills add DanteUkraine/cot-reasoning@cot-reasoning
```

## 🚀 Usage

### Automatic Activation

The skill activates based on its **description** when your request genuinely needs
multi-step structured reasoning:

```
User: "Our API is returning 500 errors, investigate and find the root cause"
→ cot-reasoning activates automatically (incident investigation signal)
→ Generates a structured reasoning flow at the right mode
→ Executes with category-first tool integration
→ Returns complete analysis with recommendations
```

Activation is gated: greetings, simple factual questions, single-word inputs, and
trivial tasks do **not** activate the skill, and domain-fact requests route to the
relevant domain skill instead.

### Explicit Activation

Installed skills have no CLI flags. To invoke the skill explicitly, name it in your
request — this phrasing is portable across agent environments (Mistral Vibe, Claude
Code, OpenCode, and others):

```
"Use cot-reasoning to investigate why our API is returning 500 errors"
"Apply the cot-reasoning framework to this architecture decision"
"Use cot-reasoning, BASIC mode, to review this diff for risks"
```

### Activation Contract

| Mechanism | How it works |
|-----------|--------------|
| Description-based activation | The skill's frontmatter description (with explicit NOT-conditions) routes multi-step reasoning requests to it automatically |
| Explicit invocation phrasing | Naming "cot-reasoning" in the request activates it directly, e.g. "Use cot-reasoning to ..." |
| Configuration through input | State the desired mode/pattern/thinking type in the request text, e.g. "Use STANDARD mode with the ReAct pattern to debug this issue" |

## 🎯 When to Use

### ✅ Use cot-reasoning for:

- Complex problem solving requiring multi-step analysis
- Technical debugging and troubleshooting
- System architecture and design
- Business strategy and planning
- Code review and quality assessment
- Research and information gathering
- Decision making with multiple options
- Root cause analysis
- Any task requiring structured thinking

### ❌ Don't Use for:

- Simple factual questions
- Trivial tasks with direct answers
- Greetings or small talk
- Single-word inputs
- Tasks shorter than 10 characters
- Domain-fact lookups (route to the relevant domain skill — only the reasoning procedure routes here)

## 🏗️ Architecture

### Core Components

1. **Reasoning Flow Generator**
   - Decomposes complex problems into logical steps
   - Each step has single responsibility and clear dependencies

2. **Self-Dialogue Engine**
   - Makes reasoning process transparent and followable
   - Format: Thought → Analysis → Question → Answer → Conclusion → Decision

3. **Tool Integration Layer**
   - Enables data operations for reasoning
   - Category-first, environment-neutral tool taxonomy (filesystem read/write, shell execution, web search, code search)
   - BASIC and MINIMAL modes are fully functional with no tools at all

4. **Result Tracking System**
   - Maintains audit trail of reasoning process
   - Tracks intermediate results and validation

### Reasoning Modes

| Mode | Self-Dialogue | Tools | Output Tier | Selection Rule |
|------|---------------|-------|-------------|----------------|
| **MINIMAL** | None | None | Core only, hard boilerplate budget | Trivial problems answerable in 2-3 simple steps |
| **BASIC** | Required | None | Core + Problem Analysis + Quality Metrics | No tools available in the environment |
| **STANDARD** | Required | As needed | Full contract | Default for most problems |
| **ENHANCED** | Reduced or omitted | As needed | Full contract, no fabricated dialogue display | Models with strong native reasoning |

Mode selection scales ceremony to model capability: strong reasoners reduce
self-dialogue via ENHANCED; weak reasoners get the full structure via STANDARD.

### Thinking Types

| Type | Best For | Strengths |
|------|----------|-----------|
| **ANALYTICAL** | Structured problems, data analysis | Precision, thoroughness |
| **CREATIVE** | Innovation, design, brainstorming | Idea generation, exploration |
| **CRITICAL** | Validation, risk assessment, QA | Flaw detection, quality |
| **SYSTEMATIC** | Process optimization, troubleshooting | Reliability, repeatability |
| **ETHICAL** | Policy, compliance, social impact | Moral consideration |
| **STRATEGIC** | Long-term planning, business strategy | Competitive awareness |

### Reasoning Patterns

| Pattern | Best For | Tool Usage |
|---------|----------|------------|
| **Zero-Shot CoT** | Simple problems | Low |
| **Few-Shot CoT** | Example-based problems | Low-Medium |
| **Auto-CoT** | Novel problems | Medium |
| **Tree of Thoughts** | Complex decisions | Medium-High |
| **ReAct** | Tool-intensive tasks | High |

## ✅ Validation

Every reasoning flow can be checked against the skill's output contract with the
bundled validator (tier-aware: it checks the sections the flow's mode requires):

```bash
cd $(npx skills path cot-reasoning)

# Validate a single markdown flow
./scripts/validate-system-flow.sh -s flow_output.md

# Validate the engineering example suite
./scripts/validate-system-flow.sh -j assets/system-examples.json

# Validate all flows in a directory
./scripts/validate-system-flow.sh -d ./flows/
```

## 📜 Version

**v5.2.0** — the version is stated consistently in the skill frontmatter, the
validator, the templates, and the output contract.

## 📜 License

This project is licensed under the **Apache License 2.0** - see [LICENSE](LICENSE) for details.

*Made with ❤️ for the AI reasoning community*
