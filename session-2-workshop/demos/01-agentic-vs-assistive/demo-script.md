# Demo Script: Assistive vs. Agentic

**Goal:** Make the conceptual shift concrete with a side-by-side comparison.  
**Duration:** ~5 minutes  
**Context in talk:** Show the same TechMart task completed two different ways.

---

## Prerequisites

- [ ] VS Code open with TechMart demo-app
- [ ] A suitable TechMart enhancement issue ready (e.g., "Add a rating sort option to the filter bar")

---

## Steps

### Step 1 — Assistive approach (inline chat)

Open `app.js` in VS Code. Highlight the `filterProducts` function.

Press `Cmd+I`:
```
Add a sort option so users can sort products by price low-to-high, price high-to-low, and highest rated
```

Walk through the interaction:
- Copilot proposes a `sortProducts` function
- You iterate: "Also update the filter bar in index.html to add a sort dropdown"
- You accept each file individually
- Each step requires your attention and judgment

**What to say:**
> "This is assistive AI. I'm in the loop at every step. I describe the change, Copilot suggests, I accept or refine. It's faster than writing from scratch, but I'm still driving."

---

### Step 2 — Agentic approach (coding agent)

Close VS Code. Navigate to GitHub.com and find the pre-created issue for the same task (e.g., "Add product sort to filter bar" with full acceptance criteria).

Assign the issue to Copilot.

**What to say:**
> "This is agentic. I define the outcome — clear acceptance criteria, bounded scope — and I delegate. The agent reads the instructions file, explores TechMart's codebase, and opens a PR. I review the output. I'm in the loop at the start and the end. The middle is automated."

Point out that while the agent is working, you can do something else — attend a meeting, work on a different issue, take a break.

---

### Step 3 — Discuss the tradeoffs

| | Assistive | Agentic |
|---|---|---|
| Human attention | Every step | Start + End |
| Best for | Exploration, learning, nuanced decisions | Well-scoped, routine, clear-criteria tasks |
| Iteration loop | Fast within a session | Async — review when it's done |
| Audit trail | Chat history | Full session log in Actions |

**What to say:**
> "Neither is always better. Assistive is better for exploration, learning, and nuanced decisions. Agentic is better for well-scoped, routine work where the path is clear. The skill is knowing which to use — and writing issues clear enough to leverage the agentic approach."
