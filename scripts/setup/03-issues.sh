#!/usr/bin/env bash
# scripts/setup/03-issues.sh
# Creates all 24 TechMart sprint backlog issues with full bodies, labels,
# and milestone assignments. Issues are created in order (#1–#24) so the
# dependency references in each body resolve correctly.
#
# IMPORTANT: Run this in a repo with NO existing issues, or the issue
# numbers will not match the dependency graph expected by the
# sprint-impact-analysis agentic workflow.
#
# Usage: bash scripts/setup/03-issues.sh [owner/repo]
# Prerequisites: labels and milestones must exist (run 01 and 02 first)

set -euo pipefail

REPO="${1:-anweiss/nyc-dev-days}"

# Resolve milestone titles (gh issue create --milestone accepts the title)
ms() {
  local prefix="$1"
  gh api "repos/$REPO/milestones" --jq ".[] | select(.title | startswith(\"$prefix\")) | .title"
}

MS1=$(ms "Sprint 1")
MS2=$(ms "Sprint 2")
MS3=$(ms "Sprint 3")
MS4=$(ms "Sprint 4")
MS5=$(ms "Sprint 5")

echo "==> Milestone IDs: S1=$MS1 S2=$MS2 S3=$MS3 S4=$MS4 S5=$MS5"

create_issue() {
  local title="$1" body="$2" labels="$3" milestone="$4"
  gh issue create \
    --repo "$REPO" \
    --title "$title" \
    --body "$body" \
    --label "$labels" \
    --milestone "$milestone"
}

echo "==> Creating issues in $REPO"

# ── SPRINT 1 ──────────────────────────────────────────────────────────────────

create_issue \
  "CART-001: Product catalog — browsable storefront with category filtering" \
  "## Overview
Implement the public product catalog page. Users should be able to browse all products and filter by category (phones, audio, wearables, accessories).

## Acceptance Criteria
- [ ] Product grid renders all products from the catalog data
- [ ] Category filter buttons update the visible products without a page reload
- [ ] Each product card shows: image placeholder, name, category, rating, price, and an Add to Cart button
- [ ] Filter state persists if the user navigates back to the catalog

## Notes
This is the foundation of the storefront. All other product-facing features depend on this." \
  "cart,enhancement,sprint-1" "$MS1"

echo "  [ok] #1 CART-001"

create_issue \
  "CART-002: Add-to-cart — client-side cart state with item count badge" \
  "## Overview
Add client-side cart functionality. Users can add products to a cart that persists in memory. The cart icon in the header shows the total item count.

## Acceptance Criteria
- [ ] Clicking 'Add to Cart' adds the item to the in-memory cart array
- [ ] Adding the same item twice increments the quantity
- [ ] The cart badge in the header reflects the total item count
- [ ] A toast notification confirms the item was added

## Depends On
- #1 (CART-001 — Product catalog)

## Notes
Checkout (payment/persistence) is out of scope for this ticket — that is CART-003." \
  "cart,enhancement,sprint-1" "$MS1"

echo "  [ok] #2 CART-002"

create_issue \
  "CART-003: Cart API — backend integration for persistent cart and checkout" \
  "## Overview
Connect the client-side cart to a backend API for cart persistence across sessions and a real checkout flow. This ticket is currently **blocked** pending the backend team provisioning the Cart API endpoint.

## Acceptance Criteria
- [ ] Cart state is persisted to the backend on every add/remove action
- [ ] Cart is restored on page load if the user has an active session
- [ ] Checkout button initiates a real order creation via the Order API
- [ ] Error states handled gracefully (API timeout, out-of-stock)

## Depends On
- #2 (CART-002 — client-side cart state)

## Blocks
- #9  (ACC-005 — Wishlist: 'Move to Cart' action)
- #11 (PROMO-007 — Promotions Engine: requires real cart contents for discount eval)
- #14 (ORD-001 — Order Service: converts cart to order)

## Status
🔴 Blocked — waiting on backend API provisioning (3 weeks and counting)" \
  "cart,enhancement,sprint-1" "$MS1"

echo "  [ok] #3 CART-003"

create_issue \
  "PDP-001: Product Detail Page — full product view with specs, breadcrumbs, and cart integration" \
  "## Overview
