# Demo Script: MCP — Connecting Agents to Everything

**Goal:** Show Model Context Protocol connecting Copilot to external systems.  
**Duration:** ~8 minutes

---

## Prerequisites

- [ ] GitHub MCP server configured in VS Code (`.vscode/mcp.json` or user settings)
- [ ] Copilot Chat panel open in VS Code

---

## Steps

### Step 1 — Explain MCP (brief, 1 min)

**What to say:**
> "Model Context Protocol is an open standard for connecting AI agents to external data and tools. Think of it as USB-C for AI — one protocol, any compliant tool. MCP servers expose tools (actions the agent can invoke) and resources (data the agent can read)."

Draw or point to a diagram:
```
Copilot Chat ←→ MCP Client ←→ MCP Server ←→ External System
                                  (GitHub, Jira, Postgres, Datadog...)
```

### Step 2 — GitHub MCP server in VS Code

Open Copilot Chat in VS Code with the GitHub MCP server active.

Ask:
```
Using the GitHub MCP tools, list all open issues in this repo labeled sprint-1. 
For each one, tell me if it has a "Depends On" section.
```

**What to say:**
> "The GitHub MCP server gives Copilot direct access to the GitHub API — issues, PRs, labels, milestones — without me having to copy-paste anything. It's Copilot with a live connection to your actual backlog."

Then ask:
```
Create a new issue titled "PERF-002: Lazy load product images for faster initial render" 
with the label "platform,enhancement,sprint-5" and a body with 3 acceptance criteria.
```

**What to say:**
> "Copilot can write back to GitHub too. It's not just reading — it's acting, with every action going through your normal GitHub permissions and audit log."

### Step 3 — GitHub MCP on GitHub.com (if time allows)

Navigate to Copilot Chat on GitHub.com.

**What to say:**
> "GitHub.com's Copilot Chat also supports MCP — the GitHub MCP is built in. You can ask it to read issues, summarize PRs, or draft new issues without leaving the browser."

### Step 4 — Describe broader MCP ecosystem

**What to say:**
> "Your team's most valuable knowledge isn't in GitHub. It's in Jira, in Confluence, in your production database schema, in your Datadog dashboards. MCP servers for all of these exist — or you can build one in a few hours. Any developer can build an MCP server: it's a JSON-RPC server with a standard manifest. The hardest part is deciding what to expose."

List real-world MCP servers: Jira, Postgres, Datadog, Figma, Slack.

**What to say:**
> "MCP is not GitHub-proprietary. It started at Anthropic and is now broadly adopted. Your MCP servers work with any compliant AI client. No lock-in."
