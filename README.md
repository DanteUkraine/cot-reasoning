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

The skill **auto-detects** when complex reasoning is needed and activates automatically:

```
User: "Our API is returning 500 errors, investigate and fix"
→ System Reasoning Brain activates automatically
→ Generates structured reasoning flow
→ Executes with tool integration
→ Returns complete analysis with recommendations
```

### Manual Activation

```bash
# Using the skill command
/cot-reasoning "Analyze this complex system architecture"

# With specific mode
/cot-reasoning --mode=STANDARD "Debug the memory leak"

# With specific pattern
/cot-reasoning --pattern=ReAct "Investigate the database timeout issue"

# With verbose output
/cot-reasoning --verbose "Design a scalable microservice architecture"
```

### Invocation Commands

| Command | Description |
|---------|-------------|
| `/cot-reasoning [query]` | Standard invocation |
| `/cot-reasoning --mode=STANDARD/BASIC/ENHANCED/MINIMAL [query]` | Force specific mode |
| `/cot-reasoning --pattern=[pattern] [query]` | Force specific CoT pattern |
| `/cot-reasoning --thinking-type=[type] [query]` | Force thinking type |

## 🎯 When to Use

### ✅ Use System Reasoning Brain for:

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
   - Automatic tool detection and parameter generation

4. **Result Tracking System**
   - Maintains audit trail of reasoning process
   - Tracks intermediate results and validation

### Reasoning Modes

| Mode | Self-Dialogue | Tool Usage | Best For |
|------|---------------|------------|----------|
| **STANDARD** | Required | As needed | Most problems (recommended) |
| **BASIC** | Required | None | No tools available |
| **ENHANCED** | Optional | Moderate | Advanced reasoning models |
| **MINIMAL** | None | Minimal | Very simple problems |

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

## 📜 License

This project is licensed under the **Apache License 2.0** - see [LICENSE](LICENSE) for details.

*Made with ❤️ for the AI reasoning community*