Create a dedicated product detail page (\`product.html\`) that shows full product information when a user clicks any product card. Route via URL param (\`?id=N\`).

## Acceptance Criteria
- [ ] Navigating to \`product.html?id=1\` renders the correct product
- [ ] Page includes: breadcrumb nav (Home > Category > Product), large emoji/image placeholder, product name, price, rating with review count, short description, and an Add to Cart button
- [ ] 404-style message shown for unknown product IDs
- [ ] Cart integration: Add to Cart works the same as on the catalog page
- [ ] Back link returns to the catalog (preserving the active category filter if possible)
- [ ] No new dependencies introduced; vanilla HTML/CSS/JS only

## Notes
This is a self-contained feature with no upstream dependencies — a great candidate for the Copilot coding agent." \
  "cart,enhancement,sprint-1" "$MS1"

echo "  [ok] #4 PDP-001"

# ── SPRINT 2 ──────────────────────────────────────────────────────────────────

create_issue \
  "AUTH-001: User login flow — email/password authentication with session management" \
  "## Overview
Implement the user login page and session management. Users can sign in with email and password. Session token is stored client-side and sent with subsequent API requests.

## Acceptance Criteria
- [ ] Login form with email + password fields and validation
- [ ] Successful auth stores a session token (localStorage or cookie)
- [ ] Failed auth shows a user-friendly error message
- [ ] 'Sign In' button in the header updates to show the logged-in user's name
- [ ] Session survives page reload

## Notes
All account-related features (Wishlist, Order History, Reviews) depend on this." \
  "auth,enhancement,sprint-2" "$MS2"

echo "  [ok] #5 AUTH-001"

create_issue \
  "AUTH-002: User registration — sign-up form with email verification" \
  "## Overview
Implement the user registration flow. New users can create an account with email, password, and display name. A verification email is sent on registration.

## Acceptance Criteria
- [ ] Registration form with name, email, password, and confirm-password fields
- [ ] Client-side validation before submission
- [ ] Verification email sent via transactional email service
- [ ] User is logged in automatically after verifying their email
- [ ] Duplicate email check returns a clear error

## Depends On
- #5 (AUTH-001 — login flow and session management)" \
  "auth,enhancement,sprint-2" "$MS2"

echo "  [ok] #6 AUTH-002"

create_issue \
  "AUTH-003: Password reset — forgot password and reset via email link" \
  "## Overview
Allow users to reset their password via a time-limited email link.

## Acceptance Criteria
- [ ] 'Forgot password?' link on the login page
- [ ] Email input collects the address; a reset link is sent if the account exists
- [ ] Reset link is valid for 1 hour and single-use
- [ ] New password meets complexity requirements
- [ ] User is redirected to login after successful reset

## Depends On
- #5 (AUTH-001 — session management infrastructure)" \
  "auth,enhancement,sprint-2" "$MS2"

echo "  [ok] #7 AUTH-003"

create_issue \
  "AUTH-004: OAuth login — Sign in with GitHub" \
  "## Overview
Add GitHub OAuth as a login option. Users can authenticate with their GitHub account without creating a separate password.

## Acceptance Criteria
- [ ] 'Sign in with GitHub' button on the login page
- [ ] GitHub OAuth flow redirects back to TechMart and creates/links an account
- [ ] Existing accounts with matching email are automatically linked
- [ ] OAuth session uses the same token format as email/password auth

## Depends On
- #5 (AUTH-001 — session management)" \
  "auth,enhancement,sprint-2" "$MS2"

echo "  [ok] #8 AUTH-004"

create_issue \
  "ACC-005: Wishlist — save products and move to cart" \
  "## Overview
Allow authenticated users to save products to a wishlist. Wishlisted products can be moved to the cart.

## Acceptance Criteria
- [ ] Heart icon on each product card toggles wishlist status
- [ ] Wishlist is persisted server-side, linked to the user's account
- [ ] Dedicated 'Wishlist' page lists all saved products
- [ ] 'Move to Cart' action on each wishlist item
- [ ] Wishlist count badge shown in account nav

## Depends On
- #5  (AUTH-001 — user must be logged in)
- #3  (CART-003 — Move to Cart requires the Cart API)" \
  "accounts,enhancement,sprint-2" "$MS2"

echo "  [ok] #9 ACC-005"

create_issue \
  "ACC-006: User profile — account details and preferences page" \
  "## Overview
Authenticated users can view and edit their account details: display name, email, and notification preferences.

## Acceptance Criteria
- [ ] Profile page accessible from account nav
- [ ] Editable fields: display name, email (with re-verification), marketing opt-in
- [ ] Changes saved with confirmation message
- [ ] Password change option (separate from forgot-password flow)

## Depends On
- #5 (AUTH-001 — user must be logged in)" \
  "accounts,enhancement,sprint-2" "$MS2"

echo "  [ok] #10 ACC-006"

# ── SPRINT 3 ──────────────────────────────────────────────────────────────────

create_issue \
  "PROMO-007: Promotions Engine — discount rules and coupon code evaluation" \
  "## Overview
Build the promotions engine that evaluates discount rules against the user's cart. Supports percentage discounts, fixed-amount discounts, and minimum order thresholds.

## Acceptance Criteria
- [ ] Admin can create promotion rules (code, discount type, value, expiry)
- [ ] Cart total recalculates automatically when a valid promo code is applied
- [ ] Invalid or expired codes return a clear error message
- [ ] Discount is visible as a line item in the cart summary
- [ ] Promo codes are single-use per account (if configured)

## Depends On
- #5 (AUTH-001 — user identity for per-account limits)
- #3 (CART-003 — requires real cart contents for discount evaluation)

## Blocks
- #12 (PROMO-008 — Flash Sale Page)
- #13 (PROMO-009 — Coupon Codes at checkout)" \
  "promotions,enhancement,sprint-3" "$MS3"

echo "  [ok] #11 PROMO-007"

create_issue \
  "PROMO-008: Flash Sale Page — time-limited deals with countdown timer" \
  "## Overview
A dedicated flash sale page showing time-limited discounted products with a live countdown timer.

## Acceptance Criteria
- [ ] Flash sale page accessible from the Deals banner
- [ ] Countdown timer shows hours/minutes/seconds remaining
- [ ] Discounted price and original price both displayed
- [ ] 'Add to Cart' triggers promotion code auto-application
- [ ] Page shows 'Sale Ended' state gracefully when timer expires

## Depends On
- #11 (PROMO-007 — Promotions Engine: discount rules required)" \
  "promotions,enhancement,sprint-3" "$MS3"

echo "  [ok] #12 PROMO-008"

create_issue \
  "PROMO-009: Coupon Codes at checkout — UI for applying promo codes" \
  "## Overview
Add a coupon code input field to the checkout flow that integrates with the Promotions Engine.

## Acceptance Criteria
- [ ] Coupon code input shown on the checkout summary page
- [ ] 'Apply' button validates code via Promotions Engine API
- [ ] Valid code: updates order total, shows discount line item
- [ ] Invalid/expired code: inline error message
- [ ] Applied code persists if user navigates back to cart

## Depends On
- #11 (PROMO-007 — Promotions Engine)
- #3  (CART-003 — Cart API: checkout flow)" \
  "promotions,enhancement,sprint-3" "$MS3"

echo "  [ok] #13 PROMO-009"

create_issue \
  "ORD-001: Order Service — convert cart to order and persist order record" \
  "## Overview
Implement the Order Service that converts a confirmed cart into a persisted order record. This is the core of the checkout pipeline.

## Acceptance Criteria
- [ ] Checkout button initiates order creation via the Order Service API
- [ ] Order record includes: user ID, line items, pricing, shipping address, timestamp
- [ ] Order ID returned and displayed on the confirmation page
- [ ] Inventory is decremented on successful order creation
- [ ] Failed order creation rolls back payment and shows a clear error

## Depends On
- #3 (CART-003 — Cart API: source of cart contents)
- #5 (AUTH-001 — user identity required for order ownership)

## Blocks
- #15 (ORD-002 — Order Confirmation Page)
- #17 (ACC-012 — Order History)
- #19 (NOTIF-001 — Order Notifications)
- #20 (REVIEW-001 — Product Reviews)" \
  "orders,enhancement,sprint-3" "$MS3"

echo "  [ok] #14 ORD-001"

create_issue \
  "ORD-002: Order Confirmation Page — post-checkout summary with order ID" \
  "## Overview
Show a confirmation page immediately after a successful order, displaying the order ID, itemized summary, estimated delivery, and next steps.

## Acceptance Criteria
- [ ] Redirected to confirmation page after checkout success
- [ ] Page shows: order ID, items ordered, subtotal/tax/total, shipping address, estimated delivery
- [ ] 'View Order History' link navigates to ACC-012
- [ ] Email confirmation is triggered (see NOTIF-001)
- [ ] Cart is cleared after confirmation

## Depends On
- #14 (ORD-001 — Order Service: order ID required)" \
  "orders,enhancement,sprint-3" "$MS3"

echo "  [ok] #15 ORD-002"

create_issue \
  "SEARCH-001: Site-wide product search with keyword filtering and ranking" \
  "## Overview
Add a search bar to the site header. Users can search the product catalog by keyword. Results are ranked by relevance (name match > description match > category match).

## Acceptance Criteria
- [ ] Search input in the header (or a dedicated search page at \`/search?q=\`)
- [ ] Results update as user types (debounced, min 2 characters)
- [ ] No results state with helpful message
- [ ] Result items link to the product detail page (PDP-001)
- [ ] Search query reflected in page title and URL for shareability

## Depends On
- #4 (PDP-001 — Product Detail Page: result items link here)" \
  "platform,enhancement,sprint-3" "$MS3"

echo "  [ok] #16 SEARCH-001"

# ── SPRINT 4 ──────────────────────────────────────────────────────────────────

create_issue \
  "ACC-012: Order History — list of past orders with status and detail view" \
  "## Overview
Authenticated users can view a paginated list of their past orders, with status indicators and a detail view for each order.

## Acceptance Criteria
- [ ] Order History page accessible from account nav
- [ ] Paginated list of orders (most recent first), showing: order ID, date, status, total
- [ ] Clicking an order shows the full order detail (same info as ORD-002 confirmation page)
- [ ] Status values: Processing, Shipped, Delivered, Cancelled
- [ ] Empty state when user has no orders

## Depends On
- #14 (ORD-001 — Order Service: source of order data)
- #5  (AUTH-001 — user must be logged in)

## Blocks
- #18 (OPS-009 — Returns Portal: depends on order history)" \
  "accounts,enhancement,sprint-4" "$MS4"

echo "  [ok] #17 ACC-012"

create_issue \
  "OPS-009: Returns Portal — initiate and track product returns" \
  "## Overview
Allow users to initiate a return for any delivered order within 30 days. Returns are tracked through a workflow: Requested > Approved > Shipped > Refunded.

## Acceptance Criteria
- [ ] 'Return Item' option on each delivered order in Order History
- [ ] Return reason selection (defective, wrong item, not as described, other)
- [ ] Return confirmation with prepaid shipping label (simulated)
- [ ] Status updates visible in Order History
- [ ] Refund status shown once warehouse confirms receipt

## Depends On
- #14 (ORD-001 — Order Service: order data required)
- #17 (ACC-012 — Order History: entry point for initiating returns)" \
  "operations,enhancement,sprint-4" "$MS4"

echo "  [ok] #18 OPS-009"

create_issue \
  "NOTIF-001: Notification Service — transactional emails for orders and account events" \
  "## Overview
Implement a notification service that sends transactional emails for key events: order confirmation, shipping update, password reset, and account registration.

## Acceptance Criteria
- [ ] Order confirmation email sent within 30s of order creation (ORD-001)
- [ ] Shipping update email sent when order status changes to 'Shipped'
- [ ] Password reset email (AUTH-003) routes through this service
- [ ] Registration verification email (AUTH-002) routes through this service
- [ ] All emails use a consistent branded template
- [ ] Unsubscribe link included in marketing emails

## Depends On
- #14 (ORD-001 — Order Service: triggers order emails)" \
  "platform,enhancement,sprint-4" "$MS4"

echo "  [ok] #19 NOTIF-001"

create_issue \
  "REVIEW-001: Product Reviews — ratings and written reviews on product pages" \
  "## Overview
Allow authenticated users who have purchased a product to leave a star rating and written review. Reviews are displayed on the product catalog cards and detail page.

## Acceptance Criteria
- [ ] 'Write a Review' option visible on PDP for products the user has purchased
- [ ] Star rating (1–5) and text field (min 20, max 500 characters)
- [ ] Reviews displayed in a list on the product detail page
- [ ] Average rating calculated and shown on catalog product cards
- [ ] Pagination for products with many reviews (10 per page)
- [ ] Moderation queue: reviews are pending until approved (can be instant for demo)

## Depends On
- #5  (AUTH-001 — user must be logged in)
- #14 (ORD-001 — only verified purchasers can review)" \
  "platform,enhancement,sprint-4" "$MS4"

echo "  [ok] #20 REVIEW-001"

# ── SPRINT 5 ──────────────────────────────────────────────────────────────────

create_issue \
  "SUP-001: Help Center — searchable FAQ and article library" \
  "## Overview
Build a self-service Help Center with categorized articles and a search function. Articles cover common topics: shipping, returns, account, payments.

## Acceptance Criteria
- [ ] Help Center accessible from the footer and support nav
- [ ] Articles organized by category (Shipping, Returns, Account, Payments, Products)
- [ ] Search bar filters articles by keyword
- [ ] Article detail page with breadcrumb nav
- [ ] 'Was this helpful?' feedback on each article

## Notes
No upstream dependencies — can be built independently." \
  "support,enhancement,sprint-5" "$MS5"

echo "  [ok] #21 SUP-001"

create_issue \
  "SUP-002: Contact Us — support ticket submission form" \
  "## Overview
A contact form that lets users submit a support request. The submission creates a ticket in the support queue and sends an auto-acknowledgement email.

## Acceptance Criteria
- [ ] Contact form: name, email, order ID (optional), subject, message
- [ ] Submission creates a ticket record and returns a ticket ID
- [ ] Auto-acknowledgement email sent to the user (via NOTIF-001)
- [ ] Support team receives notification of new ticket
- [ ] Form is accessible without login; logged-in users have fields pre-filled

## Depends On
- #5  (AUTH-001 — pre-fill for logged-in users)
- #19 (NOTIF-001 — auto-acknowledgement email)" \
  "support,enhancement,sprint-5" "$MS5"

echo "  [ok] #22 SUP-002"

create_issue \
  "PERF-001: Core Web Vitals optimization — LCP, CLS, and FID improvements" \
  "## Overview
Audit and improve TechMart's Core Web Vitals scores to meet Google's 'Good' threshold. Focus on Largest Contentful Paint (LCP) and Cumulative Layout Shift (CLS).

## Acceptance Criteria
- [ ] LCP < 2.5s on mobile (throttled 4G) measured via Lighthouse
- [ ] CLS < 0.1 across all main pages
- [ ] Images have explicit width/height to prevent layout shift
- [ ] Above-the-fold content renders without render-blocking resources
- [ ] Lighthouse performance score ≥ 90 on the catalog page

## Depends On
- #4  (PDP-001 — product detail page: largest page to optimize)
- #16 (SEARCH-001 — search results page also needs optimization)" \
  "platform,enhancement,sprint-5" "$MS5"

echo "  [ok] #23 PERF-001"

create_issue \
  "A11Y-001: Accessibility audit — WCAG 2.1 AA compliance across all pages" \
  "## Overview
Conduct an accessibility audit of TechMart and resolve all WCAG 2.1 AA violations. Focus on keyboard navigation, screen reader compatibility, and color contrast.

## Acceptance Criteria
- [ ] All interactive elements reachable and operable via keyboard alone
- [ ] All images have meaningful alt text (or empty alt for decorative)
- [ ] Color contrast ratio ≥ 4.5:1 for all body text
- [ ] Modal dialogs trap focus correctly and can be dismissed with Escape
- [ ] ARIA labels on icon-only buttons (cart, filter buttons)
- [ ] axe or WAVE audit shows zero 'critical' or 'serious' violations

## Notes
No upstream dependencies — can be worked in parallel with any sprint." \
  "platform,enhancement,sprint-5" "$MS5"

echo "  [ok] #24 A11Y-001"

echo ""
echo "==> All 24 issues created."
echo "    Verify issue numbers are sequential (1-24) before running 04-projects.sh"
