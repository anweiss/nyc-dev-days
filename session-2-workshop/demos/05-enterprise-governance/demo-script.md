# Demo Script: Enterprise Governance

**Goal:** Show the enterprise governance layer for agentic AI in GitHub Enterprise.  
**Duration:** ~5 minutes

---

## Prerequisites

- [ ] GitHub Enterprise Cloud organization access (demo org)
- [ ] Admin access to show org/enterprise settings
- [ ] Browser tab pre-navigated to **Org Settings → Copilot**

---

## Steps

### Step 1 — Org-level Copilot settings

Navigate to **Organization Settings → Copilot**.

**What to say:**
> "GitHub Enterprise gives org admins granular control over every Copilot feature. You don't have to choose between 'full AI capabilities' and 'enterprise security' — you get both."

Walk through key controls:
- **Feature toggles:** Enable/disable coding agent, code review, Autofix, suggestions — independently, per org or per repo
- **Model selection:** Pin to specific foundation models for compliance and predictability. If your security team requires GPT-4o, you can enforce it.
- **IP protection:** "Exclude from training" — your org's code never trains foundation models. Critical for proprietary codebases.

### Step 2 — Content exclusions

Navigate to **Content exclusions** settings.

**What to say:**
> "You can configure specific paths Copilot should never access: secrets files, highly sensitive business logic, regulated data. This is fine-grained control at the file or directory level."

Show an example path pattern: `.env*`, `config/secrets/**`

### Step 3 — Audit logs

Navigate to **Org audit log** and filter by Copilot events.

**What to say:**
> "Every Copilot action that results in committed code is in the enterprise audit log. Compliance teams can query: 'What code did the Copilot coding agent write this quarter? Who reviewed and approved it?' This is the audit trail that makes AI governance real, not aspirational."

### Step 4 — Seat management

Show the **Copilot seats** / usage analytics page.

**What to say:**
> "Granular control over who has Copilot, what tier, and usage analytics to optimize spend. You can see which teams are using it most, which features are most used, and where to focus rollout."

### Step 5 — The governance pitch

**What to say:**
> "The governance pitch is simple: you can give your engineers the full power of agentic AI — agents that write code, review PRs, fix security issues, cascade sprint notifications automatically — while maintaining the oversight and auditability that your security and legal teams require. These goals are not in conflict on GitHub."
