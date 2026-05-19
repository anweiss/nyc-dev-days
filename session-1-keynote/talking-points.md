# Session 1 — Talking Points

**Session:** "A Day in the Life of a Developer with GitHub + AI"  
**Format:** Keynote · 45 minutes

These talking points are written in speaker-note style — conversational and specific — with the TechMart story as the narrative thread throughout.

---

## Opening Hook

- "Raise your hand if you spent more than two hours today not writing code — in meetings, in Slack, tracking down a flaky test, writing a PR description nobody will read." *(pause for laughs)*
- Developers report spending only about 30% of their time actually writing code. The rest is coordination, context-switching, and toil. That's the problem GitHub is solving — not just in the editor, but everywhere.
- "Today I want to show you a real day in the life. I'm on the TechMart team — it's a product team building an e-commerce storefront. They have a sprint board with 24 issues, a GHAS alert that just fired, and a feature that needs shipping by end of day. Let's see how far AI can carry us."
- Set the stage: every demo is a different phase of the same day, a different GitHub surface, the same codebase.

---

## The SDLC Reimagined

- The software development lifecycle hasn't fundamentally changed in decades: idea → plan → code → review → ship → monitor. What's changed is that AI can now participate in every single one of those stages.
- GitHub's bet is not a single AI feature — it's an AI-native platform. Copilot is embedded in: the terminal, VS Code, JetBrains, the GitHub.com web UI, pull request reviews, security scanning, and fully autonomous coding agents.
- Think of it as "ambient intelligence" — Copilot understands the context of your repo, your history, your team's conventions. You don't have to re-explain yourself every time.
- Today we're walking through that full cycle in 40 minutes. Each demo is a different stage of the day. Same codebase, different surface.

---

## Demo 1: Copilot CLI

- The terminal is where developer flow often starts — git, gh, find, curl. Most of us have memorized a hundred commands and Google the rest.
- `gh copilot` brings Copilot directly into that workflow. Two core commands: `gh copilot suggest` gives you a shell command based on a plain-English description; `gh copilot explain` breaks down any command you paste in.
- Example: `gh copilot suggest "show me all issues assigned to me in this repo that are labeled sprint-1"` — Copilot returns the right `gh` incantation, explains it, and offers to run it.
- Or: `gh copilot suggest "create a branch for issue 4 following our naming convention"` — it produces the right `git checkout -b` command automatically.
- This lowers the floor for everyone. A developer new to the GitHub CLI, a designer who just picked up `git`, or someone who knows Python but has never touched Docker commands — they all benefit.

---

## Demo 2: Coding Agent

- GitHub Copilot's coding agent is a fundamentally different kind of AI tool. It doesn't just suggest — it *acts*. You assign it a GitHub issue, and it autonomously explores the repository, makes a plan, writes and commits the code, and opens a pull request.
- We're going to assign Issue #4 — PDP-001, the Product Detail Page. This is a self-contained feature with clear acceptance criteria and no upstream blockers. It's exactly the kind of task the agent is made for.
- The agent runs inside GitHub Actions — no external orchestration needed. It's repo-native, meaning it has full read access to TechMart's codebase, our issues, our PR history.
- Critically: the agent reads our `.github/copilot-instructions.md` file before writing a single line of code. This is where we put our team's conventions — vanilla JS only, CSS custom properties, the STUB_INFO map format. The agent follows all of it.
- Show the session log: every decision the agent made is visible. What files it read, what it considered, what it discarded. This is AI you can audit.

---

## Demo 3: Code Review

- Copilot code review brings AI into the pull request workflow. You request a Copilot review the same way you'd request a human reviewer — and it responds inline with specific, actionable comments.
- What makes this different from a linter: Copilot code review understands *intent*. It can spot logic errors, accessibility issues, missing edge cases, and flag when something is inconsistent with how the rest of TechMart works.
- Comments are severity-rated — critical, moderate, and low priority — so reviewers know what to focus on. For many suggestions, there's a one-click "Apply fix" right in the PR.
- This doesn't replace human review — it augments it. Your team spends less time on the obvious stuff and more time on architecture and product decisions.
- Stat to share: Teams using Copilot code review report ~40% reduction in review cycle time.

---

## Demo 4: Code Quality

