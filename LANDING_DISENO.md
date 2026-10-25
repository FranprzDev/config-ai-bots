# Landing pages: estrategia y sistema visual

Base de diseño para landings que convierten, adaptada del skill open source **landing-page-design** de [elayadesign/ai-design-skills](https://github.com/elayadesign/ai-design-skills) (licencia MIT). El skill original, completo y en inglés, quedó copiado en [`vendor/elayadesign-landing-page-design/`](vendor/elayadesign-landing-page-design/) junto con su LICENSE: respetar la atribución si se reutiliza.

Este archivo es mi resumen operativo en español, alineado con `FLUJOS.md` §4 (webs). Si el resumen y el skill original difieren, manda el original.

## Estrategia (antes de diseñar)

1. **Intake primero.** Definir objetivo (obtener respuestas), audiencia, promesa concreta, diferenciador, tono, prueba disponible y oferta. Sin brief claro, no se diseña.
2. **Una landing = una oferta, una audiencia, una acción primaria.** Sin CTAs que compitan arriba del fold.
3. **Elegir el layout a propósito:**
   - **A. Long form**: oferta nueva, cara o compleja. Hero → problema → beneficios → cómo funciona → comparación → precio → FAQ → CTA final.
   - **B. Corto con CTA fijo**: oferta conocida y baja fricción. Hero → beneficios → prueba → CTA fijo.
   - **C. Showcase**: portfolio / agencia. Hero → trabajo seleccionado → proceso → testimonios → CTA.
   - **D. Producto (SaaS/apps)**: demo primero. Hero → demo o screenshot → beneficios por resultado → integraciones → precio → FAQ → CTA.
4. **Reglas de conversión:** una idea por sección; beneficio antes que feature; números específicos en vez de adjetivos; reversión de riesgo (garantía, cancelá cuando quieras, prueba gratis); la prueba va al lado del claim que sostiene; CTA repetido donde cambia la decisión; escaneable en 30 segundos.
5. **Copy:** headline claro > inteligente; la subheadline dice para quién es y qué pasa después; CTA orientado a la acción ("Empezar", "Ver demo", no "Enviar"); sección "cómo funciona" en 3 pasos como máximo; FAQ que responde objeciones reales; microcopy humano y directo.
6. **Orden de construcción:** estructura → hero → beneficios → cómo funciona → prueba → FAQ → CTA final. Sección por sección, nunca rehacer la página entera en cada iteración.
7. **SEO/AEO:** `noindex` en páginas de campaña paga u ofertas con fecha; indexar ofertas evergreen con title, meta description, links internos y FAQ en formato pregunta/respuesta (schema si aplica).

## Sistema visual (resumen; valores exactos en el skill original)

- **Tipografía:** una sola familia por sitio (el skill sugiere Geist, Manrope, Geist Mono o Poppins; nunca Inter/Roboto/Arial/Open Sans/Helvetica). Sin itálicas, sin peso 900. Tamaños siempre sobre la escala de Tailwind, nada de valores arbitrarios. Sin guiones en el copy y sin palabras huérfanas (`text-wrap: balance` en headings, `pretty` en cuerpo).
- **Espaciado:** solo los valores de la tabla del skill (0, 2, 4, 8, 12, 16, 24, 32, 40, 48, 64, 80, 96 px). Botones principales: padding 8px vertical / 12px horizontal.
- **Radios:** solo valores Tailwind; radio anidado = radio externo − gap (cuando el gap es < 32px y el resultado > 2).
- **Bordes y fondos:** borde en las cuatro caras o en ninguna; fondos planos, sin gradientes (la única excepción es el gradiente de texto del heading del hero).
- **Hero:** heading y subheading con max-width 680px y cortes de línea donde corta la idea; gradiente de texto blanco→gris en dark, negro→gris en light.
- **Iconos:** Phosphor, Solar o Iconamoon (nunca Material).
- **Motion:** transiciones con bezier custom `cubic-bezier(0.32,0.72,0,1)`, reveals al entrar en viewport con `IntersectionObserver` (nunca listener de scroll sin throttle), stagger en navs y listas.
- **Sección tagline (obligatoria):** un bloque de texto grande (2+ líneas) con el beneficio central, donde cada palabra pasa de tenue a color pleno una por una al scrollear.
- **Realismo de contenido:** nada de Lorem Ipsum, "John Doe", marcas placeholder, números redondos falsos ni clichés de IA ("Elevate", "Seamless", "Unleash"...). Sentence case, voz activa, sin "Oops!".
- **Estados completos:** hover, active, focus visible, loading con skeletons, empty compuesto, error inline específico. Sin links muertos ni `window.alert()`.
- **Ship:** footer con legales, 404 custom, validación de formularios client-side, skip-to-content, favicon, title/meta/og, alt text, HTML semántico, siempre una forma de volver.

## Formato de salida cuando pido una landing

Antes de escribir código, el bot devuelve en orden: outline de secciones → copy del hero → 3-5 beneficios por resultado → cómo funciona en 3 pasos → FAQ (6-12) → recomendación SEO/AEO → layout elegido (A/B/C/D) y por qué. Después se construye sección por sección.

## Errores típicos a auditar

- Demasiados CTAs arriba del fold.
- Value prop vaga ("optimizar", "potenciar").
- Lista de features sin resultados.
- Prueba enterrada al fondo.
- Layout mobile que rompe la lectura.
- Sin próximo paso claro.
