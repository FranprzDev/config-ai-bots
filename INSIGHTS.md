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
