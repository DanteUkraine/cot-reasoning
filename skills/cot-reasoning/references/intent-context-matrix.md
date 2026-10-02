# Intent-Context-Thinking Type Matrix

Tier 3 reference of cot-reasoning — loaded by step 3 (Step Generation) of SKILL.md when
the thinking-type choice is not obvious.

## Overview

This document provides the mapping between user intents, problem contexts, and optimal thinking types for cot-reasoning v5.0.0.

---

## Primary Intent Categories

### Intent Classification System

| Intent ID | Intent Name | Keywords | Description | Priority | Complexity Multiplier |
|-----------|-------------|----------|-------------|----------|-------------------|
| ANALYZE | Analysis | analyze, evaluate, assess, review, examine, audit, inspect, diagnose | Systematic breakdown and evaluation | High | 1.0 |
| DESIGN | Design | design, architect, create, build, develop, invent, draft, outline | Creative or technical design work | High | 1.2 |
| SOLVE | Problem Solving | solve, fix, debug, troubleshoot, resolve, repair, optimize | Active problem resolution | Critical | 1.5 |
| VALIDATE | Validation | validate, verify, test, confirm, check, ensure, authenticate | Quality assurance and verification | High | 0.8 |
| DECIDE | Decision Making | compare, select, choose, decide, prioritize, rank, approve | Multi-option evaluation and selection | Critical | 1.3 |
| EXPLAIN | Explanation | explain, describe, understand, clarify, elaborate, define | Knowledge transfer and understanding | Medium | 0.7 |
| PREDICT | Prediction | predict, forecast, estimate, project, anticipate, model | Future state projection | Medium | 1.1 |
| RESEARCH | Research | research, investigate, explore, study, gather, find | Information discovery | Medium | 1.0 |

### Intent Detection Algorithm

```python
def detect_intent(user_input):
    # Extract keywords from user input
    keywords = extract_keywords(user_input)
    
    # Score each intent category
    intent_scores = {}
    for intent, data in INTENT_MATRIX.items():
        score = 0
        for keyword in data['keywords']:
            if keyword in keywords:
                score += 1
        intent_scores[intent] = score * data['priority']
    
    # Select highest scoring intent
    primary_intent = max(intent_scores, key=intent_scores.get)
    
    # Handle ties
    if len([k for k, v in intent_scores.items() if v == intent_scores[primary_intent]]) > 1:
        # Use secondary factors
        if 'design' in user_input.lower() or 'create' in user_input.lower():
            return 'DESIGN'
        elif 'solve' in user_input.lower() or 'fix' in user_input.lower():
            return 'SOLVE'
        else:
            return 'ANALYZE'  # Default
    
    return primary_intent
```

---

## Problem Context Domains

### Domain Classification

| Domain ID | Domain Name | Keywords | Typical Problems | Complexity Range |
|-----------|-------------|----------|------------------|------------------|
| TECHNICAL | Technical/Engineering | code, algorithm, programming, database, API, server, latency, bug, error, debug, optimize, architecture, infrastructure, cloud, devops, deployment | System design, debugging, optimization, implementation | Medium-High |
| BUSINESS | Business/Strategy | business, ROI, investment, strategy, market, customer, product, revenue, profit, competition, launch, growth, acquisition, merger, budget, forecast, KPI | Market analysis, strategy development, financial modeling | Medium-High |
| CREATIVE | Creative/Innovation | creative, innovate, brainstorm, ideas, design, novel, new, original, unique, art, music, writing, story, concept, invention, prototype | Product design, idea generation, innovation, content creation | Medium |
| SYSTEMIC | System/Process | system, process, workflow, procedure, method, optimize, efficiency, bottleneck, throughput, automation, pipeline | Process optimization, workflow design, system troubleshooting | Medium-High |
| SCIENTIFIC | Scientific/Research | research, hypothesis, experiment, data, analysis, theory, model, physics, chemistry, biology, mathematics, statistics, study | Experimental design, data analysis, theoretical modeling | High |

### Domain Detection Rules

