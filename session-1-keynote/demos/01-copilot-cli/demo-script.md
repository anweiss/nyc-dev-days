# Demo Script: Copilot CLI

**Goal:** Show GitHub Copilot CLI as an interactive, agentic coding companion in the terminal — from finding sprint work via built-in GitHub MCP, to planning and delegating implementation.  
**Duration:** ~6 minutes  
**Context in talk:** Developer opens their terminal first thing in the morning and checks what's happening in the TechMart repo.

---

## Prerequisites

- [ ] Copilot CLI installed: `brew install copilot-cli` (or `npm install -g @github/copilot`)
- [ ] Authenticated (run `copilot`, then `/login` on first launch)
- [ ] TechMart repo cloned locally — launch `copilot` from the repo root
- [ ] Terminal font size 18pt+, font weight bold

---

## Steps

### Step 1 — Launch Copilot CLI

From the TechMart repo root:

```bash
copilot
```

**What to say:**
> "I'm starting my morning in the terminal. Instead of opening an IDE or a browser, I'm going to launch the Copilot CLI right here in my project. This is a full agentic session — the same coding agent you'd get on GitHub, running locally."

Let the animated banner display. Point out the model info and prompt.

---

### Step 2 — Find sprint work via GitHub MCP

Type a natural language prompt:

```
What are my open issues in this repo labeled sprint-1?
```

**What to say:**
> "Copilot CLI ships with GitHub's MCP server built in — so it can search issues, read PRs, check labels, all without me leaving the terminal or remembering any CLI flags."

Copilot uses the GitHub MCP server to list issues. Show the output with Issue #4 (PDP-001) in the list.

---

### Step 3 — Switch to plan mode and plan the work

Press **Shift+Tab** to cycle to **plan** mode, then prompt:

```
Plan the implementation for issue #4 PDP-001 — the product detail page
```

**What to say:**
> "Now I want Copilot to think through this before writing any code. I've switched to plan mode with Shift+Tab. It's going to read the issue, look at the existing codebase, and outline an approach."

Walk through the plan Copilot produces. Point out that it references existing files and the project's conventions.

---

### Step 4 — Compare approaches with `/model` (optional, if time allows)

```
/model
```

**What to say:**
> "I can also switch models on the fly. Maybe I want to compare how Claude Sonnet and GPT-5 would approach this plan. You can even use `/fleet` to run multiple models in parallel."

Select a different model from the list to show the interaction.

---

### Step 5 — Delegate to the coding agent

```
/delegate
```

**What to say:**
> "Instead of implementing this myself, I'm going to delegate. This creates a branch, implements the change, and opens a pull request — all from right here in my terminal. Same coding agent, same guardrails, same branch protections."

Show the confirmation prompt. Accept it to kick off the delegated work.

**What to say:**
> "That's now running as a coding agent session on GitHub. I can `/resume` this later, or review the PR when it's ready."

---

### Fallback

If the CLI is unavailable, show the [Copilot CLI splash screen](https://github.com/github/copilot-cli) and walk through the `/plan` → `/delegate` workflow conceptually.

---

## Transition

> "That's the terminal experience — a full agentic session without ever leaving my shell. Now let's look at what that coding agent PR looks like when it comes back."
