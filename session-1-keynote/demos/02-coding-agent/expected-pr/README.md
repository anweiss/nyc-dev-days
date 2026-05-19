# Expected PR — PDP-001 Reference Files

These files show the *expected* output from the Copilot coding agent for Issue #4 (PDP-001 — Product Detail Page). The agent will generate its own code live — these are reference files for presenter verification and fallback.

## What the agent should produce

- **`product.html`** — new product detail page, routing via `?id=N` URL param
- **Changes to `app.js`** (not shown here) — product cards should link to `product.html?id=N` instead of showing the stub modal for non-stub products

## Acceptance criteria checklist (for PR review during Demo 3)

- [ ] `product.html?id=1` renders ProPhone 15 Ultra with correct price, rating, emoji
- [ ] `product.html?id=999` shows a "not found" state
- [ ] Breadcrumb shows Home > Category > Product Name
- [ ] Add to Cart button works (toast appears, cart count increments)
- [ ] Back link returns to the catalog
- [ ] No npm packages introduced
