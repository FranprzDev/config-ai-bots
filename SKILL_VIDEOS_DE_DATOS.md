# Skill: videos de historias con datos (harness `data-video`)

Para cuando le pida a un bot "armá un video de datos sobre X". El código está en [`harness/data-video/`](harness/data-video/)
(README en español; [`AGENTS.md`](harness/data-video/AGENTS.md) con el flujo completo para Codex / Claude Code / Cursor).

## Cuándo usarlo
- Videos cortos (≤ 60 s) que cuentan una historia con **datos abiertos** sobre un mapa: concursos de visualización, posteos, presentaciones.
- Cuando cada número tiene que ser verificable y el video tiene que leerse bien en un celular.

## Cómo pedírselo a un bot
> Usá el harness de `harness/data-video/` (leé su `AGENTS.md`). Tema: «…». Duración máxima: … s. Buscá datos
> abiertos y anotalos en `SOURCES.md`. Armá `stories/<slug>/` con `python -m harness new`, calculá cada número en
> `facts.py`, escribí las escenas en `story.yaml`, corré `check` y `qa --preview`, revisá el contact sheet y recién
> ahí renderizá con `make video`. Mostrame el mp4, el reporte de tiempos y lo que quede pendiente de decidir.

## Flujo (resumen)
1. Pregunta + datos abiertos (fuente, URL, licencia, fecha) → `SOURCES.md`.
2. `python -m harness new "Nombre"` → `stories/<slug>/` (arranca renderizable).
3. `facts.py`: todos los números en pantalla, con `assert` para cada redondeo («casi», «más de la mitad»).
4. `story.yaml`: escenas (`globe_intro`, `timeline`, `big_number`, `ranking`, `satellite_zoom`, `before_after`, `closing`, `sources`…).
5. `python -m harness check …` → `python -m harness qa … --preview` (mirar `contact_sheet.png` y `phone_sheet.png`).
6. `make video STORY=stories/<slug>/story.yaml` → mp4 a −14 LUFS → `python -m harness qa …` final.
7. Iterar por versiones; no subir a ningún lado hasta que diga que está terminado (ver `FLUJOS.md` §3).

## Reglas que el harness hace cumplir (el build falla si no)
- Texto ≥ 48 px a 1080p · ≤ 12 palabras a la vez por escena · cada texto ≥ 0,35 s/palabra + 1 s (mín. 2,5 s) · total ≤ límite.
- Ningún número tipeado a mano en pantalla: todo sale de `facts.json`; las excepciones (fechas, «1 de cada 10») llevan `assert`.
- Audio −14 LUFS, true peak ≤ −1,5 dBTP.

## Reglas que dependen de quien lo use
- Solo datos abiertos y con crédito; asociación no es causalidad.
- Sin imágenes, video, voces ni música generados por IA (por defecto). La IA ayuda con código y análisis, y se declara si las bases lo piden.
- Fotos/satélite solo PD, CC0, CC BY (CC BY-SA si no hay alternativa) o Copernicus con su atribución.
- Las historias que deban quedar privadas se trabajan **fuera** de este repo público.
