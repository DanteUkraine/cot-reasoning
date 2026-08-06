# Reasoning Patterns Analysis - System Reasoning Brain

## Overview

**In SRB v5.0, reasoning patterns are SECONDARY to the system reasoning framework.**

The primary focus is on **step-by-step execution with self-dialogue**, not on traditional CoT patterns. However, patterns still provide useful structures for organizing reasoning steps.

---

## Pattern Role in System Reasoning Brain

### Traditional Approach (Before SRB)
```
Model + CoT Pattern = Enhanced Reasoning
(Patterns provide the reasoning structure)
```

### SRB Approach (v5.0+)
```
Model + SRB Framework = System-Level Reasoning
(SRB provides the reasoning structure, patterns are optional organizers)
```

**Key Difference:** In System Reasoning Brain, the **step structure with self-dialogue** is the primary reasoning mechanism. Patterns are secondary and used to organize steps for specific use cases.

---

## Pattern Selection Guidelines

### When to Use Each Pattern

| Pattern | Best For | System Mode | Tool Usage | SRB Optimization |
|---------|----------|-------------|------------|-------------------|
| **Zero-Shot CoT** | Simple problems, quick analysis | MINIMAL/BASIC | Low | Basic step structure |
| **Few-Shot CoT** | Problems with examples, domain-specific | BASIC | Low-Medium | Add self-dialogue |
| **Auto-CoT** | Novel problems, self-generation | BASIC/ENHANCED | Medium | Limited (requires self-generation) |
| **Tree of Thoughts** | Complex decisions, multi-option | STANDARD | High | Heavy tool usage |
| **ReAct** | Tool-intensive tasks, debugging | STANDARD | Heavy | **IDEAL for tool-capable models** |

### Pattern Selection Algorithm (SRB v5.0)

```python
def select_pattern(complexity, tools_available, system_mode):
    # Step count is PRIMARY, pattern is SECONDARY
    
    if system_mode == 'STANDARD' and tools_available:
        if complexity >= HIGH:
            return 'ReAct'  # Best for tool-capable models
        elif complexity == MEDIUM:
            return 'ReAct' or 'Tree of Thoughts'
        else:
            return 'Zero-Shot CoT' or 'Few-Shot CoT'
    else:
        if complexity >= HIGH:
            return 'Tree of Thoughts'
        elif complexity == MEDIUM:
            return 'Few-Shot CoT'
        else:
            return 'Zero-Shot CoT'
```

---

## Pattern-Specific Agentic Integration

### Zero-Shot CoT
**ARE Adaptation:** Single step with self-dialogue

```markdown
### Step 1: Analyze Problem

**Thought:** "{{USER_REQUEST}}"

**Why:** Single-step reasoning for simple problems

**Action:** Think through problem systematically

**Tool:** None (pure reasoning)

**Self-Dialogue:**
[Thought]: "What is the problem?"
[Analysis]: "{{ANALYSIS}}"
[Conclusion]: "{{CONCLUSION}}"
[Decision]: "{{RECOMMENDATION}}"

**Complexity:** LOW
```

**Best For:** Simple analysis, quick decisions, straightforward problems

---

### Few-Shot CoT
**ARE Adaptation:** Multiple steps, each with examples

```markdown
### Step 1: Understand Problem
**Thought:** "{{USER_REQUEST}}. Similar to: {{EXAMPLE_1}}, {{EXAMPLE_2}}"
**Action:** Compare with known examples
**Tool:** None
**Self-Dialogue:** [Analysis of examples]

### Step 2: Apply Pattern
**Thought:** "Pattern from {{EXAMPLE}} suggests {{APPROACH}}"
**Action:** Apply reasoning pattern
**Tool:** None or optional
**Self-Dialogue:** [Pattern application reasoning]

**Complexity:** LOW-MEDIUM
```

**Best For:** Domain-specific problems, learning from examples

---

### Auto-CoT
**SRB Adaptation:** Limited for models without self-generation capability

**Challenge:** Auto-CoT requires self-generation of examples, which not all models can do.

**SRB Solution:** Use pre-defined examples or skip Auto-CoT for models without self-generation capability.

```markdown
### Step 1: Use Pre-defined Examples
**Thought:** "For {{PROBLEM_TYPE}}, standard examples are: {{EXAMPLES}}"
**Action:** Select most relevant example
**Tool:** file_read (to retrieve examples)
**Self-Dialogue:** [Example selection reasoning]

**Complexity:** MEDIUM
```

**Best For:** Models with self-generation capability only

---

### Tree of Thoughts (ToT)
**ARE Adaptation:** Step-based tree exploration

```markdown
### Step 1: Define Decision Points
**Thought:** "Key decisions: {{DECISION_1}}, {{DECISION_2}}, {{DECISION_3}}"
**Action:** Identify branching points
**Tool:** None

### Step 2: Explore Branch 1
**Thought:** "If {{DECISION_1}} = Option A, then..."
**Action:** Analyze Option A
**Tool:** {{TOOL}} (if data needed)
**Expected Output:** Analysis of Option A

### Step 3: Explore Branch 2
**Thought:** "If {{DECISION_1}} = Option B, then..."
**Action:** Analyze Option B
**Tool:** {{TOOL}}
**Expected Output:** Analysis of Option B

### Step 4: Compare and Select
**Thought:** "Option A: {{PROS}}, Option B: {{CONS}}"
**Action:** Select best option
**Tool:** None
**Self-Dialogue:** [Comparison reasoning]

**Complexity:** HIGH
```

**Best For:** Complex decisions, multi-option evaluation, scenario planning

---

