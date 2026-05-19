# Session 1 — Demo Setup Guide

Complete setup instructions for the **"Day in the Life"** keynote demos. This guide maps every demo to its source files, explains how to prepare the environment, and documents the reset workflow.

---

## Overview

Session 1 tells the story of a developer named **Alex** working through a sprint on the **TechMart** product team. Alex starts in the terminal, assigns a feature to the Copilot coding agent, reviews the PR, fixes a security vulnerability, uses a custom extension, and wraps up on GitHub.com. All demos use the **TechMart** static web app in [`demo-app/`](./demo-app/).

---

## File Map

### Demo 1 — Copilot CLI (`01-copilot-cli/`)

| File | Purpose |
|------|---------|
| `01-copilot-cli/demo-script.md` | Step-by-step commands to run live |
| `demo-app/` | The TechMart repo that CLI commands target |

**Setup:** Clone this repo locally. Run `gh extension install github/gh-copilot` if not already installed.

---

### Demo 2 — Coding Agent (`02-coding-agent/`)

| File | Purpose |
|------|---------|
| `02-coding-agent/demo-script.md` | Live walkthrough script |
| `02-coding-agent/sample-issue.md` | PDP-001 issue text (pre-staged as Issue #4) |
| `02-coding-agent/expected-pr/product.html` | Reference: what the agent should produce |
| `02-coding-agent/expected-pr/README.md` | Acceptance criteria checklist for the PR |
| `.github/copilot-instructions.md` | Coding standards the agent follows |

**Setup:**
1. Verify Issue #4 (PDP-001) is open with no assignee — run **Actions → Reset Session 1 Demo** if needed
2. Confirm Coding Agent is enabled: **Settings → Copilot → Coding agent**
3. Pre-assign the issue to Copilot before the talk to avoid live wait time

---

### Demo 3 — Code Review (`03-code-review/`)

| File | Purpose |
|------|---------|
| `03-code-review/demo-script.md` | Live walkthrough script |
| `03-code-review/pr-files/pr-review-notes.md` | Expected Copilot findings (fallback reference) |

**Setup:**
1. PDP-001 PR must be open (from Demo 2 — pre-assign the issue early)
2. Pre-trigger Copilot review on the PR before going on stage
3. Expected findings: accessibility issues (missing aria-label), SEO, minor edge cases

---

### Demo 4 — Code Quality (`04-code-quality/`)

| File | Purpose |
|------|---------|
| `04-code-quality/demo-script.md` | Live walkthrough script |
| `demo-app/app.js` | Contains the `renderSearchBanner()` XSS vulnerability |

**Setup:**
1. Ensure GHAS is enabled: **Settings → Code security → GitHub Advanced Security → Enable**
2. Enable Copilot Autofix: **Settings → Code security → Copilot Autofix → On**
3. After pushing the demo-app code, wait for CodeQL to scan (~5–10 min)
4. Verify the `js/xss` alert appears in **Security → Code scanning**

The vulnerable line in `app.js`:
```javascript
document.getElementById("search-results-title").innerHTML = `Showing results for: <strong>${query}</strong>`;
```

---

### Demo 5 — MCP Integration (`05-sdk/`)

| File | Purpose |
|------|---------|
| `05-sdk/demo-script.md` | Live walkthrough script |
| `05-sdk/MCP-SETUP.md` | **Complete setup guide** — install, VS Code config, pre-warm steps |
| `05-sdk/mcp-server/index.js` | MCP server exposing `search_runbooks` tool |
| `05-sdk/mcp-server/package.json` | MCP server dependencies |
| `05-sdk/sample-extension/runbooks.json` | Static runbook data (shared with MCP server) |
| `.vscode/mcp.json` | VS Code MCP server configuration (loads automatically) |

> **Note:** The GitHub App-based Copilot Extension approach was sunset November 10, 2025. [`EXTENSION-SETUP.md`](./05-sdk/EXTENSION-SETUP.md) is archived for reference only.

**Setup:**
1. `cd 05-sdk/mcp-server && npm install`
2. Open VS Code at the **repo root** (`nyc-dev-days/`) — required for `.vscode/mcp.json` to load
3. `Cmd+Shift+P` → **MCP: List Servers** → start `techmart-runbook` and accept any trust prompt
4. Verify `search_runbooks` appears in Copilot Chat tool list (enabled)
5. Test: `#search_runbooks rollback` returns runbook steps in Copilot Chat (Agent mode)

---

### Demo 6 — IDE (`06-ide/`)

| File | Purpose |
|------|---------|
| `06-ide/demo-script.md` | Live walkthrough script |
| `demo-app/app.js` | Target for completions, inline chat, and Copilot Edits |
| `demo-app/index.html` | Target for multi-file Copilot Edits (sorting UI) |

**Setup:**
1. Open `demo-app/` folder in VS Code
2. Verify Copilot extension is installed and authenticated (status bar icon green)
3. Verify JetBrains Copilot plugin is installed
4. Font size 18pt+ in editor, 140% zoom in VS Code

---

### Demo 7 — GitHub.com (`07-github-com/`)

| File | Purpose |
|------|---------|
| `07-github-com/demo-script.md` | Live walkthrough script |

**Setup:**
1. Navigate to this repo on GitHub.com
2. Verify Copilot Chat panel is accessible (Copilot icon in top-right nav)
3. Have PDP-001 PR merged and available for the summary demo

---

## Reset Workflow

Run **Actions → Reset Session 1 Demo** (30 min before going on stage):

| Step | Action |
|------|--------|
| 1 | Closes all open PRs labeled `demo` and deletes their branches |
| 2 | Deletes the `demo/pdp-001-product-detail-page` branch |
| 3 | Removes Copilot assignment from Issue #4 (PDP-001) |
| 4 | Removes `blocked` labels from any issues the sprint-impact workflow added |

---

## Pre-Talk Checklist (30 min before)

- [ ] **Actions → Reset Session 1 Demo** — run with all defaults
- [ ] `gh auth status` — CLI authenticated
- [ ] `gh extension list | grep copilot` — `gh copilot` extension installed
- [ ] Issue #4 (PDP-001) is open, no assignee, no `demo` label
- [ ] GHAS `js/xss` alert visible in **Security → Code scanning**
- [ ] `MCP: List Servers` → `techmart-runbook` is **Running**, `search_runbooks` tool enabled
- [ ] VS Code: `nyc-dev-days/` repo root open, Copilot extension active
- [ ] JetBrains: same repo open, Copilot plugin active
- [ ] Browser: logged in as demo GitHub account
- [ ] Sprint 1 project board open in a browser tab
- [ ] Actions tab open in a second browser tab
- [ ] Font 18pt+ terminal, 140% zoom VS Code
- [ ] Do Not Disturb enabled, Slack and email closed
- [ ] **Pre-assign Issue #4 to Copilot** (saves live wait time during Demo 2)
