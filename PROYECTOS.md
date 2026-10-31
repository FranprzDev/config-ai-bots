# Proyectos actuales (actualizado al 31/10/2026)

Descriptos a nivel público; los detalles privados (clientes, leads, montos, procesos de selección) no van acá.

> Patrón que se repite: **MCP-first**. Muchos productos míos se exponen como servidor MCP para que cualquier agente (ChatGPT, Claude, Codex, OpenCode…) los use, con una landing o web mínima en vez de un frontend de app completo. Ver `FLUJOS.md` §6.

## 1. Concurso de visualización de datos — video «¿Dónde arde Argentina?»
- Video de ≤ 60 s, categoría *Historia visual*, para un concurso nacional universitario de visualización con datos abiertos. Se presenta con seudónimo.
- Tema: incendios en la Argentina. Datos: focos de calor satelitales (NASA FIRMS VIIRS), área quemada (MODIS MCD64A1), imágenes Sentinel-2, dataset oficial de causas del Ministerio de Ambiente, límites INDEC/IGN.
- Métrica principal de área: "superficie que ardió al menos una vez, 2012–2025" (cada píxel cuenta una vez).
- Estado: **presentado el 14/10/2026**; fallo previsto la semana del 16/11/2026.
- Código: [github.com/FranprzDev/donde-arde-argentina](https://github.com/FranprzDev/donde-arde-argentina) (pipeline de datos + harness de video 100% Rust con fframes, `harness-rs/`). Sin videos ni datos pesados commiteados.

## 2. Turnero web para escribanías de Tucumán
- Producto propio: turnos online (firma, entrega de documentación, estado del trámite), panel para el escribano, simulación de bot de WhatsApp. A futuro: CRM + lectura de documentos con IA.
- Validación con demos personalizadas por escribanía (URL privada no adivinable, `noindex`) + campaña de cold email con follow-ups.
- Stack: Astro (estático, TypeScript), Vitest + Playwright, Netlify con deploy automático. Repo público [FranprzDev/escribanias](https://github.com/FranprzDev/escribanias) con datos de ejemplo inventados.
- Estado: la campaña de validación corrió del 13 al 16 de octubre de 2026; sin siguiente fase definida.

## 3. Búsqueda laboral
- Activa. Roles de AI Engineer, AI Product Engineer, Forward Deployed Engineer, Full-Stack y Backend (remoto desde Argentina; startups de IA, fintech, SaaS; también roles IT en Tucumán y oportunidades en el exterior con sponsorship).
- Unas 300 postulaciones registradas en el tracker al 31/10/2026, con CV a medida por aviso. Ver `PERFIL.md`, `FLUJOS.md` §1, `INSIGHTS.md` §2 y [`skills/tailored-cv-apply`](skills/tailored-cv-apply/SKILL.md).

## 4. Automatizaciones freelance
- Sistemas de automatización para pymes y estudios profesionales con n8n, agentes de IA, Supabase/Postgres e integraciones con Google Workspace y WhatsApp.
- **Caso real en producción**: sistema de vencimientos impositivos para un estudio contable de Buenos Aires (repo privado del cliente, `LVC`): calendario de vencimientos, flujo de aprobaciones con devoluciones y bloqueo de entidades, historial de cambios, PDFs mensuales, borradores en Gmail vía OAuth (scopes mínimos documentados), deploy con Docker Compose en un VPS. Lo desarrollo junto a un socio. En ese repo **ningún PR se mergea sin mi OK explícito** (dejo un reporte de pruebas en el PR y espero).
- Propuestas freelance (oct. 2026): agente de voz con IA para atención telefónica, agente de prospección B2B con IA, y una web freelance. Términos en `REGLAS.md` §2b.

## 5. Proofy (hackathon web3)
- Escrow en Solana con pagos por hitos: cada hito se libera cuando el código entregado pasa chequeos estáticos y tests dinámicos. Prototipo en devnet, no listo para producción. Hecho con un co-creador.
- Repo: [github.com/FranprzDev/Proofy](https://github.com/FranprzDev/Proofy) · Demo: [proofyai.vercel.app](https://proofyai.vercel.app)

## 6. AdHorarium
- Planificador académico para carreras de la UTN (trabajo del Seminario Integrador): Next.js, Neon Postgres + Drizzle, Auth.js (email + contraseña, Google como opción secundaria), panel de admin con importación de horarios oficiales (plan 2023 de Sistemas cargado; planes 2008 y 2023 nunca se mezclan).
- Entregado: documentación formal en español (habilitación de trabajo final + manual de usuario, en PDF) y deck web para la presentación oral ([adhorarium-slides](https://github.com/FranprzDev/adhorarium-slides)).
- Repo: [github.com/FranprzDev/AdHorarium](https://github.com/FranprzDev/AdHorarium) · App: [adhorarium.vercel.app](https://adhorarium.vercel.app)

## 7. ScopeProfit
- Copiloto de alcance para freelancers: idea desordenada del cliente → brief versionado (entrevista por rondas de preguntas, glosario y decisiones, estilo *grill with docs*) → documento de propuesta (PDF/DOCX). Sin cotización ni precios: fuera de alcance.
- MCP-first: servidor MCP (Streamable HTTP + stdio, API keys y OAuth 2.1 para ChatGPT) + landing en Next.js, sin frontend de app; bot de Telegram.
- Estado: backend en reescritura de NestJS a **Python/FastAPI** (deploy previsto en Vercel + Neon). Repo: [FranprzDev/ScopeProfit](https://github.com/FranprzDev/ScopeProfit).

## 8. Presu
- App de ChatGPT (servidor MCP): una persona con una idea de producto la convierte en un alcance claro mediante *grilling with docs*; al final genera un PDF con alcance y cotización. Proyectos guardables, créditos gratuitos, pagos de créditos extra solo en testnet.
- Estado: en desarrollo; plugin todavía no publicado. Video intro 720p para C-levels en borrador. Repo: [FranprzDev/presu](https://github.com/FranprzDev/presu).

## 9. Reelsmith (harness de videos promocionales → MCP)
- Servidor MCP en un único binario Rust (`rmcp`, stdio) que convierte una carpeta de clips en videos promocionales verticales: lista clips, escribe el brief, renderiza preview 360p, borrador 720p y final 1080p, y hace QA (duración, −14 LUFS, true peak, frames negros). Herramienta `animate_svg` (SVG → `.mov` con alpha para intros/end cards). Encoder por hardware autodetectado (NVENC/AMF/QSV/VAAPI/VideoToolbox → x264). Subtítulos quemados apagados por defecto (exporta SRT).
- Pensado para un cliente que hace promos de servidores de Minecraft y corre todo local en su PC con GPU. Pendiente: medir tiempos reales en esa GPU.
- Decisión: **no generar videos sueltos a mano**; mejorar el harness/producto. Repo: [FranprzDev/reelsmith](https://github.com/FranprzDev/reelsmith).

## 10. Canal de YouTube sobre algoritmos heurísticos
- Shorts técnicos en inglés sobre heurísticas y metaheurísticas (A*, recocido simulado, genéticos, tabú…) y la serie "Is AI just an LLM?". Hechos con fframes (Rust); cada número en pantalla sale de correr el algoritmo de verdad. 15 Shorts públicos a mediados de octubre de 2026.
- Lo que mejor funcionó al principio (muestra chica): comparaciones "X vs Y" y hooks contraintuitivos; deep dives sobre el tema con mejor retención.
- Si no elijo tema, se usa directamente el siguiente sugerido (próximo sugerido: Ant Colony Optimization).

## 11. Portfolio + servidor MCP
- [franprz.vercel.app](https://franprz.vercel.app) (repo [FranprzDev/Me](https://github.com/FranprzDev/Me)): Next.js 16, React 19, Tailwind v4, Motion, React Three Fiber; bilingüe ES/EN; SEO y JSON-LD; CV en PDF generado desde los mismos datos.
- `/api/mcp`: servidor MCP público, sin estado y de solo lectura (perfil, experiencia, proyectos, contacto) para que un agente de IA pueda "contratarme". Portfolio y servidor MCP se presentan como **dos cosas distintas**.
- Video promocional del portfolio (v5, 1080p) terminado; post de lanzamiento en LinkedIn en borrador (tono natural, que no suene a IA).

## 12. UTN-MCP
- Servidor MCP **no oficial** de la UTN: el agente busca y lee material del aula virtual y, con confirmación, publica en foros o entrega tareas. Local (stdio) o HTTP con OAuth. Repo: [FranprzDev/utn-mcp](https://github.com/FranprzDev/utn-mcp).

## 13. GeoTucumán
- MCP de descubrimiento y consulta de geodatos públicos (servicios WFS oficiales + API Georef), empezando por Tucumán; consulta en vivo y cita la fuente. Hecho con xmcp. Repo: [FranprzDev/geotucuman](https://github.com/FranprzDev/geotucuman).

## 14. Contribuciones open source
- PR de performance en Cap (grabador de pantalla open source, Rust): render directo de la máscara de pixelado en el editor GPUI. Pendiente de que el maintainer apruebe los workflows de CI del fork. GitHub Sponsors activo en mi perfil. (No va en el CV.)
