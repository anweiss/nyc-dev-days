# Demo 2: GitHub Copilot Coding Agent

## What This Demo Shows

The GitHub Copilot coding agent takes a GitHub issue and autonomously implements it — exploring the repo, writing code, running tests, and opening a pull request. The entire workflow runs inside GitHub Actions. No local environment required.

## Why It Matters in the Talk

This is the pivot from "AI that assists" to "AI that acts." The coding agent can handle a well-scoped feature request or bug fix while the developer works on something else — or grabs coffee.

## Required Setup / Accounts / Tools

- GitHub repository with Copilot coding agent enabled (org-level setting: **Settings → Copilot → Coding agent**)
- GitHub Copilot Business or Enterprise subscription on the org
- A well-scoped GitHub issue pre-created (title + description with acceptance criteria)
- `.github/copilot-instructions.md` file already in the demo repo
- GitHub Actions enabled on the repo
- Demo tip: Pre-assign the agent to the issue and have the Actions run *already in progress* to save live wait time (agent runs can take 3–10 min)

## Demo Duration

**~6 minutes** (show assignment live, then cut to the nearly-complete run)

## Key Concepts Demonstrated

- Assigning a GitHub issue to `@copilot` (or via the "Assign to Copilot" button)
- Agent session log: the reasoning trail
- Respecting `.github/copilot-instructions.md` for repo conventions
- The agent's opened pull request

## Audience Takeaway

> "I assigned a bug to the AI. It read the codebase, wrote the fix, and opened a PR. I reviewed it over lunch."
