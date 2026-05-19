# Demo Script: Building & Customizing Agents

**Goal:** Show how `.github/copilot-instructions.md` and well-structured issues make the coding agent behave like a real team member.  
**Duration:** ~6 minutes

---

## Prerequisites

- [ ] `.github/copilot-instructions.md` present and well-written
- [ ] A second "before" version of the instructions file ready as a tab (showing a sparse version)
- [ ] A well-structured issue (PDP-001) and a poorly scoped issue to compare

---

## Steps

### Step 1 — Show the instructions file

Navigate to `.github/copilot-instructions.md` in the repo.

**What to say:**
> "This is the most important file in your repo for agentic workflows. The coding agent reads it before every task. Think of it as an always-up-to-date onboarding document that also happens to guide your AI."

Walk through key sections:
- TechMart's stack: vanilla HTML/CSS/JS, no frameworks, no npm
- STUB_INFO map: what it is, why stubs must not be implemented
- Coding conventions: CSS custom properties, ES6+, global scope in app.js
- Issue format: the `## Depends On` section is parsed by the agentic workflow

**What to say:**
> "Everything a new developer would need in their first week — naming conventions, preferred patterns, what not to touch. The agent follows all of it."

### Step 2 — Issue quality matters

Open Issue #4 (PDP-001) — show the well-structured version.

Then show a hypothetical bad issue (type it out or have a pre-written example):
```
Add product detail page
```

**What to say:**
> "Same feature. One will produce a great PR. One will produce questions or a PR that misses the mark. Writing great issues is now a force multiplier — you're writing for both your teammates and your agents."

### Step 3 — Show the agent session log

Navigate to the completed PDP-001 coding agent run in Actions (from Session 1 if available, or a pre-run session).

Click **Session** to open the reasoning log.

**What to say:**
> "Every decision the agent made is visible here. What files it read. What it considered and discarded. This is AI you can audit. If the PR missed something, the session log tells you why — and how to write the next issue better."

### Step 4 — Discuss limitations

**What to say:**
> "The agent is honest about ambiguity. If the issue isn't clear, it'll ask clarifying questions. Great for well-scoped work: bug fixes, dependency upgrades, boilerplate generation, adding test coverage. Not great for: 'redesign our authentication system' or 'improve performance' — those require architectural judgment."
