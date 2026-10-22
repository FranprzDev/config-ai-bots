# Code Review Lessons

Conventions distilled from my own pull request reviews (Aug–Oct 2026) on TypeScript/Node/LangGraph projects. Any AI assistant or contributor writing code in my repos should follow them. A repository's own `AGENTS.md`/`CLAUDE.md` wins when it is stricter.

## Types and domain values

- Model finite domains (statuses, error codes, decisions, diff kinds, providers, stages, routes, classifications) as `enum`s, Prisma enums or shared contract types. Never compare against inline string literals or literal unions.
- Type LangGraph nodes, edges and conditional destinations with enums; no loose string targets.
- No `any` in application or test code. Use the domain type, a payload type, a DTO, `unknown`, or a type guard.
- Extract inline object types into named types when they are used in two or more places.

## Code style

- Reuse is the standard: before writing a helper, validator, component, query or type, search the repo (and related open PRs) for an existing one and reuse or extend it. Never duplicate logic.
- Domain validation lives in the backend service layer, so every path (direct edits, approvals, approver edits) shares it.

- Use `async/await`; avoid `.then().catch()` chains.
- Validate only what is needed (no `!value` before `Array.isArray(value)`, no redundant `typeof` checks).
- Prefer plain, readable loops over clever array reducers for metrics.
- Use optional chaining only when absence is a valid no-op. Keep explicit guards when the absent case must be logged, thrown or branched on, and never hide required dependencies.
- Go through abstraction services (e.g. a `StorageService`) instead of calling `fs` directly, so storage can migrate later.
- Read configuration from the environment without hidden fallbacks in code (e.g. the model name).
- Agent decisions go through the project's typed decision gate, not ad-hoc heuristics.
- Delete dead pieces (unused subagents, files, env vars) instead of leaving them around.

## Pull request hygiene

- One concern per PR: style or CSS-framework migrations never ride along with feature work.
- Use only the repo's package manager (e.g. Bun where configured); never add a second lockfile.
- Edit files directly; do not introduce helper scripts in another language for mechanical edits.
- Run typecheck and tests after changing types, and list them under Validation.
- Every PR must always show a clean merge status: no conflicts, no rebase problems, green checks. Rebase onto the base branch whenever it moves and verify mergeability before handing off.
- After rebasing onto a base that added cross-cutting middleware (CSRF, auth, rate limits), check it against the routes your PR adds, even when the rebase had no textual conflicts.
- Once a PR is clean and every check on its current head is green, merge it through the API pinned to that head SHA. In a client's private repo, never merge without the owner's explicit OK on that PR.
- When addressing review comments, use one commit that names each comment it resolves, and record the lesson in the repo's `AGENTS.md`.
