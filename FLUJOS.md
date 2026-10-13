# Flujos recurrentes

## 1. Postulaciones laborales
1. **Buscar**: roles remotos desde Argentina (startups de IA, fintech, SaaS) + roles locales en Tucumán. Fuentes: portales de empresas (Ashby, Greenhouse, Lever, Workday, Teamtailor), LinkedIn, Get on Board, listados de startups.
2. **Filtrar** con `REGLAS.md` §8 (sin data engineering, sin visa requerida que no tengo, sin Go principal). Roles "stretch" senior se pueden intentar si el resto encaja.
3. **Adaptar** el CV (versión AI Engineer) y las respuestas **sin inventar nada**. Respuestas cortas y naturales. Destacar: agentes LLM en producción, sistema para un estudio contable, NASA Space Apps 2024, instructor de n8n.
4. **Postular**: cuentas nuevas con mi email profesional + contraseña generada guardada por el asistente. Si aparece un captcha que el bot no puede resolver, pasarme el link para hacerlo yo.
5. **Registrar** cada postulación (empresa, rol, link, fecha, estado) en un tracker.
6. **Seguimiento**: revisar el mail periódicamente y avisarme solo de lo que avanza; etiquetar los mails de búsqueda laboral para que no ensucien la bandeja.

## 2. Venta de automatizaciones (cold email)
1. **Elegir nicho** con poca presencia digital y procesos repetitivos (p. ej. escribanías: turnos, requisitos, estado de trámites).
2. **Armar lista de leads** desde fuentes públicas (colegios profesionales, Google Maps), con email verificado.
3. **Demo personalizada** por prospecto (su nombre y datos públicos) con URL privada no adivinable; cada uno ve solo la suya. **Probar cada demo de punta a punta** antes de enviar.
4. **Cold email** corto con el link a la demo (+ video corto de 60 s opcional). Plantilla con placeholders; revisión antes de enviar salvo autorización puntual para la campaña.
5. **Follow-ups**: hasta 3 en 3 días + un último check-in amable. Sin respuesta → bajar la demo y sacarlo de la lista.
6. **Feedback** de un prospecto → implementarlo en su demo y responder. **Interesado en contratar → avisarme** (precios y condiciones los fijo yo).
7. Producto a futuro: turnero por WhatsApp → CRM → lectura de documentos con IA.

## 3. Videos de visualización de datos (iterativo)
- **Versionado**: una carpeta por versión `v1/ … vN/`, cada una con el `.mp4`, `script.md` (guion con tabla de tiempos), `sources.md` (cada número en pantalla → dataset → cálculo) y la descripción metodológica / declaración de IA si el concurso lo pide. No se pisa una versión: cada feedback genera la siguiente.
- **Pipeline en código**: scripts `prep_*.py` → JSON de estadísticas → `render_vN.py` que lee todo y tiene `assert` por cada número y redondeo. Nada tipeado a mano.
- **QA antes de entregar**: stills (capturas) de cada sección y contact sheet para revisar texto cortado, contraste y legibilidad (texto mínimo legible en celular); duración dentro del límite (p. ej. ≤ 60 s).
- **Audio**: loudness integrado **−14 LUFS**, true peak **≤ −1,5 dBFS**.
- **Narrativa**: una sola visualización si las bases lo piden, una idea por escena, escala humana, líneas de base explícitas, cierre accionable. Menos texto en pantalla es mejor.
- **Entrega**: mostrar la versión nueva con un resumen de cambios y lo pendiente de decidir. No subir a ningún lado hasta que diga que está terminado.

## 4. Proyectos web (Astro + Netlify)
- Sitios estáticos con **Astro** (TypeScript, scripts simples sin framework cuando alcanza), una página por entidad cuando hace falta.
- **Tests**: Vitest (unitarios) + Playwright (e2e, incluido mobile).
- **Deploy**: Netlify (o Vercel) con **deploy automático en cada push** a `main`, no uploads manuales.
- Páginas privadas: `noindex` y URLs con token no adivinable; los datos reales y el mapa de URLs quedan fuera del repo público.

## 5. GitHub
- Cuenta: [github.com/franprzdev](https://github.com/franprzdev). Repos públicos para portfolio y proyectos; datos reales nunca en repos públicos (solo ejemplos inventados).
- Repo nuevo: lo creo yo vacío y el asistente sube el código (commits claros, rama `main`).
- README con qué es, cómo correrlo y cómo testearlo.
- Antes de cada push a un repo público: revisar que no haya teléfonos, emails, tokens, nombres de clientes o URLs privadas.
