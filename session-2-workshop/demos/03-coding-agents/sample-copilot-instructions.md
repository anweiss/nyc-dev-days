# Sample: `.github/copilot-instructions.md`

This is an example `copilot-instructions.md` for a Node.js/Express API project. Adapt it to your team's conventions and tech stack.

Copy this file to `.github/copilot-instructions.md` in your repository.

---

<!-- START OF SAMPLE FILE CONTENT -->

# Copilot Instructions

This repository is a **Node.js REST API** built with Express, using PostgreSQL via `pg` (node-postgres), and Jest for testing. These instructions apply to all GitHub Copilot interactions — inline suggestions, chat, and the coding agent.

## Project Structure

```
src/
  routes/        # Express route handlers — one file per resource
  services/      # Business logic — no DB calls directly in routes
  db/            # Database client initialization and query helpers
  middleware/    # Express middleware (auth, validation, error handling)
  utils/         # Pure utility functions with no side effects
test/
  unit/          # Unit tests — mock all external dependencies
  integration/   # Integration tests — use a test DB (see test/setup.js)
```

## Naming Conventions

- **Files:** `kebab-case.js` (e.g., `user-service.js`, not `userService.js`)
- **Variables and functions:** `camelCase`
- **Classes:** `PascalCase`
- **Constants:** `UPPER_SNAKE_CASE`
- **Database tables:** `snake_case` (e.g., `user_accounts`, not `UserAccounts`)
- **Route handlers:** named exports, not default exports

## Coding Standards

### API Routes
- All routes must use the `asyncHandler` wrapper from `src/middleware/async-handler.js` to properly handle async errors
- All route parameters must be validated using Joi schemas defined in `src/validators/`
- Route handlers must NOT contain business logic — delegate to services
- Return HTTP status codes explicitly (do not rely on Express defaults)
- All endpoints must be documented with JSDoc

```javascript
// ✅ Correct
router.get('/:id', asyncHandler(async (req, res) => {
  const user = await userService.getById(req.params.id);
  if (!user) return res.status(404).json({ error: 'User not found' });
  res.status(200).json(user);
}));

// ❌ Incorrect — business logic in route, no error handling
router.get('/:id', async (req, res) => {
  const user = await db.query(`SELECT * FROM users WHERE id = ${req.params.id}`);
  res.json(user.rows[0]);
});
```

### Database
- All queries must be **parameterized** — no string interpolation of user input
- Use `db/client.js` for all database access — never instantiate `pg.Client` directly
- Use transactions for any operation that involves multiple queries
- Query functions belong in `src/db/queries/` — never inline SQL in services

```javascript
// ✅ Correct — parameterized query
const result = await db.query('SELECT * FROM users WHERE id = $1', [userId]);

// ❌ Never do this — SQL injection vulnerability
const result = await db.query(`SELECT * FROM users WHERE id = ${userId}`);
```

### Error Handling
- All errors must be instances of the custom error classes in `src/utils/errors.js`
- Use `AppError` for client errors (4xx), `InternalError` for server errors (5xx)
- Never expose stack traces or internal error details in API responses
- Log errors with `src/utils/logger.js` (Winston), not `console.log`

### Testing
- Every new function in `services/` or `routes/` must have a corresponding unit test
- Tests live in `test/unit/` — mirror the `src/` directory structure
- Use `jest.mock()` to mock all external dependencies (database, external APIs)
- Test file naming: `[filename].test.js` (e.g., `user-service.test.js`)
- Every route handler must have tests for: happy path, 404 case, and validation failure
- Use the test fixtures in `test/fixtures/` for test data — do not hardcode test data inline

```javascript
// ✅ Correct test structure
describe('userService.getById', () => {
  it('returns the user when found', async () => { ... });
  it('returns null when not found', async () => { ... });
  it('throws InternalError on database failure', async () => { ... });
});
```

## Dependencies

### Approved Libraries
- HTTP: `express`
- Database: `pg` (node-postgres)
- Validation: `joi`
- Logging: `winston`
- Testing: `jest`, `supertest`
- Dates: `date-fns` (not `moment`)
- Environment: `dotenv`

### Do NOT add without team review
- Do not add new dependencies without a comment in the PR explaining the choice
- Do not use `axios` (use Node `fetch` or `https` module)
- Do not use `lodash` (use native array/object methods)
- Do not use `sequelize` or any ORM — raw queries only

## What NOT to Do

- ❌ Do not commit code with `console.log` statements
- ❌ Do not hardcode environment-specific values — use `process.env` with documented defaults
- ❌ Do not write tests that depend on external network calls or a real database (unit tests)
- ❌ Do not skip validation on any user-supplied input
- ❌ Do not modify `src/db/client.js` or `src/middleware/auth.js` without explicit instruction
- ❌ Do not use synchronous file system operations (`fs.readFileSync`, etc.) in request handlers

## Pull Request Checklist

All PRs (including agent-generated ones) should satisfy:
- [ ] Unit tests added or updated
- [ ] No new `console.log` statements
- [ ] All user inputs validated with Joi
- [ ] Error handling follows the `AppError`/`InternalError` pattern
- [ ] No new unapproved dependencies added
- [ ] JSDoc on all new exported functions

<!-- END OF SAMPLE FILE CONTENT -->
