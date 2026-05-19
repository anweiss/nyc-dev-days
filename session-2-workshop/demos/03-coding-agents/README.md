# Demo 3: Building & Customizing Coding Agents

## What This Demo Shows

The GitHub Copilot coding agent is customizable through `.github/copilot-instructions.md` — a repo-level file that defines your team's conventions, patterns, and constraints. This demo shows how to write an effective instructions file, how it shapes agent behavior, and what a well-structured issue looks like.

## Why It Matters in the Talk

The gap between "the agent wrote something" and "the agent wrote something I can merge" is almost entirely closed by a good instructions file. This is the highest-leverage investment a team can make when adopting coding agents.

## Required Setup / Accounts / Tools

- GitHub repo with Copilot coding agent enabled
- `.github/copilot-instructions.md` in the repo (see `sample-copilot-instructions.md` in this folder)
- Two test issues: one with good structure, one with vague structure (to compare outputs)
- Agent must be run on both issues before the demo (show the PRs as evidence of the difference)

## Demo Duration

**~6 minutes**

## Key Concepts Demonstrated

- `.github/copilot-instructions.md` as the agent's rulebook
- What to include: naming conventions, testing requirements, library preferences, "do not" rules
- Structured issues: acceptance criteria, scope boundaries, constraints
- The agent session log: transparency and auditability

## Audience Takeaway

> "The quality of agent output is directly proportional to the quality of the instructions and issues we give it. Garbage in, garbage out — but with a good instructions file, the output is PR-ready."