```python
def detect_domain(user_input, intent):
    # Domain-specific keyword matching
    domain_keywords = {
        'TECHNICAL': ['code', 'algorithm', 'programming', 'database', 'api', 'server', 
                     'latency', 'bug', 'error', 'debug', 'optimize', 'architecture'],
        'BUSINESS': ['business', 'roi', 'investment', 'strategy', 'market', 'customer',
                    'product', 'revenue', 'profit', 'competition', 'launch'],
        'CREATIVE': ['creative', 'innovate', 'brainstorm', 'ideas', 'design', 'novel',
                    'new', 'original', 'unique', 'concept', 'invention'],
        'SYSTEMIC': ['system', 'process', 'workflow', 'procedure', 'method', 'optimize',
                    'efficiency', 'bottleneck', 'throughput', 'automation'],
        'SCIENTIFIC': ['research', 'hypothesis', 'experiment', 'data', 'analysis', 'theory',
                     'model', 'physics', 'chemistry', 'mathematics', 'statistics']
    }
    
    # Count matches for each domain
    domain_scores = {}
    for domain, keywords in domain_keywords.items():
        score = sum(1 for kw in keywords if kw in user_input.lower())
        domain_scores[domain] = score
    
    # Select primary domain
    primary_domain = max(domain_scores, key=domain_scores.get)
    
    return primary_domain
```

---

## Thinking Type System

<thinking_type_matrix>

### Core Thinking Type Definitions

| Thinking Type | Primary Purpose | Best For | Strengths | Limitations |
|---------------|----------------|----------|-----------|-------------|
| **ANALYTICAL** | Systematic breakdown and evaluation | Business analysis, technical problems, strategic planning | Precision, thoroughness, objectivity | May lack creativity for novel problems |
| **CREATIVE** | Innovative solution generation | Product development, brainstorming, reframing problems | Generates innovative ideas, explores multiple possibilities | May produce impractical solutions |
| **CRITICAL** | Objective evaluation with skepticism | Decision validation, argument analysis, QA, risk assessment, ethical considerations | Identifies weak points, prevents errors, ensures quality | May be overly negative or cautious |
| **SYSTEMATIC** | Methodical step-by-step approach | Process improvement, troubleshooting, system design, strategic planning | Reliable, repeatable, thorough | May miss innovative shortcuts |
| **ETHICAL** | Structured moral evaluation | Policy review, compliance, social impact, harm/benefit analysis | Stakeholder fairness, harm prevention, value clarity | May not resolve genuine value conflicts |
| **STRATEGIC** | Long-horizon positioning | Long-term planning, business strategy, competitive positioning, roadmapping | Competitive awareness, option generation, robustness across uncertainties | May undervalue short-term execution realities |

---

### Intent-Context-Thinking Type Mapping Matrix

#### Primary Mapping (Weight: 0.4 for Intent + 0.3 for Context + 0.2 for Complexity + 0.1 for Model)

| Thinking Type | ANALYZE | DESIGN | SOLVE | VALIDATE | DECIDE | EXPLAIN | PREDICT | RESEARCH |
|---------------|---------|--------|-------|----------|--------|---------|---------|----------|
| **ANALYTICAL** | 0.9 | 0.7 | 0.8 | 0.9 | 0.8 | 0.8 | 0.8 | 0.7 |
| **CREATIVE** | 0.6 | 0.9 | 0.7 | 0.6 | 0.7 | 0.6 | 0.7 | 0.8 |
| **CRITICAL** | 0.8 | 0.7 | 0.7 | 0.9 | 0.8 | 0.7 | 0.7 | 0.8 |
| **SYSTEMATIC** | 0.8 | 0.8 | 0.9 | 0.8 | 0.8 | 0.7 | 0.8 | 0.9 |
| **ETHICAL** | 0.7 | 0.7 | 0.6 | 0.8 | 0.8 | 0.6 | 0.5 | 0.6 |
| **STRATEGIC** | 0.8 | 0.9 | 0.7 | 0.7 | 0.9 | 0.7 | 0.9 | 0.7 |

#### Complexity Fit Scores

