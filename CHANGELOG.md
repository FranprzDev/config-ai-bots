# Changelog

## 2026-10-31 — handoff a un asistente nuevo
- Nuevo `HANDOFF.md`: orden de lectura, las 10 reglas clave y temas abiertos al 31/10/2026.
- Nuevo `AUTOMATIONS.md`: tareas programadas para recrear (búsqueda laboral 5×/día, alertas de entrevistas, embajadores, novedades de concursos, actualización diaria del repo, Shorts, panel de postulaciones).
- Nuevo `skills/` con skills portables (`SKILL.md`): `franprzdev-code-conventions`, `ponytail` (MIT, adaptado), `tailored-cv-apply`, `premium-scroll-pages`, `cinematic-shot` (notas sobre 1weiho/cinematic-shot).
- `PERFIL.md`: apellido sin tilde, intereses, MCP en el stack, servidor MCP del portfolio, Python en el rol de AI Engineer, paper en CoNaIISI 2026.
- `PROYECTOS.md`: estado al 31/10 y proyectos nuevos (Presu, Reelsmith como MCP, portfolio + MCP, UTN-MCP, GeoTucumán); cliente en producción descripto de forma genérica.
- `REGLAS.md`: términos freelance (§2b), excepción del canal de YouTube, merge del repo del cliente solo con mi OK, ramas/commits/PR, fframes + 720p, pretensión salarial sin montos, disponibilidad, outreach a founders, comunicación pública (§9).
- `FLUJOS.md`: productos MCP-first (§6) y link a `AUTOMATIONS.md` (§7).
- `INSIGHTS.md`: aprendizajes agregados de la búsqueda laboral, pushear temprano, verificar la versión que miro, un clone por agente.
- `CODE_REVIEW_LESSONS.md`: errores de server actions como datos tipados; partir PRs grandes antes de una demo.
- `SYSTEM_PROMPT.md` y `README.md`: alineados (índice con los archivos nuevos).

## 2026-10-30 — OpenCode multiagente gratis
- Nuevo `OPENCODE.md`: preset de oh-my-opencode-slim con modelos 100% gratuitos (provider `opencode`), cómo aplicarlo y estado de validación.
- Link desde `README.md`.

## 2026-10-25 — daily update
- `REGLAS.md` §8: CV sin la contribución open source y con la experiencia listada sumando los casi 4 años (se mantiene la ayudantía docente).

## 2026-10-25 — code rules
- `REGLAS.md` §3b: documentación vieja vs. código (seguir el código y avisar las inconsistencias, salvo cambio pedido explícitamente).

