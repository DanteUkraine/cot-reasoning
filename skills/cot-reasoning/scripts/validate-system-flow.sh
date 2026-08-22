#!/bin/bash
# =============================================================================
# System Flow Validator for cot-reasoning
# 
# Purpose: Validate that agentic reasoning flows conform to the required structure
#          and quality standards for models without native reasoning (, etc.)
# 
# Usage: ./validate-system-flow.sh [OPTIONS] <input_file_or_directory>
# 
# Options:
#   -s, --single    Validate a single flow file
#   -d, --directory Validate all flow files in a directory
#   -j, --json      Validate JSON output structure
#   -m, --markdown  Validate Markdown output structure
#   -v, --verbose   Show detailed validation messages
#   -h, --help      Show this help message
# 
# Examples:
#   ./validate-system-flow.sh -s output.md
#   ./validate-system-flow.sh -d ./flows/ -v
#   ./validate-system-flow.sh -m example-flow.md
# 
# Returns:
#   0 - All validations passed
#   1 - Validation errors found
#   2 - Usage error
# =============================================================================

set -euo pipefail

# =============================================================================
# Configuration
# =============================================================================

SCRIPT_NAME="validate-system-flow.sh"
VERSION="5.0.0"
SKILL_NAME="cot-reasoning"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
ERRORS=0
WARNINGS=0
CHECKED=0
PASSED=0

# =============================================================================
# Helper Functions
# =============================================================================

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[PASS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
    ((WARNINGS++))
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
    ((ERRORS++))
}

log_header() {
    echo -e "\n${BLUE}================================================================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================================================================${NC}\n"
}

show_help() {
    cat << EOF
${SKILL_NAME} - System Flow Validator v${VERSION}

Usage: $SCRIPT_NAME [OPTIONS] <input>

Validate agentic reasoning flows for the cot-reasoning.

Options:
  -s, --single    Validate a single flow file (markdown)
  -d, --directory Validate all flow files in a directory
  -j, --json      Validate JSON structure
  -m, --markdown  Validate Markdown structure (default)
  -v, --verbose   Show detailed validation messages
  -h, --help      Show this help message

Examples:
  $SCRIPT_NAME -s flow_output.md
  $SCRIPT_NAME -d ./test-flows/ -v
  $SCRIPT_NAME --markdown --verbose example.md

Validation Checks:
  ✓ Required sections present
  ✓ Step structure validity
  ✓ Tool call formatting
  ✓ Self-dialogue completeness
  ✓ Fallback paths defined
  ✓ Quality metrics present

Return Codes:
  0 - All validations passed
  1 - Validation errors found
  2 - Usage error

EOF
    exit 2
}

# =============================================================================
# Validation Functions
# =============================================================================

# Validate required top-level sections
validate_required_sections() {
    local file="$1"
    local content="$2"
    
    log_header "Checking Required Sections"
    
    local required_sections=(
        "Reasoning Flow:"
        "Flow ID:"
        "Timestamp:"
        "Reasoning Mode:"
        "Configuration"
        "Problem Analysis"
        "Reasoning Steps"
        "Key Findings"
        "Recommendations"
        "Execution Summary"
        "Quality Metrics"
        "Meta Information"
    )
    
    for section in "${required_sections[@]}"; do
        if grep -q "$section" <<< "$content"; then
            log_success "Found: $section"
            ((PASSED++))
        else
            log_error "Missing required section: $section"
        fi
        ((CHECKED++))
    done
}

