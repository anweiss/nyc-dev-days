# Demo Script: Code Quality — GHAS Autofix

**Goal:** Show a GHAS code scanning alert (XSS/CWE-79) and Copilot Autofix generating a one-click security fix.  
**Duration:** ~4 minutes  
**Context in talk:** After code review, we zoom out to GitHub's built-in security scanning layer.

---

## Prerequisites

- [ ] GitHub Advanced Security enabled on the demo repo
- [ ] Copilot Autofix enabled: **Repo Settings → Code security → Copilot Autofix → Enable**
- [ ] At least one open `js/xss` code scanning alert from CodeQL (targeting `app.js`)
- [ ] Navigate to **Security → Code scanning** before going on stage and leave this tab open

### The vulnerability (for reference)

In `session-1-keynote/demos/demo-app/app.js`, the `renderSearchBanner()` function:

```javascript
// VULNERABLE: unsanitized user input via innerHTML (CWE-79)
document.getElementById("search-results-title").innerHTML = `Showing results for: <strong>${query}</strong>`;
```

The `?search=` URL parameter is written directly to `innerHTML` without sanitization. An attacker crafts a URL like:
```
?search=<img src=x onerror=alert('XSS')>
```
…and any user who clicks that link executes the attacker's JavaScript.

---

## Steps

### Step 1 — Navigate to the Code Scanning alert

Go to **Security → Code scanning** and click on the `js/xss` alert.

**What to say:**
> "GitHub Advanced Security runs CodeQL — a semantic analysis engine — on every push. Here it flagged an XSS vulnerability in our TechMart app. This is real. The `?search=` URL parameter is written directly into the DOM via innerHTML. An attacker can craft a URL that runs arbitrary JavaScript in any user's browser."

Point out:
- Alert severity: High
- CWE-79 classification
- File: `app.js`, line in `renderSearchBanner()`

---

### Step 2 — Click "Generate fix"

Click the **Generate fix** button (Copilot Autofix).

**What to say:**
> "One click. Copilot Autofix analyzes the vulnerability and proposes a code change — not advice, an actual diff."

---

### Step 3 — Review the Autofix suggestion

Copilot proposes replacing:
```javascript
document.getElementById("search-results-title").innerHTML = `Showing results for: <strong>${query}</strong>`;
```

With something like:
```javascript
const title = document.getElementById("search-results-title");
const prefix = document.createTextNode("Showing results for: ");
const strong = document.createElement("strong");
strong.textContent = query;  // textContent is safe — no HTML parsing
title.appendChild(prefix);
title.appendChild(strong);
```

Or more simply, `textContent` for the whole string if the `<strong>` formatting isn't needed.

**What to say:**
> "The fix replaces innerHTML with textContent — which never parses input as HTML, so an attacker's script tags are rendered as literal text instead of executed. The fix also includes an explanation of what the attack vector was and why this change closes it."

---

### Step 4 — Apply and commit

Click **Commit fix** directly on the alert page.

**What to say:**
> "One more click — the fix is committed. The alert is resolved. No ticket, no PR, no back-and-forth. Copilot Autofix can resolve about 70% of GHAS alerts automatically. That's how your security backlog shrinks without requiring every developer to become a security expert."

---

## Talking point — Scale

> "This works at scale too. In a large org, you might have hundreds of open GHAS alerts. You can batch Autofix across all of them, review the proposed fixes, and ship a security cleanup PR — one PR that closes fifty alerts."

---

## Fallback

If GHAS hasn't run yet: show a screenshot of a `js/xss` alert from another repo, walk through the Autofix UI conceptually, and paste the vulnerable code + fix side-by-side in the terminal.