- GitHub Advanced Security has been scanning for vulnerabilities for years. Copilot Autofix is what happens when you add AI to the remediation side.
- TechMart has an XSS vulnerability in `app.js` — the `?search=` URL parameter is written directly into `innerHTML` without sanitization. An attacker could craft a URL that executes arbitrary JavaScript in any user's browser.
- When GHAS detects this as CWE-79, Copilot Autofix analyzes the vulnerability and proposes a code fix — not "sanitize your inputs" as advice, but an *actual code change*: replace `innerHTML` with `textContent`.
- The fix includes an explanation: what the vulnerability is, why the proposed change is safe, and what attack vector it closes. Security education baked into the workflow.
- ~70% of GHAS alerts can be fixed automatically with Autofix. That means the security backlog shrinks without requiring developers to become security experts.

---

## Demo 5: SDK / Extensions

- GitHub Copilot Extensions let teams build custom AI experiences that live inside Copilot Chat. Think of them as chat participants your team can invoke with `@your-extension-name`.
- The TechMart ops team has an `@runbook` extension — it queries their internal runbook system and surfaces deployment and rollback procedures directly in Copilot Chat.
- Example: `@runbook how do I roll back the TechMart store if a bad deploy hits production?` — the extension returns the exact runbook steps, fetched live from the internal system.
- Two types: **agent extensions** (full LLM reasoning loop, can call external APIs) and **skillset extensions** (lighter-weight, define functions Copilot can call). The runbook extension is a skillset.
- Extensions are registered as GitHub Apps. They're published to users in your org and require the same OAuth/permissions model your org already uses. The SDK is publicly available — build in any language with an HTTP interface.

---

## Demo 6: IDE

- The IDE is where code gets written. VS Code and JetBrains both get first-class Copilot support — parity matters because teams are polyglot.
- **Completions** are the foundation: multi-line, context-aware suggestions that understand TechMart's full codebase — not just the open file.
- **Inline Chat** (`Cmd+I` in VS Code): highlight a TechMart function, describe the change in plain English, see the diff, accept or discard. "Add input sanitization to this function" → Copilot proposes the change.
- **Copilot Edits** (multi-file editing mode): describe a change that spans multiple files and Copilot applies diffs across all of them. This is where you feel the shift from "autocomplete" to "AI pair programmer."
- Show the JetBrains experience: same capabilities, slightly different UI. Important for enterprise Java/Kotlin/Python shops that live in IntelliJ.

---

## Demo 7: GitHub.com

- Copilot on GitHub.com brings the AI experience to where developers already collaborate — no context switch.
- **Copilot Chat on GitHub.com** is repo-aware. Ask it: "What happens if CART-003 doesn't ship this sprint?" and it reasons about TechMart's issue dependency graph. Ask "How does the stub modal work in app.js?" and it traces through the code.
- **PR Summaries**: Copilot auto-generates pull request descriptions — what changed, why, what to review. For the PDP-001 PR the agent just opened, Copilot can summarize the entire diff in a sentence.
- **Issue Triage**: Draft a rough idea for a new TechMart feature in plain language, and Copilot helps you structure it into a well-formed issue with acceptance criteria and suggested labels.
- The common thread: Copilot knows TechMart. It knows the code, the history, the issues. That context is what makes it useful instead of generic.

---

## The Bigger Picture

- We just walked through one developer's day: terminal → autonomous agent → code review → security fixes → custom extensions → IDE → GitHub.com. Every surface, every phase, Copilot was there.
- The industry question is moving from "should we use AI?" to "how do we govern and maximize AI in our engineering org?" GitHub's answer: make it platform-native, auditable, and customizable.
- Three things to do this week: (1) Enable Copilot for your team. (2) Assign your first issue to the Copilot coding agent. (3) Explore the Copilot Extensions SDK for internal tooling.
- Stay for Session 2 — we're going to show what happens when CART-003 slips its sprint date and nine downstream issues cascade automatically. That's where things get really interesting.

---

## Close / Q&A

- "Everything I showed today is live and available. The demo scripts and materials are in this repo."
- "Questions? Let's dig in."
- Remind: `gh copilot suggest "where can I learn more about GitHub Copilot"` — show that the CLI can help them get started 😄
