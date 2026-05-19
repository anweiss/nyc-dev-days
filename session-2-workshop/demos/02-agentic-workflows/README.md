# Demo 2: GitHub Agentic Workflows

## What This Demo Shows

GitHub Actions + Copilot coding agent + issue labels = an automated agentic pipeline. This demo shows how to set up a workflow where issues labeled `copilot-approved` are automatically assigned to the coding agent — turning your backlog into an autonomous work queue.

## Why It Matters in the Talk

Moving from "manually triggering agents" to "automatic agentic pipelines" is the next level of the shift. This demo shows that natural language (the issue body) can become the trigger for engineering automation — no YAML pipeline for each task.

## Required Setup / Accounts / Tools

- GitHub repository with Copilot coding agent enabled
- A GitHub Actions workflow file that triggers on issue label events
- A label called `copilot-approved` created in the repo
- At least one well-scoped issue ready to demonstrate the pipeline

## Demo Duration

**~5 minutes**

## Key Concepts Demonstrated

- GitHub Actions `issues` event trigger on label assignment
- Automatically assigning the coding agent to labeled issues
- The "intent-driven" vs "event-driven" pipeline model
- Audit trail: every automated action is traceable in the Actions logs

## Audience Takeaway

> "I labeled an issue. Twenty seconds later, the coding agent was already working on it. My backlog is now a work queue."
