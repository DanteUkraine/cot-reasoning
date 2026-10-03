#!/bin/bash
# =============================================================================
# Regression suite runner for validate-system-flow.sh
#
# Runs every fixture in assets/test-flows/ and checks that the validator's
# exit code matches the expectation encoded in the fixture filename:
#   *-pass-*.md    -> expect exit 0 (all validations passed)
#   *-fail-*.md    -> expect exit 1 (validation errors found)
#
# Usage: ./scripts/run-test-flows.sh [fixtures_dir]
#   fixtures_dir defaults to assets/test-flows relative to this script
#
# Returns:
#   0 - every fixture matched its expected outcome
#   1 - at least one fixture deviated from its expected outcome
# =============================================================================

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VALIDATOR="${SCRIPT_DIR}/validate-system-flow.sh"
FIXTURES_DIR="${1:-${SCRIPT_DIR}/../assets/test-flows}"

if [[ ! -x "$VALIDATOR" ]]; then
    echo "Validator not found or not executable: $VALIDATOR" >&2
    exit 2
fi

if [[ ! -d "$FIXTURES_DIR" ]]; then
    echo "Fixtures directory not found: $FIXTURES_DIR" >&2
    exit 2
fi

total=0
deviations=0

for fixture in "$FIXTURES_DIR"/*.md; do
    [[ -e "$fixture" ]] || continue
    name="$(basename "$fixture")"
    [[ "$name" == "README.md" ]] && continue
    total=$((total + 1))

    if [[ "$name" == *"-pass-"* || "$name" == *"-pass."* ]]; then
        expected=0
    elif [[ "$name" == *"-fail-"* || "$name" == *"-fail."* ]]; then
        expected=1
    else
        echo "[SKIP] $name (filename encodes no expectation)"
        continue
    fi

    "$VALIDATOR" -s "$fixture" > /dev/null 2>&1
    actual=$?

    if [[ "$actual" -eq "$expected" ]]; then
        echo "[OK]   $name (exit $actual, expected $expected)"
    else
        echo "[FAIL] $name (exit $actual, expected $expected)"
        deviations=$((deviations + 1))
    fi
done

echo ""
if [[ $deviations -eq 0 ]]; then
    echo "OK: $total fixture(s), all outcomes matched"
    exit 0
else
    echo "FAIL: $deviation(s) of $total fixture(s) deviated from expected outcomes"
    exit 1
fi
