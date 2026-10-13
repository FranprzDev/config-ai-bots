# Skill: videos de historias con datos

Guía para cuando le pida a un bot "armá un video de datos sobre X". Vale para cualquier herramienta o lenguaje: lo que
importa son los principios, no el código.

## Cuándo aplica
- Videos cortos (≤ 60 s, o el límite que se pida) que cuentan **una** historia con **datos abiertos**, normalmente sobre
  un mapa o un gráfico: posteos, presentaciones, convocatorias de visualización.
- Cuando cada número tiene que ser verificable y el video tiene que leerse bien en un celular.

## Principios

### 1. La historia vive en un archivo de configuración
- Un archivo por historia (YAML, JSON o similar) describe las escenas en orden: tipo de escena, textos, duración,
  qué datos muestra, movimientos de cámara. El código de render es genérico y no cambia de una historia a otra.
- Cambiar el guion = editar ese archivo, no el código. Cada versión del video corresponde a una versión del archivo.
- Las escenas son piezas reutilizables (intro, línea de tiempo, número grande, ranking, zoom a una imagen, antes/después,
  cierre, fuentes). Una escena nueva se agrega como pieza nueva, no como caso especial dentro de otra.

### 2. Los números se calculan, nunca se tipean
- Un paso separado calcula **todos** los números que salen en pantalla a partir de los datos y los guarda en un archivo
  de *facts*. Los textos del guion los referencian por nombre (`{total_casos}`), con el formato aplicado ahí.
- Cada redondeo verbal («casi», «más de la mitad», «1 de cada 10», «7 veces») lleva un **assert** que lo verifica contra
  el valor calculado. Si el dato cambia y la frase deja de ser cierta, el build falla.
- Un dígito escrito a mano en un texto de pantalla frena el build. Las excepciones inevitables (fechas, nombres de
  satélites) se declaran explícitamente, cada una con su chequeo.
- Cada número queda trazado: número en pantalla → dataset (fuente, URL, licencia, fecha de descarga) → cálculo.

### 3. Reglas de lectura, chequeadas en código
- Texto ≥ 48 px a 1080p (pensar en un celular en vertical mirando un video horizontal).
- Pocas palabras a la vez por escena (≈ 12 como tope).
- Cada texto en pantalla al menos `0,35 s × palabras + 1 s`, con un mínimo de 2,5 s.
- Duración total ≤ el límite pedido.
- Si algo no cumple, se arregla **cortando** palabras o escenas, nunca aflojando la regla.
- La escena de fuentes/créditos puede quedar exenta de las reglas de palabras, pero no de la de tamaño.

### 4. Una sola visualización
- Todo ocurre sobre una base visual coherente (un mapa, un sistema de coordenadas): las escenas son movimientos de
  cámara, capas que aparecen y zooms, no cortes a gráficos sueltos.
- Una idea por escena, escala humana («1 de cada 10»), líneas de base explícitas («lo habitual» definido), cierre
  accionable. Asociación no es causalidad.
- La leyenda muestra solo lo que está en pantalla en ese momento.

### 5. Audio
- Música sintetizada o con licencia clara, sincronizada con los cortes de escena.
- Loudness integrado **−14 LUFS**, true peak **≤ −1,5 dBTP**, medido sobre el archivo final ya comprimido.

### 6. Material y uso de IA
- Solo datos abiertos y con crédito.
- Sin imágenes, video, voces ni música generados por IA (por defecto). La IA ayuda con código, datos y análisis, y se
  declara cuando corresponde.
- Fotos o imágenes satelitales solo de dominio público, CC0, CC BY (CC BY-SA si no hay alternativa) o con la atribución
  que pida la fuente.

## Flujo
1. Pregunta concreta + datos abiertos; anotar fuente, URL, licencia y fecha de cada dataset.
2. Crear la historia desde una plantilla que ya renderiza algo real, para tener video desde el minuto uno.
3. Calcular los *facts* con sus asserts.
4. Escribir las escenas en el archivo de configuración.
5. **Chequeo rápido** (segundos): valida la configuración, calcula los facts y aplica las reglas de lectura; imprime una
   tabla de tiempos por escena.
6. **QA visual**: capturas de cada escena + contact sheet + hoja a tamaño celular. Revisarlas a ojo: texto cortado o
   superpuesto, contraste, legibilidad.
7. Render completo (en paralelo y reanudable si tarda) → QA final: duración y loudness del archivo entregado.
8. Iterar por versiones (una carpeta o tag por versión, sin pisar la anterior). No subir a ningún lado hasta que diga
   que está terminado.

## Checklist de QA antes de entregar
- [ ] Todos los números de pantalla salen de los facts; todos los redondeos tienen assert.
- [ ] Tabla de tiempos: ninguna escena por debajo del mínimo de lectura; total ≤ límite.
- [ ] Contact sheet y hoja celular revisadas: nada cortado, superpuesto ni con bajo contraste.
- [ ] −14 LUFS / true peak ≤ −1,5 dBTP medidos sobre el archivo final.
- [ ] Fuentes y créditos completos y legibles; licencias respetadas.
- [ ] Guion con tiempos y documento de fuentes (número → dataset → cálculo) junto al video.

## Cómo pedírselo a un bot
> Armá un video de datos de ≤ … s sobre «…». Seguí `SKILL_VIDEOS_DE_DATOS.md`: buscá datos abiertos y anotá las
> fuentes, definí la historia en un archivo de configuración, calculá cada número con asserts, chequeá las reglas de
> lectura, revisá el contact sheet y recién ahí renderizá. Mostrame el video, la tabla de tiempos y lo que quede
> pendiente de decidir.
