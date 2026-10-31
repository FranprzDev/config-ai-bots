# Recurring automations

Scheduled jobs my previous assistant ran for me, written so any assistant with scheduling, web search, a browser and access to my mailbox can recreate them. Times are Argentina time (America/Argentina/Tucuman, UTC-3). Private inputs (contact details, salary numbers, account logins, tracker locations) are given to the assistant privately, never stored here.

Common rules for every job:
- Message me **only when there is something new**, in short Rioplatense Spanish. Silence otherwise.
- Never reply to emails or recruiters on my behalf from a scheduled run unless the job says so; offer to reply.
- Honesty limits from `REGLAS.md` §1 and §8 always apply.

## 1. Job search: 5 times a day, until I say I got a job
- **Schedule**: 08:00, 11:00, 14:00, 16:00, 18:00. Stops (and cancels itself) when I say I found a job.
- **Search** new postings since the last run: AI / LLM / forward deployed, full-stack and backend roles (junior, semi-senior, senior) remote and open to Argentina/LatAm; on-site or hybrid IT roles in Tucumán; undergraduate AI/ML research internships open to Argentina. Sources: LinkedIn Jobs, Greenhouse, Lever, Ashby, Workable, Teamtailor, Get on Board, Himalayas, company career pages.
- **Filter out**: data engineering / ML pipelines, roles requiring residency, citizenship or a visa I don't have (without sponsorship), Go as main language, Silver.dev, scams, roles clearly paying below my floor, anything already in the tracker.
- **Apply directly, without asking** (my rule): one browser per posting (in parallel), fill the whole form from what you know about me, upload a **one-page CV tailored to that posting** ([`skills/tailored-cv-apply`](skills/tailored-cv-apply/SKILL.md)). Salary: my private ask level, or my range when a range is allowed. Answer "yes" to availability/schedule. Never claim tools or years I don't have; in cover letters don't volunteer gaps. Never say I live near an office: I live in Tucumán, open to relocating after graduating (Dec 2027). If a form needs something only I can give (my own video, references), mark it Blocked and ask me.
- **LinkedIn**: only apply (Easy Apply or the external link). Never comment on posts, never add notes to connection requests.
- **Log** every application (or block) in the single tracker before/after applying (see `INSIGHTS.md` §1).
- **Notify**: one table (company, role, modality, status, link) only if something was submitted or got blocked.

## 2. Interview alerts: every 3 hours, 08:00–22:00
- Search my mailbox for emails from the last window where a company or recruiter invites me to a technical interview, HR/recruiter call, screening, take-home or challenge, or asks me to book a slot.
- Ignore automatic "we received your application", rejections, newsletters and generic job ads.
- For each invitation: one short message with company, role, what they ask, deadline or proposed times, and an offer to reply or schedule. Do not reply on your own.

## 3. Student ambassador programs: daily at 10:00
- Watch AI/tech student ambassador programs that give benefits (stipend, credits, subscriptions, swag, trips): Google/Gemini student ambassadors, Claude Campus / Builder Clubs, OpenAI student programs, Cursor, Perplexity, Notion, GitHub Campus Experts, Microsoft Learn Student Ambassadors, Vercel, Replit, Lovable, ElevenLabs, Hugging Face, AWS Cloud Clubs, NVIDIA and similar.
- For each program that is **open**, accepts students from Argentina and isn't in the ambassadors tracker: apply without asking, first-person honest answers (proposal: an AI builders club at my university with workshops, hackathons and demo nights). Never invent roles, follower counts or achievements; if it needs something only I can give, leave it pending and ask.
- Notify only with news: where I was applied (benefit + link), what opens soon (date), what you need from me.

## 4. Contest news: daily at 10:00 (until the result)
- Search my mailbox for the last 24 h for emails about the data-visualization contest I entered (receipts, documentation requests, shortlist, results, award invitation). Ignore unrelated newsletters from the organizer.
- If something arrives: who wrote, what they ask, deadline, and offer to reply. When the final result arrives, tell me and stop the job.

## 5. Update this repo: daily at 22:00
- Review the last 24–48 h of work and conversations for durable changes in how I work: new or corrected rules, my corrections ("don't do X", "always Y"), lessons from mistakes, new or improved flows, code conventions from reviews, stack changes, new or finished projects.
- Edit only the affected parts of the right file (lessons → `INSIGHTS.md`; rules → `REGLAS.md` and, if central, `SYSTEM_PROMPT.md`; flows → `FLUJOS.md`; code → `CODE_REVIEW_LESSONS.md`; projects → `PROYECTOS.md`), keep my conditions exactly as I stated them, add a dated `CHANGELOG.md` entry.
- Ship through a PR (branch `chore/daily-update-YYYY-MM-DD`, `docs: ...` commits, What/Why/Impact/Validation), merge it yourself when clean and green.
- Privacy check of the diff before pushing (public repo): no phone numbers, addresses, emails, ID numbers, money amounts, client names, companies I applied to, other people's names, tokens or private URLs.
- Message me only if something was merged, with the PR link.

## 6. YouTube Shorts on heuristics (daily, when active)
- Goal I set: at least 5 English technical Shorts per day on heuristic/metaheuristic algorithms and "AI beyond LLMs", built with fframes (Rust), each running the real algorithm so every on-screen number is computed. Vertical 1080×1920, 45–60 s.
- Upload as **public** without asking (my rule for this channel only). Quality and variety matter: YouTube penalizes mass-produced templated content. If uploads are rate-limited, publish the leftovers the next day.
- If I don't pick a topic, use the next suggested one (deep dives on the best-retaining topic; "X vs Y" hooks worked best early on).

## 7. Applications panel
- A glanceable dashboard (refreshed every few hours from my mailbox) showing **only applications that advanced**: interviews, tests, recruiter replies. Applications that didn't move are hidden; I remove entries I'm no longer interested in.