# Validate flow metadata
validate_flow_metadata() {
    local content="$1"
    
    log_header "Checking Flow Metadata"
    
    # Check Flow ID
    if grep -q "Flow ID:" <<< "$content"; then
        local flow_id=$(grep "Flow ID:" <<< "$content" | head -1 | sed 's/.*Flow ID: *//')
        if [[ -n "$flow_id" && ! "$flow_id" =~ \[[:space:]]*\] ]]; then
            log_success "Flow ID is valid: $flow_id"
            ((PASSED++))
        else
            log_error "Flow ID is empty or invalid"
        fi
    else
        log_error "Flow ID is missing"
    fi
    ((CHECKED++))
    
    # Check Agentic Mode
    local valid_modes=("STANDARD" "BASIC")
    if grep -q "Reasoning Mode:" <<< "$content"; then
        local mode=$(grep "Reasoning Mode:" <<< "$content" | head -1 | sed 's/.*Reasoning Mode: *//')
        if [[ " ${valid_modes[*]} " =~ " ${mode} " ]]; then
            log_success "Reasoning Mode is valid: $mode"
            ((PASSED++))
        else
            log_error "Invalid Reasoning Mode: $mode (must be one of: ${valid_modes[*]})"
        fi
    else
        log_error "Reasoning Mode is missing"
    fi
    ((CHECKED++))
    
    # Check Thinking Type
    local valid_thinking_types=("ANALYTICAL" "CREATIVE" "CRITICAL" "SYSTEMATIC")
    if grep -q "Thinking Type:" <<< "$content"; then
        local thinking_type=$(grep "Thinking Type:" <<< "$content" | head -1 | sed 's/.*Thinking Type: *//')
        if [[ " ${valid_thinking_types[*]} " =~ " ${thinking_type} " ]]; then
            log_success "Thinking Type is valid: $thinking_type"
            ((PASSED++))
        else
            log_error "Invalid Thinking Type: $thinking_type"
        fi
    else
        log_error "Thinking Type is missing"
    fi
    ((CHECKED++))
    
    # Check Complexity
    local valid_complexities=("LOW" "MEDIUM" "HIGH" "VERY_HIGH")
    if grep -q "Complexity:" <<< "$content"; then
        local complexity=$(grep "Complexity:" <<< "$content" | head -1 | sed 's/.*Complexity: *//')
        if [[ " ${valid_complexities[*]} " =~ " ${complexity} " ]]; then
            log_success "Complexity is valid: $complexity"
            ((PASSED++))
        else
            log_error "Invalid Complexity: $complexity"
        fi
    else
        log_error "Complexity is missing"
    fi
    ((CHECKED++))
}

