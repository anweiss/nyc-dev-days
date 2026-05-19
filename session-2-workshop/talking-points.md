# Session 2 — Talking Points

**Session:** "The Agentic Developer Loop"  
**Format:** Workshop · 45 minutes

These talking points are written in speaker-note style — conversational, specific, and substantive. The TechMart sprint dependency story is the central narrative.

---

## Opening: The Shift Has Already Happened

- Start with a concrete statement: "Agentic AI is not a roadmap item. It is live on GitHub today. The teams that understand how to work with it are already shipping faster."
- Define the shift clearly: "Assistive AI says 'here's a suggestion.' Agentic AI says 'I looked at your repo, made a plan, wrote the code, and here's a PR.' The human's job changes from typist to reviewer."
- The key word is *autonomous*: the agent doesn't need you to prompt every step. You define the outcome; the agent finds the path.
- This isn't about replacing developers — it's about what happens when developers stop being the bottleneck in routine tasks. "Your judgment is the scarce resource. Agentic AI frees it up."
- Real numbers: GitHub's internal data shows coding agent tasks complete successfully for well-scoped issues in the majority of cases. Teams using the agent are closing backlogged issues they'd deprioritized for months.

---

## Demo 1: Assistive vs. Agentic

- The assistive model: Copilot suggestions in your editor, you accept or reject each one. Great for in-the-flow coding. Still requires your full attention.
- The agentic model: write a clear issue, assign it to Copilot, go do something else. Come back to a PR.
- The mental model shift: you're not "prompting" anymore — you're "delegating." And like any good delegation, the quality of what you get back is proportional to the clarity of what you asked for.
- "Agent-ready" tasks share four properties: (1) scope is bounded, (2) success is measurable, (3) tech stack is established, (4) no ambiguous architectural decisions required.
- Walk through examples: **Good** — "Add a sort dropdown to the product filter bar." **Bad** — "Redesign the TechMart checkout flow."

---

## Demo 2: The Sprint Impact Cascade

### Part A — Ad-hoc Chat Analysis
- "Let me start with the most direct question: what happens if CART-003 doesn't ship?" 
- Copilot reads the issue bodies, traces the `## Depends On` sections, and groups the blast radius by sprint. No special tooling needed — just Copilot and your issues.
- "This is powerful for ad-hoc analysis. But it's not repeatable. If the product manager asks the same question tomorrow, you'd need to prompt from scratch."

### Part B — Structured Prompt Template
- "That's what the prompt template solves. Fill in the blanks, paste, get a consistent 5-section report every time."
- Highlight the structure: blast radius table, sprint-by-sprint impact, critical path, three recommendations, quick wins.
- "Any team member can run this. It standardizes the conversation across sprint planning, stakeholder updates, and documentation."

### Part C — Live Automated Cascade
- "Now let me show you what happens when you make the decision. We're cancelling CART-003."
- Close Issue #3 as "not planned."
- "In a traditional workflow, someone would need to manually trace each dependency, post individual comments, update the project board. What you're about to see is that entire cascade — 9 notifications across 4 sprints — triggered automatically in about 60 seconds."
- Navigate to impacted issues: "CART-003 is gone. Wishlist (Sprint 2) — blocked. Promotions Engine (Sprint 3) — blocked. Order Service (Sprint 3) — blocked. Order History (Sprint 4) — transitively blocked."
- Key design principle: "The dependency graph is computed deterministically in code. The AI writes the human-readable narrative. This makes the automation trustworthy and auditable."

---

## Demo 3: Building & Customizing Agents

- "The most important file in your repo for agentic workflows: `.github/copilot-instructions.md`. This is the agent's rulebook. It reads this before every task."
- What goes in it? Everything a new developer would need in their first week: naming conventions, preferred libraries, testing patterns, folder structure, what *not* to do.
- Real example from TechMart's instructions file: "Vanilla HTML/CSS/JS only — no frameworks, no npm. CSS custom properties for theming. The STUB_INFO map in app.js must not be replaced with real implementations."
- The agent session log is your audit trail: click "Session" in the coding agent run to see the full reasoning trail — every file it read, every decision it made. This is AI you can audit.
- Structured issues are the other lever. An issue with clear acceptance criteria produces a much better PR than one that says "add product detail page." Teach your team to write issues like acceptance tests.

---

## Demo 4: MCP — Connecting Agents to Everything

- "Model Context Protocol is an open standard for connecting AI agents to external data and tools. Think of it as USB-C for AI: one protocol, any compliant tool."
- MCP servers expose "tools" (actions the agent can invoke — create a ticket, query a database) and "resources" (data the agent can read — schema, documentation, API specs).
- Live: with the GitHub MCP server connected, Copilot Chat can read your issues and PRs, create new issues, and navigate your repo — all without leaving the Chat interface.
- Real-world uses: Jira MCP so Copilot knows your ticket context; Datadog MCP so Copilot can read your observability data while debugging; internal database MCP so Copilot knows your production schema.
- "MCP is not GitHub-proprietary. It's an open protocol — originally from Anthropic, now broadly adopted. Your MCP servers work with any compliant AI client. No lock-in."
- The protocol is simple: a JSON-RPC server with a standard manifest. Any developer can build one in a few hours.

---

## Demo 5: Enterprise Governance

- "GitHub Enterprise gives admins granular control over every Copilot feature. You don't have to choose between 'full AI capabilities' and 'enterprise security' — you get both."
- Feature toggles: enable/disable the coding agent, code review, Autofix, and suggestions independently per org or repo. You control the surface area.
- Model selection: pin orgs to specific foundation models (GPT-4o, Claude, etc.) for compliance and predictability. If your security team requires a specific model, you can enforce it.
- IP protection: "Exclude from training" policy ensures your org's code is never used to train foundation models. Critical for organizations with proprietary code.
- Content exclusions: configure which files or paths Copilot should not access — secrets files, highly sensitive business logic, regulated data.
- Audit logs: every Copilot action that results in committed code is in the GitHub Enterprise audit log. Compliance teams can query: "What code did the Copilot agent write this quarter? Who reviewed it?"
- "The governance pitch: give engineers the full power of agentic AI while maintaining the oversight and auditability your security and legal teams require. These goals are not in conflict."

---

## Synthesis: The Agentic Developer Loop

- Pull everything together with the loop: `Define → Plan → Act (with MCP context) → Review → Ship`
- The loop is designed so humans are involved at the points of maximum judgment: defining outcomes and reviewing results. Everything in between can be automated.
- The developer's role in the agentic era: **problem definer**, **context architect**, **quality reviewer**. Higher-leverage activities than manual implementation.
- Practical advice: (1) Start with one well-scoped issue per sprint assigned to the agent. (2) Write your `copilot-instructions.md` this week. (3) Add one MCP server connecting to your most-used internal tool.
- Final message: "The teams that figure out how to work *with* agents — not just use AI as a fancier autocomplete — will have a structural advantage. That starts today."

---

## Workshop Discussion + Q&A

- Prompt the room: "What's the most repetitive engineering task in your team right now? If it's well-scoped, an agent could probably handle it."
- Common discussion topics: how to handle agent mistakes, what to put in `copilot-instructions.md`, MCP server ideas for their stack, governance concerns.
- Close: "The repo with all of today's materials is linked in the session description. Fork it, run the scripts, and let me know how your first agent cascade goes."
