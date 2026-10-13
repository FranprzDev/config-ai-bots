# Skill: data-story videos

A guide for when I ask a bot to "make a data video about X". It applies to any tool or language: what matters are the
principles, not the code.

## When it applies
- Short videos (≤ 60 s, or whatever limit is requested) that tell **one** story with **open data**, usually on
  a map or a chart: posts, presentations, data-visualization calls and contests.
- When every number has to be verifiable and the video has to read well on a phone.

## Principles

### 1. The story lives in a configuration file
- One file per story (YAML, JSON or similar) describes the scenes in order: scene type, text, duration,
  which data it shows, camera moves. The render code is generic and does not change from one story to another.
- Changing the script = editing that file, not the code. Each version of the video maps to a version of the file.
- Scenes are reusable pieces (intro, timeline, big number, ranking, zoom into an image, before/after,
  closing, sources). A new scene is added as a new piece, not as a special case inside another one.

### 2. Numbers are computed, never typed
- A separate step computes **every** number shown on screen from the data and saves them to a *facts*
  file. The script's text references them by name (`{total_cases}`), with the formatting applied there.
- Every verbal rounding ("almost", "more than half", "1 in 10", "7 times") carries an **assert** that checks it against
  the computed value. If the data changes and the phrase stops being true, the build fails.
- A digit typed by hand into on-screen text stops the build. The unavoidable exceptions (dates, satellite
  names) are declared explicitly, each with its own check.
- Every number stays traceable: on-screen number → dataset (source, URL, license, download date) → computation.

### 3. Readability rules, checked in code
- Text ≥ 48 px at 1080p (think of a phone held vertically watching a horizontal video).
- Few words on screen at once per scene (≈ 12 at most).
- Each text stays on screen at least `0.35 s × words + 1 s`, with a minimum of 2.5 s.
- Total duration ≤ the requested limit.
- If something does not comply, fix it by **cutting** words or scenes, never by loosening the rule.
- The sources/credits scene may be exempt from the word rules, but not from the size rule.

### 4. A single visualization
- Everything happens on one coherent visual base (a map, one coordinate system): scenes are camera
  moves, layers that appear and zooms, not cuts to standalone charts.
- One idea per scene, human scale ("1 in 10"), explicit baselines ("the usual" defined), an actionable
  closing. Association is not causation.
- The legend shows only what is on screen at that moment.

### 5. Audio
- Synthesized music or music with a clear license, synced to the scene cuts.
- Integrated loudness **−14 LUFS**, true peak **≤ −1.5 dBTP**, measured on the final compressed file.

### 6. Material and use of AI
- Open data only, with credit.
- No AI-generated images, video, voices or music (by default). AI helps with code, data and analysis, and that is
  disclosed when required.
- Photos or satellite images only if public domain, CC0, CC BY (CC BY-SA if there is no alternative) or with the attribution
  the source requires.

## Workflow
1. A concrete question + open data; record the source, URL, license and date of each dataset.
2. Create the story from a template that already renders something real, so there is a video from minute one.
3. Compute the *facts* with their asserts.
4. Write the scenes in the configuration file.
5. **Quick check** (seconds): validates the configuration, computes the facts and applies the readability rules; prints a
   per-scene timing table.
6. **Visual QA**: stills of each scene + contact sheet + phone-size sheet. Review them by eye: clipped or
   overlapping text, contrast, readability.
7. Full render (parallel and resumable if it takes long) → final QA: duration and loudness of the delivered file.
8. Iterate in versions (one folder or tag per version, never overwriting the previous one). Do not upload anywhere until I say
   it is finished.

## QA checklist before delivery
- [ ] Every on-screen number comes from the facts; every rounding has an assert.
- [ ] Timing table: no scene below the reading minimum; total ≤ limit.
- [ ] Contact sheet and phone sheet reviewed: nothing clipped, overlapping or low-contrast.
- [ ] −14 LUFS / true peak ≤ −1.5 dBTP measured on the final file.
- [ ] Sources and credits complete and readable; licenses respected.
- [ ] Timed script and sources document (number → dataset → computation) delivered alongside the video.

## How to ask a bot for it
> Make a data video of ≤ … s about "…". Follow `DATA_VIDEO_GUIDELINES.md`: find open data and record the
> sources, define the story in a configuration file, compute every number with asserts, check the readability
> rules, review the contact sheet and only then render. Show me the video, the timing table and anything still
> left to decide.
