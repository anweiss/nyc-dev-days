# Session 2 Outline — "The Agentic Developer Loop"

**Format:** Workshop  
**Duration:** 45 minutes  
**Goal:** Give developers a deep, practical understanding of GitHub's agentic AI capabilities through the TechMart sprint dependency story — from the conceptual shift to hands-on agent customization, MCP integration, and enterprise governance.

---

## Timing Breakdown

| Time | Section | Mode |
|------|---------|------|
| 0:00–3:00 | Opening: The Shift Has Already Happened | Talk |
| 3:00–8:00 | Demo 1: Assistive vs. Agentic | Demo |
| 8:00–19:00 | Demo 2: The Sprint Impact Cascade | Demo |
| 19:00–25:00 | Demo 3: Building & Customizing Agents | Demo |
| 25:00–33:00 | Demo 4: MCP — Connecting Agents to Everything | Demo |
| 33:00–38:00 | Demo 5: Enterprise Governance | Demo |
| 38:00–41:00 | Synthesis: The Agentic Developer Loop | Talk |
| 41:00–45:00 | Workshop Discussion + Q&A | Interactive |

---

## Section 1 — Opening: The Shift Has Already Happened (0:00–3:00)

**Goal:** Establish that agentic AI is live now, not a roadmap item.

- Assistive AI = AI that responds when you ask (completions, inline chat, explain commands)
- Agentic AI = AI that acts, reasons, plans, and iterates without your hands on the keyboard for every step
- GitHub's bet: agents that are repo-native, governed by your org's policies, and auditable at every step
- Today's session: understanding the difference, building agents for your team, connecting them to your systems, governing them at scale

---

## Section 2 — Demo 1: Assistive vs. Agentic (3:00–8:00)

**Goal:** Make the conceptual shift concrete with a side-by-side comparison.

- Show the same task (add a feature to TechMart) completed two ways:
  - Assistive: Copilot inline chat in VS Code — you prompt every step
  - Agentic: assign the issue to the coding agent — you define and review
- The key difference: assistive requires human-in-the-loop at every step; agentic requires human at the *start* (define task) and *end* (review output)
- Introduce the "agentic loop": observe → plan → act → verify → repeat

📄 See [`demos/01-agentic-vs-assistive/`](./demos/01-agentic-vs-assistive/)

---

## Section 3 — Demo 2: The Sprint Impact Cascade (8:00–19:00)

**Goal:** Show the sprint-impact-analysis agentic workflow in action — the centerpiece demo.

**The story:** It's Sprint 1 planning. CART-003 (Issue #3) has been waiting 3 weeks on backend API provisioning. The team decides to cancel this sprint item. One issue close triggers a cascade: 9 issues across 4 sprints are automatically flagged and notified.

### Part A — Ad-hoc Chat Analysis (8:00–12:00)
- Open Copilot Chat on GitHub.com with the repo attached
- Ask: "What happens if CART-003 doesn't ship this sprint? Look at the issue bodies and their Depends On sections."
- Copilot traces the dependency chain and groups by sprint
- This is the unstructured version — powerful but not repeatable

### Part B — Structured Prompt Template (12:00–15:00)
- Show `.github/prompts/inspect-delay.prompt.md`
- Fill in the template for CART-003, paste into Copilot Chat
- Output: 5-section structured report (blast radius, sprint impact, critical path, recommendations, quick wins)
- This is repeatable — any team member can run it for any issue

### Part C — Live Automated Cascade (15:00–19:00)
- Close Issue #3 as "not planned"
- Watch the `sprint-impact-analysis` agentic workflow trigger in Actions
- Within ~60 seconds: 9 issues receive impact alert comments, get `blocked` labels
- Navigate through issues #9, #11, #14, #17 to show the comments
- Show the workflow run summary

📄 See [`demos/02-agentic-workflows/`](./demos/02-agentic-workflows/)

---

## Section 4 — Demo 3: Building & Customizing Agents (19:00–25:00)

**Goal:** Show how `.github/copilot-instructions.md` and structured issues make the coding agent behave like a real team member.

- The most important file in your repo for agentic workflows: `.github/copilot-instructions.md`
- Live walk-through: what's in TechMart's instructions file, why each rule matters
- Modify a rule live and explain how the agent would behave differently
- Show an example of a well-structured issue (PDP-001) vs a poorly scoped one
- Show the agent session log: reasoning trail, what files it read, what it decided
- Discuss agent strengths and limitations

📄 See [`demos/03-coding-agents/`](./demos/03-coding-agents/)

---

## Section 5 — Demo 4: MCP — Connecting Agents to Everything (25:00–33:00)

**Goal:** Show how Model Context Protocol connects Copilot to external systems.

- MCP (Model Context Protocol): an open standard for connecting AI agents to external data and tools
- Think of it as USB-C for AI — one protocol, any compliant tool
- MCP servers expose "tools" (actions) and "resources" (data) the agent can use
- MCP is not GitHub-proprietary — broadly adopted, no lock-in
- Live demo: GitHub MCP server in VS Code — Copilot reads and creates issues directly from Chat
- Live demo: GitHub MCP on GitHub.com — ask Copilot to file a well-formed issue from natural language
- Real-world extensions: Jira MCP for ticket context, Datadog MCP for observability, internal API MCP for domain data

📄 See [`demos/04-mcp/`](./demos/04-mcp/)

---

## Section 6 — Demo 5: Enterprise Governance (33:00–38:00)

**Goal:** Show the enterprise governance layer for agentic AI.

- GitHub Enterprise admins have full control over Copilot capabilities at org and repo level
- Key controls: feature toggles, model selection, IP protection (exclude from training), content exclusions
- Audit logs: every Copilot action that results in a committed code change is logged
- Seat management: who has access, what tier, usage analytics
- The governance pitch: full power of agentic AI + the control security and compliance teams require

📄 See [`demos/05-enterprise-governance/`](./demos/05-enterprise-governance/)

---

## Section 7 — Synthesis: The Agentic Developer Loop (38:00–41:00)

**Goal:** Connect all the pieces into a coherent mental model.

- The Agentic Developer Loop:  
  `Define (Issue + copilot-instructions.md) → Agent Plans → Agent Acts (with MCP context) → Human Reviews (+ Copilot code review) → Ship`
- This is not automation replacing developers — it's developers operating at a higher level of abstraction
- The developer's role shifts: less implementation toil, more problem definition, architecture, review, and judgment
- The teams that move fastest: those who write great issues, great instructions files, and great review policies

---

## Section 8 — Workshop Discussion + Q&A (41:00–45:00)

- Discussion prompt: "What's one workflow in your team that you'd hand to an agent this week? Is it agent-ready?"
- Common discussion topics: handling agent mistakes, what to put in `copilot-instructions.md`, MCP server ideas, governance concerns
- Close: repo URL with all demo scripts and materials
- Point to GitHub docs: [docs.github.com/en/copilot](https://docs.github.com/en/copilot)
