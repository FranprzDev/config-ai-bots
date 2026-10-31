---
name: premium-scroll-pages
description: Build landing pages and scroll sites that feel premium instead of "AI slop": brand first, the 3 Ps, scroll feedback, named references and components, mobile parity and a screenshot verification loop.
---

# Premium scroll pages (anti "AI slop")

My notes from a public 16-minute walkthrough of "cinematic" sites built with Claude (x.com/naldzyul, Oct 2026), saved on 2026-10-15. Use together with [`../../LANDING_DISENO.md`](../../LANDING_DISENO.md) and, for launch videos, [`../cinematic-shot`](../cinematic-shot/SKILL.md).

## Core idea
"Make it look premium" never works. Give the agent concrete inspiration, named components and a verification loop. These seven principles matter more than which model you use.

## The 7 steps
1. **Brand guidelines first**: logo, colours, fonts, voice. Consistency everywhere.
2. **The 3 Ps**: the **Pain** being solved, the **Person** who has it, the **Promise** of how the product fixes it. Copy and visual intensity follow them (a law firm is not a keyboard brand).
3. **Scroll responsiveness**: the user must feel in control; every scroll gives feedback. Subtle is fine: words or lines revealing on enter, numbers ticking up, cards stacking. Avoid forced 3D fly-throughs unless the brand calls for it.
4. **Inspiration from real sites**: pick 1–3 references and name the exact elements you like and why (e.g. "four parallax layers in the hero, each moving at a different rate").
5. **Reuse existing components** instead of inventing them (21st.dev components with copyable prompts; animated backgrounds from Motion Sites).
6. **Mobile must work**: same premium feel on a phone; stacked-card effects may need a different mobile behaviour.
7. **Verification loop**: screenshot frame by frame while scrolling (desktop and mobile), judge like a visitor, fix hard cuts, seams, off colours and imbalance, repeat.

## Techniques that read "premium"
- Layered parallax hero (separate transparent layers moving at different speeds), with the layering returning at the final CTA.
- A live product mock inside a device frame.
- Text reveals; FAQ answers that morph when switching.
- Sticky stacking cards; tabs that flip content within one section.
- Counters ticking up on stats.
- A subtle background reacting to the mouse that never distracts.
- Sticky navigation.
- Product-in-use animations inside the apps users already use, pausing on hover.
- Scroll-scrubbed, reversible video; exploded product views.
- Soft painted backgrounds when the brand fits.

## Inspiration sources
21st.dev, godly.website, Awwwards (match the niche), Motion Sites, competitor sites in the same niche (clone the feel, never the content).

## One-shot prompt pattern
"Build [N] distinctly different, impressive layered scroll sites for [brand]. Brand guidelines: [..]. 3 Ps: [..]. Inspiration: [site A: elements + why]; components: [names]. Generate the assets you need as separate transparent layers. Subtle but premium. Must work on mobile. Verify by screenshotting while scrolling and fix anything off."

## Known failures to check
Hard cuts between sections or layers; third-party logos drawn wrong; parallax or card stacks breaking on mobile.