| Thinking Type | LOW | MEDIUM | HIGH |
|---------------|-----|--------|------|
| ANALYTICAL | 0.9 | 0.9 | 0.8 |
| CREATIVE | 0.6 | 0.8 | 0.9 |
| CRITICAL | 0.7 | 0.8 | 0.8 |
| SYSTEMATIC | 0.8 | 0.9 | 0.8 |
| ETHICAL | 0.7 | 0.8 | 0.9 |
| STRATEGIC | 0.6 | 0.8 | 0.9 |

#### Model Size Fit Scores

| Thinking Type | LOW | MEDIUM | HIGH | VERY_HIGH |
|---------------|----|----|-----|------|
| ANALYTICAL | 0.8 | 0.9 | 0.9 | 0.9 |
| CREATIVE | 0.7 | 0.8 | 0.9 | 0.9 |
| CRITICAL | 0.8 | 0.9 | 0.9 | 0.9 |
| SYSTEMATIC | 0.9 | 0.9 | 0.9 | 0.9 |
| ETHICAL | 0.7 | 0.8 | 0.9 | 0.9 |
| STRATEGIC | 0.7 | 0.8 | 0.9 | 0.9 |

---

### Selection Algorithm Implementation

```python
def select_thinking_type(intent, context, complexity):
    # Define weights
    INTENT_WEIGHT = 0.4
    CONTEXT_WEIGHT = 0.3
    COMPLEXITY_WEIGHT = 0.2
    MODEL_WEIGHT = 0.1
    
    # Define mappings
    INTENT_MAPPING = {
        'ANALYZE': {'ANALYTICAL': 0.9, 'CRITICAL': 0.8, 'EXPLAIN': 0.7, 'DECIDE': 0.8},
        'DESIGN': {'CREATIVE': 0.9, 'SYSTEMATIC': 0.8, 'ANALYTICAL': 0.7},
        'SOLVE': {'SYSTEMATIC': 0.9, 'ANALYTICAL': 0.8, 'CREATIVE': 0.7},
        'VALIDATE': {'CRITICAL': 0.9, 'ANALYTICAL': 0.8},
        'DECIDE': {'CRITICAL': 0.8, 'ANALYTICAL': 0.8, 'SYSTEMATIC': 0.8},
        'EXPLAIN': {'ANALYTICAL': 0.7, 'CRITICAL': 0.6},
        'PREDICT': {'ANALYTICAL': 0.8, 'CREATIVE': 0.6, 'SYSTEMATIC': 0.8},
        'RESEARCH': {'SYSTEMATIC': 0.8, 'ANALYTICAL': 0.7, 'CREATIVE': 0.7}
    }
    
    CONTEXT_MAPPING = {
        'TECHNICAL': {'ANALYTICAL': 0.9, 'SYSTEMATIC': 0.9, 'CRITICAL': 0.7},
        'BUSINESS': {'SYSTEMATIC': 0.8, 'ANALYTICAL': 0.7, 'CREATIVE': 0.7},
        'CREATIVE': {'CREATIVE': 0.9, 'ANALYTICAL': 0.6, 'SYSTEMATIC': 0.6},
        'SYSTEMIC': {'SYSTEMATIC': 0.9, 'ANALYTICAL': 0.8, 'CREATIVE': 0.6},
        'SCIENTIFIC': {'ANALYTICAL': 0.8, 'SYSTEMATIC': 0.8, 'CREATIVE': 0.7}
    }
    
    COMPLEXITY_MAPPING = {
        'LOW': {'ANALYTICAL': 0.8, 'SYSTEMATIC': 0.8, 'CRITICAL': 0.7, 'CREATIVE': 0.6},
        'MEDIUM': {'ANALYTICAL': 0.9, 'SYSTEMATIC': 0.9, 'CRITICAL': 0.8, 'CREATIVE': 0.8},
        'HIGH': {'SYSTEMATIC': 0.9, 'ANALYTICAL': 0.8, 'CREATIVE': 0.9, 'CRITICAL': 0.8}
    }
    
    MODEL_MAPPING = {
        'LOW': {'ANALYTICAL': 0.8, 'SYSTEMATIC': 0.8, 'CRITICAL': 0.8, 'CREATIVE': 0.7},
        'MEDIUM': {'ANALYTICAL': 0.9, 'SYSTEMATIC': 0.9, 'CRITICAL': 0.9, 'CREATIVE': 0.8},
        'HIGH': {'ANALYTICAL': 0.9, 'SYSTEMATIC': 0.9, 'CRITICAL': 0.9, 'CREATIVE': 0.9},
        'VERY_HIGH': {'ANALYTICAL': 0.9, 'SYSTEMATIC': 0.9, 'CRITICAL': 0.9, 'CREATIVE': 0.9}
    }
    
    # Calculate scores for each thinking type
    thinking_types = ['ANALYTICAL', 'CREATIVE', 'CRITICAL', 'SYSTEMATIC', 'ETHICAL', 'STRATEGIC']
    scores = {}
    for thinking_type in thinking_types:
        intent_score = INTENT_MAPPING.get(intent, {}).get(thinking_type, 0.5) * INTENT_WEIGHT
        context_score = CONTEXT_MAPPING.get(context, {}).get(thinking_type, 0.5) * CONTEXT_WEIGHT
        complexity_score = COMPLEXITY_MAPPING.get(complexity, {}).get(thinking_type, 0.5) * COMPLEXITY_WEIGHT
        model_score = MODEL_MAPPING.get(complexity, {}).get(thinking_type, 0.5) * MODEL_WEIGHT
        
        scores[thinking_type] = intent_score + context_score + complexity_score + model_score
    
    # Select highest scoring thinking type
    best_type = max(scores, key=scores.get)
    best_score = scores[best_type]
    
    # Handle borderline cases
    if best_score < 0.7:
        # Fallback to most reliable types
        if intent in ['ANALYZE', 'VALIDATE', 'EXPLAIN']:
            return 'ANALYTICAL'
        elif intent in ['SOLVE', 'DECIDE']:
            return 'SYSTEMATIC'
        else:
            return 'ANALYTICAL'
    
    # Check for secondary factors in borderline cases
    second_best = sorted(scores.items(), key=lambda x: x[1], reverse=True)[1]
    if abs(best_score - second_best[1]) < 0.05:
        # Apply secondary factors
        if 'design' in user_input.lower() or 'create' in user_input.lower():
            if scores.get('CREATIVE', 0) > 0.6:
                return 'CREATIVE'
            elif scores.get('SYSTEMATIC', 0) > 0.6:
                return 'SYSTEMATIC'
        elif 'validate' in user_input.lower() or 'verify' in user_input.lower():
            if scores.get('CRITICAL', 0) > 0.6:
                return 'CRITICAL'
        elif 'optimize' in user_input.lower() or 'solve' in user_input.lower():
            if scores.get('SYSTEMATIC', 0) > 0.6:
                return 'SYSTEMATIC'
    
    return best_type
```