## 2026-10-24 — landing design skill
- Nuevo `LANDING_DISENO.md`: base de diseño para landings (estrategia de conversión, layouts A-D, sistema visual, motion, checklist), adaptada del skill open source `landing-page-design` de [elayadesign/ai-design-skills](https://github.com/elayadesign/ai-design-skills) (MIT); original en inglés copiado con su LICENSE en `vendor/elayadesign-landing-page-design/`.
- Link desde `README.md`.

## 2026-10-24 — daily update
- `REGLAS.md`: formato del CV (debajo del nombre solo el título del puesto; proyectos sin links).

## 2026-10-21 — weekly update
- `PERFIL.md`: AI Product Engineer, ~4 años con IA y 2 con GCP (nunca decir 5), Gemini, Rust, fecha de fin del rol de AI Engineer.
- `REGLAS.md`: años de experiencia honestos, no pagar fees de plataformas, harness de videos sin tests (render de prueba 360p), reporte de pruebas en PRs de clientes.
- `FLUJOS.md`: nuevo §2b de propuestas para clientes (brief ScopeProfit, versión sin jerga, PDF) y §3b de videos promocionales con el harness.
- `PROYECTOS.md`: propuestas freelance en curso, portfolio simplificado, harness de videos promocionales y contribución open source a Cap.
- `CODE_REVIEW_LESSONS.md`: reutilizar antes de crear, validación en la capa de servicios, middleware tras un rebase, merge pinneado al SHA.
- `SYSTEM_PROMPT.md`: alineado con lo anterior.

## 2026-10-18 — weekly update
- `REGLAS.md`: postulaciones (postular directo y completar formularios sin preguntar, nunca "sí" en preguntas eliminatorias sobre habilidades que no tengo, no mencionar faltantes en mails, horario de envío 08–19 ART, cold emails sin CV, CV de una página a medida, nada de comentarios ni notas en LinkedIn, no más Silver.dev); nueva sección §3b de código (reutilizar antes de crear, enums, implementación mínima, merge propio de PRs limpios y en verde); sin videos ni binarios en repos.
- `FLUJOS.md`: CV a medida por aviso, tracker antes de postular, programas de embajadores, fframes + borradores 720p, link a convenciones de código.
- `PERFIL.md`: portfolio, ~4 años de experiencia, C#, experiencia con fechas, formación complementaria, reubicación al terminar la carrera.
- `PROYECTOS.md`: concurso de datos presentado, cierre de la campaña de escribanías, nuevos AdHorarium, ScopeProfit, canal de YouTube y portfolio.
- `SYSTEM_PROMPT.md` y `GIT_WORKFLOW.md`: alineados con las reglas nuevas (merge propio de PRs limpios y en verde).

## 2026-10-14 — tracker update guide
- `INSIGHTS.md`: step-by-step guide to update the applications tracker (columns, statuses, duplicate check, regenerating the xlsx).

## 2026-10-14 — insights
- New `INSIGHTS.md`: first insight, keep a single xlsx tracker of every job application, check it before applying and update it after, so applications never overlap.
- Linked from `README.md`.

## 2026-10-14 — data-video final delivery
- `DATA_VIDEO_GUIDELINES.md`: new "Final delivery" section (chunked, retried, resumable render on memory-limited machines; re-encode before upload; thumbnail from a real frame; manual upload fallback when browser automation fails) and an anonymity checklist for contests; workflow and QA checklist updated (720p drafts until approval).

## 2026-10-14 — data-video lessons
- `DATA_VIDEO_GUIDELINES.md` extended with lessons from a real data-video pipeline: documented assignment rules and fragile roundings, approved rule exceptions, legends that match what is drawn, credits and authorship (no AI authorship, pseudonym hygiene), a new *Rendering and performance* section (720p drafts, design canvas, pre-scaled rasters, single-pass bloom, discarded ideas, honest benchmarks), *Tooling lessons*, and an updated workflow and QA checklist.

## 2026-10-13 — code review lessons
- New `CODE_REVIEW_LESSONS.md`: conventions distilled from my PR reviews (types, code style, PR hygiene, clean merge status).
- Linked from `README.md`.

## 2026-10-13 — Git & GitHub workflow guide
- New `GIT_WORKFLOW.md`: general guideline for how work reaches my repos (pull requests only, branch naming, commit convention, PR body and review comments, Git Flow, rebase, checks, safety), summarized from my own repos.
- Linked from `README.md` and `FLUJOS.md` §5.

## 2026-10-13 — data-video guide in English
- `SKILL_VIDEOS_DE_DATOS.md` renamed to `DATA_VIDEO_GUIDELINES.md` and translated to English; links in `README.md` and `FLUJOS.md` §3 updated.
- The data-video additions (README table row and "Harnesses and working guides" section, FLUJOS §3 guide and pipeline lines, these changelog entries) translated to English.

## 2026-10-13 — Markdown only
- Removed `harness/data-video/` (code, Makefile, Dockerfile, example data): the repo keeps only ideas, ways of working and guides in `.md`.
- The data-video guide (then `SKILL_VIDEOS_DE_DATOS.md`, now `DATA_VIDEO_GUIDELINES.md`) rewritten as a general, tool-independent guide.
- `README.md` and `FLUJOS.md` §3 updated so they no longer point to code.

## 2026-10-13 — data-video guide
- New data-video guide (then `SKILL_VIDEOS_DE_DATOS.md`, now `DATA_VIDEO_GUIDELINES.md`), linked from `README.md` and `FLUJOS.md` §3. (Harness code was also added that day and removed in the entry above.)

## 2026-10-13 — versión inicial
- README, SYSTEM_PROMPT, PERFIL, REGLAS, FLUJOS, PROYECTOS.
- Contenido público únicamente: sin datos de contacto privados, montos, clientes, terceros ni credenciales.
