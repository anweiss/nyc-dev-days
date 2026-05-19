---
name: "Demo: Feature request"
about: "Pre-staged issue for the Coding Agent demo (Demo 2)"
title: "feat: add /health endpoint with version and uptime info"
labels: enhancement, demo
assignees: ""
---

## Description

Add a `GET /health` endpoint that returns the current health status of the API, including:

- Application version (from `package.json`)
- Server uptime in seconds
- Current timestamp
- Database connectivity status (`"ok"` or `"error"`)

## Acceptance Criteria

- [ ] `GET /health` returns a `200` response with JSON body
- [ ] Response includes `version`, `uptime`, `timestamp`, and `database` fields
- [ ] If the database is unreachable, the endpoint still returns `200` but sets `database: "error"`
- [ ] Unit tests cover the happy path and the database-down scenario

## Example Response

```json
{
  "status": "healthy",
  "version": "1.2.0",
  "uptime": 3612,
  "timestamp": "2026-05-10T14:30:00.000Z",
  "database": "ok"
}
```
