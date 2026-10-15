# cot-reasoning — Reasoning Disciplines Reference

Tier 3 reference of cot-reasoning v6.0.0 — loaded by the `reason` and `verify`
states of SKILL.md when a discipline's full procedure or worked example is
needed. Self-contained; no other file needs to be read first.

<discipline_procedures>

The five externalized reasoning disciplines replace capabilities a weak
reasoner lacks — ambiguity tolerance, self-correction, metacognition,
completeness intuition — with external procedure. They are procedural
discipline for existing steps, not new ontology: no new thinking types,
patterns, or tool categories. The mode-conditional tier matrix lives in
SKILL.md `<reasoning_disciplines>`; this file carries the full procedures.

1. **Contract Formalization (STANDARD/ENHANCED).** Before decomposing an
   open-ended problem statement, convert it into a closed contract: named
   entities, hard and soft constraints, measurable success criteria, and an
   explicit list of what must NOT be interpreted freely. Decomposing an
   open-ended statement directly is a formalization failure, not a style
   choice — ambiguity is where a weak reasoner derails first.
   Worked example: `templates/system-flows/step-execution-template.md`
   (Formalization Step).

2. **Typed Step Outputs (BASIC/STANDARD/ENHANCED).** A step's Expected Output
   is a typed structure — fields, enums, ranges — not prose. Declare it in the
   optional **Output Schema** step field. If a produced output violates its
   declared structure, feed the violation back into the step and regenerate
   the output: the cheapest correction loop, fired before any fallback.

3. **Verification Loop (STANDARD/ENHANCED).** A verification step that fails
   does not fall back once — it iterates. Capture the RAW failure evidence
   (error output, observed values — never a paraphrase), feed it into the
   next attempt, and on a REPEATED failure change the strategy, not just the
   parameters. Every loop declares **Max Iterations**, **Exit Criteria**,
   and **Escalation Policy**; a loop without a budget is an anti-pattern,
   not persistence. A check that stalls or depends on unavailable data fails
   fast and hands its partial evidence to the loop — the iteration budget is
   never spent waiting on a hanging check.
   Worked example: `templates/system-flows/step-execution-template.md`
   (Verification Loop Step).

4. **Confidence Gate (BASIC/STANDARD/ENHANCED).** The Quality Metrics
   confidence value is a GATE, not a report. Default threshold: 7.0/10 unless
   the user set one. Below the threshold the step or flow is NOT done:
   iterate, escalate, or ask — and name which. A check that could match more
   than one interpretation of success is a FAILED check, never a passed one.
   No silent pass.

5. **Edge Coverage (STANDARD/ENHANCED).** When the problem contains states and
   transitions — any process, protocol, workflow, lifecycle — validation
   cases are DERIVED by covering the graph: every state, every transition,
   every guard. A weak reasoner generates the happy path; the coverage
   procedure supplies the rest externally.
   Procedure: `templates/system-flows/step-execution-template.md`
   (Edge-Case Derivation).

</discipline_procedures>
