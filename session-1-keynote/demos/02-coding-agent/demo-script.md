# Demo Script: GitHub Copilot Coding Agent

**Goal:** Show the Copilot coding agent autonomously turning Issue #4 (PDP-001) into a pull request.  
**Duration:** ~6 minutes  
**Context in talk:** Developer assigns the Product Detail Page issue to the agent instead of implementing it.

---

## Prerequisites

- [ ] Copilot Coding Agent enabled: **Repo Settings → Copilot → Coding agent → Enable**
- [ ] Issue #4 (PDP-001) is open with no assignee (run **Actions → Reset Session 1 Demo** to verify)
- [ ] `.github/copilot-instructions.md` is present in the repo
- [ ] Two browser tabs: one on the issue, one on the Actions tab
- [ ] **Pre-run option:** Assign the issue to Copilot before the talk so the run is ~80% complete when you demo it live

---

## Steps

### Step 1 — Show the issue

Navigate to Issue #4 in the TechMart repo on GitHub.com.

**What to say:**
> "Here's PDP-001 — the Product Detail Page. Clear description, specific acceptance criteria, explicit constraints: vanilla JS only, no new dependencies. This is what an 'agent-ready' issue looks like. Bounded scope. Measurable success. No architectural ambiguity."

Read one or two acceptance criteria aloud.

---

### Step 2 — Assign the issue to Copilot

Click **Assignees → Copilot** (the robot avatar in the assignee list).

Or leave a comment: `@copilot please implement this`

**What to say:**
> "That's all I do — assign it to Copilot. The agent picks it up, spins up a runner in GitHub Actions, and starts working. I can go review another PR or grab coffee."

---

### Step 3 — Show the GitHub Actions run in progress

Navigate to the **Actions** tab. Click the running job titled something like `Copilot coding agent: PDP-001`.

**What to say:**
> "You can watch it in real time. Every step is logged — it's not a black box."

Point out key steps:
- **Repo exploration:** "It read the directory structure, found `index.html`, `style.css`, and `app.js`."
- **Data access:** "It looked at the `PRODUCTS` array to understand what data is available."
- **Code generation:** "It created `product.html`, wired it into the existing JS, and linked it from the product cards."

---

### Step 4 — Show the opened Pull Request

Navigate to the **Pull Requests** tab. Open the PR opened by the coding agent.

**What to say:**
> "It opened a pull request with a description of what it built. Let me look at the diff."

Walk through the diff:
- New `product.html` file
- Changes to `app.js` to link product cards to the new page
- PR description that references the acceptance criteria

---

### Step 5 — Show `.github/copilot-instructions.md`

Navigate to `.github/copilot-instructions.md` in the repo.

**What to say:**
> "Here's why the agent wrote code that fits our style. Before it wrote a single line, it read this file — our team's coding contract. It says: vanilla JS only, CSS custom properties, STUB_INFO map format, no npm packages. The agent followed all of it. That's the difference between a generic code generator and a real team member."

---

### Step 6 — Transition

**What to say:**
> "The agent opened a PR. Now I need to review it — and yes, I can use Copilot to do that too."

---

## Fallback

If the agent is slow to start: show the `expected-pr/` reference files and explain what the agent is expected to produce. Use the pre-run approach (assign before the talk) to avoid live waits.
