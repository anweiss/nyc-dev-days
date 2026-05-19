# Sample Copilot Extension — @runbook

This directory contains a minimal Copilot Extension used in **Demo 5 (SDK / Extensions)**. It shows how to build a custom agent that answers questions about your team's runbooks.

> 📖 **Full setup instructions:** See [`../EXTENSION-SETUP.md`](../EXTENSION-SETUP.md) for the complete step-by-step guide covering ngrok, GitHub App registration, Copilot tab configuration, and troubleshooting.

## How It Works

1. User invokes `@runbook` in Copilot Chat
2. GitHub sends the user's question to this endpoint
3. The extension searches `runbooks.json` for relevant procedures
4. It returns a formatted answer with step-by-step instructions

## Quick Start

```bash
npm install
node index.js        # server on http://localhost:8080
```

Then expose with ngrok and register as a GitHub App — see `EXTENSION-SETUP.md` for the full walkthrough.

## Files

| File | Purpose |
|------|---------|
| `index.js` | HTTP endpoint that receives Copilot Extension requests |
| `runbooks.json` | Static runbook data (deployment, rollback, incident response) |
| `package.json` | Dependencies |

## Demo Queries

1. `@runbook how do I roll back the TechMart store if a bad deploy hits production?`
2. `@runbook what monitoring alerts fire when cart checkout fails?`
