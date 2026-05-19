# Session 2 — Demo Run-of-Show

This document is the master reference for all demos in the workshop. Demos are designed to be hands-on and interactive — invite the audience to follow along where possible.

---

## Narrative Thread

> **Theme:** Show the full agentic developer loop — from understanding the assistive-to-agentic shift, through building and customizing agents, connecting them to enterprise systems, and governing the whole thing at scale.

**Demo Repo:** `anweiss/nyc-dev-days` (this repo)  
**Demo App:** `session-2-workshop/demos/demo-app/` — TechMart  
**Pre-staged Issues:** the latest open `bug + demo + session-2` and `enhancement + demo + session-2` issues, recreated each time **Reset Session 2 Demo** is run. Find them with:

```bash
gh issue list --repo anweiss/nyc-dev-days --label "demo" --label "session-2" --state open
```

---

## Demo Order & Timing

| # | Demo | Duration | Key Concept |
|---|------|----------|-------------|
| 1 | [Agentic vs. Assistive](./01-agentic-vs-assistive/) | ~5 min | The conceptual shift |
| 2 | [Agentic Workflows](./02-agentic-workflows/) | ~5 min | Natural language as pipeline triggers |
| 3 | [Coding Agents](./03-coding-agents/) | ~6 min | Customizing agents with instructions |
| 4 | [MCP Integration](./04-mcp/) | ~7 min | Connecting to external systems |
| 5 | [Enterprise Governance](./05-enterprise-governance/) | ~7 min | Policies, audit, control |

**Total demo time: ~30 min** | **Hands-on workshop: ~7 min** | **Q&A: ~8 min**

---

## Pre-Demo Setup Checklist

- [ ] **Actions → Reset Session 2 Demo** — run the workflow (resets issues, labels, PRs)
- [ ] `gh issue list --repo anweiss/nyc-dev-days --label "demo" --label "session-2" --state open` — verify the pre-staged bug + feature issues are open (numbers vary; recreated by each reset run)
- [ ] Open `session-2-workshop/demos/demo-app/index.html` locally (or via GitHub Pages) — confirm TechMart loads
- [ ] VS Code open at the **repo root** (`nyc-dev-days/`) so `.vscode/mcp.json` loads, with Copilot extension active
- [ ] Browser: logged into github.com on demo account
- [ ] MCP server configured (see `04-mcp/mcp-config-example.json`)
- [ ] GitHub Enterprise org available for Demo 5
- [ ] Terminal: 18pt font, zoom 150%
- [ ] Audience clone URL ready: `git clone https://github.com/anweiss/nyc-dev-days.git`

---

## Workshop Interaction Points

- **After Demo 1:** "How many of you have used Copilot in assistive mode? Keep your hand up if you've tried the coding agent."
- **After Demo 3:** "Take 2 minutes: What would you put in your team's `.github/copilot-instructions.md`? Write down three things."
- **After Demo 4:** "What's one external system you'd connect to Copilot via MCP first? Shout it out."
- **Hands-on:** Direct attendees to `ATTENDEE-GUIDE.md` for self-paced steps with the demo app.
- **Close:** "What's one thing you'll try this week?" (go around the room or take a few answers)

---

## Hands-On Workshop Setup

Attendees follow along with TechMart:

```bash
git clone https://github.com/anweiss/nyc-dev-days.git
cd nyc-dev-days
# Open the repo root in VS Code so `.vscode/mcp.json` is picked up
# TechMart is a static HTML/CSS/JS app — open `session-2-workshop/demos/demo-app/index.html`
# directly, or browse it live at https://anweiss.github.io/nyc-dev-days/session-2-workshop/demos/demo-app/
```

See `session-2-workshop/ATTENDEE-GUIDE.md` for the full guided exercises.