# Validate step structure
validate_step_structure() {
    local content="$1"
    
    log_header "Checking Step Structure"
    
    # Extract all steps
    local steps=()
    while IFS= read -r line; do
        if [[ "$line" =~ ^\#\#\#\ Step\ [0-9]+: ]]; then
            steps+=("$line")
        fi
    done <<< "$content"
    
    if [[ ${#steps[@]} -eq 0 ]]; then
        log_error "No steps found in flow"
        return
    fi
    
    log_success "Found ${#steps[@]} steps"
    ((PASSED++))
    ((CHECKED++))
    
    # Validate each step
    local step_count=${#steps[@]}
    for ((i=0; i<step_count; i++)); do
        local step_section="${steps[$i]}"
        local step_number=$(echo "$step_section" | grep -oP 'Step \K[0-9]+')
        
        # Extract step content (from this step to next step or section)
        local step_content=$(sed -n "/^${step_section}/,/^\#\#\#/p" <<< "$content" | head -n -1)
        
        validate_single_step "$step_number" "$step_content"
    done
}

# Validate a single step
validate_single_step() {
    local step_number="$1"
    local step_content="$2"
    
    local required_fields=(
        "Thought:"
        "Why:"
        "Action:"
        "Expected Output:"
        "Validation:"
        "Next Step:"
        "Fallback:"
    )
    
    for field in "${required_fields[@]}"; do
        if grep -q "$field" <<< "$step_content"; then
            log_success "Step $step_number: $field present"
            ((PASSED++))
        else
            log_error "Step $step_number: Missing field - $field"
        fi
        ((CHECKED++))
    done
    
    # Check Tool field (optional but recommended for data steps)
    if grep -q "Tool:" <<< "$step_content"; then
        local tool=$(grep "Tool:" <<< "$step_content" | head -1 | sed 's/.*Tool: *//')
        if [[ "$tool" != "None" ]]; then
            # Check for Tool Parameters if tool is not None
            if grep -q "Tool Parameters:" <<< "$step_content"; then
                log_success "Step $step_number: Tool Parameters present for $tool"
                ((PASSED++))
            else
                log_warning "Step $step_number: Tool specified but no Tool Parameters found"
            fi
        fi
        ((CHECKED++))
    fi
    
    # Check Status field
    if grep -q "Status:" <<< "$step_content"; then
        local status=$(grep "Status:" <<< "$step_content" | head -1 | sed 's/.*Status: *//')
        local valid_statuses=("pending" "completed" "failed" "skipped")
        if [[ " ${valid_statuses[*]} " =~ " ${status} " ]]; then
            log_success "Step $step_number: Status is valid - $status"
            ((PASSED++))
        else
            log_error "Step $step_number: Invalid Status - $status"
        fi
    else
        log_warning "Step $step_number: Status field missing (recommended)"
    fi
    ((CHECKED++))
    
    # Check Complexity field
    if grep -q "Complexity:" <<< "$step_content"; then
        local step_complexity=$(grep "Complexity:" <<< "$step_content" | head -1 | sed 's/.*Complexity: *//')
        local valid_complexities=("LOW" "MEDIUM" "HIGH")
        if [[ " ${valid_complexities[*]} " =~ " ${step_complexity} " ]]; then
            log_success "Step $step_number: Complexity is valid - $step_complexity"
            ((PASSED++))
        else
            log_error "Step $step_number: Invalid Complexity - $step_complexity"
        fi
    else
        log_warning "Step $step_number: Complexity field missing (recommended)"
    fi
    ((CHECKED++))
}

# Validate self-dialogue quality
validate_self_dialogue() {
    local content="$1"
    
    log_header "Checking Self-Dialogue Quality"
    
    # Check for dialogue components in steps
    local dialogue_components=("Thought:" "Analysis:" "Question:" "Answer:" "Conclusion:" "Decision:")
    
    for component in "${dialogue_components[@]}"; do
        local count=$(grep -c "$component" <<< "$content" || true)
        if [[ $count -gt 0 ]]; then
            log_success "Found $count instances of $component"
            ((PASSED++))
        else
            log_warning "No instances of $component found (may be intentional)"
        fi
        ((CHECKED++))
    done
}

# Validate tool integration
validate_tool_integration() {
    local content="$1"
    
    log_header "Checking Tool Integration"
    
    # Check if tools are used
    if grep -q "Tool:" <<< "$content"; then
        log_success "Tools are used in flow"
        ((PASSED++))
        
        # Validate tool calls
        local tool_calls=$(grep -c "Tool:" <<< "$content" || true)
        log_success "Found $tool_calls tool calls"
        
        # Check for valid tools
        local valid_tools=("file_read" "file_write" "code_analyzer" "web_search" "grep" "bash")
        while IFS= read -r line; do
            if [[ "$line" =~ Tool:\ *([^[:space:]]+) ]]; then
                local tool="${BASH_REMATCH[1]}"
                if [[ "$tool" != "None" && " ${valid_tools[*]} " != *" ${tool} "* ]]; then
                    log_warning "Potentially invalid tool: $tool"
                fi
            fi
        done <<< "$content"
    else
        log_warning "No tools used in flow (may be intentional for BASIC mode)"
    fi
    ((CHECKED++))
}

# Validate quality metrics
validate_quality_metrics() {
    local content="$1"
    
    log_header "Checking Quality Metrics"
    
    local required_metrics=(
        "Confidence Level:"
        "Agentic Simulation Quality:"
        "Tool Utilization:"
        "Step Completion Rate:"
        "Actionability Score:"
    )
    
    for metric in "${required_metrics[@]}"; do
        if grep -q "$metric" <<< "$content"; then
            log_success "Found: $metric"
            ((PASSED++))
        else
            log_error "Missing quality metric: $metric"
        fi
        ((CHECKED++))
    done
}

# Validate recommendations
validate_recommendations() {
    local content="$1"
    
    log_header "Checking Recommendations"
    
    if grep -q "## Recommendations" <<< "$content"; then
        log_success "Recommendations section found"
        ((PASSED++))
        
        # Check for recommendation items
        if grep -q "^\s*1\." <<< "$content"; then
            local rec_count=$(grep -c "^\s*[0-9]\+\." <<< "$content" || true)
            log_success "Found $rec_count recommendations"
            ((PASSED++))
        else
            log_warning "No numbered recommendations found"
        fi
        
        # Check for priority/impact/effort in recommendations
        local priority_check=$(grep -c "Priority:" <<< "$content" || true)
        local impact_check=$(grep -c "Impact:" <<< "$content" || true)
        
        if [[ $priority_check -gt 0 ]]; then
            log_success "Recommendations include Priority"
            ((PASSED++))
        else
            log_warning "Recommendations missing Priority field"
        fi
        
        if [[ $impact_check -gt 0 ]]; then
            log_success "Recommendations include Impact"
            ((PASSED++))
        else
            log_warning "Recommendations missing Impact field"
        fi
    else
        log_error "Recommendations section missing"
    fi
    ((CHECKED++))
}

# Validate fallback paths
validate_fallbacks() {
    local content="$1"
    
    log_header "Checking Fallback Paths"
    
    local fallback_count=$(grep -c "Fallback:" <<< "$content" || true)
    local step_count=$(grep -c "^### Step" <<< "$content" || true)
    
    if [[ $fallback_count -eq $step_count ]]; then
        log_success "All $step_count steps have Fallback defined"
        ((PASSED++))
    elif [[ $fallback_count -gt 0 ]]; then
        log_warning "Only $fallback_count of $step_count steps have Fallback defined"
    else
        log_error "No Fallback paths defined"
    fi
    ((CHECKED++))
}

# Validate for cot-reasoning specific requirements
validate_cot_resoning_requirements() {
    local content="$1"
    
    log_header "Checking cot-reasoning Specific Requirements"
    
    # Check if mode is STANDARD
    if grep -q "Agentic Mode: STANDARD" <<< "$content"; then
        log_success "Mode is STANDARD (recommended for cot-reasoning)"
        ((PASSED++))
        
        # For STANDARD, tools should be used
        if grep -q "Tool:" <<< "$content"; then
            log_success "Tools are used (required for STANDARD)"
            ((PASSED++))
        else
            log_error "STANDARD mode but no tools used"
        fi
        
        # Check tool utilization metric
        if grep -q "Tool Utilization:" <<< "$content"; then
            local utilization=$(grep "Tool Utilization:" <<< "$content" | sed 's/.*Tool Utilization: *//' | sed 's/%//')
            if [[ "$utilization" =~ ^[0-9]+(\.[0-9]+)?$ ]] && (( $(echo "$utilization > 50" | bc -l) )); then
                log_success "Tool Utilization is high: ${utilization}%"
                ((PASSED++))
            else
                log_warning "Tool Utilization could be higher: ${utilization}%"
            fi
        fi
    else
        log_warning "Mode is not STANDARD (not optimized for cot-reasoning)"
    fi
    
    ((CHECKED++))
}

# Validate JSON structure (for JSON output)
validate_json_structure() {
    local file="$1"
    
    log_header "Checking JSON Structure"
    
    if ! command -v jq &> /dev/null; then
        log_error "jq is required for JSON validation. Install with: sudo apt-get install jq"
        return
    fi
    
    # Try to parse JSON
    if jq empty "$file" 2>/dev/null; then
        log_success "Valid JSON structure"
        ((PASSED++))
    else
        log_error "Invalid JSON structure"
        return
    fi
    
    # Check required JSON fields
    local required_fields=("flow_id" "agentic_mode" "steps" "key_findings" "recommendations")
    
    for field in "${required_fields[@]}"; do
        if jq -e ".$field" "$file" > /dev/null 2>&1; then
            log_success "JSON field '$field' present"
            ((PASSED++))
        else
            log_error "JSON field '$field' missing"
        fi
        ((CHECKED++))
    done
    
    # Validate steps array
    local step_count=$(jq '.steps | length' "$file" 2>/dev/null || echo "0")
    if [[ $step_count -gt 0 ]]; then
        log_success "Found $step_count steps in JSON"
        ((PASSED++))
    else
        log_error "No steps found in JSON"
    fi
    ((CHECKED++))
}

# =============================================================================
# Main Validation Function
# =============================================================================

validate_file() {
    local file="$1"
    local is_json="$2"
    local verbose="$3"
    
    if [[ ! -f "$file" ]]; then
        log_error "File not found: $file"
        return 1
    fi
    
    log_header "Validating: $file"
    
    local content=$(cat "$file")
    
    # Markdown validation
    if [[ "$is_json" != "true" ]]; then
        validate_required_sections "$file" "$content"
        validate_flow_metadata "$content"
        validate_step_structure "$content"
        validate_self_dialogue "$content"
        validate_tool_integration "$content"
        validate_quality_metrics "$content"
        validate_recommendations "$content"
        validate_fallbacks "$content"
        validate_cot_resoning_requirements "$content"
    else
        validate_json_structure "$file"
    fi
    
    # Summary
    echo ""
    log_header "Validation Summary for: $file"
    echo -e "  Checks:     $CHECKED"
    echo -e "  Passed:     ${GREEN}$PASSED${NC}"
    echo -e "  Warnings:   ${YELLOW}$WARNINGS${NC}"
    echo -e "  Errors:     ${RED}$ERRORS${NC}"
    echo ""
    
    if [[ $ERRORS -eq 0 ]]; then
        echo -e "${GREEN}✓ All validations passed!${NC}"
        return 0
    else
        echo -e "${RED}✗ Validation failed with $ERRORS error(s)${NC}"
        return 1
    fi
}

# =============================================================================
# Main Script Execution
# =============================================================================

main() {
    # Parse arguments
    local mode="markdown"
    local verbose="false"
    local target=""
    
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -s|--single)
                mode="single"
                shift
                target="$1"
                shift
                ;;
            -d|--directory)
                mode="directory"
                shift
                target="$1"
                shift
                ;;
            -j|--json)
                mode="json"
                shift
                ;;
            -m|--markdown)
                mode="markdown"
                shift
                ;;
            -v|--verbose)
                verbose="true"
                shift
                ;;
            -h|--help)
                show_help
                ;;
            *)
                # Assume it's a positional argument
                if [[ -z "$target" ]]; then
                    target="$1"
                fi
                shift
                ;;
        esac
    done
    
    # If no target specified, show help
    if [[ -z "$target" ]]; then
        show_help
    fi
    
    # Check if target exists
    if [[ ! -e "$target" ]]; then
        log_error "Target does not exist: $target"
        exit 2
    fi
    
    log_header "${SKILL_NAME} - System Flow Validator v${VERSION}"
    echo -e "Mode:       $mode"
    echo -e "Target:     $target"
    echo -e "Verbose:    $verbose"
    echo ""
    
    # Process based on mode
    case "$mode" in
        "single")
            if [[ "$target" == *.json ]]; then
                validate_file "$target" "true" "$verbose"
            else
                validate_file "$target" "false" "$verbose"
            fi
            ;;
        "directory")
            local total_errors=0
            local total_checks=0
            local total_passed=0
            local files_processed=0
            
            while IFS= read -r -d "" file; do
                if [[ -f "$file" ]]; then
                    files_processed=$((files_processed + 1))
                    if [[ "$file" == *.json ]]; then
                        validate_file "$file" "true" "$verbose" || true
                    else
                        validate_file "$file" "false" "$verbose" || true
                    fi
                    total_errors=$((total_errors + ERRORS))
                    total_checks=$((total_checks + CHECKED))
                    total_passed=$((total_passed + PASSED))
                    ERRORS=0
                    CHECKED=0
                    PASSED=0
                    WARNINGS=0
                    echo ""
                fi
            done < <(find "$target" -type f \( -name "*.md" -o -name "*.json" \) -print0)
            
            log_header "Directory Validation Summary"
            echo -e "  Files:      $files_processed"
            echo -e "  Checks:     $total_checks"
            echo -e "  Passed:     ${GREEN}$total_passed${NC}"
            echo -e "  Errors:     ${RED}$total_errors${NC}"
            echo ""
            
            if [[ $total_errors -eq 0 ]]; then
                echo -e "${GREEN}✓ All files passed validation!${NC}"
                exit 0
            else
                echo -e "${RED}✗ $total_errors validation errors found${NC}"
                exit 1
            fi
            ;;
        "json")
            if [[ -f "$target" && "$target" == *.json ]]; then
                validate_file "$target" "true" "$verbose"
            else
                log_error "JSON validation requires a .json file"
                exit 2
            fi
            ;;
        "markdown")
            if [[ -f "$target" && "$target" == *.md ]]; then
                validate_file "$target" "false" "$verbose"
            else
                log_error "Markdown validation requires a .md file"
                exit 2
            fi
            ;;
        *)
            # Default: try to auto-detect
            if [[ "$target" == *.json ]]; then
                validate_file "$target" "true" "$verbose"
            else
                validate_file "$target" "false" "$verbose"
            fi
            ;;
    esac
    
    exit $?
}

# Run main function
main "$@"