---

### CoT Pattern Selection by Thinking Type

#### Pattern-Selection Matrix

| Thinking Type | LOW Complexity | MEDIUM Complexity | HIGH Complexity | Tool Available |
|---------------|----------------|-------------------|-----------------|----------------|
| **ANALYTICAL** | Zero-Shot CoT | Few-Shot CoT | Tree of Thoughts | → ReAct if helpful |
| **CREATIVE** | Zero-Shot CoT | Auto-CoT | Tree of Thoughts | → ReAct if needed |
| **CRITICAL** | Zero-Shot CoT | Few-Shot CoT | Auto-CoT | → ReAct if validation tools |
| **SYSTEMATIC** | Zero-Shot CoT | ReAct | Tree of Thoughts | → ReAct preferred |
| **ETHICAL** | Zero-Shot CoT | Few-Shot CoT | Tree of Thoughts | → ReAct if stakeholder data needed |
| **STRATEGIC** | Zero-Shot CoT | Auto-CoT | Tree of Thoughts | → ReAct if market/competitor data needed |

---

### Pattern Configuration Guidelines

#### For Models with Limited Capability

| Pattern | Configuration | Reasoning |
|---------|--------------|-----------|
| Zero-Shot CoT | Default | Works well, low overhead |
| Few-Shot CoT | max_examples=2-3 | Moderate overhead |
| Auto-CoT | max_examples=2-3, difficulty=low | Limited self-generation |
| Tree of Thoughts | branches=2-4, depth=2-4, threshold=5-6 | Restricted exploration |
| ReAct | max_iter=3-5, tool_budget=5-8 | Moderate tool usage |

