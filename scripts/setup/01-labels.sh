#!/usr/bin/env bash
# scripts/setup/01-labels.sh
# Creates the 15 custom labels used by the sprint dependency demo.
# Safe to re-run: skips labels that already exist.
#
# Usage: bash scripts/setup/01-labels.sh [owner/repo]
# Defaults to anweiss/nyc-dev-days if no argument supplied.

set -euo pipefail

REPO="${1:-anweiss/nyc-dev-days}"

create_label() {
  local name="$1" color="$2" description="$3"
  if gh label list --repo "$REPO" --json name -q '.[].name' | grep -qx "$name"; then
    echo "  [skip] label already exists: $name"
  else
    gh label create "$name" \
      --repo "$REPO" \
      --color "$color" \
      --description "$description"
    echo "  [ok]   created label: $name"
  fi
}

echo "==> Creating labels in $REPO"

# Domain labels
create_label "cart"        "F97316" "Shopping cart features"
create_label "auth"        "EC4899" "Authentication and session management"
create_label "accounts"    "8B5CF6" "User account features"
create_label "promotions"  "EF4444" "Deals, discounts, and promotions"
create_label "orders"      "F59E0B" "Order management and fulfillment"
create_label "operations"  "6B7280" "Operations and logistics"
create_label "support"     "10B981" "Customer support features"
create_label "platform"    "3B82F6" "Platform, infrastructure, and performance"
create_label "enhancement" "A855F7" "New feature or request"

# State label
create_label "blocked"     "FF0000" "Blocked by an unresolved dependency"

# Sprint labels
create_label "sprint-1"    "DBEAFE" "Sprint 1: Foundation & Core Shopping"
create_label "sprint-2"    "EDE9FE" "Sprint 2: Authentication & Accounts"
create_label "sprint-3"    "FCE7F3" "Sprint 3: Commerce & Promotions"
create_label "sprint-4"    "FEF3C7" "Sprint 4: Post-Purchase & Operations"
create_label "sprint-5"    "D1FAE5" "Sprint 5: Growth & Polish"

echo "==> Done"
