# OpenCode multiagente (oh-my-opencode-slim) — modelos gratuitos

Cómo trabajo con el plugin `oh-my-opencode-slim` de OpenCode: orquestación multiagente (un Orchestrator que planifica y delega en especialistas: explorer, fixer, designer, oracle, observer) usando **solo modelos gratuitos**.

## Regla fija

- Todo con modelos gratis del provider `opencode` (sin API keys ni alta).
- Si un modelo gratis se queda sin cuota, cambiar al siguiente de la cadena u otro gratis del catálogo (`opencode models --refresh`); nunca pasar a uno pago.
- El preset que genera el instalador por defecto apunta a modelos pagos: no usarlo.

## Preset

Contenido de `~/.config/opencode/oh-my-opencode-slim.json`:

```json
{
  "$schema": "https://unpkg.com/oh-my-opencode-slim@latest/oh-my-opencode-slim.schema.json",
  "preset": "free",
  "presets": {
    "free": {
      "orchestrator": {
        "model": [
          "opencode/big-pickle",
          "opencode/nemotron-3.5-lightning-free",
          "opencode/beam-free"
        ],
        "skills": [
          "*"
        ]
      },
      "oracle": {
        "model": [
          "opencode/big-pickle",
          "opencode/beam-free"
        ],
        "skills": [
          "simplify"
        ]
      },
      "explorer": {
        "model": [
          "opencode/glm-5.3-flash-free",
          "opencode/mimo-v2.6-flash-free"
        ],
        "skills": []
      },
      "designer": {
        "model": [
          "opencode/glm-5.3-flash-free",
          "opencode/nemotron-3.5-super-vl-free"
        ],
        "skills": []
      },
      "fixer": {
        "model": [
          "opencode/deepseek-v4.1-flash-free",
          "opencode/flint-40b-free"
        ],
        "skills": []
      },
      "observer": {
        "model": [
          "opencode/nemotron-3.5-super-vl-free",
          "opencode/glm-5.3-flash-free"
        ],
        "skills": []
      }
    }
  },
  "fallback": {
    "enabled": true,
    "maxRetries": 3,
    "retryDelayMs": 500,
    "continuationPolicy": "retry-primary"
  }
}
```

## Aplicarlo

1. `npx oh-my-opencode-slim@latest install` (hace backup `.bak` de lo que toca; respeta el `opencode.json`/`tui.json` existentes).
2. Reemplazar `~/.config/opencode/oh-my-opencode-slim.json` por el preset de arriba.
3. Reiniciar OpenCode y verificar con `ping all agents` (deben responder los especialistas).

## Validación (2026-10-30)

- Probado en entorno aislado con OpenCode 1.19.5 + oh-my-opencode-slim 3.0.6: ping a los 4 especialistas OK y una edición de código real ejecutada y verificada.
- Primarios probados en runtime: orchestrator `big-pickle`, fixer `deepseek-v4.1-flash-free`, explorer `glm-5.3-flash-free`, oracle `beam-free`.
- Fallbacks verificados gratuitos en el catálogo (models.dev), sin prueba de runtime: si salta un fallback, validar antes de confiar.
- Techo de calidad menor que el preset pago original; para trabajo pesado conviene el modelo gratis más capaz del momento.

## Skill: stack-diagram (diagramas de arquitectura con logos oficiales)

Skill de agente que genera un diagrama de arquitectura del stack a partir de una frase ("Diagram our stack: Next.js y una API Hono en Vercel, Postgres en Neon, auth con Clerk..."), con los logos oficiales de cada tecnología. El resultado es un HTML autocontenido (funciona offline), PNG en light y dark, componente React o artifact.

