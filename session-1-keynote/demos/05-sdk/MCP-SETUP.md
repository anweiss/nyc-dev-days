# MCP Setup Guide — `techmart-runbook` MCP Server

> **This guide replaces [`EXTENSION-SETUP.md`](./EXTENSION-SETUP.md).**
> GitHub App-based Copilot Extensions were sunset on November 10, 2025. The demo now uses an MCP (Model Context Protocol) server instead — same runbook data, simpler setup, no GitHub App registration or ngrok required.

---

## What You're Building

A local **MCP server** that:
1. Exposes a `search_runbooks` tool to GitHub Copilot in VS Code
2. Receives natural-language queries from Copilot
3. Searches `runbooks.json` and returns the matching runbook content

Copilot calls the tool automatically in Agent mode. No `@extension-name` syntax needed.

---

## Prerequisites

- [ ] Node.js 18+ (`node --version`)
- [ ] VS Code with GitHub Copilot Chat extension (v0.24+ for MCP support)
- [ ] A GitHub Copilot subscription (Individual, Business, or Enterprise)
- [ ] The repo open in VS Code **at its root** (`nyc-dev-days/`)

---

## Part 1: Install Dependencies

```bash
cd session-1-keynote/demos/05-sdk/mcp-server
npm install
```

You should see packages added with no errors.

### Verify the server starts

```bash
node index.js
```

The process will hang (waiting for stdio input from VS Code) — that's expected. Press `Ctrl+C` to stop. VS Code will launch it automatically when you open the workspace.

---

## Part 2: VS Code MCP Configuration

The repo already includes `.vscode/mcp.json` at the workspace root. When you open the `nyc-dev-days/` folder in VS Code, this file is picked up automatically.

```json
{
  "servers": {
    "techmart-runbook": {
      "command": "node",
      "args": [
        "${workspaceFolder}/session-1-keynote/demos/05-sdk/mcp-server/index.js"
      ],
      "type": "stdio"
    }
  }
}
```

> ⚠️ **Open the repo root, not a subdirectory.** VS Code must open `nyc-dev-days/` as the workspace root for `${workspaceFolder}` to resolve correctly. Opening `05-sdk/` or `demo-app/` will break the path.

---

## Part 3: Pre-Warm the MCP Server (before going on stage)

VS Code shows a trust/approval prompt the **first time** it starts a new MCP server. You must pre-warm before your talk to avoid a popup interrupting the demo.

### Step 3.1 — Open the workspace

Open VS Code with the `nyc-dev-days/` folder as the root.

### Step 3.2 — Start the MCP server

Open the Command Palette (`Cmd+Shift+P`) and run:

```
MCP: List Servers
```

You should see `techmart-runbook` listed. Click **Start** if it shows as stopped.

### Step 3.3 — Approve the trust prompt

VS Code may ask: *"Allow this MCP server to run?"* — click **Allow**.

### Step 3.4 — Verify the tool is registered

In Copilot Chat, open the tool picker (the `#` icon or **Configure Tools** button). Confirm `search_runbooks` appears in the list and is **enabled** (checkmark visible).

---

## Part 4: Test End-to-End

### Step 4.1 — Open Copilot Chat in Agent mode

Open Copilot Chat panel → switch to **Agent** mode (dropdown next to the send button).

### Step 4.2 — Test the tool directly

```
#search_runbooks how do I roll back the TechMart store?
```

The `#` prefix explicitly invokes the tool — reliable for testing.

You should receive the rollback runbook steps.

### Step 4.3 — Test with natural language (demo query)

```
How do I roll back the TechMart store if a bad deploy hits production?
```

In Agent mode, Copilot should automatically call `search_runbooks` and return the runbook. If it doesn't, use the `#search_runbooks` prefix instead (see demo script).

### Step 4.4 — Test a second query

```
What monitoring alerts fire when cart checkout fails?
```

Copilot should match the `checkout-failure-alerts` runbook.

---

## Day-of-Talk Checklist

Do this ~15 minutes before the session:

- [ ] VS Code open with `nyc-dev-days/` as workspace root
- [ ] `MCP: List Servers` → `techmart-runbook` is **Running** (green)
- [ ] `search_runbooks` appears in Copilot Chat tool list (enabled)
- [ ] Trust prompt already accepted (no popup appears)
- [ ] Test query works: `#search_runbooks rollback` returns the runbook
- [ ] Copilot Chat is in **Agent** mode
- [ ] `mcp-server/index.js` open in editor tab (for Step 4 of the demo)

---

## Troubleshooting

### `techmart-runbook` doesn't appear in MCP: List Servers

1. Is VS Code open at the **repo root** (`nyc-dev-days/`), not a subdirectory?
2. Does `.vscode/mcp.json` exist at the root? Run `ls .vscode/` in the terminal.
3. Reload VS Code window: `Cmd+Shift+P` → **Reload Window**

### MCP server shows as stopped / fails to start

1. Did you run `npm install` in `mcp-server/`?
2. Run `node index.js` manually from that folder — check for errors.
3. Common error: `Cannot find module '@modelcontextprotocol/sdk'` → `npm install` not done.

### `search_runbooks` not in the tool list

1. Open Copilot Chat → **Configure Tools** (gear icon or `#` picker)
2. Find `techmart-runbook` → make sure it's expanded and `search_runbooks` is **checked**
3. If missing entirely, restart the MCP server from `MCP: List Servers`

### Copilot doesn't call the tool automatically

Use `#search_runbooks` prefix to invoke it explicitly:

```
#search_runbooks how do I roll back the TechMart store?
```

Or say: *"Use the search_runbooks tool to answer: how do I roll back the TechMart store?"*

---

## What the Code Does (for the Demo Walkthrough)

When you open `mcp-server/index.js` during the demo, point out these three things:

```
1. Tool registration (line ~12)
   server.tool() defines a typed tool with a name, description, and input schema.
   VS Code reads this schema and passes it to Copilot as an available capability.

2. Runbook search (line ~28)
   searchRunbooks() does keyword matching against runbooks.json.
   In production, you'd use embeddings or a vector store.

3. MCP response format (line ~16)
   Returns { content: [{ type: "text", text: answer }] }
   That's the whole protocol — the SDK handles the serialization.
```

The key message: **"This is the whole integration. Define a tool, return content. The SDK handles the MCP protocol. The hardest part is deciding what knowledge to expose."**
