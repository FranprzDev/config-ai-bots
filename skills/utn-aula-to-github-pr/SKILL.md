---
name: utn-aula-to-github-pr
description: "Publish a TP from the UTN aula to a GitHub repo: download the original file via utn-mcp, verify the byte hash, and open a PR whose description carries the evidence (source, sha256, verification). Use when a TP or course file from the aula virtual must land in a repo as a byte-identical PR."
---

# TP del aula a GitHub PR

Moves a course file from the UTN aula virtual into a GitHub repo with verifiable provenance. The evidence lives in the PR description, not in chat messages.

## Workflow

1. Set up utn-mcp as in [`utn-aula`](../utn-aula/SKILL.md).
2. Look up the materia in [`materias.md`](materias.md): it maps each aula course to its repo and the per-TP folder convention. If the materia is "sin repo", stop and ask — never create a repo without his OK.
3. Find the assign in the aula (course + TP name). When the assign links a Google Colab, that Colab is the file: download/export the notebook byte-identical.
4. Compute `sha256sum` and the byte size of the downloaded file, and verify the download is byte-identical to the original in the aula.
5. New branch from `main`; commit only that file under the materia's folder convention (commit message in English, no comments added to the file). The PR must contain that file and nothing else.
6. Open the PR. The summary goes in the PR description (see template), in Spanish, short, with no mention of AI or tooling.
7. Attach or keep a screenshot of the assign in the aula as supporting evidence when reporting.

## PR description template

```
Notebook original del TP tal como está en el aula.

- Fuente: aula del curso <course>, consigna "<assign name>" (linkea a un Google Colab; ese Colab es este archivo).
- Único archivo del PR: `<path>`.
- Verificación: descarga byte-idéntica al original del aula — sha256 `<sha256>`, <bytes> bytes.
```

Adapt the first line and the source line to the actual file type (PDF, notebook, etc.).
