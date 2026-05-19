# Demo Script: GitHub.com — Copilot Chat, PR Summaries, Issue Triage

**Goal:** Show Copilot Chat on GitHub.com, PR summary generation, and issue triage.  
**Duration:** ~4 minutes  
**Context in talk:** End of day — reviewing TechMart's open issues and PRs on github.com.

---

## Prerequisites

- [ ] Navigate to the nyc-dev-days repo on GitHub.com before going on stage
- [ ] The PDP-001 PR (from Demo 2/3) is merged
- [ ] Copilot Chat panel accessible from the top-right nav icon

---

## Steps

### Step 1 — Copilot Chat on GitHub.com (repo-aware Q&A)

Click the **Copilot** icon in the top-right navigation on GitHub.com.

Attach the repo as context (click `+` → "This repository").

Ask:
```
What are the biggest risks to our Sprint 1 delivery? Look at the open issues and their dependencies.
```

**What to say:**
> "Copilot on GitHub.com is repo-aware. It can read our code, our issues, our history. I'm asking it to reason about our sprint risk — without me having to copy-paste anything into a separate AI tool."

Copilot should identify Issue #35 (CART-003 is blocked) as the primary risk and mention that issues #41, #43, and #46 in later sprints depend on it.

---

### Step 2 — PR Summary

Navigate to the merged PDP-001 PR.

In the PR description area, click **Copilot → Generate summary** (if not already present).

**What to say:**
> "Copilot can auto-generate pull request descriptions. For the PDP-001 PR our agent opened, let me have Copilot summarize the full diff for a teammate who wasn't in the loop."

Show the generated summary — it should describe the new product.html page, the routing logic, and what acceptance criteria were met.

---

### Step 3 — Issue Triage

Navigate to the **Issues** tab. Click **New issue**.

Type a rough idea in the body:
```
We need a way for users to compare two products side by side before buying. Something like a compare button on each card that adds it to a comparison tray at the bottom of the page. Max 3 products.
```

Then ask Copilot to help structure it:
```
@copilot help me write this as a proper product backlog issue with acceptance criteria and labels
```

**What to say:**
> "Rough ideas become structured issues. That structure is what makes the coding agent effective — and what makes sprint planning actually productive."

---

## Transition to close

**What to say:**
> "That's the full day. Terminal to GitHub.com. Every surface. Same codebase. Let me wrap up."

---

## Fallback

If Copilot Chat is slow: show the sprint board and Issue #35 manually, walk through the dependency chain in the talking points. Use `gh issue list` in the terminal as an alternative to the GitHub.com chat.
