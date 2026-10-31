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
