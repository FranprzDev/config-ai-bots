# config-ai-bots

Mi forma de trabajar con asistentes de IA, solo en Markdown, para llevarla a cualquier herramienta (Grok, ChatGPT, Claude, Gemini, Cursor, etc.) cuando cambio de bot.

> Repo público: no contiene datos personales privados (teléfono, dirección, emails, montos, clientes, credenciales). Esos datos se los doy al bot en el momento, si hacen falta.

## Archivos

| Archivo | Para qué sirve |
|---|---|
| [`HANDOFF.md`](HANDOFF.md) | Punto de partida para un asistente nuevo: orden de lectura, las 10 reglas clave y temas abiertos. |
| [`SYSTEM_PROMPT.md`](SYSTEM_PROMPT.md) | Prompt listo para pegar como *custom instructions* / *system prompt* (menos de ~6.000 caracteres). |
| [`PERFIL.md`](PERFIL.md) | Perfil profesional público: stack, experiencia, logros, roles objetivo. |
| [`REGLAS.md`](REGLAS.md) | Reglas de trabajo fijas: qué hacer sin preguntar y qué confirmar antes. |
| [`FLUJOS.md`](FLUJOS.md) | Flujos recurrentes: postulaciones, venta de automatizaciones, videos de datos, webs, GitHub. |
| [`PROYECTOS.md`](PROYECTOS.md) | Proyectos actuales con estado y stack, descriptos de forma genérica. |
| [`AUTOMATIONS.md`](AUTOMATIONS.md) | Scheduled jobs to recreate in any assistant: job search 5×/day, interview alerts, ambassador programs, contest news, daily repo update, YouTube Shorts. |
| [`GIT_WORKFLOW.md`](GIT_WORKFLOW.md) | Git & GitHub workflow: everything through pull requests, branch naming, commit convention, PR content and review comments, Git Flow, rebase, checks, safety. |
| [`CODE_REVIEW_LESSONS.md`](CODE_REVIEW_LESSONS.md) | Code conventions distilled from my own PR reviews: enums for finite domains, no `any`, async/await, one concern per PR, clean merge status. |
| [`INSIGHTS.md`](INSIGHTS.md) | Lessons learned working together, e.g. keep one xlsx tracker of every job application and check it before applying. |
| [`DATA_VIDEO_GUIDELINES.md`](DATA_VIDEO_GUIDELINES.md) | General guide for data-story videos: story in a config file, numbers computed with asserts, readability rules, legends and credits, audio, rendering and performance, QA. |
| [`LANDING_DISENO.md`](LANDING_DISENO.md) | Base de diseño para landings que convierten (estrategia + sistema visual), adaptada del skill MIT de Elaya Design (original en `vendor/`). |
| [`OPENCODE.md`](OPENCODE.md) | OpenCode multiagente (oh-my-opencode-slim) con modelos gratuitos: preset, instalación y validación. |
| [`skills/`](skills/README.md) | Portable skill docs (`SKILL.md`): code conventions, ponytail, tailored CV per application, premium scroll pages, cinematic launch shots. |
| [`CHANGELOG.md`](CHANGELOG.md) | Historial de cambios del repo. |

## Cómo usarlo

1. **Pegá `SYSTEM_PROMPT.md`** (sin el título) en el campo de instrucciones del bot:
   - **ChatGPT**: Settings → Personalization → Custom instructions, o dentro de un *Project* / *GPT* → Instructions.
   - **Claude**: un *Project* → Project instructions (o Settings → Profile → preferencias).
   - **Grok**: Settings → Customize → Custom instructions.
   - **Gemini**: un *Gem* → Instructions.
   - **Cursor / IDEs**: como regla del proyecto (`.cursor/rules/*.mdc`, `AGENTS.md` o `CLAUDE.md`).
2. **Adjuntá el resto como conocimiento** (*knowledge* / *project files*): `HANDOFF.md`, `PERFIL.md`, `REGLAS.md`, `FLUJOS.md`, `PROYECTOS.md`, `AUTOMATIONS.md`. En agentes que soportan skills (Claude Code, OpenCode, Codex), copiá las carpetas de `skills/`.
3. Si el bot no permite archivos, pegá `REGLAS.md` al inicio de la conversación cuando la tarea lo requiera.
4. Cuando algo cambie (nuevo proyecto, nueva regla), actualizá el archivo y anotá el cambio en `CHANGELOG.md`.

## Harnesses and working guides

This repo is Markdown only: ideas, ways of working and guides, no code. The concrete tools live in their own repos.

- **Git & GitHub**: [`GIT_WORKFLOW.md`](GIT_WORKFLOW.md), how changes reach my repos (branches, commits, pull requests, reviews, rebase, checks).
- **Data videos**: [`DATA_VIDEO_GUIDELINES.md`](DATA_VIDEO_GUIDELINES.md), principles and a checklist that apply to any tool.

## Mantenimiento

- Un archivo por tema; cambios chicos y fechados.
- Antes de commitear, revisar que no se cuelen datos privados (teléfonos, emails, montos, nombres de clientes o de terceros, tokens, URLs privadas).
