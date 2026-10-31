# Flujos recurrentes

## 1. Postulaciones laborales
1. **Buscar**: roles remotos desde Argentina (startups de IA, fintech, SaaS) + roles locales en Tucumán. Fuentes: portales de empresas (Ashby, Greenhouse, Lever, Workday, Teamtailor), LinkedIn, Get on Board, listados de startups.
2. **Filtrar** con `REGLAS.md` §8 (sin data engineering, sin visa requerida que no tengo, sin Go principal). Roles "stretch" senior se pueden intentar si el resto encaja.
3. **Adaptar** un CV de una página para cada aviso (base: versión AI Engineer; ver [`skills/tailored-cv-apply`](skills/tailored-cv-apply/SKILL.md)), con una pasada de crítica y un chequeo ATS/honestidad antes de subirlo, y las respuestas **sin inventar nada**. Respuestas cortas y naturales. Destacar: agentes LLM en producción, sistema para un estudio contable, NASA Space Apps 2024, instructor de n8n.
4. **Postular**: cuentas nuevas con mi email profesional + contraseña generada guardada por el asistente. Si aparece un captcha que el bot no puede resolver, pasarme el link para hacerlo yo.
5. **Registrar** cada postulación (empresa, rol, link, fecha, estado) en un tracker; revisarlo antes de postular para no duplicar (ver `INSIGHTS.md`).
6. **Seguimiento**: revisar el mail periódicamente y avisarme solo de lo que avanza; etiquetar los mails de búsqueda laboral para que no ensucien la bandeja.
7. **Programas de embajadores estudiantiles** de empresas de IA/tech: revisar todos los días y postular a los abiertos para Argentina sin preguntar. Nunca inventar logros; pedirme solo lo que únicamente yo puedo dar (un video propio, referencias).

## 2. Venta de automatizaciones (cold email)
1. **Elegir nicho** con poca presencia digital y procesos repetitivos (p. ej. escribanías: turnos, requisitos, estado de trámites).
2. **Armar lista de leads** desde fuentes públicas (colegios profesionales, Google Maps), con email verificado.
3. **Demo personalizada** por prospecto (su nombre y datos públicos) con URL privada no adivinable; cada uno ve solo la suya. **Probar cada demo de punta a punta** antes de enviar.
4. **Cold email** corto con el link a la demo (+ video corto de 60 s opcional). Plantilla con placeholders; revisión antes de enviar salvo autorización puntual para la campaña.
5. **Follow-ups**: hasta 3 en 3 días + un último check-in amable. Sin respuesta → bajar la demo y sacarlo de la lista.
6. **Feedback** de un prospecto → implementarlo en su demo y responder. **Interesado en contratar → avisarme** (precios y condiciones los fijo yo).
7. Producto a futuro: turnero por WhatsApp → CRM → lectura de documentos con IA.

## 2b. Propuestas para clientes freelance
1. **Brief** con el método de ScopeProfit: entrevista por rondas de preguntas, glosario, decisiones y alcance por fases; estimación en horas y riesgos. Sin precios inventados: el precio lo fijo yo.
2. **Dos versiones**: el brief técnico y una propuesta para el cliente **sin jerga técnica**.
3. **Entrega en PDF** (nunca un archivo editable), con mi marca.
4. Lo opcional (p. ej. una fase 2) se cotiza por separado, no se mete en el precio base.
5. Investigar costos reales de terceros (APIs, telefonía, consumo) antes de comprometer alcance; los paga el cliente.

