# ⚠️ DEPRECATED — Extension Setup Guide

> **This guide is no longer usable.** GitHub App-based Copilot Extensions were sunset on **November 10, 2025**. The Copilot tab in GitHub App settings no longer exists; new extensions cannot be created.
>
> **Use [`MCP-SETUP.md`](./MCP-SETUP.md) instead.** Demo 5 has been migrated to an MCP (Model Context Protocol) server — same runbook data, no GitHub App or ngrok required.

---

# (Archive) Extension Setup Guide — `@runbook` Copilot Extension

This guide is kept for historical reference only. It describes the GitHub App-based Copilot Extension approach that was used before November 2025.

---

This guide walks you through everything needed to get the `@runbook` demo extension running before the talk. Budget **45–60 minutes** the first time. Subsequent setups (e.g., on the day of the talk) take about 10 minutes once you have ngrok and the GitHub App already configured.

---

## What You're Building

A **Copilot Agent Extension** — a small Node.js HTTP server that:
1. Receives a Copilot Chat message (e.g., `@runbook how do I roll back the store?`)
2. Searches `runbooks.json` for matching content
3. Streams the answer back to the Copilot Chat UI

It's invoked from Copilot Chat in VS Code or GitHub.com with `@runbook`.

---

## Prerequisites

- [ ] Node.js 18+ installed (`node --version`)
- [ ] ngrok installed — see Step 2 below
- [ ] A GitHub account with **Copilot Pro or higher** subscription
  - Free tier *can use* extensions but may not have access to the Copilot tab in GitHub App settings — upgrade if you hit that wall
- [ ] A terminal and a browser

---

## Part 1: Run the Extension Locally

### Step 1.1 — Install dependencies

```bash
cd session-1-keynote/demos/05-sdk/sample-extension
npm install
```

### Step 1.2 — Start the server

```bash
node index.js
```

You should see:
```
Runbook extension listening on http://localhost:8080
```

Leave this terminal running. Open a second terminal for the next steps.

### Step 1.3 — Verify it's up

```bash
curl -X POST http://localhost:8080 \
  -H "Content-Type: application/json" \
  -d '{"messages":[{"role":"user","content":"rollback"}]}'
```

You'll get an error about signature verification — that's expected. The server is running.

---

## Part 2: Expose the Server with ngrok

GitHub needs to reach your laptop. ngrok creates a public HTTPS URL that tunnels to your local port.

### Step 2.1 — Install ngrok

```bash
# macOS with Homebrew
brew install ngrok

# Or download from https://ngrok.com/download
```

### Step 2.2 — Create a free ngrok account

Go to **https://dashboard.ngrok.com/signup** and create a free account. This gives you a **static domain** (critical — see why in the Gotchas section).

### Step 2.3 — Connect your ngrok account

After signing up, the dashboard shows a command like:
```bash
ngrok config add-authtoken YOUR_TOKEN_HERE
```
Run that in your terminal.

### Step 2.4 — Get your free static domain

In the ngrok dashboard: **Cloud Edge → Domains → Create Domain**

You'll get a domain like `fluffy-flamingo-free.ngrok-free.app`. Copy it.

### Step 2.5 — Start ngrok with your static domain

```bash
ngrok http --domain=fluffy-flamingo-free.ngrok-free.app 8080
```

The terminal shows:
```
Forwarding    https://fluffy-flamingo-free.ngrok-free.app -> http://localhost:8080
```

That `https://...ngrok-free.app` URL is your extension's public address. Keep this terminal running alongside the server terminal.

> **Why static domain?** Without it, ngrok gives you a new random URL every restart. You'd have to update the GitHub App settings before every talk. The static domain never changes.

---

## Part 3: Create the GitHub App

This is the registration step that tells GitHub about your extension.

### Step 3.1 — Open GitHub App creation

Go to: **https://github.com/settings/apps/new**

(Shortcut: Profile photo → Settings → Developer settings → GitHub Apps → New GitHub App)

### Step 3.2 — Fill out the form

| Field | What to enter |
|---|---|
| **GitHub App name** | `techmart-runbook` (must be globally unique — add your username if taken, e.g., `techmart-runbook-matt`) |
| **Homepage URL** | `https://github.com/anweiss/nyc-dev-days` |
| **Callback URL** | Your ngrok URL: `https://fluffy-flamingo-free.ngrok-free.app` |
| **Expire user authorization tokens** | Leave checked ✓ |
| **Request user authorization during installation** | Leave unchecked |
| **Webhook → Active** | ⚠️ **UNCHECK THIS** — this is the #1 gotcha. Copilot Extensions don't use webhooks. If this is checked, the app silently fails. |
| **Where can this GitHub App be installed?** | `Only on this account` |

Leave everything else at defaults. Click **Create GitHub App**.

### Step 3.3 — Note your App ID

After creation, you land on the app settings page. Note the **App ID** number at the top — you may need it for debugging.

### Step 3.4 — Set the required permission

In the left sidebar: **Permissions & events** → scroll to **Account permissions** → find **GitHub Copilot Chat** → set to **`Read-only`** → **Save changes**.

> This is the **only permission required**. You don't need any repository or organization permissions for this demo extension.

Confirm the dialog that says the permission change will be applied at next install.

---

## Part 4: Configure the Copilot Tab

This is where you register your server URL and accept the terms.

### Step 4.1 — Open the Copilot tab

In the left sidebar of your GitHub App settings: click **Copilot**.

(Direct URL: `https://github.com/settings/apps/YOUR-APP-NAME/agent`)

### Step 4.2 — Accept the terms

You'll see two agreements. Check both:
- ✓ GitHub Marketplace Developer Agreement
- ✓ GitHub Pre-release License Terms for Copilot Extensions

