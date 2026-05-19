# Session 1 Outline — "A Day in the Life of a Developer with GitHub + AI"

**Format:** Keynote  
**Duration:** 45 minutes  
**Goal:** Show how GitHub Copilot's agentic AI spans every phase of the SDLC using the TechMart project as a unified demo story.

---

## Timing Breakdown

| Time | Section | Mode |
|------|---------|------|
| 0:00–2:00 | Opening Hook | Talk |
| 2:00–5:00 | The SDLC Reimagined | Talk |
| 5:00–11:00 | Demo 1: Copilot CLI | Demo |
| 11:00–17:00 | Demo 2: Coding Agent | Demo |
| 17:00–22:00 | Demo 3: Code Review | Demo |
| 22:00–26:00 | Demo 4: Code Quality | Demo |
| 26:00–31:00 | Demo 5: SDK / Extensions | Demo |
| 31:00–37:00 | Demo 6: IDE (VS Code / JetBrains) | Demo |
| 37:00–41:00 | Demo 7: GitHub.com | Demo |
| 41:00–43:00 | The Bigger Picture | Talk |
| 43:00–45:00 | Q&A / Close | Talk |

---

## Section 1 — Opening Hook (0:00–2:00)

**Goal:** Establish emotional resonance with the audience.

- Open with a relatable pain point: "How much of your day is actually writing code vs. everything else around it?"
- Tease the vision: "What if your entire stack — your terminal, your editor, your PRs, your CI — was infused with an AI partner that understands context?"
- Introduce the TechMart story: "Today I'm playing a developer on the TechMart product team. They're building an e-commerce store sprint by sprint, and I need to ship a feature by end of day."
- One-sentence thesis: "Let me show you how GitHub Copilot shows up at every stage of that work."

---

## Section 2 — The SDLC Reimagined (2:00–5:00)

**Goal:** Frame the story arc before demos begin.

- Introduce the fictional dev scenario: developer (you) arriving in the morning with the TechMart sprint board open — issues to close, a PR to review, a GHAS alert to fix.
- Walk through the classic SDLC phases: Idea → Plan → Code → Review → Ship → Monitor
- Explain that each demo maps to a real phase of that cycle
- Brief visual: GitHub product surface map across the SDLC

---

## Section 3 — Demo 1: Copilot CLI (5:00–11:00)

**Goal:** Show Copilot CLI as the developer's AI-powered terminal companion.

- Scenario: Dev opens terminal and checks what's happening in the TechMart repo
- Demo: `gh copilot suggest` and `gh copilot explain` for common tasks
- Show: git workflows, `gh` commands, repository inspection — all through natural language
- Transition: "Now I have a well-scoped issue in the backlog. Instead of just writing code myself, what if I could assign it to an agent?"

📄 See [`demos/01-copilot-cli/`](./demos/01-copilot-cli/)

---

## Section 4 — Demo 2: Coding Agent (11:00–17:00)

**Goal:** Show the GitHub Copilot coding agent autonomously implementing a feature from a GitHub issue.

- Scenario: Assign PDP-001 (Product Detail Page, Issue #4) to the Copilot coding agent
- Demo: Watch the agent spin up in GitHub Actions, explore the TechMart repo, write code, and open a PR
- Highlight: The agent respects `.github/copilot-instructions.md` for repo conventions
- Highlight: Agent session logs show its reasoning and decision trail
- Transition: "The agent opened a PR. Now let's review it — with AI."

📄 See [`demos/02-coding-agent/`](./demos/02-coding-agent/)

---

## Section 5 — Demo 3: Code Review (17:00–22:00)

**Goal:** Show Copilot code review providing actionable, contextual PR feedback.

- Scenario: The coding agent's PDP-001 PR is ready — request Copilot as reviewer
- Demo: Walk through inline Copilot review comments on the agent's PR
- Show: Severity-rated suggestions, fix-in-place capability
- Highlight: Review catches issues the agent introduced — accessibility, edge cases, navigation UX
- Transition: "Copilot not only reviewed the PR — it caught things the agent missed. Let's zoom out and look at the security layer."

📄 See [`demos/03-code-review/`](./demos/03-code-review/)

---

## Section 6 — Demo 4: Code Quality (22:00–26:00)

**Goal:** Show GHAS and Copilot Autofix closing the loop on a security vulnerability.

- Scenario: GHAS scanner flagged an XSS vulnerability in TechMart's `app.js` — unsanitized `innerHTML` using URL parameters
- Demo: GitHub Advanced Security alert + Copilot Autofix generating a one-click fix
- Show: The suggested fix (`textContent` replacement), explanation of the attack vector, apply-and-commit
- Stat: Autofix resolves ~70% of GHAS alerts automatically
- Transition: "The platform handles quality at scale. But what if your team needs something custom?"

📄 See [`demos/04-code-quality/`](./demos/04-code-quality/)

---

## Section 7 — Demo 5: SDK / Extensions (26:00–31:00)

**Goal:** Show how teams build custom Copilot Extensions using the Copilot Extensions SDK.

- Scenario: The TechMart ops team wants a Copilot Extension that connects to their internal runbook system
- Demo: A pre-built `@runbook` extension responding in Copilot Chat with deployment and rollback procedures
- Show: Anatomy of a Copilot Extension, how it's registered, how it's invoked via `@runbook`
- Transition: "This is what Copilot looks like when it speaks your team's language. Now let's go back to where most devs live — the IDE."

📄 See [`demos/05-sdk/`](./demos/05-sdk/)

---

## Section 8 — Demo 6: IDE (31:00–37:00)

**Goal:** Show the breadth of Copilot's IDE experience in VS Code and JetBrains.

- Scenario: Dev returns to the editor to implement the remaining TechMart work with Copilot as a pair programmer
- Demo (VS Code): Inline completions, Copilot Edits (multi-file), inline chat (`Cmd+I`) on TechMart code
- Demo (JetBrains): Show completions + inline chat parity
- Highlight: Copilot understands workspace context across the TechMart codebase
- Transition: "The IDE is where code happens. But collaboration happens on GitHub.com."

📄 See [`demos/06-ide/`](./demos/06-ide/)

---

## Section 9 — Demo 7: GitHub.com (37:00–41:00)

**Goal:** Show Copilot on GitHub.com: chat, PR summaries, and issue triage.

- Scenario: End of day — reviewing the TechMart repo on github.com, checking open issues and PRs
- Demo: Copilot Chat on github.com (ask questions about TechMart's codebase and sprint board)
- Demo: PR summary auto-generation on the agent's merged PR
- Demo: Issue triage — draft a well-scoped TechMart issue from a rough idea
- Highlight: Copilot on GitHub.com is repo-aware — it knows TechMart's code, history, and issues

📄 See [`demos/07-github-com/`](./demos/07-github-com/)

---

## Section 10 — The Bigger Picture (41:00–43:00)

**Goal:** Synthesize the journey.

- Recap the full arc: terminal → agent → review → security → custom extensions → IDE → GitHub.com
- Key message: "This isn't about any single feature. It's about GitHub becoming an AI-native platform where every surface is contextually aware and proactively helpful."
- Call to action: Enable Copilot for your team, assign your first issue to the agent, explore the Extensions SDK
- Tease Session 2: "This afternoon, Matt goes deep on the agentic layer — what happens when CART-003 slips and nine issues cascade. Come see."

---

## Section 11 — Q&A / Close (43:00–45:00)

- Open floor for questions
- Remind audience of Session 2: "The Agentic Developer Loop" — deeper dive into agents and the sprint dependency workflow
- Share repo URL for all demo scripts and materials
