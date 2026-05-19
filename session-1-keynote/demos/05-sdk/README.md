# Demo 5: Copilot MCP Integration

## What This Demo Shows

A local MCP (Model Context Protocol) server that exposes TechMart operational runbooks as a tool inside VS Code Copilot Chat. Copilot calls the `search_runbooks` tool automatically in Agent mode when asked ops questions.

> **Note:** This demo previously used a GitHub App-based Copilot Extension (`@runbook`). That approach was sunset by GitHub on November 10, 2025. See [`EXTENSION-SETUP.md`](./EXTENSION-SETUP.md) for the archived guide.

## Why It Matters in the Talk

Out-of-the-box Copilot is powerful. But enterprise teams have internal tools, runbooks, ticketing systems, and institutional knowledge that Copilot doesn't know about. MCP lets you expose that context to Copilot — making it a domain expert for your team's specific workflows. No GitHub App registration. No public endpoint. Runs locally.

## Required Setup / Accounts / Tools

- Node.js 18+ installed
- VS Code with GitHub Copilot Chat extension (v0.24+ for MCP support)
- GitHub Copilot subscription (Individual, Business, or Enterprise)
- VS Code open at the **repo root** (`nyc-dev-days/`) so `.vscode/mcp.json` loads
- `npm install` run in `mcp-server/` before the talk

## Demo Duration

**~5 minutes**

## Key Concepts Demonstrated

- MCP server exposing a typed tool (`search_runbooks`) to VS Code Copilot
- Copilot calling external tools automatically in Agent mode
- How little code it takes to connect internal knowledge to Copilot
- MCP as the replacement for GitHub App-based Copilot Extensions

## Audience Takeaway

> "Copilot now speaks my team's language — it knows our deploy process, our runbooks, our internal APIs. And we built it in an afternoon."
