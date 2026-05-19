# Session 1 — Presenter Guide

**Session:** "A Day in the Life of a Developer with GitHub + AI"  
**Format:** Keynote · 45 minutes  
**Demo story:** Alex, a developer on the TechMart product team, spends a Monday shipping a feature with Copilot at every step.

---

## Before the event

1. Complete `SETUP.md` at the repo root — creates issues, labels, milestones, and project boards
2. Complete `demos/DEMO-SETUP.md` — verifies each demo's environment is ready
3. Run **Actions → Reset Session 1 Demo** 30 minutes before going on stage
4. **Pre-assign Issue #36 (PDP-001) to Copilot** — avoids a live wait during Demo 2

---

## The story arc

| Demo | Alex's day | What you show |
|---|---|---|
| CLI | Morning — checking what's in the sprint | `gh copilot suggest/explain` |
| Coding Agent | Delegates PDP-001 to the agent | Agent implements product detail page |
| Code Review | Reviews the agent's PR | Copilot flags accessibility issues |
| Code Quality | Fixes a GHAS XSS alert | Autofix proposes `textContent` replacement |
| MCP Integration | On-call asks Copilot about runbooks | MCP server returns runbook via tool call |
| IDE | Back in the editor, adds sorting to TechMart | Completions, inline chat, Copilot Edits |
| GitHub.com | End of day sprint check | Chat + PR summary + issue triage |

---

## Timing tips

- Keep Demo 2 (Coding Agent) brief on the "waiting" part — pre-assign the issue to avoid a live wait
- Demo 4 (GHAS) should be fast: 4 minutes max, all the setup is done in advance
- Demo 7 (GitHub.com) has 3 sub-demos — prioritize the Chat Q&A and PR summary if short on time

---

## Common issues and fixes

| Issue | Fix |
|---|---|
| Coding agent hasn't started | Pre-assign the issue 15 min before; show the "Copilot is working" indicator from the issue |
| GHAS alert not showing | Trigger CodeQL manually: Security → Run workflow; use a screenshot as fallback |
| MCP server not responding | Use `#search_runbooks rollback` to invoke explicitly; if still failing, open `runbooks.json` + `mcp-server/index.js` and walk through the anatomy |
| Copilot Chat slow on GitHub.com | Use the repo's README and `app.js` to narrate the answer manually |

---

## Key messages per demo

1. **CLI:** Copilot is in the terminal too — not just the editor
2. **Coding Agent:** You delegate, it delivers — your job is to define scope well
3. **Code Review:** AI augments human review; catches what the agent missed
4. **Code Quality:** Autofix closes the security loop — 70% of alerts, one click
5. **MCP Integration:** MCP lets teams expose internal knowledge to Copilot — runbooks, APIs, internal systems
6. **IDE:** From completions to multi-file edits — the spectrum of IDE intelligence
7. **GitHub.com:** Copilot is repo-aware everywhere on github.com

---

## Closing call to action

Three things to encourage the audience to do this week:
1. Enable GitHub Copilot for their team (or trial it)
2. Assign one well-scoped issue to the Copilot coding agent
3. Build an MCP server if they have internal tooling worth exposing to Copilot
