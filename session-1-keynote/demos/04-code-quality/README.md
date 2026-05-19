# Demo 4: Code Quality — Copilot Autofix & GHAS

## What This Demo Shows

GitHub Advanced Security (GHAS) scans for vulnerabilities like SQL injection, XSS, hardcoded secrets, and insecure dependencies. Copilot Autofix pairs with GHAS alerts to generate a code-level fix — complete with explanation — that developers can review and apply with a single click.

## Why It Matters in the Talk

Security is everyone's problem, but most developers aren't security experts. Autofix lowers the bar for fixing real vulnerabilities by removing the "now what?" friction after a GHAS alert fires.

## Required Setup / Accounts / Tools

- GitHub Advanced Security enabled on the repo (requires GitHub Enterprise or public repo)
- GitHub Copilot Autofix enabled (part of GHAS — check: **Repo Settings → Code security → Copilot Autofix**)
- At least one open Code Scanning alert in the demo repo
- Suggested alert types for a great demo: SQL injection (CWE-89), cross-site scripting (CWE-79), or path traversal
- Demo tip: Use a pre-existing alert; live scans take time. Navigate directly to the **Security → Code scanning** tab.

## Demo Duration

**~4 minutes**

## Key Concepts Demonstrated

- GitHub Advanced Security code scanning alert
- Copilot Autofix: AI-generated fix with explanation
- One-click commit of the fix
- The security education aspect: Copilot explains *why* the fix is safe

## Audience Takeaway

> "GHAS found a real vulnerability. Copilot wrote the fix. I reviewed and shipped it — without needing to be a security expert."
