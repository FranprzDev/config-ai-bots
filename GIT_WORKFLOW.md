# Git & GitHub workflow

How I want work to reach my repositories, whether a person or an AI agent does it. These rules are gathered from the contributing guides, agent instructions and notes in my own repos (sources at the end). Where a project has its own `CONTRIBUTING.md`, `AGENTS.md` or `CLAUDE.md`, that file wins for that project.

## 1. Everything goes through a pull request

- **Never change `main`, `master` or any other primary branch directly.** Work on a descriptive branch and open a pull request.
- **Do not merge a PR unless I explicitly ask for the merge.**
- Do not commit, push, open a PR, merge, deploy or change any external state unless that action was requested. A request to *implement* something authorizes local changes and validation, not publishing them.
- When I ask for a PR, do the whole flow: check the scope, commit, validate, push, and open a **normal, ready-for-review PR**. Never a draft unless I ask for one.

## 2. Branch naming

| Kind of work | Branch |
|---|---|
| New feature | `feat/<short-description>` (or `feature/<name>` in Git Flow projects, see §6) |
| Bug fix | `fix/<short-description>` |
| Maintenance, docs, config | `chore/<short-description>` |
| Work done by an AI agent | `agent/<short-description>` |

Names are short, descriptive and in kebab-case (e.g. `feature/crud-vehicles`).

## 3. Commits

- Small, readable commits with a terse, meaningful message.
- Convention: `type: brief description`, with `feat`, `fix` or `chore` as the type (e.g. `feat: add milestone escrow release`).
- Code, comments, commit messages and repo docs are in **English**.
- Never stage unrelated work silently: check `git status --short --branch` and the diff before staging.
- Changes requested after the PR exists become **new commits on the same branch and PR**, unless they are unrelated or I ask for a separate PR.
- Do not rewrite history (squash, cleanup) unless I ask for it.
- If a project says so, do not commit at all until tests, lint and build pass locally (see §6).

## 4. Pull request content

- Keep related changes together in one PR when practical, and keep each PR scoped to what was asked.
- Title: short and descriptive.
- Body: describe the **what** and the **why**, reference the issue if there is one, and use these sections:
  - **What changes:** the concrete changes.
  - **Why:** the problem or goal.
  - **Impact:** effect on users, product, deployment or operations.
  - **Validation:** the exact commands run and their result.
- If behaviour changes, add or update tests.
- If the project keeps a `CHANGELOG.md`, add the change under *Unreleased* (or a dated entry).

## 5. Review comments on every PR

After opening or materially updating a PR, add two short comments (unless I say not to):

1. **Critical evaluation:** is the implementation appropriate? Risks, missing tests, regressions, unnecessary complexity, concrete improvements.
2. **Senior engineering perspective:** how to approach the problem, what to monitor, and which future refactor or architecture decision would improve maintainability.

Both must be specific to the diff and based on evidence: no generic praise, no unverified claims, and they are not an approval.

## 6. Git Flow for team and client projects

Larger projects use a Git Flow variant:

- **`main`**: production. No direct pushes; updated only by merges from `develop` (or `release/*`).
- **`develop`**: integration. Features land here through PRs.
- **`feature/<name>`**: branch from `develop` for each feature and open the PR to `develop`.
- **Nothing is merged into `develop` if tests, lint or build fail.**
- TDD: red → green → refactor. A feature is not done until every test passes, with no skipped tests.

Repos without a `develop` branch: branch off the default branch and open the PR against it.

## 7. Keeping a branch up to date: rebase

- When another PR was merged first into the base branch (usually `dev`/`develop`), rebase my branch on it instead of merging the base in:
  1. Commit everything on the work branch (a commit is easier than a stash).
  2. Update the base branch (`git pull origin dev`).
  3. Switch back to the work branch and run `git rebase dev`.
  4. Resolve conflicts commit by commit, test, and continue; if it goes wrong, `git rebase --abort` and start again.
  5. Push the rewritten branch. **Agents use `--force-with-lease`, and only when needed.**
- Rebase often, every time a new PR lands on the base branch, so conflicts stay small.

## 8. Checks before calling a PR ready

- Run the relevant checks locally (tests, lint, type-check, build, formatting) and review the final diff with `git diff --check`.
- A PR is ready only when the required CI/CD checks on GitHub are green, there are no merge conflicts, and the branch is up to date. Local compilation alone is not enough.
- If a check fails, diagnose it before claiming completion; fix it only if the request covers it, otherwise report the blocker.

## 9. Auditing a PR ("let's audit the PR")

1. Identify the PR, base, head, status, mergeability, checks and changed files.
2. Read the whole diff and the surrounding code.
3. Look for correctness issues, regressions, security/privacy risks, data loss, deployment mismatches, missing validation and scope creep.
4. Order findings by severity, citing files and lines; keep confirmed findings separate from questions.
5. End with a recommendation: **ready**, **changes requested** or **blocked**, and why.

## 10. Releases

1. Move the *Unreleased* entries to the new version in `CHANGELOG.md`.
2. Bump the version files the project uses.
3. Merge to `main` and push a tag `vX.Y.Z`; the release workflow publishes the GitHub Release.

## 11. Safety and privacy

- No destructive commands (`git reset --hard`, broad recursive deletes, plain force-push) without explicit authorization and a verified target.
- Never put tokens, credentials or secrets in commits, PR descriptions, comments or output.
- Public repos: no real client or lead data, phone numbers, emails, tokens or private URLs; example data only. Check this before every push.
- If a PR is merged or closed unexpectedly, do not rewrite history or touch the base branch: explain what happened (who merged and when) and open a new PR only if the ongoing request needs it.
- Final hand-offs separate what was validated locally from the state on GitHub, and list the PR URL, branch, commits, base branch, validation and anything still waiting on my decision.

## 12. New repositories

- I create the empty repo; the assistant pushes the code with clear commits.
- Every repo has a README covering what it is, how to run it and how to test it.

## Sources

Summarized from my own repos:

- [`github-delivery-workflow/SKILL.md`](https://github.com/FranprzDev/github-delivery-workflow/blob/main/SKILL.md): agent delivery workflow (branches, PRs, review comments, rebase, checks, audit, safety).
- [`vibe-latex/CONTRIBUTING.md`](https://github.com/FranprzDev/vibe-latex/blob/main/CONTRIBUTING.md): pull request flow, branch prefixes, changelog, releases.
- A private client project's `CONTRIBUTING.md`, `CLAUDE.md` and `AGENT.md`: Git Flow, merge gates, TDD, commit pattern, English-only code.
- [`FranNotes/Legislación/Rebase.md`](https://github.com/FranprzDev/FranNotes/blob/main/Legislaci%C3%B3n/Rebase.md): how and when I rebase.
- [`FLUJOS.md`](FLUJOS.md) §5 in this repo: new repos, READMEs, pre-push privacy check.
