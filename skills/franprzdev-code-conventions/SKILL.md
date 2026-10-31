---
name: franprzdev-code-conventions
description: Francisco Perez's code conventions distilled from his own PR reviews (TypeScript/Node/LangGraph/Next.js). Load before writing, reviewing or merging code in his repos.
---

# Francisco's code conventions

Distilled from fixes his reviews required on his TypeScript/Node/LangGraph/Next.js projects (Aug–Oct 2026). A repository's own `AGENTS.md` / `CLAUDE.md` wins when it is stricter. Long-form version: [`../../CODE_REVIEW_LESSONS.md`](../../CODE_REVIEW_LESSONS.md); Git process: [`../../GIT_WORKFLOW.md`](../../GIT_WORKFLOW.md).

## Types and domain values
- Finite domains (statuses, actions, entity types, error codes, decisions, providers, stages, routes) are `enum`s, Prisma enums or shared contract types. Never compare against inline string literals or literal unions, including in ORM filters (`where: { status: ApprovalStatus.Pending }`).
- Type LangGraph nodes, edges and conditional destinations with enums; no loose string targets.
- No `any` in app or test code: use the domain type, a payload type, a DTO, `unknown` or a type guard.
- Extract inline object types into named types when used in two or more places.

## Reuse first
- Before adding a helper, validator, component, query or type, search the repo (and sibling open PRs) for an existing one and reuse or extend it. Never duplicate logic.
- Domain validation lives in the backend service layer so every path (direct edits, approvals, approver edits) shares it.

## Code style
- `async/await`, never `.then().catch()` chains.
- Validate only what is needed (no `!value` before `Array.isArray(value)`, no redundant `typeof` checks).
- Plain, readable loops over clever reducers for metrics.
- Optional chaining only when absence is a valid no-op; keep explicit guards when you must log, throw or branch. Never hide required dependencies.
- Go through abstraction services (e.g. a `StorageService`) instead of calling `fs` directly.
- Configuration from the environment without hidden fallbacks in code (e.g. the model name).
- Agent decisions go through the project's typed decision gate, not ad-hoc heuristics.
- Delete dead pieces (unused subagents, files, env vars) instead of leaving them around.
- Expected errors in Next.js server actions are returned as typed data, so production builds don't replace them with a redacted generic error.

## PR hygiene
- English for code, comments, commits and docs. Never push to `main`.
- Branches `feat/`, `fix/`, `chore/` (agents: `agent/`); commits `type: brief description`; ready-for-review PR body with What / Why / Impact / Validation.
- One concern per PR: style or CSS-framework migrations never ride along with feature work. Split oversized PRs (e.g. a small demo-safe PR plus a follow-up).
- Use only the repo's package manager (Bun or pnpm where configured); never add a second lockfile.
- Edit files directly; don't introduce helper scripts in another language for mechanical edits.
- Run typecheck and tests after type changes and list them under Validation.
- Every PR must always show a clean merge status: no conflicts, no rebase problems, green checks. Rebase onto the base whenever it moves, push with `--force-with-lease`, and verify `mergeable_state=clean` before handing off.
- After rebasing onto a base that added cross-cutting middleware (CSRF, auth, rate limits), check it against the routes your PR adds even if there were no textual conflicts.
- When addressing review comments: one commit naming each comment it resolves, and add the lesson to the repo's `AGENTS.md`.

## Merging
- On his own repos: once the PR is rebased, `mergeable_state=clean` and every check on the current head is green, merge it yourself through the API pinned to that head SHA (merge method matching the repo's history). Never merge with conflicts or red/pending checks.
- **Exception — the private client repo `LVC`**: never merge any PR without his explicit OK on that PR. Post a test report on the PR and wait.
