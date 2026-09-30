---
template_id: self-dialogue-template
version: "5.0.0"
category: system-core
recommended_for: reasoning-transparency
domain: universal
---

# Self-Dialogue Template for Reasoning Transparency

## Purpose

This template provides **structured internal monologue patterns** that create **transparent, auditable reasoning** for any model. Self-dialogue makes the thinking process **visible, logical, and followable**.

**Core Value:** Transforms a sequence of actions into a **coherent reasoning process** that users can understand, trust, and audit.

---

## Dialogue Structure

### Standard Format

```
[Thought]: "Initial observation or question"
[Analysis]: "Breakdown of the situation"
[Question]: "Specific question to address"
[Answer]: "Response to the question"
[Consideration]: "Alternative perspective or concern" (optional)
[Conclusion]: "Synthesis of all findings"
[Decision]: "Final decision or next action"
```

### Component Definitions

| Component | Purpose | Content Type | Required? |
|-----------|---------|--------------|-----------|
| **Thought** | Initial trigger | Question, observation, or problem | Yes |
| **Analysis** | Contextual breakdown | Facts, possibilities, considerations | Optional |
| **Question** | Focused inquiry | Specific question to answer | Optional |
| **Answer** | Direct response | Factual or logical response | If Question exists |
| **Consideration** | Alternative perspective | "What about X?" or "But Y..." | Optional |
| **Conclusion** | Synthesis | Combines all previous | Yes |
| **Decision** | Actionable output | Next step or final answer | Yes |

---

## Dialogue Depth Guidelines

### LOW Complexity (2-3 exchanges)
**Use Case:** Simple problems, direct solutions

```
[Thought]: "User wants to know the status of the system"
[Analysis]: "This is a factual question about current state"
[Conclusion]: "Need to check system health"
[Decision]: "Retrieve current system metrics"
```

**When to Use:** Simple yes/no questions, routine checks, direct information retrieval

---

### MEDIUM Complexity (4-5 exchanges) - DEFAULT
**Use Case:** Standard problems requiring analysis

```
[Thought]: "User reports system is returning errors for 5% of requests"
[Analysis]: "This indicates a server-side problem affecting a subset of users"
[Question]: "What are the most common causes of this type of error?"
[Answer]: "Typical causes: database issues, code bugs, configuration errors, resource limits"
[Question]: "Which is most likely given it started suddenly?"
[Answer]: "Most likely: recent code deployment introduced a bug"
[Conclusion]: "Need to check recent deployments and error logs for correlation"
[Decision]: "Retrieve deployment history and error logs"
```

**When to Use:** Typical debugging, analysis problems, multi-factor decisions

---

### HIGH Complexity (6-8 exchanges)
**Use Case:** Complex problems with multiple variables

```
[Thought]: "User wants to optimize database performance for high-traffic system"
[Analysis]: "This involves: query optimization, indexing, connection pooling, caching"
[Question]: "What are the current performance bottlenecks?"
[Answer]: "Unknown - need to measure first"
[Question]: "What metrics should I check?"
[Answer]: "Query execution time, connection wait time, cache hit rate, CPU usage"
[Question]: "Which is most critical for high-traffic?"
[Answer]: "Connection pooling typically causes most issues under load"
[Consideration]: "But caching can also dramatically improve performance"
[Conclusion]: "Need to profile current performance, then identify top bottlenecks"
[Decision]: "Run performance profiling on all database operations"
```

**When to Use:** Multi-step investigations, system optimization, complex decision trees

---

### VERY_HIGH Complexity (9+ exchanges)
**Use Case:** Very complex, multi-faceted problems

```
[Thought]: "User wants to design a distributed microservices architecture"
[Analysis]: "This involves: service decomposition, data consistency, network latency, deployment, monitoring, cost"
[Question]: "What are the non-functional requirements?"
[Answer]: "Not fully specified - need to infer: scalability, reliability, low latency"
[Question]: "What scale are we targeting?"
[Answer]: "High traffic implies: millions of users, multiple regions, 24/7 availability"
[Consideration]: "But budget may limit infrastructure choices"
[Question]: "What are the data consistency requirements?"
[Answer]: "Unknown - but high traffic often requires eventual consistency for performance"
[Conclusion]: "Need to define requirements first, then design architecture to meet them"
[Decision]: "Create requirements document, then propose architecture options"
```

**When to Use:** Architectural design, large-scale system planning, multi-stakeholder decisions

---

## Domain-Specific Dialogue Patterns

### System Debugging

**Pattern:** Problem Identification → Data Needed → Hypothesis → Verification

```
[Thought]: "{{PROBLEM_STATEMENT}}"
[Analysis]: "This type of problem typically caused by: {{COMMON_CAUSES}}"
[Question]: "What data would help identify the specific cause?"
[Answer]: "Need: {{DATA_TYPES}} from {{DATA_SOURCES}}"
[Question]: "Which cause is most likely given {{CONTEXT}}?"
[Answer]: "Most likely: {{HYPOTHESIS}} because {{REASONING}}"
[Conclusion]: "Need to verify {{HYPOTHESIS}} by checking {{VERIFICATION_DATA}}"
[Decision]: "{{NEXT_ACTION}}"
```