#### For Models with Full Capability

| Pattern | Configuration | Reasoning |
|---------|--------------|-----------|
| Zero-Shot CoT | Default | Works well |
| Few-Shot CoT | max_examples=3-4 | Standard overhead |
| Auto-CoT | max_examples=3-4, difficulty=medium-high | Good self-generation |
| Tree of Thoughts | branches=3-5, depth=4-6, threshold=5 | Full exploration |
| ReAct | max_iter=5-10, tool_budget=8-10 | Full tool usage |

---

## Example Mappings

### Example 1: Technical Debugging
```
User Input: "Our API is returning 500 errors for 5% of requests - investigate and fix"
Intent: SOLVE
Context: TECHNICAL
Complexity: HIGH (multiple entities, interdependencies, tool requirements)

Thinking Type: SYSTEMATIC (SOLVE:0.9 * 0.4 + TECHNICAL:0.9 * 0.3 + HIGH:0.9 * 0.2 = 0.87)
CoT Pattern: ReAct (SYSTEMATIC + HIGH + tool_availability=true)
Configuration: max_iter=4, tool_budget=5
```

### Example 2: Business Strategy
```
User Input: "Develop a strategy for entering the European market with our SaaS product"
Intent: DESIGN + DECIDE
Context: BUSINESS
Complexity: HIGH (open-ended, multi-factor, long-term)

Thinking Type: SYSTEMATIC (DESIGN:0.8 * 0.4 + BUSINESS:0.8 * 0.3 + HIGH:0.9 * 0.2 = 0.83)
CoT Pattern: Tree of Thoughts + Auto-CoT (hybrid)
Configuration: branches=4, depth=5, num_examples=4
```

### Example 3: Code Review
```
User Input: "Review this pull request for security vulnerabilities and performance issues"
Intent: VALIDATE + ANALYZE
Context: TECHNICAL
Complexity: MEDIUM (domain-specific, multiple aspects)

Thinking Type: ANALYTICAL (VALIDATE:0.9 * 0.4 + TECHNICAL:0.9 * 0.3 + MEDIUM:0.9 * 0.2 = 0.87)
CoT Pattern: Few-Shot CoT (ANALYTICAL + MEDIUM)
Configuration: num_examples=3
```

---

## Validation Rules

### Intent-Context Compatibility
```python
def is_compatible(intent, domain):
    # All intents are compatible with all domains
    # But some combinations are more natural
    NATURAL_COMBINATIONS = {
        'ANALYZE': ['TECHNICAL', 'BUSINESS', 'SCIENTIFIC', 'SYSTEMIC'],
        'DESIGN': ['TECHNICAL', 'CREATIVE', 'BUSINESS'],
        'SOLVE': ['TECHNICAL', 'SYSTEMIC', 'SCIENTIFIC'],
        'VALIDATE': ['TECHNICAL', 'BUSINESS'],
        'DECIDE': ['BUSINESS', 'SYSTEMIC'],
        'EXPLAIN': ['ALL'],
        'PREDICT': ['BUSINESS', 'SCIENTIFIC', 'TECHNICAL'],
        'RESEARCH': ['SCIENTIFIC', 'TECHNICAL', 'BUSINESS']
    }
    
    return domain in NATURAL_COMBINATIONS.get(intent, ['ALL'])
```

---

</thinking_type_matrix>

## Version Information

**Version:** 5.0.0
**Last Updated:** 2026-08-22
**Maintainer:** System Reasoning Consortium
**Compatibility:** cot-reasoning v5.0.0+
