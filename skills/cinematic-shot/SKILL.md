---
name: cinematic-shot
description: Direct a cinematic product launch film from the product's real UI - steep low-angle hero shots, a thin focal band, slow motivated camera drift, no captions or music. Francisco's working notes on top of 1weiho/cinematic-shot.
---

# Cinematic shot (working notes)

Based on the open-source skill [1weiho/cinematic-shot](https://github.com/1weiho/cinematic-shot), which I added on 2026-10-15. These are my condensed working notes; read the upstream repo for the exact recipes (camera, depth of field, light, typography, render) and its full shot-list example.

## My rules on top
- Build with **fframes (Rust)**; every frame is a pure function of time.
- Drafts and previews at **720p** until my final OK; full quality only after.
- Use the product's **real UI** (screenshots rasterized at the shot's magnification, or a faithful rebuild). Never invented UI, never upscaled 1× bitmaps.

## The look
A black void. The product floats as a dark slab tilted away from the camera, lit by a soft pool that follows whatever matters. The camera sits low and close, looking along the UI so text runs diagonally into the distance, with only one control or line in focus. The camera never stops drifting and never moves fast. The only colour is the product's own. The UI does the work: things get typed, streamed and selected while we watch; nothing is explained with captions.

## Process
1. **Story first**: the flow (4–7 on-screen events), one payoff moment, dense believable demo content, and one line of copy (product name + a tagline of five words or fewer).
2. **Shot list before building** (cut time, length, subject in focus, scale, angle, move, action). Around 45–55 s, 8–10 UI shots, then copy and logo. Long "process" shots (typing, streaming) alternate with short "punctuation" shots (a tab, a button). Cut on the action, not on a beat grid. One idea per shot; vary scale and alternate the diagonal; keep the wide shot for the payoff.
3. **Light and grade**: true black stage, a soft neutral pool attached to the UI plane that trails the subject slightly; low key; no added colour, flares or glows; motion blur and fine grain to finish.
4. **Motion inside the shot**: no cursor (controls show their own pressed states); realistic typing speed with a caret; streamed text appearing line by line; gentle fade-and-rise appearances without overshoot.
5. **Ending**: cut to black, one centred line of copy that un-blurs and holds, then a still logo. No CTA unless asked.
6. **Sound**: no music; quiet tactile foley only (key ticks, clicks, a soft whoosh on send).

## Don't
Title cards, captions, keycap overlays, arrows, a visible pointer, flat frontal close-ups, everything in focus, dissolves between UI shots, fast moves or shake, restyled UI, coloured light, animated logos, music.

## Verify like a DP
Render stills mid-shot, at action peaks, at the payoff, copy and logo. Check: one sharp subject readable in under half a second; a thin focal band with near and far blur (except the wide shot); a visibly tilted plane; at least a quarter of the frame near-black; consecutive shots differ in scale or diagonal; consistent black level and grain. Show me 720p stills or a preview first.