**Example:**
```
[Thought]: "API response time increased from 100ms to 500ms"
[Analysis]: "Latency increases typically caused by: database queries, external APIs, network, resources"
[Question]: "What data would help identify the bottleneck?"
[Answer]: "Need: response time breakdown, database query logs, external API times, resource metrics"
[Question]: "Which is most likely given it happened suddenly?"
[Answer]: "Most likely: external API timeout or resource exhaustion because it's sudden"
[Conclusion]: "Need to check external API response times and server resource usage"
[Decision]: "Analyze performance metrics for all components"
```

---

### System Design

**Pattern:** Requirements → Constraints → Options → Evaluation → Selection

```
[Thought]: "User needs {{DESIGN_GOAL}}"
[Analysis]: "Requirements: {{REQUIREMENTS}}. Constraints: {{CONSTRAINTS}}"
[Question]: "What are the standard approaches?"
[Answer]: "Common solutions: {{OPTION_1}}, {{OPTION_2}}, {{OPTION_3}}"
[Question]: "Which options meet all requirements?"
[Answer]: "{{OPTION_1}}: {{EVALUATION_1}}, {{OPTION_2}}: {{EVALUATION_2}}"
[Consideration]: "But {{OPTION_3}} might be better for {{SPECIFIC_NEED}}"
[Conclusion]: "{{OPTION_X}} seems best overall"
[Decision]: "Propose {{SELECTED_OPTION}} with detailed specification"
```

**Example:**
```
[Thought]: "User needs authentication without passwords for mobile app"
[Analysis]: "Requirements: high usability, strong security, mobile compatibility. Constraints: no passwords"
[Question]: "What are the standard passwordless methods?"
[Answer]: "Common solutions: SMS codes, email magic links, biometrics, hardware tokens"
[Question]: "Which meet all requirements?"
[Answer]: "Biometrics: high usability but platform limitations, SMS: usable but security concerns, Magic links: good balance"
[Consideration]: "But users may not have email configured"
[Conclusion]: "Magic links with biometric fallback seems optimal"
[Decision]: "Design magic link system with Face ID/Touch ID fallback"
```

---

### Decision Making

**Pattern:** Options → Criteria → Evaluation → Trade-offs → Decision

```
[Thought]: "User needs to decide between {{OPTIONS}}"
[Analysis]: "Decision factors: {{FACTORS}}. Stakeholders: {{STAKEHOLDERS}}"
[Question]: "What are the evaluation criteria?"
[Answer]: "Criteria: {{CRITERIA_LIST}}"
[Question]: "How do options compare?"
[Answer]: "{{OPTION_1}}: {{SCORE_1}}, {{OPTION_2}}: {{SCORE_2}}"
[Consideration]: "Trade-offs: {{TRADE_OFFS}}"
[Conclusion]: "{{OPTION_X}} is optimal based on {{REASONING}}"
[Decision]: "Recommend {{OPTION_X}} with implementation plan"
```

---

## Dialogue Quality Metrics

### Evaluation Criteria

| Criterion | Description | Target Score |
|----------|-------------|--------------|
| **Relevance** | Addresses current step purpose | 9-10 |
| **Logical Flow** | Each exchange follows from previous | 9-10 |
| **Completeness** | All necessary considerations included | 8-10 |
| **Clarity** | Easy to understand | 9-10 |
| **Actionability** | Leads to clear decision | 9-10 |

### Scoring Rubric

**10/10 - Excellent:** All criteria met, insightful, natural, leads to effective action

**8-9/10 - Good:** Minor issues, helpful, leads to reasonable action

**6-7/10 - Adequate:** Several issues, somewhat forced, action acceptable

**<6/10 - Needs Improvement:** Major issues, artificial, action may be ineffective

---

## Common Dialogue Mistakes & Fixes

### Mistake 1: Too Vague

**Bad:**
```
[Thought]: "Problem with system"
[Conclusion]: "Need to fix it"
```

**Good:**
```
[Thought]: "System API is returning 500 errors for POST /users endpoint"
[Analysis]: "500 errors indicate server-side failure affecting user creation"
[Question]: "Is this affecting all users or specific cases?"
[Answer]: "Unknown - need to check error patterns"
[Conclusion]: "Need to identify which user creation requests are failing"
[Decision]: "Retrieve and analyze error logs for /users endpoint"
```

### Mistake 2: Not Actionable

**Bad:**
```
[Thought]: "Something is wrong"
[Analysis]: "It's not working correctly"
[Conclusion]: "This is a problem"
[Decision]: "Something needs to be done"
```

