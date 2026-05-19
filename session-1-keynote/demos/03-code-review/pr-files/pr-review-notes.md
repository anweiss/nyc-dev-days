# Copilot Code Review — Expected Findings for PDP-001

These are the issues Copilot code review is expected to surface on the PDP-001 PR.
Use this as a talking guide if the live review hasn't completed.

## Expected findings

### 🔴 Moderate — Accessibility: missing alt attribute
**Location:** `product.html` — the emoji product image placeholder  
**Issue:** The `<div>` used as a product image has no `aria-label` or `role`, making it invisible to screen readers.  
**Copilot suggestion:** Add `role="img"` and `aria-label="${product.name} product image"` to the placeholder element.

### 🟡 Low — SEO: document title hydration order  
**Location:** `product.html` — the `<script>` block  
**Issue:** `document.title` is set inside `renderProductDetail()` which runs after the browser has already parsed the `<title>` tag. For SPAs this is fine, but for crawlers it means the meta title may not be set.  
**Copilot suggestion:** Either set the title server-side or add a `<noscript>` fallback.

### 🟡 Low — Missing `aria-label` on icon buttons
**Location:** `product.html` — Wishlist and Cart buttons  
**Issue:** The "♡ Save to Wishlist" and cart buttons have text labels, but the cart icon-only button in the header does not.  
**Copilot suggestion:** Add `aria-label="Add to cart"` to the cart icon button.

### 🟢 Info — Input validation  
**Location:** `product.html` — `parseInt(params.get('id'), 10)`  
**Copilot note:** `parseInt('abc', 10)` returns `NaN`. `PRODUCTS.find(p => p.id === NaN)` returns `undefined`, which the 404 block handles correctly — but worth a comment explaining the intentional fallback.