Click **Save**.

### Step 4.3 — Set the App type and URL

| Field | Value |
|---|---|
| **App type** | `Agent` |
| **URL** | `https://fluffy-flamingo-free.ngrok-free.app` ← your ngrok static domain (root, no trailing slash) |
| **Inference description** | `Answers questions about TechMart operational runbooks — deploy procedures, rollback steps, monitoring alerts, and incident response.` |

Click **Save**.

---

## Part 5: Install the App

### Step 5.1 — Install on your account

In the left sidebar: **Install App** → click **Install** next to your GitHub username.

Confirm the installation. Click **Install**.

> If you're using this in an org context for the demo: go to **Install App** and choose your demo org, or navigate to `https://github.com/apps/YOUR-APP-NAME` and click **Install**.

### Step 5.2 — (Business/Enterprise only) Enable the policy

If your demo org is on Copilot Business or Enterprise:

**Org Settings → Copilot → Policies → GitHub Copilot Extensions → Enabled**

Without this, the `@runbook` handle won't appear in Chat even with the app installed.

---

## Part 6: Test It End-to-End

### Step 6.1 — Make sure everything is running

- [ ] Terminal 1: `node index.js` is running (server on port 8080)
- [ ] Terminal 2: `ngrok http --domain=... 8080` is running (tunnel active)
- [ ] GitHub App is installed on your account

### Step 6.2 — Test in GitHub.com

1. Go to **https://github.com/copilot** (or any repo → Copilot icon)
2. In the chat input, type `@` — you should see `@techmart-runbook` (or whatever you named it) in the autocomplete list
3. Type: `@techmart-runbook how do I roll back the TechMart store?`
4. The extension should respond with the rollback runbook steps

### Step 6.3 — Test in VS Code

1. Open VS Code → Copilot Chat panel
2. If the extension doesn't appear: **restart VS Code** (must restart after installing a new extension)
3. Type `@techmart-runbook ping` — you should get a response

### Step 6.4 — Check the ngrok dashboard for traffic

Open **http://localhost:4040** in your browser — this is ngrok's local inspector. You can see every request/response in real time, which is invaluable for debugging.

---

## Optional: Test Locally Without GitHub (gh-debug-cli)

The `gh-debug-cli` tool lets you chat with your agent from the terminal without going through GitHub at all — no GitHub App, no ngrok needed. Great for local development.

```bash
# Install the debug CLI
gh extension install copilot-extensions/gh-debug-cli

# Chat with your local server
gh copilot-debug http://localhost:8080 "how do I roll back the store?"
```

The CLI simulates what GitHub sends to your agent endpoint. Use this to validate your server logic before doing the full GitHub App registration.

---

## Day-of-Talk Checklist

Do this ~30 minutes before the session:

- [ ] `cd sample-extension && node index.js` — server running on 8080
- [ ] `ngrok http --domain=YOUR-STATIC-DOMAIN 8080` — tunnel active
- [ ] Open **http://localhost:4040** in browser (ngrok inspector) — keep in background
- [ ] Open GitHub.com in browser, navigate to the repo
- [ ] Test: `@techmart-runbook ping` responds in Copilot Chat
- [ ] Test the two demo queries (see demo-script.md) — confirm both get good responses
- [ ] Have `sample-extension/index.js` open in VS Code for Step 4 of the demo

---

## Troubleshooting

### `@techmart-runbook` doesn't appear in Chat autocomplete

1. Is the GitHub App installed? Check: **Settings → Applications → Installed GitHub Apps**
2. Is the Copilot tab configured with the agent URL? Check: `https://github.com/settings/apps/YOUR-APP-NAME/agent`
3. Did you accept the terms in the Copilot tab?
4. VS Code: restart the IDE (required after new extension installs)
5. Business/Enterprise org: is the Extensions policy enabled?

### The extension appears but gives "Something went wrong" or no response

1. Is your local server running? (`node index.js` in terminal)
2. Is ngrok running? Check `http://localhost:4040` for incoming requests
3. Did the request hit your server? If yes (you see it in ngrok dashboard), check the server terminal for errors
4. Is the ngrok URL in GitHub App settings matching your current tunnel URL?

### ngrok shows connection but server returns 401

That's the signature verification check — expected when calling from curl or a non-GitHub source. From Copilot Chat, GitHub signs the request and verification will pass.

### `Cannot find module '@copilot-extensions/preview-sdk'`

```bash
cd sample-extension && npm install
```

### The extension worked yesterday but not today

ngrok ephemeral domain changed. If you're using a **static domain**, this shouldn't happen. If using an ephemeral domain:
1. Get new ngrok URL from terminal
2. Update **both** the **Callback URL** (General tab) and **URL** (Copilot tab) in GitHub App settings
3. Re-test

### Webhook error in GitHub App settings

You left "Active" checked on the Webhook setting. Go to GitHub App settings → **General** → scroll to **Webhook** → uncheck **Active** → **Save changes**.

---

## What the Code Does (for the Demo Walkthrough)

When you open `sample-extension/index.js` during the demo, point out these three things:

```
1. Request verification (lines ~26-34)
   verifyAndParseRequest() checks GitHub's cryptographic signature.
   Rejects anything not from GitHub — security by default.

2. Runbook search (lines ~38-42)
   searchRunbooks() does keyword matching against runbooks.json.
   In production, you'd use embeddings or a vector store.

3. SSE response (lines ~44-49)
   createAckEvent() → createTextEvent(answer) → createDoneEvent()
   Copilot requires this streaming format — the SDK handles the boilerplate.
```

The key message: **"This is the whole thing. An HTTP server, a data lookup, and a streamed response. The hardest part is deciding what knowledge to expose."**
