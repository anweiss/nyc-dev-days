# Presenter Guide — Session 2: The Agentic Developer Loop

## Session at a Glance

- **Duration:** 45 minutes (5 demos + discussion + Q&A)
- **Format:** Workshop — conversational, hands-on-friendly
- **Central narrative:** TechMart's Sprint 1 hits a dependency crisis; we show three escalating ways to handle it, culminating in a fully automated agentic workflow
- **Key moment:** Demo 2, Part C — closing Issue #35 live and watching 9 issues cascade in ~60 seconds

---

## Pre-Event Checklist (do the evening before)

### GitHub repo
- [ ] All 24 TechMart issues created and open (run `scripts/setup/03-issues.sh` if needed)
- [ ] Issue #35 (CART-003) is open and labeled `blocked`
- [ ] Issues #41, #43, #44, #45, #46, #47, #49, #50, #51, #52 have no cascade comments
- [ ] `sprint-impact-analysis.lock.yml` is present in `.github/workflows/`
- [ ] Agentic workflow is enabled on the repo (check repo Actions settings)
- [ ] Sprint 1 board shows CART-003 as Blocked

### Accounts & access
- [ ] Logged into GitHub with a Copilot-enabled account
- [ ] GitHub Enterprise Cloud demo org accessible (for Demo 5 governance settings)
- [ ] GitHub MCP server configured in VS Code (for Demo 4)
- [ ] Copilot Chat panel open and working in VS Code

### Browser setup
- [ ] Tab 1: Repository home
- [ ] Tab 2: Sprint 1 project board
- [ ] Tab 3: Issue #35 (CART-003)
- [ ] Tab 4: GitHub Actions → Sprint Impact Analysis
- [ ] Tab 5: Copilot Chat on GitHub.com
- [ ] Tab 6: GHEC org settings → Copilot

---

## Reset Between Runs

If you've run the cascade demo already:
1. Re-open Issue #35 → **Reopen issue**
2. Remove `blocked` labels from issues #41, #43, #44, #45, #46, #47, #49, #50, #51, #52
3. Delete cascade comments from those issues (look for comments from `github-actions[bot]`)
4. Restore Issue #35's milestone to "Sprint 1: Foundation & Core Shopping"

Or run the reset workflow (if configured): **Actions → Reset Demo Environment → Run workflow**

---

## Demo Flow

| # | Demo | Duration | Emphasis |
|---|---|---|---|
| 1 | Assistive vs. Agentic | 5 min | Conceptual shift, side-by-side comparison |
| 2 | Sprint Impact Cascade | 11 min | The centerpiece — 3 parts (chat, template, live trigger) |
| 3 | Building & Customizing Agents | 6 min | `copilot-instructions.md`, issue quality, session logs |
| 4 | MCP | 8 min | GitHub MCP in VS Code, broader ecosystem |
| 5 | Enterprise Governance | 5 min | Feature toggles, audit logs, IP protection |

Total demo time: ~35 min. Reserve 10 min for discussion + Q&A.

---

## Timing Notes

- Demo 2 is the longest and most visual — protect it. If you're running long, condense Demo 5 (it's mostly navigation through settings).
- Demo 2 Part C (the live cascade) takes ~60-90 seconds for the workflow to run. Use that time to narrate what's happening rather than going silent.
- If the workflow fails during the live run: switch to showing the pre-run cascade comments that should already exist on the impacted issues from your prep. Say: "Here's what it produced in my test run this morning."

---

## Backup Plans

| Failure | Recovery |
|---|---|
| Workflow doesn't trigger | Show a pre-screenshotted run from prep |
| Copilot Chat doesn't load | Show the output you captured in prep; paste as slide content |
| MCP tools unavailable | Demo GitHub MCP on GitHub.com instead of VS Code |
| GHEC org inaccessible | Walk through the settings with screenshots in the slide deck |

---

## Workshop Discussion Prompts

Use these to spark conversation during natural pauses:
- "What would your team name as the most repetitive, well-scoped engineering task right now?"
- "What's in your STUB_INFO equivalent — things that everyone knows not to change?"
- "If you could connect Copilot to one data source your team uses daily, what would it be?"
- "What's the governance question your security team would ask if you proposed enabling the coding agent tomorrow?"

---

## Post-Session Resources

Point attendees to:
- `SETUP.md` in the root — step-by-step to replicate the entire demo environment
- `.github/prompts/inspect-delay.prompt.md` — the reusable sprint impact template
- `.github/copilot-instructions.md` — the agent customization file they can copy as a starting point
