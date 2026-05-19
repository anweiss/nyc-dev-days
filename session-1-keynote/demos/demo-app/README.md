# TechMart Demo App

A fictional e-commerce storefront used as the shared demo application across both NYC Dev Days sessions.

## What it is

TechMart is a **static HTML/CSS/JS store** — no build step, no framework, no npm. It runs directly in a browser or on GitHub Pages.

The app has a realistic-looking product catalog, category filtering, and an add-to-cart flow. Several features are **intentionally stubbed out** (marked 🚧) to simulate a real sprint backlog — these stubs are the backbone of the sprint dependency demo in Session 2.

## Running locally

Open `index.html` in any browser. No server required.

## Stubbed features

| Feature | Ticket | Sprint |
|---|---|---|
| Shopping Cart (checkout) | CART-003 | Sprint 1 |
| Login / Sign Up | AUTH-001 | Sprint 2 |
| Wishlist | ACC-005 | Sprint 2 |
| Flash Sale Page | PROMO-008 | Sprint 3 |
| Order History | ACC-012 | Sprint 4 |
| Returns Portal | OPS-009 | Sprint 4 |
| Help Center | SUP-001 | Sprint 5 |

Clicking any stubbed feature opens a modal showing the ticket ID and sprint assignment. This is intentional — the `STUB_INFO` map in `app.js` drives this behavior. **Do not implement the stubs** unless the issue explicitly asks for it.

## GHAS Demo Hook

`app.js` contains a deliberate **XSS vulnerability** in `renderSearchBanner()`:
the `?search=` URL parameter is rendered via `innerHTML` without sanitization.
GitHub Advanced Security (CodeQL) flags this as CWE-79. Copilot Autofix proposes
replacing `innerHTML` with `textContent` as the fix.

**Do not fix this unless demonstrating the Autofix workflow.**

## Coding conventions

- Vanilla ES6+ — no frameworks, no module bundler
- CSS custom properties for theming — do not introduce preprocessors
- All state lives in global scope in `app.js`
- `STUB_INFO` map must be kept in sync with the GitHub Issues in this repo
