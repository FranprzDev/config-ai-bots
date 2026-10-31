---
name: tailored-cv-apply
description: For every job application that takes a CV, build a one-page CV tailored to the posting from a single fact master, critique it, check ATS keywords and honesty, then upload it. Inspired by MadsLorentzen/ai-job-search.
---

# Tailored CV per application

Francisco asked on 2026-10-16 to apply this to all his applications (inspired by the `/apply` flow in [MadsLorentzen/ai-job-search](https://github.com/MadsLorentzen/ai-job-search)). It applies whenever a form, email or portal takes a CV.

## Tooling to set up once
- **Fact masters** `master_en.json` and `master_es.json`: the only source of truth for jobs, bullets, stack, projects and certifications. Never add a fact that is not there; update the masters only when Francisco confirms a new real fact.
- **Renderer** (any small script, e.g. Python + WeasyPrint) that takes a `tailoring.json` and produces a PDF, then checks: exactly **1 page**; contact text extractable (e.g. `pdftotext`); keyword coverage; and a list of `new_terms_check_honesty` (words not in the master, each must be a pure rewording or be removed).
- One folder per application: `apps/<YYYY-MM-DD>_<company>_<role-slug>/` with the `tailoring.json` and the PDF.

## Steps per posting
1. **Parse** the posting: role, seniority, must-haves, nice-to-haves, 8–15 ATS keywords, language (Spanish posting → Spanish CV).
2. **Fit check**: skip on deal-breakers from `REGLAS.md` §8 (data engineering, visa he doesn't have, Go as main language…). Note genuine gaps; never hide them by inventing.
3. **Draft the tailoring**: headline and summary aimed at the role, job order, bullets reordered/reworded so the posting's keywords lead (only where the master supports them), stack rows reordered, projects to keep, keyword list.
4. **Reviewer pass**: for applications with free-text fields, a cover letter, or a high-fit role, have a second reviewer (sub-agent or a fresh pass) critique missed keywords, weak framing, generic wording and any claim not backed by the master. Revise once. For simple CV-only forms, one self-critique pass.
5. **Render** and make it pass: 1 page, contact OK. Add supported missing keywords; leave unsupported ones missing. Resolve every honesty flag.
6. Look at a preview image once when the layout changed a lot.
7. **Upload** that PDF and log the application in the tracker with a pointer to its folder.

## CV rules (Francisco's)
- One page. File name always professional: `Francisco_Perez_CV_<Role_In_Words>.pdf` (e.g. `Francisco_Perez_CV_AI_Engineer.pdf`). Never `v2`, `draft`, `borrador` or lowercase slugs.
- Under the name: only the role title, never a stack list.
- Portfolio link: franprz.vercel.app. Projects listed without links. No open-source contribution entry. No private client names (describe generically, or omit).
- Listed experience must add up to his "almost 4 years" (keep the teaching-assistant role). Never claim 5+ years.
- The AI Engineer version is the default base; highlight Python on the production AI-agent role.
- NASA Space Apps / ExoGames is fine on the CV but never in cold emails.

## Form and letter wording
- Cover letters and free text: highlight what he has; do **not** mention tools or years he lacks.
- Knockout questions: if the honest answer disqualifies, still answer honestly or stop and report. Never answer "yes" to a skill he lacks to get past a filter.
- Tools he doesn't have: lowest level / "No".
