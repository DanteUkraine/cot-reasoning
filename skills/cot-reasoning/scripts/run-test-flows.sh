#!/bin/bash
# =============================================================================
# Regression suite runner for validate-system-flow.sh
#
# Runs every fixture in assets/test-flows/ and checks that the validator's
# exit code (and, when specified, an output message) matches the expectation
# recorded in assets/test-flows/expectations.tsv.
#
# Fixture conventions:
#   *.md    -> validated with -s (markdown mode)
#   *.json  -> validated with -j (JSON mode)
#   README.md and expectations.tsv are not fixtures
#
# Expectations manifest (TSV: filename <TAB> expected_exit <TAB> message):
#   expected_exit   0 or 1
#   message         extended regex the validator output must contain,
#                   or "-" when only the exit code matters
#
# Built-in CLI cases (usage errors and edge invocations):
#   no arguments            -> exit 2
#   nonexistent target      -> exit 2
#   -j on a .md file        -> exit 2
#   -m on a .json file      -> exit 2
#   -s on a directory       -> exit 1 (File not found path)
#
# Usage: ./scripts/run-test-flows.sh [fixtures_dir]
#
# Returns:
#   0 - every fixture and CLI case matched its expected outcome
#   1 - at least one deviation
#   2 - setup error (validator or fixtures missing)
# =============================================================================

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VALIDATOR="${SCRIPT_DIR}/validate-system-flow.sh"
FIXTURES_DIR="${1:-${SCRIPT_DIR}/../assets/test-flows}"
MANIFEST="${FIXTURES_DIR}/expectations.tsv"

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

lookup_expectation() {
    # $1 = fixture filename; echoes "exit<TAB>message" or nothing
    [[ -f "$MANIFEST" ]] || return 1
    awk -F'\t' -v f="$1" 'NR > 1 && $1 == f { print $2 "\t" $3; exit }' "$MANIFEST"
}

check_outcome() {
    # $1 = label, $2 = actual exit, $3 = expected exit,
    # $4 = output log, $5 = expected message regex ("-" = none)
    local label="$1" actual="$2" expected="$3" log="$4" message="$5"
    total=$((total + 1))
    local ok=1
    [[ "$actual" -ne "$expected" ]] && ok=0
    if [[ "$ok" -eq 1 && "$message" != "-" && -n "$message" ]]; then
        if ! grep -qE "$message" "$log"; then
            ok=0
        fi
    fi
    if [[ "$ok" -eq 1 ]]; then
        echo "[OK]   $label (exit $actual, expected $expected)"
    else
        echo "[FAIL] $label (exit $actual, expected $expected, message: ${message:--})"
        deviations=$((deviations + 1))
    fi
}

# ---- File fixtures ----
for fixture in "$FIXTURES_DIR"/*.md "$FIXTURES_DIR"/*.json; do
    [[ -e "$fixture" ]] || continue
    name="$(basename "$fixture")"
    [[ "$name" == "README.md" ]] && continue

    if [[ "$name" == *.json ]]; then
        flag="-j"
    else
        flag="-s"
    fi

    expected=("")
    message="-"
    if IFS=$'\t' read -r exp msg < <(lookup_expectation "$name"); then
        expected="$exp"
        message="$msg"
    elif [[ "$name" == *"-pass-"* || "$name" == *"-pass."* ]]; then
        expected=0
    elif [[ "$name" == *"-fail-"* || "$name" == *"-fail."* ]]; then
        expected=1
    else
        echo "[SKIP] $name (no expectation in manifest and none encoded in filename)"
        continue
    fi

    log="$(mktemp)"
    "$VALIDATOR" "$flag" "$fixture" > "$log" 2>&1
    actual=$?
    check_outcome "$name" "$actual" "$expected" "$log" "$message"
    rm -f "$log"
done

# ---- Built-in CLI cases ----
cli_case() {
    # $1 = label, $2 = expected exit, remaining args passed to the validator
    local label="$1" expected="$2"
    shift 2
    total=$((total + 1))
    log="$(mktemp)"
    "$VALIDATOR" "$@" > "$log" 2>&1
    actual=$?
    if [[ "$actual" -eq "$expected" ]]; then
        echo "[OK]   CLI: $label (exit $actual, expected $expected)"
    else
        echo "[FAIL] CLI: $label (exit $actual, expected $expected)"
        deviations=$((deviations + 1))
    fi
    rm -f "$log"
}

cli_case "no arguments" 2
cli_case "nonexistent target" 2 /tmp/definitely-missing-flow-file.md
cli_case "-j on a .md file" 2 -j "$FIXTURES_DIR/minimal-pass.md"
cli_case "-m on a .json file" 2 -m "$SCRIPT_DIR/../assets/system-examples.json"
cli_case "-s on a directory (File not found path)" 1 -s "$FIXTURES_DIR"

echo ""
if [[ $deviations -eq 0 ]]; then
    echo "OK: $total case(s), all outcomes matched"
    exit 0
else
    echo "FAIL: $deviations of $total case(s) deviated from expected outcomes"
    exit 1
fi