- **Origen**: [caru-ini/stack-diagram](https://github.com/caru-ini/stack-diagram) (MIT). Versión validada: commit `1ed53e3e9525` (2026-11-03).
- **Instalarlo**: `npx skills add caru-ini/stack-diagram`, o manual: clonar el repo y copiar `skills/stack-diagram/` a `~/.config/opencode/skills/stack-diagram/` (global, todos los proyectos) o a `.opencode/skills/stack-diagram/` (por proyecto). El preset ya tiene `"skills": ["*"]` en el orchestrator, así que queda disponible sin tocar la config.
- **Requisitos**: Python 3.9+ (solo stdlib) y red para bajar los logos de las fuentes oficiales (svgl, devicon, gilbarbara/logos y los paquetes de iconos de AWS/GCP/Azure). Para exportar PNG: `pip install playwright && python3 -m playwright install --with-deps chromium`. Todo gratis: sin API keys, sin cuotas y sin llamadas a modelos; los scripts son deterministas.
- **Validación (2026-11-03)**: probado en entorno aislado con Python 3.10: fetch de iconos vía svgl OK, build del HTML autocontenido sin tokens sin resolver OK, render PNG light+dark con Chromium headless OK.
- **Ojo**: el skill ofrece una sola vez publicar el diagrama en la galería pública https://stacks.caru.moe; solo se envía si confirmás dos veces y tu prompt nunca se envía. Si no te interesa, decí que no y no insiste.

## Ruta CrowLLM (API key propia, modelo gratis) — SIN VALIDAR

Alternativa al provider `opencode` para cuando los modelos gratis sin clave están saturados: CrowLLM (gateway OpenAI-compatible) sirve `deepseek-v4-flash-uncensored:free` a $0/M tokens de entrada y salida, sin tarjeta ([ficha del modelo](https://crowllm.com/models/deepseek-v4-flash-uncensored:free)).

**Estado 2026-11-09: configuración documentada, NO validada.** El alta con contraseña está deshabilitada por el sitio (solo OAuth de terceros); falta crear la cuenta y la API key. Hasta tener clave y prueba real de tool calls/edición, no usar esta ruta para trabajo real.

### Config ([docs oficiales](https://crowllm.com/docs/integrations/opencode))

En `~/.config/opencode/opencode.json` (global) o en un `opencode.json` en la raíz del proyecto:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "crowllm": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "CrowLLM",
      "options": {
        "baseURL": "https://crowllm.com/v1",
        "apiKey": "{env:CROWLLM_API_KEY}"
      },
      "models": {
        "deepseek-v4-flash-uncensored:free": {
          "name": "deepseek-v4-flash-uncensored:free"
        }
      }
    }
  }
}
```

- La clave se lee de la variable de entorno `CROWLLM_API_KEY`; nunca literal en el archivo ni en el repo.
- Clave dedicada para esta ruta (no reutilizar la de TokenFactory, OpenRouter ni otras). Crearla en el dashboard de CrowLLM; si el dashboard lo permite, limitarla al modelo gratis y con tope de gasto $0.
- Uso: `opencode run -m crowllm/deepseek-v4-flash-uncensored:free "..."` o elegirlo en el picker de modelos.

### Reglas de esta ruta

- Solo el modelo `:free`; nunca modelos pagos del catálogo.
- Solo código público o ficticio: CrowLLM dice no registrar prompts pero los transmite al proveedor upstream y la retención del upstream no está despejada ([privacy](https://crowllm.com/privacy-policy)). Nada de repos privados hasta autorización explícita.
- Métricas medidas por el propio gateway (ventana 8-9 nov 2026): ~93-94% de éxito y ~23s de latencia media. No prometer cuota infinita: el plan gratis puede tener techo de requests por minuto.
- Verificado sin clave el 2026-11-09: el modelo figura servido en `GET https://crowllm.com/v1/models` (endpoint anónimo).

### Pendiente para validar (cuando haya clave)

1. `opencode models` lista el modelo.
2. `opencode run -m crowllm/deepseek-v4-flash-uncensored:free "reply with the single word: ready"` responde.
3. Edición real con tool calls en un repo de prueba público, midiendo latencia y éxito.
