# Demo Script: Code Review

**Goal:** Show Copilot code review providing actionable, contextual feedback on the agent's PDP-001 PR.  
**Duration:** ~5 minutes  
**Context in talk:** The coding agent's pull request is open — time to review it with Copilot.

---

## Prerequisites

- [ ] PDP-001 PR is open (from Demo 2)
- [ ] Copilot code review enabled on the repo
- [ ] Copilot review should be pre-triggered before going on stage to save wait time

---

## Steps

### Step 1 — Navigate to the PR

Open the PR the coding agent created for PDP-001.

**What to say:**
> "The agent opened a PR. Before I merge it, I want to review it — but I can use Copilot to do the first pass."

---

### Step 2 — Request Copilot review

In the PR sidebar, under **Reviewers**, click the gear icon and select **Copilot**.

Or, if the "Review with Copilot" button appears at the top of the PR, click that.

**What to say:**
> "I request Copilot as a reviewer the same way I'd request a teammate."

---

### Step 3 — Walk through inline comments

Copilot should flag several issues in the agent's product.html. Common findings to highlight:

**Accessibility issues:**
- Missing `alt` text on the product emoji/image element
- Buttons without `aria-label` attributes for icon-only interactions
- Comment: "This is great — the agent wrote functional code but missed accessibility details that Copilot picked up."

**Edge case:**
- What happens when `?id=` is a non-integer (e.g., `?id=abc`)? `parseInt` returns `NaN`, the `find` returns `undefined`, and the 404 state handles it — but Copilot might flag this as worth a comment.

**Minor improvements:**
- SEO: `<title>` should be set before the product data loads (hydration order)
- Copilot might suggest adding a `rel="noopener"` to back links

**What to say:**
> "Copilot caught accessibility gaps the agent introduced. The agent wrote functional code — Copilot made it production-ready."

---

### Step 4 — Apply a fix in-place

Click **Apply fix** on one of the Copilot suggestions (e.g., the missing alt text fix).

**What to say:**
> "One click. The fix is applied directly to the PR. No need to leave the browser, no need to check out the branch locally."

---

### Step 5 — Merge the PR

Approve and merge the PR.

**What to say:**
> "The product detail page is now live. The agent wrote it, Copilot reviewed it, I approved it. That entire loop happened without me writing a single line of code."

---

## Fallback

If the Copilot review hasn't completed: open `pr-files/pr-review-notes.md` and walk through the expected findings manually as talking points.
