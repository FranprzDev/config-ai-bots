# config-ai-bots

Mi forma de trabajar con asistentes de IA, en Markdown, para llevarla a cualquier herramienta (Grok, ChatGPT, Claude, Gemini, Cursor, etc.) cuando cambio de bot.

> Repo público: no contiene datos personales privados (teléfono, dirección, emails, montos, clientes, credenciales). Esos datos se los doy al bot en el momento, si hacen falta.

## Archivos

| Archivo | Para qué sirve |
|---|---|
| [`SYSTEM_PROMPT.md`](SYSTEM_PROMPT.md) | Prompt listo para pegar como *custom instructions* / *system prompt* (menos de ~6.000 caracteres). |
| [`PERFIL.md`](PERFIL.md) | Perfil profesional público: stack, experiencia, logros, roles objetivo. |
| [`REGLAS.md`](REGLAS.md) | Reglas de trabajo fijas: qué hacer sin preguntar y qué confirmar antes. |
| [`FLUJOS.md`](FLUJOS.md) | Flujos recurrentes: postulaciones, venta de automatizaciones, videos de datos, webs, GitHub. |
| [`PROYECTOS.md`](PROYECTOS.md) | Proyectos actuales, descriptos de forma genérica. |
| [`CHANGELOG.md`](CHANGELOG.md) | Historial de cambios del repo. |

## Cómo usarlo

1. **Pegá `SYSTEM_PROMPT.md`** (sin el título) en el campo de instrucciones del bot:
   - **ChatGPT**: Settings → Personalization → Custom instructions, o dentro de un *Project* / *GPT* → Instructions.
   - **Claude**: un *Project* → Project instructions (o Settings → Profile → preferencias).
   - **Grok**: Settings → Customize → Custom instructions.
   - **Gemini**: un *Gem* → Instructions.
   - **Cursor / IDEs**: como regla del proyecto (`.cursor/rules/*.mdc`, `AGENTS.md` o `CLAUDE.md`).
2. **Adjuntá el resto como conocimiento** (*knowledge* / *project files*): `PERFIL.md`, `REGLAS.md`, `FLUJOS.md`, `PROYECTOS.md`.
3. Si el bot no permite archivos, pegá `REGLAS.md` al inicio de la conversación cuando la tarea lo requiera.
4. Cuando algo cambie (nuevo proyecto, nueva regla), actualizá el archivo y anotá el cambio en `CHANGELOG.md`.

## Mantenimiento

- Un archivo por tema; cambios chicos y fechados.
- Antes de commitear, revisar que no se cuelen datos privados (teléfonos, emails, montos, nombres de clientes o de terceros, tokens, URLs privadas).
