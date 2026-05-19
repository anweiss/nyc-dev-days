# Demo 4: MCP — Model Context Protocol

## What This Demo Shows

Model Context Protocol (MCP) connects GitHub Copilot (and the coding agent) to external tools, APIs, and data sources. This demo shows Copilot Chat in VS Code using MCP servers to query a database schema and interact with GitHub resources — without any copy-pasting or context switching.

## Why It Matters in the Talk

Code doesn't exist in isolation. Developers constantly switch between their editor, their database client, their ticketing system, and their monitoring tools. MCP collapses that context switching by bringing external data directly into Copilot's reasoning loop.

## Required Setup / Accounts / Tools

- VS Code with GitHub Copilot Chat extension (1.96+)
- At least one MCP server configured (see `mcp-config-example.json`)
- Recommended for demo: GitHub MCP server (uses GitHub API) OR a local Postgres/SQLite MCP server
- MCP configuration file: `~/.config/github-copilot/mcp.json` (VS Code reads from workspace or user settings)
- Node.js installed (most MCP servers run as Node processes)

## Demo Duration

**~7 minutes**

## Key Concepts Demonstrated

- MCP architecture: client (Copilot) ↔ protocol ↔ MCP server ↔ external system
- Copilot Chat invoking MCP tools during a conversation
- The difference between MCP "tools" (actions) and "resources" (readable data)
- Real-world MCP server examples: GitHub, Postgres, Jira, Datadog

## Audience Takeaway

> "Copilot doesn't just know my code anymore. With MCP, it knows my database, my tickets, my production metrics — whatever I connect it to."
