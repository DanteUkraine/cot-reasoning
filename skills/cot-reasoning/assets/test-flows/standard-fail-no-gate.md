## Reasoning Flow: Deploy check

**Reasoning Mode:** STANDARD
**Thinking Type:** SYSTEMATIC
**Complexity:** MEDIUM
**Steps:** 1

### Reasoning Steps

### Step 1: Check Service
**Thought:** Service must be verified after deploy
**Why:** Deploys need verification
**Action:** Curl the health endpoint
**Tool:** shell-execution
**Tool Parameters:** {"command": "curl -f /health"}
**Input:** Deployed service URL
**Expected Output:** Health status
**Output Schema:** {"status": "string"}
**Validation:** Endpoint returns 200
**Dependencies:** None
**Next Step:** None
**Fallback:** Check logs
**Complexity:** LOW

### Key Findings
1. **Finding 1:** Service healthy - Impact: High - Confidence: 9/10

### Recommendations
1. **Action 1:** Monitor for 30 minutes - Priority: Medium - Impact: early detection
