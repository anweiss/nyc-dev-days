# PDP-001: Product Detail Page — full product view with specs, breadcrumbs, and cart integration

## Overview
Create a dedicated product detail page (`product.html`) that shows full product information when a user clicks any product card in TechMart. Route via URL param (`?id=N`).

## Acceptance Criteria
- [ ] Navigating to `product.html?id=1` renders the correct product
- [ ] Page includes: breadcrumb nav (Home > Category > Product), large emoji/image placeholder, product name, price, rating with review count, short description, and an Add to Cart button
- [ ] 404-style message shown for unknown product IDs
- [ ] Cart integration: Add to Cart works the same as on the catalog page (adds to in-memory cart, shows toast)
- [ ] Back link returns to the catalog at the correct category filter
- [ ] No new dependencies introduced; vanilla HTML/CSS/JS only

## Notes
This is a self-contained feature with no upstream dependencies — the product data is already defined in `app.js`. The page should load `app.js` and read from the `PRODUCTS` array using the `id` URL param.

This is a great candidate for the Copilot coding agent — clear scope, no ambiguity, measurable acceptance criteria.