**Good:**
```
[Thought]: "API latency has increased from 100ms to 500ms"
[Analysis]: "This is a 400% increase, significantly affecting user experience"
[Question]: "What component is causing the slowdown?"
[Answer]: "Unknown - need to profile each component"
[Conclusion]: "Database, external APIs, or internal processing could be the cause"
[Decision]: "Profile API endpoints to identify slowest component"
```

### Mistake 3: Missing Context

**Bad:**
```
[Thought]: "Fix the bug"
[Decision]: "Change the code"
```

**Good:**
```
[Thought]: "User reports authentication fails for some users"
[Analysis]: "Authentication involves: token validation, session check, database lookup"
[Question]: "Which part is failing?"
[Answer]: "Unknown - error message would help identify"
[Question]: "Where are authentication errors logged?"
[Answer]: "In system/auth_errors.log with user ID and error type"
[Conclusion]: "Need to check auth_errors.log for recent failures"
[Decision]: "Retrieve authentication error logs to identify pattern"
```

### Mistake 4: Overly Complex

**Bad (too many exchanges for simple problem):**
```
[Thought]: "User asks for current time"
[Analysis]: "Time is a fundamental concept"
[Question]: "What timezone?"
[Answer]: "Unknown"
[Question]: "Should I ask?"
[Answer]: "Probably"
[Question]: "What's the default?"
[Answer]: "UTC usually"
[Conclusion]: "Need to determine timezone"
[Decision]: "Ask user for timezone or use UTC"
```

**Good:**
```
[Thought]: "User asks for current time"
[Analysis]: "Simple factual request"
[Conclusion]: "Need to provide current time"
[Decision]: "Return current UTC time"
```

---

## Dialogue Generation Guidelines

### For Different Scenarios

**For Data Collection Steps:**
```
[Thought]: "Need {{DATA_TYPE}} to proceed"
[Analysis]: "This data will reveal {{INSIGHT}}"
[Question]: "Where can I get {{DATA_TYPE}}?"
[Answer]: "From {{SOURCE}} using {{TOOL}}"
[Conclusion]: "{{TOOL}} is the best approach"
[Decision]: "Execute {{TOOL}} to retrieve {{DATA_TYPE}}"
```

**For Analysis Steps:**
```
[Thought]: "Data shows {{OBSERVATION}}"
[Analysis]: "This suggests {{INTERPRETATION}}"
[Question]: "What does this mean?"
[Answer]: "It indicates {{IMPLICATION}}"
[Consideration]: "But should also check {{ALTERNATIVE}}"
[Conclusion]: "Primary insight: {{INSIGHT}}"
[Decision]: "{{NEXT_ACTION}}"
```

**For Verification Steps:**
```
[Thought]: "Need to verify {{HYPOTHESIS}}"
[Analysis]: "Evidence: {{EVIDENCE}}. Missing: {{VERIFICATION_NEEDED}}"
[Question]: "How to verify?"
[Answer]: "Use {{TOOL}} to check {{ASPECT}}"
[Conclusion]: "Verification plan: {{PLAN}}"
[Decision]: "Execute verification"
```

---

## Best Practices

1. **Be Specific:** Vague dialogue produces vague results
2. **Stay Relevant:** Every exchange should contribute to the step's purpose
3. **Build Logically:** Each component should follow from the previous
4. **End with Action:** Dialogue should always lead to a clear next step
5. **Match Complexity:** Dialogue depth should match problem complexity
6. **Add Insight:** Self-dialogue should provide understanding, not just noise
7. **Test Dialogue:** Read it aloud - does it make sense as reasoning?

---

## Quick Reference

### Dialogue Components

| Component | Symbol | Purpose | Required? |
|-----------|--------|---------|-----------|
| Thought | 💭 | Initial observation | Yes |
| Analysis | 📊 | Context breakdown | Medium+ |
| Question | ❓ | Focused inquiry | Medium+ |
| Answer | ✅ | Direct response | If Question |
| Consideration | ⚠️ | Alternative view | High+ |
| Conclusion | 🎯 | Synthesis | Yes |
| Decision | 🚀 | Action | Yes |

### Complexity Mapping

```
LOW (2-3):      Thought → Conclusion → Decision
                Thought → Analysis → Conclusion → Decision

MEDIUM (4-5):  Thought → Analysis → Question → Answer → Conclusion → Decision
               Thought → Analysis → Question → Answer → Consideration → Conclusion → Decision

HIGH (6-8):    Thought → Analysis → Q → A → Q → A → Consideration → Conclusion → Decision

VERY_HIGH:     Thought → Analysis → Q → A → Q → A → Q → A → C → C → Conclusion → Decision
```

---

## Conclusion

Self-dialogue is the **heart of transparent reasoning**. Well-crafted dialogue:

- Provides the **illusion of reasoning** through structured thought process
- Makes the process **transparent** so users can follow and trust it
- Enables **effective tool usage** by explaining why each tool is needed
- Creates **auditability** with a clear chain of reasoning

**Golden Rule:** If the dialogue doesn't help a human understand the reasoning process, it's not serving its purpose. Always ask: *"Does this make the thinking process clearer?"*
