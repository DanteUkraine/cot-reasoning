#!/bin/bash
# =============================================================================
# Consistency Lint for cot-reasoning
#
# Four groups of checks, all mechanical:
#   1. Version consistency — one version across SKILL.md, validator,
#      templates, references, examples, README
#   2. Frontmatter validity — SKILL.md carries the required keys
#   3. Cross-references — every file named in the SKILL.md references
#      table exists, and the anchors the table claims are present
#   4. Universality guard — no domain-specific terms leak into the skill
#      (case-sensitive, word-bounded; ReAct does not match React)
#
# Usage: ./scripts/lint-consistency.sh
# Returns: 0 = clean, 1 = inconsistencies found
# =============================================================================

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL="$SKILL_DIR/SKILL.md"

ERRORS=0
fail() { echo "[FAIL] $1"; ERRORS=$((ERRORS + 1)); }
pass() { echo "[OK]   $1"; }

# ---- 1. Version consistency ----
echo "== Version consistency =="
VERSION=$(sed -n 's/^  version: "\([0-9.]*\)"/\1/p' "$SKILL" | head -1)
if [[ -z "$VERSION" ]]; then
    fail "SKILL.md frontmatter has no version"
    exit 1
fi
pass "SKILL.md version: $VERSION"

v=$(sed -n 's/^VERSION="\([0-9.]*\)"/\1/p' "$SCRIPT_DIR/validate-system-flow.sh")
[[ "$v" == "$VERSION" ]] && pass "validator VERSION: $v" || fail "validator VERSION is '$v', expected '$VERSION'"

for f in "$SKILL_DIR"/templates/thinking-types/*.md \
         "$SKILL_DIR"/templates/system-flows/*.md \
         "$SKILL_DIR"/templates/adaptive-flows/*.md; do
    v=$(sed -n 's/^version: "\([0-9.]*\)"/\1/p' "$f" | head -1)
    [[ "$v" == "$VERSION" ]] && pass "$(basename "$f"): $v" || fail "$(basename "$f") version is '$v', expected '$VERSION'"
done

for f in "$SKILL_DIR"/references/*.md; do
    if grep -q "$VERSION" "$f"; then
        pass "$(basename "$f"): mentions $VERSION"
    else
        fail "$(basename "$f") does not mention version $VERSION"
    fi
done

v=$(jq -r '.metadata.version' "$SKILL_DIR/assets/system-examples.json")
[[ "$v" == "$VERSION" ]] && pass "examples metadata.version: $v" || fail "examples metadata.version is '$v', expected '$VERSION'"

n=$(jq -r --arg v "cot-reasoning v$VERSION" '[.examples[].flow.meta.generated_by] | map(select(. == $v)) | length' "$SKILL_DIR/assets/system-examples.json")
t=$(jq -r '[.examples[].flow.meta.generated_by] | map(select(. != null)) | length' "$SKILL_DIR/assets/system-examples.json")
[[ "$n" == "$t" && "$t" != "0" ]] && pass "examples generated_by: $n/$t consistent" || fail "examples generated_by: only $n of $t match v$VERSION"

if grep -q "\*\*v$VERSION\*\*" "$SKILL_DIR/../../README.md"; then
    pass "README states v$VERSION"
else
    fail "README does not state **v$VERSION**"
fi

# ---- 2. Frontmatter validity ----
echo ""
echo "== Frontmatter validity =="
for key in "^name:" "^description:" "^metadata:" "^  version:" "^  allowed-tools:"; do
    if grep -q "$key" "$SKILL"; then
        pass "SKILL.md has $key"
    else
        fail "SKILL.md missing frontmatter key matching $key"
    fi
done

# ---- 3. Cross-references ----
echo ""
echo "== Cross-references =="
REFS=(
    "references/model-capabilities.md:mode_selection_algorithm"
    "references/intent-context-matrix.md:thinking_type_matrix"
    "references/reasoning-patterns-analysis.md:pattern_selection"
    "references/reasoning-simulation.md:framework_pillars"
    "references/output-contract.md:output_contract"
    "references/output-contract.md:Confidence Gate"
    "templates/system-flows/step-execution-template.md:Formalization Step"
    "templates/system-flows/step-execution-template.md:Verification Loop Step"
    "templates/system-flows/step-execution-template.md:Edge-Case Derivation"
    "templates/system-flows/self-dialogue-template.md:Verification Loop Iteration"
    "templates/adaptive-flows/unified-reasoning-flow.md:Formalized Contract"
    "templates/adaptive-flows/unified-reasoning-flow.md:Confidence Gate"
)
for ref in "${REFS[@]}"; do
    file="${ref%%:*}"
    anchor="${ref#*:}"
    if [[ ! -f "$SKILL_DIR/$file" ]]; then
        fail "missing file: $file"
    elif grep -q "$anchor" "$SKILL_DIR/$file"; then
        pass "$file contains '$anchor'"
    else
        fail "$file lacks anchor '$anchor'"
    fi
done
for f in templates/thinking-types/analytical.md templates/thinking-types/creative.md \
         templates/thinking-types/critical.md templates/thinking-types/systematic.md \
         templates/thinking-types/ethical.md templates/thinking-types/strategic.md \
         scripts/validate-system-flow.sh assets/system-examples.json; do
    [[ -f "$SKILL_DIR/$f" ]] && pass "exists: $f" || fail "missing file: $f"
done

# ---- 4. Universality guard ----
echo ""
echo "== Universality guard (no domain-specific terms) =="
# Scans skill CONTENT (what models read), not tooling: SKILL.md, references,
# templates, assets. The lint script itself lives in scripts/ and necessarily
# names the terms it forbids.
if grep -rnE "\b(React|Playwright|XState|DTCG|Tailwind|axe-core|daisyUI|shadcn|Zod)\b" \
        "$SKILL" "$SKILL_DIR/references" "$SKILL_DIR/templates" "$SKILL_DIR/assets" \
        > /tmp/lint-domain-hits.txt 2>&1; then
    fail "domain-specific terms found in skill content (case-sensitive, word-bounded):"
    sed 's/^/      /' /tmp/lint-domain-hits.txt
else
    pass "no domain-specific terms in skill content (React, Playwright, XState, DTCG, Tailwind, axe-core, daisyUI, shadcn, Zod)"
fi

echo ""
if [[ $ERRORS -eq 0 ]]; then
    echo "OK: consistency lint clean"
    exit 0
else
    echo "FAIL: $ERRORS inconsistency(ies) found"
    exit 1
fi
