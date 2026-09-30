# Reasoning Patterns - cot-reasoning

## Overview

In cot-reasoning, **patterns are optional organizing principles**. The core mechanism is step-by-step execution with self-dialogue. Patterns provide useful structures for organizing reasoning steps in specific scenarios.

**Key Principle:** Patterns are SECONDARY. The step structure with self-dialogue is PRIMARY.

---

## Pattern Selection Guidelines

### When to Use Each Pattern

| Pattern | Best For | Mode | Tool Usage | Notes |
|---------|----------|------|------------|-------|
| **Zero-Shot CoT** | Simple problems, quick analysis | BASIC | Low | Default for straightforward tasks |
| **Few-Shot CoT** | Problems with examples, domain-specific | BASIC | Low-Medium | Use when examples help clarify |
| **Auto-CoT** | Novel problems without provided examples | BASIC/STANDARD | Medium | Model generates its own examples, then extracts the pattern |
| **Tree of Thoughts** | Complex decisions, multi-option evaluation | STANDARD | Medium-High | Explore multiple solution paths |
| **ReAct** | Tool-intensive tasks, debugging, analysis | STANDARD | Heavy | **Recommended for tool-capable models** |

### Pattern Selection Algorithm

```python
def select_pattern(complexity, tools_available):
    # For STANDARD mode (with tools)
    if tools_available:
        if complexity >= HIGH:
            return 'ReAct'  # Best for tool-capable models
        elif complexity == MEDIUM:
            return 'ReAct' or 'Tree of Thoughts' or 'Auto-CoT'
        else:
            return 'Zero-Shot CoT' or 'Few-Shot CoT'
    else:
        # For BASIC mode (no tools)
        if complexity >= HIGH:
            return 'Tree of Thoughts'
        elif complexity == MEDIUM:
            return 'Auto-CoT' or 'Few-Shot CoT'
        else:
            return 'Zero-Shot CoT'
```

---

## Pattern Recommendations

### For Tool-Capable Models
- **Default:** ReAct (most effective for tool-intensive tasks)
- **Complex decisions:** Tree of Thoughts
- **Novel problems without examples:** Auto-CoT
- **Example-based:** Few-Shot CoT
- **Simple problems:** Zero-Shot CoT

### Pattern Strengths
| Pattern | Suitability | Use Case |
|---------|-------------|----------|
| ReAct | ⭐⭐⭐⭐⭐ (Excellent) | Debugging, analysis, investigation |
| Tree of Thoughts | ⭐⭐⭐⭐ (Very Good) | Complex decisions, multi-option |
| Auto-CoT | ⭐⭐⭐⭐ (Very Good) | Novel problems, self-generated examples |
| Few-Shot CoT | ⭐⭐⭐⭐ (Very Good) | Example-based learning |
| Zero-Shot CoT | ⭐⭐⭐ (Good) | Simple problems |

---

## Best Practices

1. **Default to ReAct** for models with tool-calling capability
2. **Use Tree of Thoughts** for complex decisions with multiple options
3. **Use Auto-CoT** for novel problems where no examples are provided
4. **Use Few-Shot CoT** when examples would help understanding
5. **Use Zero-Shot CoT** for simple, direct problems
6. **Always use step structure** regardless of pattern
7. **Include self-dialogue** in every step for transparency (STANDARD/BASIC modes)

---

## Key Insight

In cot-reasoning, **the step-by-step execution framework is what truly enables effective reasoning**. Patterns simply provide organizing principles for specific use cases. The core power comes from:

1. Step-by-step execution
2. Self-dialogue for transparency
3. Tool integration for data operations
4. Fallback paths for robustness

Patterns are useful but not essential. Focus on the step structure first, then consider patterns as optional enhancements.

---

## Version Information

**Version:** 5.0.0
**Last Updated:** 2026-08-22
**Compatibility:** cot-reasoning v5.0.0+
