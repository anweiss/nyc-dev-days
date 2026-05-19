# Copilot Instructions — NYC Dev Days / TechMart

## Project Overview

This is the **TechMart** demo project — a fictional e-commerce store used across both NYC Dev Days sessions. It is a static HTML/CSS/JS application (no server, no build step, no npm). All functionality runs in the browser.

## Demo Story

TechMart has a 24-issue sprint backlog spread across 5 sprints. The central demo conflict: **CART-003** (Issue #3, Cart API) is blocked in Sprint 1, causing a cascade of 9 downstream issues across Sprints 2–5. The `sprint-impact-analysis` agentic workflow detects this automatically when CART-003 is cancelled.

## Stack

- Vanilla HTML/CSS/JS — **no frameworks, no npm, no build step**
- GitHub Pages compatible (open `index.html` directly)
- CSS custom properties (`--primary`, `--bg`, `--surface`, etc.) — no preprocessors
- ES6+ modules via `<script type="module">` where applicable
- All application logic is in `app.js` in global scope

## Conventions

- Use `const` and `let` — never `var`
- CSS theming via custom properties only — never hardcode color values
- All user-facing text should be accessible (proper labels, alt text, ARIA where needed)
- No external CDN dependencies — self-contained files only
- Feature stubs in the `STUB_INFO` map must remain as stubs — see below

## The STUB_INFO Map

`app.js` contains a `STUB_INFO` map that links unimplemented features to their sprint ticket and metadata. When a user clicks a stubbed feature, a modal displays the ticket ID and sprint.

```js
const STUB_INFO = {
  'wishlist':   { ticket: 'WISH-001', sprint: 2, label: 'Wishlist' },
  'promotions': { ticket: 'PROMO-007', sprint: 3, label: 'Promo Engine' },
  // ...
};
```

**Do not replace stub implementations with real code.** The stubs exist so the demo app always works regardless of which sprint features have been "completed."

## Issue Format

Every issue body must include a `## Depends On` section. This section is parsed by the `sprint-impact-analysis` agentic workflow to build the dependency graph.

```markdown
## Depends On
- #3 CART-003 (Cart API Backend Integration)
```

If an issue has no dependencies, use:
```markdown
## Depends On
None
```

## Demo Exceptions

- `session-1-keynote/demos/demo-app/app.js` — contains a deliberate XSS vulnerability in `renderSearchBanner()` for the GHAS Autofix demo. **Do not fix this vulnerability.** It is intentional.
- Do not refactor demo files unless an issue explicitly requests it.

## File Organization

- Demo apps: `session-X-*/demos/demo-app/`
- Setup scripts: `scripts/setup/`
- Agentic workflow source: `.github/workflows/sprint-impact-analysis.md`
- Prompt template: `.github/prompts/inspect-delay.prompt.md`
