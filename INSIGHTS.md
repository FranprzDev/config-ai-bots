# Insights

Lessons learned while working with Francisco that any AI assistant should apply.

## 1. Keep a single tracker of every job application (2026-10-14)

**Problem:** applications were sent from many sessions and scheduled runs, so the same company or role risked being applied to twice, and nobody had a full picture.

**Rule:**
- Keep ONE spreadsheet (xlsx) with every application: date, company, role, link, channel (form/email), status (Sent, In progress, Blocked, Rejected, Discarded, Pending on him) and notes.
- **Before** applying anywhere, search the tracker for the company and role. If it is already there, do not apply again; tell him instead.
- **After** applying (or getting blocked), add the row right away and regenerate the xlsx.
- Update the status when a reply arrives (interview, test, rejection).
- Share the xlsx with him when he asks how the search is going.

### How to update the tracker

1. **Source of truth:** a plain tab-separated file (`rows.tsv`) with one row per application and these columns, in order: `Date (YYYY-MM-DD) | Company | Role | Link | Channel (form/email/DM) | Status | Notes`.
2. **Allowed statuses:** `Sent`, `In progress` (interview, test, recruiter reply), `Blocked` (captcha, required video, missing data), `Rejected`, `Discarded` (we decided not to apply), `Pending on him` (he must finish it himself).
3. **Before applying:** search `rows.tsv` (case-insensitive) for the company and the role. Same company + same role = do not apply again. Same company + different role = allowed, but mention it.
4. **After applying:** append the row the same day, with the exact link and the confirmation in Notes.
5. **When a reply arrives:** edit that row's Status and Notes in place (never add a duplicate row).
6. **Regenerate the xlsx** from `rows.tsv` with a small script (Python + openpyxl): one `Applications` sheet as a filterable table with frozen header and color by status, plus a `Summary` sheet counting rows per status and the total.
7. Scheduled job-search runs follow the same steps, so manual and automatic applications never overlap.

## 2. Job search: what the numbers taught us (Oct 2026)

Aggregate of about 300 applications tracked between late September and 31 October 2026 (roughly two thirds submitted, ~10% blocked, the rest discarded, rejected or in progress).

- **Volume works only with tailoring.** A one-page CV adapted to each posting, with a critique pass and an honesty check, is the default; generic CVs annoyed him and fit worse. See [`skills/tailored-cv-apply`](skills/tailored-cv-apply/SKILL.md).
- **Where automated applying gets stuck**: reCAPTCHA Enterprise on some ATS forms, one-way video interviews and "record yourself" steps, Workday portals that want a separate account per company (and a password only he knows), SSO-only sign-ins, and English checks on talent marketplaces. Mark these Blocked with what is missing instead of retrying blindly.
- **Ashby, Greenhouse and Lever** forms are the smoothest to complete end to end; LinkedIn Easy Apply works but LinkedIn has strict no-comment / no-note rules.
- **Honesty failures are costly**: a cover letter once disclosed a missing technology and a knockout question was once answered "yes" for a tool he lacks. Both became rules: never volunteer gaps in letters; never answer "yes" to a skill he lacks.
- **Only report what moves.** He wants to hear about interviews, tests and recruiter replies, not receipts.
- **Cold emails**: short, named person over generic inbox, LinkedIn + GitHub links, no CV attached, no hackathon bragging.

## 3. Push work early and keep state in files (Oct 2026)

**Problem:** a sandbox wipe once lost a whole unpushed branch of a backend rewrite, and long multi-step tasks were interrupted mid-way.

**Rule:** push WIP branches often (a draft PR is fine), keep progress notes and trackers in files rather than only in the conversation, and make long renders resumable (chunked, retried).

## 4. Check which version he is looking at (Oct 2026)

**Problem:** he reported a wrong URL in a video that the latest version had already fixed; he was watching an older copy.

**Rule:** before re-doing work on feedback about a deliverable, confirm the version (file name or link) he is reviewing, then send the latest one.

## 5. Concurrent agents on one repo (Oct 2026)

**Problem:** two agents working in the same local clone path overwrote each other's uncommitted changes.

**Rule:** every agent uses its own clone directory and its own branch; never share a working tree.
