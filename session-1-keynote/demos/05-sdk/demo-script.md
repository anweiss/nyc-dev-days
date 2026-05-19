# Demo Script: Copilot MCP Integration

**Goal:** Show a custom MCP server (`techmart-runbook`) giving Copilot access to TechMart ops runbooks inside VS Code Copilot Chat.
**Duration:** ~5 minutes
**Context in talk:** The TechMart ops team exposed their internal runbooks as an MCP server. Now Copilot can query them directly — no `@extension-name` syntax, no external service.

---

## Prerequisites

- [ ] `mcp-server/` dependencies installed (`npm install` in `05-sdk/mcp-server/`)
- [ ] VS Code open with `nyc-dev-days/` as workspace root (required for `.vscode/mcp.json` to load)
- [ ] `MCP: List Servers` → `techmart-runbook` is **Running** (do this before going on stage)
- [ ] `search_runbooks` tool enabled in Copilot Chat tool list
- [ ] Copilot Chat in **Agent** mode
- [ ] Test before going on stage: `#search_runbooks rollback` returns the runbook

---

## Steps

### Step 1 — Open Copilot Chat in Agent mode

Open the Copilot Chat panel in VS Code. Switch to **Agent** mode using the dropdown next to the send button.

**What to say:**
> "After shipping PDP-001 and fixing the XSS, end of day it's my turn for on-call. The TechMart ops team built an MCP server that connects Copilot to our internal runbook system. I just ask Copilot about our ops procedures — it calls the tool automatically."

---

### Step 2 — Invoke the tool

In Copilot Chat, type:

```
#search_runbooks how do I roll back the TechMart store if a bad deploy hits production?
```

> The `#search_runbooks` prefix explicitly invokes the tool — use this for the demo to ensure it fires reliably. If Copilot automatically calls it from natural language (it often will in Agent mode), that's even better to show.

**What to say:**
> "I reference the tool by name — same as you'd reference a file or symbol. Copilot calls it, passes my question, and the server queries our runbook data. The answer comes back right here in chat."

Copilot responds with the rollback runbook steps.

---

### Step 3 — Ask a follow-up

```
#search_runbooks what monitoring alerts fire when cart checkout fails?
```

**What to say:**
> "It understands follow-up questions within the same conversation. The context carries."

---

### Step 4 — Show the MCP server anatomy (briefly)

Open `mcp-server/index.js` in the editor.

**What to say:**
> "This is the whole integration. Define a tool, return content. The SDK handles the MCP protocol. The hardest part is deciding what knowledge to expose — the plumbing is a dozen lines."

Point out:
- `server.tool()` — registers the tool with its name, description, and input schema
- `searchRunbooks()` — the data lookup against `runbooks.json`
- The response format: `{ content: [{ type: "text", text: answer }] }`

---

## Transition

**What to say:**
> "MCP is how you give Copilot your team's vocabulary — your runbooks, your APIs, your internal systems. Any team can expose their knowledge this way. Now let's go back to where most of the implementation work actually happens — the IDE."

---

## Fallback

If the MCP server fails to respond: open `mcp-server/runbooks.json` directly and walk through the data structure. Describe the tool registration in `index.js` conceptually. Say: "The MCP server queries this data and streams it back to Copilot — in practice you'd point this at a real runbook API or vector store."
