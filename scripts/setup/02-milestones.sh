#!/usr/bin/env bash
# scripts/setup/02-milestones.sh
# Creates 5 sprint milestones in the repo.
# Safe to re-run: skips milestones that already exist by title.
#
# Usage: bash scripts/setup/02-milestones.sh [owner/repo]

set -euo pipefail

REPO="${1:-anweiss/nyc-dev-days}"
OWNER="${REPO%%/*}"
REPO_NAME="${REPO##*/}"

create_milestone() {
  local title="$1" due="$2"
  local existing
  existing=$(gh api "repos/$REPO/milestones" --jq ".[] | select(.title == \"$title\") | .number" 2>/dev/null || true)
  if [[ -n "$existing" ]]; then
    echo "  [skip] milestone already exists: $title (number $existing)"
  else
    gh api "repos/$REPO/milestones" \
      --method POST \
      -f title="$title" \
      -f due_on="${due}T00:00:00Z" \
      --jq '"  [ok]   created milestone: \(.title) (number \(.number))"'
  fi
}

echo "==> Creating milestones in $REPO"

# 2-week sprints starting from today's month
create_milestone "Sprint 1: Foundation & Core Shopping"   "2026-05-30"
create_milestone "Sprint 2: Authentication & Accounts"    "2026-06-13"
create_milestone "Sprint 3: Commerce & Promotions"        "2026-06-27"
create_milestone "Sprint 4: Post-Purchase & Operations"   "2026-07-11"
create_milestone "Sprint 5: Growth & Polish"              "2026-07-25"

echo "==> Done"
echo ""
echo "Note: capture milestone numbers for use in 03-issues.sh"
gh api "repos/$REPO/milestones" --jq '.[] | "\(.number) — \(.title)"' | sort
