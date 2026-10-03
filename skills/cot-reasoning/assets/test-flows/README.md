# Validator Regression Fixtures

Fixed flows the validator is run against after every change to
`scripts/validate-system-flow.sh` or to the output contract. The expected
outcome is encoded in the filename: `-pass-` fixtures must exit 0, `-fail-`
fixtures must exit 1.

Run the suite:

```bash
./scripts/run-test-flows.sh
```

| Fixture | Mode | Expected | What it protects |
|---------|------|----------|-------------------|
| `minimal-pass.md` | MINIMAL | exit 0 | MINIMAL is untouched by the v5.2.0 disciplines: a flow with no new fields and the 12-line budget still passes |
| `basic-pass.md` | BASIC | exit 0 | BASIC contract with the Confidence Gate present passes |
| `standard-pass.md` | STANDARD | exit 0 | Full STANDARD contract: extended sections, Confidence Gate, Output Schema per step, loop fields declared as a set |
| `standard-fail-no-gate.md` | STANDARD | exit 1 | A STANDARD flow without the Confidence Gate is rejected |
| `standard-fail-broken-loop.md` | STANDARD | exit 1 | Max Iterations declared without Exit Criteria / Escalation Policy is rejected |

Adding a new check to the validator: add a fixture that fails without the
check and passes with it, then re-run the suite and the example suite:

```bash
./scripts/run-test-flows.sh
./scripts/validate-system-flow.sh -j assets/system-examples.json
```
