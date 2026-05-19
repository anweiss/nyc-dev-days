# Attendee Guide — Session 2: The Agentic Developer Loop

Welcome! This guide covers the hands-on context for today's workshop. All materials are in the repo linked below.

**Repo:** `github.com/anweiss/nyc-dev-days`

---

## What You'll See Today

Five demos built around **TechMart** — a fictional e-commerce store with a 24-issue sprint backlog and a critical dependency crisis in Sprint 1.

The arc: Sprint 1 hits a blocker (CART-003, the Cart API) → we explore the impact three ways → we watch an agentic workflow cascade alerts automatically → we see how to customize agents and connect them to more data → we look at the governance layer that makes this enterprise-safe.

---

## Demo Overviews

### Demo 1 — Assistive vs. Agentic
Same task, two approaches:
- **Assistive:** Copilot inline suggestions in the editor. You drive every step.
- **Agentic:** Write a clear issue, assign to Copilot, review the PR.

**Key concept:** The shift from *prompting* to *delegating*. Quality of delegation = quality of the issue.

**Agent-ready task checklist:**
- [ ] Scope is bounded (you can describe "done" in one sentence)
- [ ] Success is measurable (you could write a test for it)
- [ ] Tech stack is established (no new frameworks needed)
- [ ] No ambiguous architectural decisions required

### Demo 2 — The Sprint Impact Cascade
CART-003 is cancelled. Three escalating responses:

**Part A — Ad-hoc Copilot Chat:**
> "Which issues depend on #3? Group by sprint, separate direct vs. transitive."

Try this yourself with any dependency-linked issue.

**Part B — Structured Prompt Template:**
Found at `.github/prompts/inspect-delay.prompt.md`. Fill in `[issue]`, `[delay reason]`, and paste into any Copilot Chat session with the repo attached. Always returns the same 5-section report.

**Part C — Live Cascade:**
Closing Issue #3 as "not planned" triggers the `sprint-impact-analysis` agentic workflow. It traces all dependency chains and comments on 9 impacted issues with AI-written narratives.

### Demo 3 — Building & Customizing Agents
The agent's rulebook: `.github/copilot-instructions.md`

**Why it matters:** The agent reads this before every task. What you put here directly shapes the quality of every PR it produces.

**Template for your own repo:**
```markdown
## Stack
[Your tech stack — frameworks, languages, libraries you prefer]

## Conventions
[Naming patterns, file organization, what not to do]

## Testing
[How to run tests, test patterns you expect]

## Security
[Things to never touch, dangerous patterns to avoid]
```

### Demo 4 — MCP
GitHub MCP server connects Copilot to your GitHub data live.

**Try in Copilot Chat (VS Code, with GitHub MCP active):**
```
List all open issues labeled "sprint-1". For each, summarize the 
acceptance criteria in one line.
```

**MCP server ideas for your stack:**
- Jira → sprint context from your existing boards
- PostgreSQL → your production schema, without pasting DDL
- Datadog → live observability data during debugging
- Slack → recent incident discussion context

### Demo 5 — Enterprise Governance
GitHub Enterprise controls:
- Feature toggles: enable/disable per org or per repo
- Model selection: pin to specific models for compliance
- IP protection: exclude from training
- Content exclusions: paths Copilot cannot access
- Audit logs: every agent-authored commit is tracked

---

## Take-Home Exercises

### Exercise 1 — Write an agent-ready issue
Take one recurring task from your backlog. Rewrite it with:
- A clear, single-sentence **goal**
- 3-5 **acceptance criteria** (testable)
- A `## Depends On` section listing blockers (or "None")

Then assign it to the Copilot coding agent.

### Exercise 2 — Start your `copilot-instructions.md`
If your repo doesn't have one, start with:
1. Your tech stack (3-5 bullet points)
2. Two things Copilot should never do (e.g., "never add new npm packages")
3. How tests are run
4. Where feature flags / stub code lives

### Exercise 3 — Copy the sprint impact template
Take `.github/prompts/inspect-delay.prompt.md` and adapt it for your issue structure. Try it next time a sprint dependency slips.

---

## Setup Your Own Version

To replicate the full TechMart demo environment in your own repo:

```bash
# Clone the repo
git clone https://github.com/anweiss/nyc-dev-days
cd nyc-dev-days

# See full setup instructions
cat SETUP.md
```

The `scripts/setup/` directory has labeled, sequenced scripts that create all 24 issues, 5 milestones, 5 project boards, and 15 labels.

---

## Q&A Topics

Common questions:
- **"What if the agent makes a mistake?"** — The PR review step is your safety net. Check the session log to understand why. Write a better issue for next time.
- **"How do I get my team to write better issues?"** — Start with a template in your `.github/ISSUE_TEMPLATE/` directory. The agent-ready checklist above is a good starting point.
- **"Is MCP secure?"** — MCP tools run with the permissions of the authenticated GitHub user. No additional permissions granted. Audit logs capture everything.
