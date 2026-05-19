# Sprint Impact Analysis — Prompt Template

Use this template to analyze the downstream effects of a delayed or cancelled sprint item.
Replace all `[BRACKETED]` values before running. Works in Copilot Chat on GitHub.com, VS Code, or CLI.

---

Issue **#[ISSUE_NUMBER]** — **[ISSUE_TITLE]** — has been **[delayed to Sprint X / cancelled entirely]**.

Please analyze the impact on the rest of the backlog:

1. **Blast radius** — Which open issues in this repository depend on this issue, directly or transitively? List each one with:
   - Issue number and title
   - Whether the dependency is direct or transitive
   - Which sprint it belongs to (check the milestone)

2. **Sprint-by-sprint impact** — Group the impacted issues by sprint milestone. What does each sprint lose?

3. **Critical path** — What is the longest dependency chain stemming from this issue? Show it as an arrow diagram (e.g., `#3 → #14 → #17 → #18`).

4. **Recommendations** — Give three concrete options the team could consider, with trade-offs for each.

5. **Quick wins** — Are there any open issues that do NOT depend on #[ISSUE_NUMBER] and could be pulled forward to fill the sprint capacity?

Format the blast radius as a markdown table with columns: Issue | Title | Sprint | Dependency Type.

---

## How to use

1. Open Copilot Chat in GitHub.com, VS Code, or the CLI
2. Attach this repository as context (click `+` → "This repository" in GitHub.com Copilot Chat)
3. Paste the filled-in prompt above
4. Follow up with: *"If we accept that #[ISSUE_NUMBER] slips by one sprint, what can the team start on that has no dependency on it?"*