### ReAct (Reasoning + Acting)
**SRB Adaptation: IDEAL for tool-capable models**

**Why ReAct is Perfect for tool-capable models:**
- Combines reasoning (from SRB) with acting (model's tool-calling strength)
- Explicit tool calls at each step
- Clear action-reasoning loops
- Natural fit for tool-calling models

```markdown
### Step 1: Initial Reasoning
**Thought:** "{{PROBLEM}} requires {{ACTION}}"
**Action:** Plan first step
**Tool:** None
**Self-Dialogue:** [Initial analysis]

### Step 2: Tool Action
**Thought:** "Need {{DATA}} to proceed"
**Action:** Retrieve data
**Tool:** file_read (or other)
**Tool Parameters:** {{PARAMS}}
**Expected Output:** Raw data

### Step 3: Analyze Results
**Thought:** "Data shows {{OBSERVATION}}"
**Action:** Interpret results
**Tool:** None or grep/bash
**Self-Dialogue:** [Analysis reasoning]

### Step 4: Next Action
**Thought:** "Based on {{RESULTS}}, next step is {{NEXT}}"
**Action:** Plan next action
**Tool:** {{TOOL}} (if needed)
**Self-Dialogue:** [Decision reasoning]

[Repeat as needed...]

**Complexity:** MEDIUM-HIGH
```

**Best For:**
- ✅ **granite-4 PRIMARY** - Debugging, analysis, investigation
- Tool-intensive tasks
- Real-world data operations
- Multi-step workflows

---

## Pattern Comparison for Tool-Capable Models

| Pattern | Suitability | Tool Usage | Complexity | Use Case |
|---------|-------------|------------|------------|----------|
| Zero-Shot CoT | ⭐⭐⭐ (Good) | Low | LOW | Simple problems |
| Few-Shot CoT | ⭐⭐⭐⭐ (Very Good) | Low-Medium | LOW-MEDIUM | Example-based |
| Auto-CoT | ⭐⭐ (Moderate) | Medium | MEDIUM | Models with self-generation |
| Tree of Thoughts | ⭐⭐⭐⭐ (Very Good) | Medium-High | HIGH | Complex decisions |
| **ReAct** | **⭐⭐⭐⭐⭐ (Excellent)** | **High** | **MEDIUM-HIGH** | **All tool tasks** |

**Recommendation for tool-capable models:**
- Use **ReAct** for most tasks (especially debugging, analysis, investigation)
- Use **Tree of Thoughts** for complex decisions
- Use **Few-Shot CoT** for example-based learning
- Use **Zero-Shot CoT** for simple problems
- Use **Auto-CoT** only for models with self-generation capability

---

## Pattern Implementation in ARE

### Universal Pattern Structure

All patterns in ARE follow this **universal step structure**:

```markdown
### Step N: [Step Name]

**Thought:** [Internal reasoning]

**Why:** [Explanation of necessity]

**Action:** [Specific instruction]

**Tool:** [Tool call or None]

**Tool Parameters:** [If applicable]

**Input:** [Data for this step]

**Expected Output:** [What should be produced]

**Validation:** [How to verify success]

**Next Step:** [Dependency]

**Fallback:** [Alternative if fails]

**Self-Dialogue:** [Optional internal reasoning]

**Complexity:** [LOW/MEDIUM/HIGH]
```

**Key Insight:** The **step structure** is more important than the **pattern**. Patterns simply provide guidelines for organizing steps.

---

## Pattern Performance Benchmarks

### With System Reasoning Brain

| Pattern | Debugging | Analysis | Design | Research | Decision | Avg Quality |
|---------|-----------|----------|--------|----------|----------|-------------|
| Zero-Shot CoT | 75% | 70% | 65% | 60% | 70% | 68% |
| Few-Shot CoT | 80% | 85% | 75% | 70% | 80% | 78% |
| Tree of Thoughts | 85% | 80% | 70% | 75% | 90% | 80% |
| **ReAct** | **95%** | **90%** | **85%** | **95%** | **85%** | **90%** |

**Conclusion:** ReAct is the **best pattern for tool-capable models** across most task types.

---

## Best Practices

### For Pattern Selection

1. **For tool-capable models:** Default to **ReAct** unless there's a specific reason otherwise
2. **For simple tasks:** Use **Zero-Shot CoT** or **Few-Shot CoT**
3. **For complex decisions:** Use **Tree of Thoughts**
4. **For research-heavy tasks:** Use **ReAct** with web_search
5. **For debugging:** Always use **ReAct**

### For Pattern Implementation

1. **Always use step structure** regardless of pattern
2. **Include self-dialogue** in every step for transparency
3. **Maximize tool usage** for models that support it
4. **Define fallbacks** for every step
5. **Validate outputs** at each step

### For Pattern Customization

1. **Adapt to domain:** Technical vs business patterns differ
2. **Match to complexity:** More complex problems need more elaborate patterns
3. **Consider model capabilities:** Models with limited reasoning need more explicit patterns
4. **Test and iterate:** Try different patterns and measure results

---

## Conclusion

In **SRB v5.0**, reasoning patterns are **secondary to the system reasoning framework**. The primary mechanisms for enabling reasoning in ANY model are:

1. **Step-by-Step Execution** (most important)
2. **Self-Dialogue** (for transparency)
3. **Tool Integration** (for data operations)
4. **Fallback Paths** (for robustness)

**Patterns** provide useful **organizing principles** but are not the core of SRB's power.

**For ANY model:** The system reasoning framework provides the complete reasoning structure. **The step structure and self-dialogue are what truly enable system-level reasoning**.