## 3. Videos de visualización de datos (iterativo)
- **Herramienta**: fframes (Rust) por defecto para videos, para iterar rápido. Borradores en 720p hasta mi OK final; recién ahí 1080p.
- **Guide**: [`DATA_VIDEO_GUIDELINES.md`](DATA_VIDEO_GUIDELINES.md) (principles and checklist). The story is defined in a configuration file; quick rule check → visual QA (contact sheet) → full render.
- **Versionado**: una carpeta por versión `v1/ … vN/`, cada una con el `.mp4`, `script.md` (guion con tabla de tiempos), `sources.md` (cada número en pantalla → dataset → cálculo) y la descripción metodológica / declaración de IA si el concurso lo pide. No se pisa una versión: cada feedback genera la siguiente.
- **Pipeline in code**: data preparation → a *facts* file with every statistic → a renderer that reads everything, with an `assert` for every number and rounding. Nothing typed by hand.
- **QA antes de entregar**: stills (capturas) de cada sección y contact sheet para revisar texto cortado, contraste y legibilidad (texto mínimo legible en celular); duración dentro del límite (p. ej. ≤ 60 s).
- **Audio**: loudness integrado **−14 LUFS**, true peak **≤ −1,5 dBFS**.
- **Narrativa**: una sola visualización si las bases lo piden, una idea por escena, escala humana, líneas de base explícitas, cierre accionable. Menos texto en pantalla es mejor.
- **Entrega**: mostrar la versión nueva con un resumen de cambios y lo pendiente de decidir. No subir a ningún lado hasta que diga que está terminado.

## 3b. Videos promocionales (harness reutilizable)
- Un harness en Rust (fframes) arma muchos videos cortos verticales a partir de **clips + guion + recursos** definidos en un archivo de configuración; pensado para que más adelante una app permita subir clips y textos.
- **Subtítulos quemados desactivados por defecto**: los agrego yo por fuera a partir del SRT.
- Calidades: preview 360p → borrador 720p → final 1080p solo con mi OK.
- Validación: render corto de prueba (360p), loudness −14 LUFS / true peak ≤ −1,5 dBTP, sin frames negros. Sin tests unitarios.
- No hacer videos sueltos a mano cuando el pedido es mejorar el harness.

## 4. Proyectos web (Astro + Netlify)
- Sitios estáticos con **Astro** (TypeScript, scripts simples sin framework cuando alcanza), una página por entidad cuando hace falta.
- **Tests**: Vitest (unitarios) + Playwright (e2e, incluido mobile).
- **Deploy**: Netlify (o Vercel) con **deploy automático en cada push** a `main`, no uploads manuales.
- Páginas privadas: `noindex` y URLs con token no adivinable; los datos reales y el mapa de URLs quedan fuera del repo público.

## 5. GitHub
- **Workflow guide**: [`GIT_WORKFLOW.md`](GIT_WORKFLOW.md) (branches, commits, pull requests, reviews, rebase, checks). Changes go through a branch + PR, never a direct push to `main`.
- **Code conventions**: [`CODE_REVIEW_LESSONS.md`](CODE_REVIEW_LESSONS.md) y `REGLAS.md` §3b (reutilizar antes de crear, enums, implementación mínima).
- Cuenta: [github.com/franprzdev](https://github.com/franprzdev). Repos públicos para portfolio y proyectos; datos reales nunca en repos públicos (solo ejemplos inventados).
- Repo nuevo: lo creo yo vacío y el asistente sube el código (commits claros, rama `main`).
- README con qué es, cómo correrlo y cómo testearlo.
- Antes de cada push a un repo público: revisar que no haya teléfonos, emails, tokens, nombres de clientes o URLs privadas.

## 6. Productos MCP-first
- Si un producto lo va a usar un agente, empezar por un **servidor MCP** con herramientas bien tipadas y una landing que lo explique, no por un frontend de app (ScopeProfit, Presu, Reelsmith, UTN-MCP, GeoTucumán, el MCP del portfolio).
- Local para el usuario final → binario único por **stdio** (p. ej. Rust + `rmcp`), distribuido por GitHub Releases multiplataforma con la config para Claude / Codex / OpenCode.
- Para ChatGPT u otros clientes remotos → **Streamable HTTP** sobre un dominio HTTPS estable, con OAuth/API keys; trabajos pesados (renders) asíncronos con `job_id` y consulta de estado.
- Herramientas de solo lectura sin secretos cuando es público (el MCP del portfolio); acciones con efecto (publicar, entregar) siempre con confirmación del usuario.
- Para OpenCode multiagente con modelos gratis, ver `OPENCODE.md`.

## 7. Automatizaciones recurrentes
- Las tareas programadas en las que me apoyo (búsqueda laboral 5×/día, alertas de entrevistas, embajadores, novedades de concursos, actualización diaria de este repo, Shorts diarios) están descriptas en [`AUTOMATIONS.md`](AUTOMATIONS.md) para recrearlas en cualquier asistente.
