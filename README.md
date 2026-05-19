# NYC Dev Days 2026 — Presentation Repository

This repository contains all speaker materials for two sessions at **NYC Dev Days 2026**, covering GitHub Copilot's agentic AI capabilities across the full software development lifecycle.

Both sessions share a unified demo story: **TechMart** — a fictional e-commerce store with a 24-issue sprint backlog and a critical dependency crisis that unfolds across the demos. See [`SETUP.md`](./SETUP.md) to set up the full demo environment.

---

## Sessions at a Glance

### 🎤 Session 1 — Keynote (45 min)
**"A Day in the Life of a Developer with GitHub + AI"**

GitHub is infusing Agentic AI into the entire Software Development Lifecycle. From brainstorming new ideas, implementing a plan, crafting new code, reviewing code reviews, releasing software, and bringing insights back to the development team — see how GitHub Copilot is being reimagined to boost productivity across software teams.

**Key surfaces covered:**
| # | Surface | Description |
|---|---------|-------------|
| 1 | Copilot CLI | `gh copilot` — natural language commands in the terminal |
| 2 | Coding Agent | Autonomous issue-to-PR agent in GitHub Actions |
| 3 | Code Review | AI-powered pull request review with inline suggestions |
| 4 | Code Quality | Autofix, security scanning, and GHAS integration |
| 5 | SDK | Building custom Copilot Extensions with the Extensions SDK |
| 6 | IDE | VS Code & JetBrains: inline chat, completions, multi-file edits |
| 7 | GitHub.com | Chat, PR summaries, issue triage on GitHub.com |

📁 [`session-1-keynote/`](./session-1-keynote/)

---

### 🛠️ Session 2 — Workshop (60 min)
**"The Agentic Developer Loop"**
**Speaker:** Andrew Weiss (Field CTO, Regulated Industries)

A hands-on deep dive into GitHub's agentic AI capabilities — from the conceptual shift from assistive to agentic AI, through building the `sprint-impact-analysis` automated cascade, to customizing agents, connecting them via MCP, and governing them at enterprise scale.

**Demos:**
1. **Assistive vs. Agentic** — side-by-side comparison on a TechMart feature task
2. **Sprint Impact Cascade** — cancel CART-003, watch 9 downstream issues auto-notified in ~60 seconds via `sprint-impact-analysis`
3. **Building & Customizing Agents** — `copilot-instructions.md`, session logs, structured issues
4. **MCP** — GitHub MCP in VS Code + GitHub.com; the broader MCP ecosystem
5. **Enterprise Governance** — GHEC feature toggles, model selection, IP protection, audit logs

📁 [`session-2-workshop/`](./session-2-workshop/)

---

## The TechMart Demo Story

Both sessions use **TechMart** as their shared demo project — a static HTML/CSS/JS e-commerce store with a realistic sprint backlog.

### The Dependency Crisis
Issue **#3 CART-003** (Cart API Backend Integration) is blocked in Sprint 1. It is a dependency for 9 other issues across Sprints 2–5:

```
CART-003 (#3)
├── Wishlist (#9) — Sprint 2
├── Promo Engine (#11) — Sprint 3
│   ├── Coupon Validation (#12)
│   └── Flash Sale (#13)
└── Order Service (#14) — Sprint 3
    ├── Order Confirmation (#15)
    ├── Order History (#17) — Sprint 4
    │   ├── Return Requests (#18)
    │   └── Order Analytics (#19)
    └── Fulfillment (#20)
```

The `sprint-impact-analysis` agentic workflow detects this cascade automatically when CART-003 is closed as "not planned."

### Setup

See [`SETUP.md`](./SETUP.md) for the complete one-time environment setup (labels, milestones, issues, project boards, workflow verification).

---

## Repository Structure

```
nyc-dev-days/
├── README.md
├── SETUP.md                          # One-time demo environment setup guide
├── .github/
│   ├── copilot-instructions.md       # TechMart conventions for the coding agent
│   ├── prompts/
│   │   └── inspect-delay.prompt.md  # Reusable sprint impact analysis template
│   └── workflows/
│       ├── sprint-impact-analysis.md     # gh-aw source — the cascade workflow
│       └── sprint-impact-analysis.lock.yml  # Compiled lock file (gh aw compile)
├── scripts/setup/
│   ├── 01-labels.sh     # Create 15 sprint labels
│   ├── 02-milestones.sh # Create 5 sprint milestones
│   ├── 03-issues.sh     # Create all 24 TechMart backlog issues
│   └── 04-projects.sh   # Create 5 sprint project boards
├── session-1-keynote/
│   ├── outline.md              # Full talk outline with timing
│   ├── talking-points.md       # Detailed talking points per section
│   ├── PRESENTER-GUIDE.md      # Pre-event checklist and run-of-show
│   └── demos/
│       ├── DEMO-SETUP.md       # Comprehensive setup guide & reset steps
│       ├── demo-app/           # TechMart static HTML/CSS/JS store
│       ├── 01-copilot-cli/
│       ├── 02-coding-agent/
│       ├── 03-code-review/
│       ├── 04-code-quality/
│       ├── 05-sdk/
│       ├── 06-ide/
│       └── 07-github-com/
└── session-2-workshop/
    ├── outline.md
    ├── talking-points.md
    ├── PRESENTER-GUIDE.md
    ├── ATTENDEE-GUIDE.md
    └── demos/
        ├── demo-app/               # TechMart (same as session 1)
        ├── 01-agentic-vs-assistive/
        ├── 02-agentic-workflows/
        ├── 03-coding-agents/
        ├── 04-mcp/
        └── 05-enterprise-governance/
```

---

## Quick Reference

| Term | What it means |
|------|--------------|
| **Copilot CLI** | `gh copilot` — the GitHub Copilot CLI agent |
| **Coding Agent** | GitHub Copilot coding agent — autonomous, works on issues/PRs via GitHub Actions |
| **MCP** | Model Context Protocol — connects Copilot agents to external tools and data sources |
| **`copilot-instructions.md`** | `.github/copilot-instructions.md` — repo-level file that customizes Copilot behavior |
| **Copilot Extensions SDK** | SDK for building custom chat participants and agents in Copilot |
| **GHEC/GHES** | GitHub Enterprise Cloud / GitHub Enterprise Server |

---

## Event Details

- **Event:** GitHub Agentic DevDay NYC
- **Date:** Wednesday, May 20, 2026
- **Time:** 10:00 AM – 2:00 PM ET
- **Venue:** Microsoft NYC – 11 Times Square, New York, NY 10036
- **Landing page:** https://gh.io/ghagenticdevdaynyc0520
- **Series page:** https://gh.io/ghagenticdevdayseries
- **Marketing issue:** [github/amer-regional-marketing#1012](https://github.com/github/amer-regional-marketing/issues/1012)

### Agenda

| Time | Session |
|------|---------|
| 10:00–10:05 | Welcome & opening |
| 10:00–10:45 | **Session 1 — Keynote (45 min):** A Day in the Life of a Developer with GitHub + AI |
| 10:45–11:45 | **Session 2 — Workshop (60 min):** The Agentic Developer Loop *(this repo)* |
| 11:45–13:00 | Networking lunch |
| 13:00–14:00 | **Session 3 — Workshop (45 min):** GitHub Next: Future of Agentic Development |

> This repo carries materials adapted from [`beardofedu/chicago-dev-days`](https://github.com/beardofedu/chicago-dev-days) for the New York stop of the GitHub Agentic DevDay series.

---

*Prepared for NYC Dev Days 2026 · GitHub*
