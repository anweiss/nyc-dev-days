# Demo Script: The Sprint Impact Cascade

**Goal:** Show three escalating ways to analyze and automate sprint dependency impact using the TechMart backlog.  
**Duration:** ~11 minutes (the centerpiece demo of Session 2)  
**Context in talk:** CART-003 (Issue #35) is cancelled — watch the cascade happen automatically.

---

## Prerequisites

- [ ] All 24 TechMart issues created (run `scripts/setup/03-issues.sh`)
- [ ] `sprint-impact-analysis.md` agentic workflow present in `.github/workflows/`
- [ ] Issue #35 (CART-003) is **open** — reset it if needed
- [ ] `blocked` labels removed from issues #41, #43, #44, #45, #46, #47, #49, #50, #51, #52
- [ ] Sprint impact comments deleted from those issues
- [ ] Copilot Chat on GitHub.com accessible
- [ ] Two browser tabs: one on the Issues list, one on Actions

---

## Part A — Ad-hoc Chat Analysis (~4 min)

### Step 1 — Open Copilot Chat on GitHub.com

Navigate to the repo → click the **Copilot** icon (top right) → attach "This repository" as context.

**What to say:**
> "Let me start with the most direct question a product manager would ask: 'What happens to our roadmap if CART-003 doesn't ship?'"

### Step 2 — Ask the impact question

Paste:
```
Issue #35 CART-003 is currently blocked and might not ship in Sprint 1.
Looking at the issue bodies and their "Depends On" sections, which other
issues would be impacted? Group your answer by sprint and tell me which
issues are directly vs transitively blocked.
```

**Expected response:** Copilot reads the issue bodies, identifies the dependency chain, and returns a sprint-grouped breakdown: Sprint 2 loses #41 (Wishlist), Sprint 3 loses #43 (Promo Engine) and #46 (Orders), etc.

### Step 3 — Ask a follow-up

```
If we accept that #35 slips to Sprint 2, is there anything the Sprint 1
team could start work on that doesn't require the Cart API to be ready?
```

**Expected:** Copilot identifies #36 PDP-001 and #56 A11Y-001 as work that can proceed independently.

**What to say:**
> "No workflow, no custom tooling — just Copilot reading real issue data and reasoning about it. Powerful, but not repeatable. If the product manager asks the same question next week, we start from scratch. That's what the prompt template solves."

---

## Part B — Structured Prompt Template (~3 min)

### Step 4 — Show the prompt template

Navigate to `.github/prompts/inspect-delay.prompt.md` in the repo.

**What to say:**
> "This is our reusable impact analysis template. Fill in the brackets, paste into any Copilot Chat session with the repo attached, and get the same structured 5-section report every time."

Fill in the template for CART-003:
```
Issue **#35 — CART-003: Cart API Backend Integration** needs to be **cancelled entirely**.
```

### Step 5 — Run the template

Paste the filled-in template into Copilot Chat.

**Expected output:** A structured report with:
- **Blast radius** — table of all 9 impacted issues with sprint and dependency type
- **Sprint-by-sprint impact** — what Sprint 2, 3, 4 each lose
- **Critical path** — `#35 → #46 → #49 → #50` as the longest chain
- **Recommendations** — three concrete options
- **Quick wins** — #36 PDP-001, #56 A11Y-001 can proceed

**What to say:**
> "Now any team member can produce this report for any issue. It's repeatable, standardized, and consistent. This is the difference between ad-hoc AI and structured AI. But we can go one step further — what if this happened *automatically* when we cancelled the issue?"

---

## Part C — Live Automated Cascade (~4 min)

### Step 6 — Set the scene

Navigate to Issue #35 and show the sprint board for Sprint 1. Point out that CART-003 is Blocked.

**What to say:**
> "It's Sprint 1 planning. CART-003 has been waiting 3 weeks on the backend team to provision an API endpoint. The decision has been made: we're cancelling this sprint item."

### Step 7 — Close Issue #35 as "not planned"

On Issue #35, click **Close issue → Close as not planned**.

**What to say:**
> "In a traditional workflow, someone would manually trace every dependency, post individual comments, update the board. What you're about to see is that entire cascade — triggered automatically."

### Step 8 — Watch the workflow run

Click into **Actions → Sprint Impact Analysis**.

Open the running job and watch the log:
- `Fetched 21 open issues`
- `Building dependency graph...`
- `Impacted issues found: #41, #43, #44, #45, #46, #47, #49, #50, #51, #52`
- `Notified #41`... `Notified #46`...

**What to say:**
> "9 issues across 4 sprints. 60 seconds. Triggered by a single issue close."

### Step 9 — Show the impact comments

Navigate to these issues in sequence:
- **#41 Wishlist** (Sprint 2, direct): "Cannot save wishlist items without the Cart API"
- **#46 Order Service** (Sprint 3, direct): "Cannot create orders without a server-side cart"
- **#49 Order History** (Sprint 4, transitive): "Order history has no data if orders can never be placed"

### Step 10 — Show the workflow summary

Go to the completed Actions run → click **Summary**.

Show the impact table + AI-generated narrative.

**What to say:**
> "The dependency graph is computed deterministically — the AI only writes the human-readable narrative. That's the key design principle: trustworthy automation, with AI handling the communication layer."

---

## Reset Instructions

To re-run Part C:
1. Re-open Issue #35 (click **Reopen issue**)
2. Remove `blocked` label from issues #41, #43, #44, #45, #46, #47, #49, #50, #51, #52
3. Delete the sprint impact comments from those issues
4. Reset Issue #35 milestone back to Sprint 1
