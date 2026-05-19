# Session 1 — Demo Run-of-Show

This document is the master reference for all demos in the keynote. Demos run in sequence and tell a single narrative story about a developer's day.

---

## Narrative Thread

> **Scenario:** You are a developer named "Alex" starting a Monday morning. There's a new feature request — adding a rate-limiting endpoint to a Node.js API. You'll follow Alex's day from the terminal all the way to GitHub.com.

---

## Demo Order & Timing

| # | Demo | Duration | Transition |
|---|------|----------|------------|
| 1 | [Copilot CLI](./01-copilot-cli/) | ~6 min | "Let me assign this to an agent" |
| 2 | [Coding Agent](./02-coding-agent/) | ~6 min | "Let's review what it built" |
| 3 | [Code Review](./03-code-review/) | ~5 min | "Copilot flagged a security concern" |
| 4 | [Code Quality](./04-code-quality/) | ~4 min | "What if we need something custom?" |
| 5 | [SDK / Extensions](./05-sdk/) | ~5 min | "Back to the editor" |
| 6 | [IDE](./06-ide/) | ~6 min | "Let's wrap up the day on GitHub.com" |
| 7 | [GitHub.com](./07-github-com/) | ~4 min | → Close |

**Total demo time: ~36 min**

---

## Demo Application

All demos use the **DevDay Task API** — a fictional Node.js REST API in [`demo-app/`](./demo-app/). The app intentionally contains code-quality issues (missing error handling, SQL injection) that are surfaced during demos 3 and 4.

For detailed file mappings, environment setup, and the reset workflow, see **[`DEMO-SETUP.md`](./DEMO-SETUP.md)**.

---

## Pre-Demo Setup Checklist

Complete ALL of these before going on stage:

- [ ] `gh auth status` — confirm GitHub CLI is authenticated
- [ ] `gh copilot --version` — confirm Copilot CLI extension is installed
- [ ] Browser: github.com logged in as demo account
- [ ] VS Code: Copilot extension installed and active (check status bar)
- [ ] JetBrains: Copilot plugin installed and active
- [ ] Demo repo forked and cloned locally
- [ ] Demo issue pre-created on the repo (for Coding Agent demo)
- [ ] A PR already open (for Code Review demo — pre-triggered to save live wait time)
- [ ] GHAS enabled on the demo org with at least one open alert
- [ ] Custom Copilot Extension deployed and registered in the demo org
- [ ] Zoom level: 150% in terminal, 140% in VS Code for readability at the back of the room
- [ ] Terminal font size: 18pt minimum
- [ ] Disable notifications on Mac (`Do Not Disturb` ON)
- [ ] Close Slack, email, and other chat apps

---

## Fallback Strategy

If any demo fails live, each demo folder contains a `demo-script.md` with a **Fallback** section. Options include:
- Pre-recorded screen capture (keep in `~/Desktop/demo-backups/`)
- Screenshots embedded in the script
- "Explain the concept" pivot using the talking points

---

## Demo Account Details

> ⚠️ Keep credentials out of this file. Store in your password manager.

- GitHub username: `[your-demo-account]`
- Demo org: `[your-demo-org]`
- Demo repo: `[your-demo-repo]`

---

## Audience Interaction Points

- **After Demo 1 (CLI):** "Who here uses the terminal every day? Now imagine never Googling a command again."
- **After Demo 2 (Agent):** "How many of you have issues sitting in your backlog right now that haven't been touched in weeks? This is for those."
- **After Demo 4 (Quality):** "Security reviews blocking your deploys? This is what it looks like when AI closes that gap."
