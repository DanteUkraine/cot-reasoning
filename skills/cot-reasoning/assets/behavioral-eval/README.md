# Behavioral Eval for cot-reasoning

The mechanical layers (validator, fixtures, lint) prove the contract checker
works. This eval proves the product claim: **a model executing the skill emits
flows that pass the contract and match the expected reasoning profile.**

## Protocol

1. Take each prompt from `prompts.json` (10 prompts, one per expected profile:
   incident, trivial, no-tools, architecture, code review, open-ended,
   stateful, verification, trade-off, debugging).
2. Run the skill in the target model with that prompt as the user request.
3. Save the emitted flow as `<id>.md` in a flows directory.
4. Run the scorer:

```bash
./scripts/run-behavioral-eval.sh <flows_dir> "<model and environment label>"
```

The scorer validates each flow against the output contract, extracts the
actual mode / thinking type / pattern, checks the expected disciplines
(formalization, verification loop, confidence gate, typed outputs, edge
coverage), and prints a matrix with two numbers: **validator pass rate** and
**profile match rate**.

## Results

Results live in dated directories under `results/`. Each contains the
generated `flows/` and the scored `matrix.md`.

| Date | Model / environment | Validator | Profile |
|------|----------------------|-----------|---------|
| 2026-10-03 | Mistral Vibe agent (Mistral Large) | 10/10 | 10/10 |

## Interpretation

- **Validator failures** mean the model emitted a flow that violates the
  output contract — a skill defect (unclear instruction) or a model
  capability gap; check which step fields failed before deciding which.
- **Profile mismatches** mean the model picked the wrong mode, thinking type,
  or skipped a discipline the prompt should have triggered — most often a
  routing or activation-clarity defect in the skill.
- A model that passes the validator but mismatches profiles is "compliant but
  misrouted"; fix the skill's selection guidance, not the contract.

## Adding prompts

Append to `prompts.json` with `expected_mode`, `expected_thinking_type`
(`any` allowed), `expected_pattern` (`any` allowed), and
`expected_disciplines`. The scorer picks up new ids automatically.
