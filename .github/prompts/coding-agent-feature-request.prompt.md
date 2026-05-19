# Session 1 — Coding Agent Feature Request

Use this template when filing issues intended for the GitHub Copilot coding agent to implement.
Well-structured issues get better results. Fill in the bracketed values before creating the issue.

---

## [FEATURE TITLE — verb phrase, e.g. "Add rate limiting to the /tasks endpoint"]

## Summary

[One to two sentences describing what the feature does and why it's needed.]

## Acceptance Criteria

- [ ] [Specific, testable requirement 1]
- [ ] [Specific, testable requirement 2]
- [ ] [Specific, testable requirement 3]
- [ ] Unit tests cover the happy path and at least one error path

## Example Request / Response

```http
[METHOD] /[endpoint]
Content-Type: application/json

{
  "[field]": "[value]"
}
```

```json
{
  "[response_field]": "[example_value]"
}
```

## Constraints

- No new npm dependencies without prior approval
- Follow existing patterns in `src/routes/` and `src/db/`
- Tests go in `tests/[resource].test.js`
- Follow all standards in `.github/copilot-instructions.md`

## What NOT to touch

- Do not modify `src/db/connection.js` or `src/middleware/auth.js`
- Do not refactor existing working code unless it directly conflicts with this feature
