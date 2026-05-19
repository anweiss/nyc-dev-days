# Demo Script: IDE — VS Code (and JetBrains)

**Goal:** Show inline completions, Copilot Edits (multi-file), and inline chat on the TechMart codebase.  
**Duration:** ~6 minutes  
**Context in talk:** Developer is back in the editor, using Copilot as a pair programmer on TechMart.

---

## Prerequisites

- [ ] VS Code with Copilot extension installed and authenticated
- [ ] TechMart repo (`session-1-keynote/demos/demo-app/`) open in VS Code
- [ ] JetBrains IDE open with the same repo (for the cross-IDE moment)
- [ ] Font size 18pt+ in editor, 140% zoom
- [ ] Copilot Chat panel open in sidebar

---

## Steps

### Step 1 — Inline completions

Open `app.js`. Navigate to the `filterProducts` function.

Type a new function signature:
```javascript
function sortProducts(criteria) {
```

**What to say:**
> "I want to add sorting to the product grid. I start typing the function and Copilot picks up the pattern from the rest of `app.js`."

Accept Copilot's completion (Tab). Walk through what it suggested — it should complete a sort based on price, rating, or name using the `PRODUCTS` array.

---

### Step 2 — Inline Chat (`Cmd+I`)

Highlight the `renderSearchBanner` function (or whatever remains of it after the Autofix demo). Hit `Cmd+I`.

Type:
```
Add input sanitization using textContent instead of innerHTML, and also filter the search results to only show matching products
```

**What to say:**
> "I can describe a change in plain English. Copilot proposes a diff — I can accept, reject, or refine it without leaving the file."

Show the proposed diff, accept it.

---

### Step 3 — Copilot Edits (multi-file)

Open Copilot Edits mode (the pencil icon in the chat panel, or `Cmd+Shift+I` in newer VS Code versions).

Add both `app.js` and `index.html` to the edit context.

Type:
```
Add a "Sort by" dropdown to the product filter bar in index.html and wire it up to a new sortProducts function in app.js. Sort options: Price: Low to High, Price: High to Low, Highest Rated
```

**What to say:**
> "This is multi-file editing. I describe a feature that spans two files and Copilot applies diffs to both simultaneously. This is where it starts to feel less like autocomplete and more like a pair programmer."

Show the diffs proposed for both files. Accept.

---

### Step 4 — JetBrains moment (1 min)

Switch to JetBrains (IntelliJ or another IDE with TechMart open).

Show: inline completions are active, the Copilot Chat panel is visible.

**What to say:**
> "Same capabilities in JetBrains — completions, inline chat, the Chat panel. For teams living in IntelliJ for Java or Kotlin work, this is the same experience."

---

## Transition

**What to say:**
> "The IDE is where code happens. The last place I want to check before end of day is GitHub.com — where collaboration happens."

---

## Fallback

If the Copilot Edits UI has changed: show the inline chat (`Cmd+I`) workflow as the primary demo and describe multi-file editing as a follow-up capability.
