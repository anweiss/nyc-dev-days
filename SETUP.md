# NYC Dev Days — Demo Setup Guide

This guide covers the full one-time setup for the TechMart demo environment that powers both sessions. Run these steps once before the event (or use the scripts in `scripts/setup/` to automate most of them).

---

## What gets created

| Artifact | Description |
|---|---|
| TechMart web app | Static HTML/CSS/JS store in `session-1-keynote/demos/demo-app/` (also in `session-2-workshop/`) |
| 15 custom labels | Domain + sprint + state labels for the sprint dependency demo |
| 5 sprint milestones | Sprint 1–5 with 2-week intervals |
| 24 GitHub Issues | Realistic product backlog with ticket IDs, acceptance criteria, and `## Depends On` dependency links |
| 5 GitHub Project boards | One board per sprint, linked to this repo |
| `sprint-impact-analysis` workflow | GitHub Agentic Workflow that fires when an issue is cancelled or delayed |
| `inspect-delay` prompt template | Reusable Copilot Chat prompt for ad-hoc impact analysis |

---

## Prerequisites

- **GitHub CLI** installed and authenticated: `gh auth login`
- **`jq`** installed (used by some scripts)
- **Copilot Coding Agent** enabled: **Repo Settings → Copilot → Coding agent**
- **GitHub Advanced Security** enabled on the repo (for the GHAS/Autofix demo)
- **GitHub Pages** enabled: **Settings → Pages → Branch: main / (root)**

For project boards, you also need:
```bash
gh auth refresh -s project,read:project
```
This opens a device-flow browser authorization — enter the one-time code at `https://github.com/login/device`.

---

## Step 1 — Create labels

```bash
bash scripts/setup/01-labels.sh anweiss/nyc-dev-days
```

Creates 15 labels: `cart`, `auth`, `accounts`, `promotions`, `orders`, `operations`, `support`, `platform`, `enhancement`, `blocked`, and `sprint-1` through `sprint-5`.

---

## Step 2 — Create sprint milestones

```bash
bash scripts/setup/02-milestones.sh anweiss/nyc-dev-days
```

Creates 5 milestones: Sprint 1–5 with 2-week due dates. Note the milestone numbers printed at the end — the issues script resolves them automatically by title.

---

## Step 3 — Create issues

> ⚠️ **Run this in a fresh repo with no existing issues.** Issues #1–24 must be sequential for the `sprint-impact-analysis` dependency graph to work correctly.

```bash
bash scripts/setup/03-issues.sh anweiss/nyc-dev-days
```

Creates all 24 issues with:
- Full body text (Overview, Acceptance Criteria, Depends On, Blocks sections)
- Appropriate labels (`cart,enhancement,sprint-1`, etc.)
- Sprint milestone assignments

### Issue map

| # | Ticket | Sprint | Key Dependencies |
|---|---|---|---|
| 1 | CART-001 | 1 | — |
| 2 | CART-002 | 1 | #1 |
| 3 | CART-003 | 1 | #2 · **Blocks #9, #11, #14** |
| 4 | PDP-001  | 1 | — |
| 5 | AUTH-001 | 2 | — |
| 6 | AUTH-002 | 2 | #5 |
| 7 | AUTH-003 | 2 | #5 |
| 8 | AUTH-004 | 2 | #5 |
| 9 | ACC-005  | 2 | #5, **#3** |
| 10 | ACC-006 | 2 | #5 |
| 11 | PROMO-007 | 3 | #5, **#3** · Blocks #12, #13 |
| 12 | PROMO-008 | 3 | #11 |
| 13 | PROMO-009 | 3 | #11, #3 |
| 14 | ORD-001   | 3 | **#3**, #5 · Blocks #15, #17, #19, #20 |
| 15 | ORD-002   | 3 | #14 |
| 16 | SEARCH-001 | 3 | #4 |
| 17 | ACC-012   | 4 | #14, #5 · Blocks #18 |
| 18 | OPS-009   | 4 | #14, #17 |
| 19 | NOTIF-001 | 4 | #14 |
| 20 | REVIEW-001 | 4 | #5, #14 |
| 21 | SUP-001   | 5 | — |
| 22 | SUP-002   | 5 | #5, #19 |
| 23 | PERF-001  | 5 | #4, #16 |
| 24 | A11Y-001  | 5 | — |

**The star of the show:** If Issue #3 (CART-003) slips, issues #9, #11, #12, #13, #14, #15, #17, #18, #19, #20 are directly or transitively impacted across Sprints 2–4.

