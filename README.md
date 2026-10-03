# Chain-of-thought Reasoning

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

[English](README.md) | [Українська](README.uk.md)

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
- **🧭 Externalized Reasoning Disciplines**: Contract Formalization, Typed Step Outputs, Verification Loops, Confidence Gates, Edge Coverage

## 📦 Installation

```bash
npx skills add DanteUkraine/cot-reasoning@cot-reasoning
```

The command is interactive (it asks which agents to install to). For scripts
and CI, use the non-interactive form:

```bash
npx skills add DanteUkraine/cot-reasoning@cot-reasoning --agent '*' -y
```

`jq` is not required for installation — only for the validation tooling below.

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

### Command Examples: Modes and Patterns

The commands below use the Vibe slash form. In any other environment, replace
`/cot-reasoning` with "Use cot-reasoning to ..." — the rest of the line is
identical. Stating a mode or pattern in the request pins it; omitting it lets
the skill select automatically.

#### Reasoning modes

| Mode | Example command | Designed for |
|------|-----------------|--------------|
| **MINIMAL** | `/cot-reasoning decide: tabs or spaces for a small hand-edited internal config` | Trivial problems answerable in 2-3 simple steps — the skill must not inflate ceremony |
| **BASIC** | `/cot-reasoning review this change for risks, BASIC mode: replacing the in-memory session store with Redis, single node, no fallback yet` | Environments with no tools: the full reasoning scaffold with pure analysis |
| **STANDARD** | `/cot-reasoning investigate why our API returns 500 errors for 5% of requests since yesterday's deploy` | The default for most problems: evidence gathering, tool use, full contract |
| **ENHANCED** | `/cot-reasoning decide between PostgreSQL, MongoDB, and a time-series database for 50M metrics points per day, ENHANCED mode` | Models with strong native reasoning: structure and validation without the simulated dialogue display |

#### Reasoning patterns

| Pattern | Example command | Designed for |
|---------|-----------------|--------------|
| **Zero-Shot CoT** | `/cot-reasoning analyze why our queue depth spikes every Monday morning, Zero-Shot CoT` | Simple problems needing direct step-by-step reasoning — no examples, no tools |
| **Few-Shot CoT** | `/cot-reasoning triage these three new incidents following the two example post-mortems below, Few-Shot CoT` | Problems where provided examples clarify the expected reasoning shape |
| **Auto-CoT** | `/cot-reasoning design an on-call rotation policy for a four-person team, Auto-CoT` | Novel problems with no provided examples — the skill generates its own first |
| **Tree of Thoughts** | `/cot-reasoning compare self-hosted email, SendGrid, and AWS SES for 200k emails per month, Tree of Thoughts` | Multi-option decisions: branches scored independently, leading branch stress-tested |
| **ReAct** | `/cot-reasoning debug why checkout takes 8 seconds on every tenth request, ReAct` | Tool-intensive investigation: action-observation loops, evidence before conclusions |

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
   - Step outputs are typed structures (v5.2.0), not free-form prose

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

### Reasoning Disciplines (v5.2.0)

Five externalized disciplines replace capabilities a weak reasoner lacks — ambiguity
tolerance, self-correction, metacognition, completeness intuition — with external
procedure. They are procedural discipline for existing steps, not new ontology, and
they are mode-conditional: none applies in MINIMAL.

| Discipline | Replaces | MINIMAL | BASIC | STANDARD | ENHANCED |
|------------|-----------|---------|-------|----------|----------|
| **Contract Formalization** | ambiguity tolerance | — | — | yes | yes |
| **Typed Step Outputs** | free-form drift control | — | yes | yes | yes |
| **Verification Loop** | one-shot fallback | — | — | yes | yes |
| **Confidence Gate** | metacognition | — | yes | yes | yes |
| **Edge Coverage** | completeness intuition | — | — | yes | yes |

- **Contract Formalization** — an open-ended problem statement is converted into a
  closed contract (entities, constraints, measurable success criteria) before
  decomposition begins.
- **Typed Step Outputs** — a step's expected output is a typed structure, not prose;
  a structure violation is fed back and the output is regenerated.
- **Verification Loop** — a failed verification iterates on captured raw evidence
  with a declared budget (`Max Iterations`, `Exit Criteria`, `Escalation Policy`);
  a repeated failure changes the strategy, not just the parameters.
- **Confidence Gate** — the confidence metric is a gate (default threshold 7.0/10),
  not a report; below it, the flow iterates, escalates, or asks. No silent pass.
- **Edge Coverage** — when the problem has states and transitions, validation cases
  are derived by covering the graph, not by intuition.

## ✅ Validation

**Prerequisite:** [`jq`](https://jqlang.github.io/jq/) must be installed for JSON
validation (the validator prints the install command if it is missing).

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

### Regression suite

The validator itself is protected by 22 regression cases (17 fixtures with an
expectations manifest plus 5 built-in CLI cases), covering 99% of its check
templates:

```bash
./scripts/run-test-flows.sh
```

### Consistency lint

Version alignment, frontmatter validity, cross-references, and a universality
guard that rejects domain-specific terms in skill content:

```bash
./scripts/lint-consistency.sh
```

### Behavioral eval

The mechanical layers prove the contract checker works; the behavioral eval
proves the product claim — that a model executing the skill emits conformant
flows with the right reasoning profile. Ten reference prompts, a scorer, and a
results matrix:

```bash
./scripts/run-behavioral-eval.sh <flows_dir> "<model label>"
```

See `assets/behavioral-eval/README.md` for the protocol and the measured
results to date. Current data point: Mistral Vibe agent (Mistral Large) —
validator 10/10, profile 10/10.

### CI

All three verification layers (example validation, regression suite, lint) run
in GitHub Actions on every push and pull request — see
`.github/workflows/ci.yml`.

## 📜 Version

**v5.2.0** — the version is stated consistently in the skill frontmatter, the
validator, the templates, the references, and the output contract, and is
enforced by the consistency lint. See [CHANGELOG.md](CHANGELOG.md) for the
release history.

## 📜 License

This project is licensed under the **Apache License 2.0** - see [LICENSE](LICENSE) for details.

*Made with ❤️ for the AI reasoning community*
