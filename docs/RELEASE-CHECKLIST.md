# Release Checklist — cot-reasoning v5.2.0

Mechanical verification (validator, regression suite, lint, behavioral eval)
runs in CI on every push. This checklist covers what cannot be verified from
the development environment.

## Before publishing

- [x] **CI green on GitHub**: the Actions workflow passed on GitHub runners for
  this branch (push runs and the PR run, 2026-10-03). Advisory annotations:
  shellcheck findings (non-blocking by design) and the actions/checkout@v4
  Node-20 deprecation notice — consider bumping to @v5 in a follow-up
- [x] **Install command**: `npx skills add DanteUkraine/cot-reasoning@cot-reasoning`
  verified from a clean directory (non-interactive form: `--agent '*' -y`); the
  registry currently serves the published main version (5.1.0) — it will serve
  5.2.0 once this branch is merged and pushed
- [ ] **Smoke test in one alternative environment**: run one behavioral-eval
  prompt (e.g. `incident-500-errors`) in Claude Code or OpenCode and score it:
  `./scripts/run-behavioral-eval.sh <flows_dir> "<label>"`
- [ ] **Multi-model behavioral matrix**: run the 10-prompt eval in at least two
  more models (one strong reasoner, one small/local model) and append the
  results to `assets/behavioral-eval/README.md` — the small-model row is the
  product's core claim and must be measured, not assumed
- [ ] **Tag the release**: `git tag v5.2.0 && git push origin v5.2.0`
- [ ] **CHANGELOG reviewed**: dates and versions match the tags

## After publishing

- [ ] Monitor the first week of CI runs for environment-specific failures
      (jq availability, shellcheck findings worth fixing)
- [ ] Collect user-reported flow failures and score them with the behavioral
      eval scorer; a validator failure from a real user session is a skill
      defect signal, not user error
