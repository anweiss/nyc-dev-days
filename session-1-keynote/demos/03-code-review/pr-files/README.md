# Code Review PR Files

This directory contains the version of files as they would appear in a pull request that Copilot Code Review analyzes during **Demo 3**.

## What Copilot Should Flag

The `users-with-issues.js` file contains three intentional issues:

| # | Issue | Severity | Copilot Comment |
|---|-------|----------|-----------------|
| 1 | Synchronous `fs.readFileSync` in async request handler | Moderate | "This blocks the event loop. Use `fs.promises.readFile` instead." |
| 2 | No `try/catch` around file operations | Critical | "If the file is missing or corrupted, this will crash the server." |
| 3 | No input validation on `POST /api/users` body | Moderate | "Missing validation — `name` and `email` could be undefined." |

## How to Use

1. Before the demo, create a branch from the demo-app code
2. Replace `src/routes/users.js` with `users-with-issues.js` from this folder
3. Open a PR from that branch to `main`
4. Request Copilot as a reviewer — it will flag the issues above