---

## Step 4 — Create project boards

```bash
bash scripts/setup/04-projects.sh anweiss anweiss/nyc-dev-days
```

Creates 5 project boards, links them to the repo, adds a Priority field, and populates each board with its sprint issues. **Set Status and Priority values manually** via the project board UI after running the script (see the script output for the recommended values per issue).

### Recommended initial status assignments

| Issues | Status | Priority |
|---|---|---|
| #1, #2 | In Progress | 🔴 High |
| #3 | Blocked | 🔴 High |
| #4 | Todo | 🟡 Medium |
| #5, #6, #8 | Todo | 🔴 High |
| #7, #9, #10 | Todo | 🟡 Medium |
| #11, #14 | Todo | 🔴 High |
| #12, #17 | Blocked | 🔴 High |
| #13, #18 | Blocked | 🟡 Medium |
| #15, #19 | Todo | 🟡 Medium |
| #16, #23, #24 | Todo | 🟢 Low |
| #20, #21, #22 | Todo | 🟡 Medium |

---

## Step 5 — Verify the agentic workflow

The `sprint-impact-analysis` workflow file is already in `.github/workflows/`. Verify it's enabled:

1. Go to **Actions → Sprint Impact Analysis**
2. Click **Run workflow** → Issue number: `3`, Scenario: `cancelled`
3. Confirm the workflow starts and completes within ~60 seconds
4. Check that issues #9, #11, #14 received impact alert comments

If the workflow fails, check that **GitHub Models** is enabled for the repo (required for the AI-generated impact narrative).

---

## Step 6 — Verify GitHub Pages

1. Go to **Settings → Pages** — confirm source is `main` branch, root folder
2. Visit `https://anweiss.github.io/nyc-dev-days/` — TechMart should load
3. Test the XSS hook for Demo 4: `https://anweiss.github.io/nyc-dev-days/session-1-keynote/demos/demo-app/?search=test` — the search banner should appear

---

## Step 7 — Verify GHAS / Autofix

1. Confirm **GitHub Advanced Security** is enabled: **Settings → Code security**
2. Confirm **Copilot Autofix** is enabled: **Settings → Code security → Copilot Autofix → On**
3. After the first push, wait for CodeQL to scan (~5–10 min)
4. Go to **Security → Code scanning** — verify a `js/xss` alert on `app.js` in the demo-app

If no alert appears, manually trigger: **Security → Code scanning → Set up more scanners → CodeQL → Run workflow**.

---

## Pre-event checklist (30 min before)

- [ ] **Actions → Reset Session 1 Demo** — run the workflow to recreate fresh demo state
- [ ] `gh auth status` — CLI authenticated
- [ ] `gh extension list | grep copilot` — `gh copilot` extension installed
- [ ] Issue #4 (PDP-001) is open with no assignee
- [ ] GHAS alert visible in Security tab (`js/xss` on `app.js`)
- [ ] Custom `@runbook` extension deployed and responding
- [ ] VS Code: Copilot extension active
- [ ] Browser: logged in as demo GitHub account
- [ ] GitHub Pages URL loads TechMart correctly
- [ ] Sprint 1 project board open in a browser tab
- [ ] Actions tab open in a second browser tab
- [ ] Font size 18pt+ in terminal, 140% zoom in VS Code
- [ ] Do Not Disturb enabled

---

## Resetting between runs

### Session 1 reset
Run **Actions → Reset Session 1 Demo** with defaults. This will:
1. Close any open PRs labeled `demo`
2. Delete the `demo/product-detail-page` branch if it exists
3. Re-open Issue #4 (PDP-001) and remove any Copilot assignment
4. Remove `blocked` labels applied by the sprint-impact-analysis workflow

### Session 2 reset (sprint impact demo)
1. Re-open Issue #3 (CART-003) — click **Reopen issue**
2. Remove `blocked` label from issues #9, #11, #12, #13, #14, #15, #17, #18, #19, #20
3. Delete the sprint impact comments from those issues (or use **Actions → Reset Demo State**)
4. Reset Issue #3 milestone back to **Sprint 1**

---

## Adapting this for your own event

- Replace the `PRODUCTS` array and `STUB_INFO` map in `app.js` with your domain's features
- Issue numbers must stay sequential for the dependency graph to work — create issues in order
- The `sprint-impact-analysis.md` workflow reads `## Depends On` sections literally — keep that heading exact
- Sprint count and names are flexible — the workflow reads milestone data from live issues
