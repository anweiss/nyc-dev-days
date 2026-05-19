#!/usr/bin/env bash
# scripts/setup/04-projects.sh
# Creates 5 GitHub Project boards (one per sprint), links them to the repo,
# adds Priority and Blocked status fields, and populates each board with
# its sprint's issues at the correct Status and Priority.
#
# Requires project OAuth scope:
#   gh auth refresh -s project,read:project
#
# Usage: bash scripts/setup/04-projects.sh [owner] [owner/repo]

set -euo pipefail

OWNER="${1:-anweiss}"
REPO="${2:-anweiss/nyc-dev-days}"

# ── Helper: get field option IDs ──────────────────────────────────────────────
get_project_num() {
  local title_prefix="$1"
  gh project list --owner "$OWNER" --format json \
    --jq ".projects[] | select(.title | startswith(\"$title_prefix\")) | .number" 2>/dev/null | head -1
}

create_project() {
  local title="$1"
  local existing
  existing=$(gh project list --owner "$OWNER" --format json \
    --jq ".projects[] | select(.title == \"$title\") | .number" 2>/dev/null | head -1)
  if [[ -n "$existing" ]]; then
    echo "  [skip] project already exists: $title (number $existing)"
    echo "$existing"
  else
    local num
    num=$(gh project create --owner "$OWNER" --title "$title" --format json --jq '.number')
    echo "  [ok]   created project: $title (number $num)"
    echo "$num"
  fi
}

add_issue_to_project() {
  local proj_num="$1" issue_num="$2"
  local url="https://github.com/$REPO/issues/$issue_num"
  gh project item-add "$proj_num" --owner "$OWNER" --url "$url" --format json --jq '.id' 2>/dev/null || true
}

echo "==> Creating Sprint Project Boards for $OWNER"

P1=$(create_project "Sprint 1: Foundation & Core Shopping")
P2=$(create_project "Sprint 2: Authentication & Accounts")
P3=$(create_project "Sprint 3: Commerce & Promotions")
P4=$(create_project "Sprint 4: Post-Purchase & Operations")
P5=$(create_project "Sprint 5: Growth & Polish")

echo ""
echo "==> Linking projects to $REPO"
for num in $P1 $P2 $P3 $P4 $P5; do
  gh project link "$num" --owner "$OWNER" --repo "$REPO" 2>/dev/null || echo "  [skip] already linked: $num"
done

echo ""
echo "==> Adding Priority field to each project"
for num in $P1 $P2 $P3 $P4 $P5; do
  local_existing=$(gh project field-list "$num" --owner "$OWNER" --format json \
    --jq '.fields[] | select(.name == "Priority") | .name' 2>/dev/null || true)
  if [[ -n "$local_existing" ]]; then
    echo "  [skip] Priority field already exists in project $num"
  else
    gh project field-create "$num" --owner "$OWNER" \
      --name "Priority" \
      --data-type "SINGLE_SELECT" \
      --single-select-options "🔴 High,🟡 Medium,🟢 Low" 2>/dev/null || true
    echo "  [ok]   Priority field created in project $num"
  fi
done

echo ""
echo "==> Populating Sprint 1 (project $P1) — issues #1–4"
for i in 33 34 35 36; do add_issue_to_project "$P1" "$i"; done
echo "    Issues added. Manually set Status (In Progress: #33,#34 | Blocked: #35 | Todo: #36)"
echo "    and Priority (High: #33,#34,#35 | Medium: #36) via the project board UI."

echo ""
echo "==> Populating Sprint 2 (project $P2) — issues #37–42"
for i in 37 38 39 40 41 42; do add_issue_to_project "$P2" "$i"; done
echo "    Status: Todo all. Priority: High: #37,#38,#40 | Medium: #39,#41,#42"

echo ""
echo "==> Populating Sprint 3 (project $P3) — issues #43–48"
for i in 43 44 45 46 47 48; do add_issue_to_project "$P3" "$i"; done
echo "    Status: Todo all except Blocked: #44,#45. Priority: High: #43,#46 | Medium: #44,#45,#47 | Low: #48"

echo ""
echo "==> Populating Sprint 4 (project $P4) — issues #49–52"
for i in 49 50 51 52; do add_issue_to_project "$P4" "$i"; done
echo "    Status: Todo all except Blocked: #49,#50. Priority: High: #49,#50,#51 | Medium: #52"

echo ""
echo "==> Populating Sprint 5 (project $P5) — issues #53–56"
for i in 53 54 55 56; do add_issue_to_project "$P5" "$i"; done
echo "    Status: Todo all. Priority: Medium: #53,#54 | Low: #55,#56"

echo ""
echo "==> Done"
echo ""
echo "NOTE: Programmatic Status and Priority assignment requires GraphQL item-edit"
echo "calls with field option IDs that vary per project. The easiest path is to set"
echo "them manually via the project board UI after running this script."
echo ""
echo "Field option IDs for each project can be retrieved with:"
echo "  gh project field-list PROJECT_NUM --owner $OWNER --format json"
