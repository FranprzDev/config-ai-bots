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
- Write down **every assignment rule** the computation uses, not just the formula: how a point that falls outside
  every polygon is assigned (e.g. to the nearest one), which boundary set, which confidence filter, how ties and
  repeats count. An undocumented rule means nobody else can reproduce the number, even when the number is right.
- A number that sits right at the edge of its verbal rounding (e.g. 6.96 for "almost 7", which another reasonable
  boundary rule turns into exactly 7.00) is fragile: flag it, or choose wording that holds under both rules.

### 3. Readability rules, checked in code
- Text ≥ 48 px at 1080p (think of a phone held vertically watching a horizontal video).
- Few words on screen at once per scene (≈ 12 at most).
- Each text stays on screen at least `0.35 s × words + 1 s`, with a minimum of 2.5 s.
- Total duration ≤ the requested limit.
- If something does not comply, fix it by **cutting** words or scenes, never by loosening the rule.
- The sources/credits scene may be exempt from the word rules, but not from the size rule.
- An exception to a rule is an editorial decision, never a way to make a failing check pass. It is declared in the
  story file next to the scene it affects, with the approved value, **who approved it** and why; the check prints the
  rule's own figure next to the approved one, so the exception stays visible in every report.
- Text is designed on the 1080p canvas and the rules are measured there, whatever the output resolution (see
  *Rendering and performance*): a 48 px design text is 32 px in a 720p draft and 48 px again in the final.

### 4. A single visualization
- Everything happens on one coherent visual base (a map, one coordinate system): scenes are camera
  moves, layers that appear and zooms, not cuts to standalone charts.
- One idea per scene, human scale ("1 in 10"), explicit baselines ("the usual" defined), an actionable
  closing. Association is not causation.
- The legend shows only what is on screen at that moment.
- The legend must match what is actually drawn. A colour key draws the real swatch, taken from the same constant the
  layer uses, rather than naming a colour in words ("grey = …") that may be false once the layer is blended over the
  base; the key also uses the same tone and size as the other legend rows, so it reads as a key and not a caption.
- Keep a legend on screen while two layers coexist and removing it would let the viewer confuse them (e.g. points
  and areas from different products), even if the scene "feels" readable without it.

### 5. Audio
- Synthesized music or music with a clear license, synced to the scene cuts.
- Integrated loudness **−14 LUFS**, true peak **≤ −1.5 dBTP**, measured on the final compressed file.

### 6. Material and use of AI
- Open data only, with credit.
- No AI-generated images, video, voices or music (by default). AI helps with code, data and analysis, and that is
  disclosed when required.
- Photos or satellite images only if public domain, CC0, CC BY (CC BY-SA if there is no alternative) or with the attribution
  the source requires.

### 7. Credits and authorship
- Never attribute authorship or production to AI ("video generation: AI", "produced with AI"). When AI helped,
  phrase it as assistance under human supervision (e.g. "Code: AI assistance, under human supervision") and give the
  detailed disclosure where the rules ask for it (description, form, methodology).
- When a pseudonym is required, no real name appears anywhere the jury can see: on screen, in the credits, in the
  file metadata. Also search the repo and every delivered file for the real name or handles: story files (e.g. an
  `approved_by` field), QA reports, test strings, commit-visible docs, and the account the video is uploaded from.
- Check that the pseudonym itself does not echo the author's real name or public handles.

## Rendering and performance
- **Drafts at 720p by default; 1080p only with an explicit flag (e.g. `--final`)** after the human approves the cut.
  In practice this saved ~40 % of render time and ~30 % of peak memory on every iteration.
- Lay out everything on the 1080p design canvas (positions, font sizes, readability rules in design pixels) and scale
  only the output, so the size rules stay valid at any resolution.
- QA validates the resolution that was requested (draft or final), not a hard-coded 1920×1080.
- Cache rasters pre-scaled to the draft size (rebuilt when the source is newer): a 720p draft then decodes ~44 % of
  the pixels.
- Don't rasterize the same layer group twice (a sharp copy plus a blurred copy for the glow). Draw it once and add
  the bloom in the same pass; this cut ~16 % on the heaviest stretch. Before merging a rendering change like this,
  prove visual equality on sample frames with PSNR/SSIM (here ~65 dB / 0.9999, i.e. 8-bit rounding only).
- Measure before optimizing: find which stretch costs the time (often one effects-heavy scene costs 10× the rest).
- Tried and discarded, so don't retry blindly: rendering chunks in parallel on a 2-core machine (the renderer
  already uses both cores; no time gained, memory doubled), and removing the probe pass that lists each chunk's
  rasters (it costs ~1 s per chunk and keeps memory bounded).
- Benchmark honestly: the same input before and after, peak RSS of the whole process tree (not just the parent),
  and a note on noise. On a shared machine, report a ±10–15 % margin and say when a result is not a measurable
  improvement, instead of picking the best run.

## Tooling lessons
- A flag such as `--help` must never trigger a full render. Decide "full render" with an explicit, readable check
  (e.g. an `is_full_render()` function) instead of treating "no range given" as "render everything".
- If the repo has no CI, "green checks" means nothing: run build, tests, the rule check and QA locally before
  merging, and say so in the PR.

## Workflow
1. A concrete question + open data; record the source, URL, license and date of each dataset.
2. Create the story from a template that already renders something real, so there is a video from minute one.
3. Compute the *facts* with their asserts.
4. Write the scenes in the configuration file.
5. **Quick check** (seconds): validates the configuration, computes the facts and applies the readability rules; prints a
   per-scene timing table.
6. **Visual QA**: stills of each scene + contact sheet + phone-size sheet. Review them by eye: clipped or
   overlapping text, contrast, readability.
7. Full render at 720p draft (chunked and resumable if it takes long) → QA: duration, resolution and loudness of
   the delivered file. Render 1080p with the final flag only after the human approves the cut, then run QA again.
8. Iterate in versions (one folder or tag per version, never overwriting the previous one). Do not upload anywhere until I say
   it is finished.

## QA checklist before delivery
- [ ] Every on-screen number comes from the facts; every rounding has an assert; no hand-typed digit in a template.
- [ ] Every data assignment rule (fallbacks, filters, boundaries) is written in the sources document.
- [ ] Any rule exception is declared with who approved it and why.
- [ ] Timing table: no scene below the reading minimum; total ≤ limit.
- [ ] Contact sheet and phone sheet reviewed: nothing clipped, overlapping or low-contrast.
- [ ] −14 LUFS / true peak ≤ −1.5 dBTP measured on the final file.
- [ ] Sources and credits complete and readable; licenses respected.
- [ ] Legends match what is drawn (real swatches, not colour words).
- [ ] Credits: no AI authorship; if a pseudonym is required, no real name on screen, in metadata, or in repo files,
      reports and test strings.
- [ ] QA ran on the requested resolution; the 1080p final only after the human OK.
- [ ] Timed script and sources document (number → dataset → computation) delivered alongside the video.

## How to ask a bot for it
> Make a data video of ≤ … s about "…". Follow `DATA_VIDEO_GUIDELINES.md`: find open data and record the
> sources, define the story in a configuration file, compute every number with asserts, check the readability
> rules, review the contact sheet and only then render. Show me the video, the timing table and anything still
> left to decide.
