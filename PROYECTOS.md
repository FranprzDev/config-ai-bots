# Proyectos actuales (octubre 2026)

Descriptos a nivel público; los detalles privados (clientes, leads, montos) no van acá.

## 1. Concurso de visualización de datos — video «¿Dónde arde Argentina?»
- Video de ≤ 60 s, categoría *Historia visual*, para un concurso universitario de visualización con datos abiertos. **Cierre: 15 de octubre de 2026.** Se presenta con seudónimo.
- Tema: incendios en la Argentina. Datos: focos de calor satelitales (NASA FIRMS VIIRS), área quemada (MODIS MCD64A1), imágenes Sentinel-2, dataset oficial de causas del Ministerio de Ambiente, límites INDEC/IGN.
- Métrica principal de área: "superficie que ardió al menos una vez, 2012–2025" (cada píxel cuenta una vez). Cierre accionable: prevenir y llamar al 911.
- Estado: **presentado el 14/10/2026** (versión final en 1080p tras varias iteraciones). El código que genera el video está en un repo público.
- Tema alternativo trabajado antes: urbanización vs. cobertura de cloacas en Tucumán (datos del Censo 2022 + GHSL).

## 2. Turnero web para escribanías de Tucumán
- Producto propio: turnos online (firma, entrega de documentación, estado del trámite), panel para el escribano, simulación de bot de WhatsApp. A futuro: CRM + lectura de documentos con IA.
- Validación con demos personalizadas por escribanía + campaña de cold email.
- Stack: Astro (estático, TypeScript), Vitest + Playwright, Netlify con deploy automático. El repo público solo tiene datos de ejemplo inventados.
- Estado: la campaña de validación por cold email corrió del 13 al 16 de octubre de 2026.

## 3. Búsqueda laboral
- Postulando a roles de AI Engineer, AI Product Engineer, Forward Deployed Engineer y Full-Stack (remoto desde Argentina; startups de IA, fintech, SaaS; también roles IT en Tucumán y oportunidades en el exterior con sponsorship).
- Ver `PERFIL.md` y `FLUJOS.md` §1.

## 4. Automatizaciones freelance
- Sistemas de automatización para pymes y estudios profesionales con n8n, agentes de IA, Supabase e integraciones con Google Workspace y WhatsApp.
- Caso real: sistema de vencimientos impositivos para un estudio contable de Buenos Aires (en uso con datos reales).
- Propuestas en curso (octubre 2026): un agente de voz con IA (ElevenLabs) para atención telefónica de una gestoría y un agente de prospección B2B con IA (buscar, enriquecer y puntuar prospectos; el envío masivo queda como fase 2 opcional).

## 5. Proofy (hackathon web3)
- Escrow en Solana con pagos por hitos: cada hito se libera cuando el código entregado pasa chequeos estáticos y tests dinámicos. Prototipo en devnet, no listo para producción.
- Repo: [github.com/FranprzDev/Proofy](https://github.com/FranprzDev/Proofy) · Demo: [proofyai.vercel.app](https://proofyai.vercel.app)

## 6. AdHorarium
- Planificador académico para carreras de la UTN (trabajo del Seminario Integrador): Next.js, Neon Postgres + Drizzle, Auth.js (email + contraseña, Google como opción secundaria), panel de admin con importación de horarios oficiales.
- Documentación formal en español (habilitación de trabajo final + manual de usuario) y presentación oral.
- Repo: [github.com/FranprzDev/AdHorarium](https://github.com/FranprzDev/AdHorarium) · App: [adhorarium.vercel.app](https://adhorarium.vercel.app)

## 7. ScopeProfit
- Copiloto de alcance para freelancers: idea desordenada del cliente → brief versionado (entrevista por rondas de preguntas, glosario y decisiones) → documento de propuesta (PDF/DOCX). Sin cotización ni precios: fuera de alcance.
- Enfoque MCP-first: funciona como servidor MCP / plugin para cualquier agente (ChatGPT, Claude, Grok…); solo una landing en Next.js, sin frontend de app. Backend en reescritura a Python con FastAPI.

## 8. Canal de YouTube sobre algoritmos heurísticos
- Shorts técnicos en inglés sobre heurísticas y metaheurísticas (A*, recocido simulado, genéticos, tabú…) y la serie "Is AI just an LLM?". Hechos con fframes (Rust); cada número en pantalla sale de correr el algoritmo de verdad.
- Si no elijo tema, se usa directamente el siguiente sugerido.

## 9. Portfolio
- [franprz.vercel.app](https://franprz.vercel.app): fondo oscuro simple (sin fondo 3D ni scroll-snap), línea de experiencia que se dibuja con el scroll, selector de mundos y sección de contacto; SEO y datos estructurados. El bloque de proyectos destacados se sacó en octubre 2026.

## 10. Harness de videos promocionales
- Plantilla en Rust (fframes) que genera anuncios verticales a partir de clips, guion y recursos definidos por configuración, con preview 360p, borrador 720p y final 1080p, procesamiento por lotes y QA automático de audio y frames. Subtítulos quemados apagados por defecto. Ver `FLUJOS.md` §3b.

## 11. Contribuciones open source
- PR de performance en Cap (grabador de pantalla open source, Rust): render directo de la máscara de pixelado en el editor GPUI. Pendiente de que el maintainer apruebe los workflows de CI del fork.
