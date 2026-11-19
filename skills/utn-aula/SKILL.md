---
name: utn-aula
description: "UTN (university) tasks: read the aula virtual (courses, forums, files, grades) and autogestión/Sysacad (academic status, finals, correlativas) through utn-mcp. Use for anything that needs the campus aula or Sysacad from a fresh agent sandbox."
---

# UTN aula + autogestión via utn-mcp

[`utn-mcp`](https://github.com/nialvape/utn-mcp) is an unofficial MCP server for the UTN campus: aula virtual (Moodle) and, for regionals with a connector, autogestión (Sysacad). Every agent sandbox starts empty, so run the one-command setup at the start of any UTN task.

## Setup (once per sandbox)

Credentials come from the platform's secret store (vault), never from chat, files in the repo, or CLI arguments. Export them, then run the script:

```bash
export UTN_USER="$(cat <secret-store-user-file>)"
export UTN_PASS="$(cat <secret-store-pass-file>)"
export UTN_REGIONAL=frt
curl -sL https://raw.githubusercontent.com/FranprzDev/config-ai-bots/main/skills/utn-aula/setup-utn-mcp.sh | bash
```

The script pins `UTN_MCP_VERSION` (default 0.9.4), installs into `~/.utn-mcp`, writes a `utn-call.js` helper there, and verifies the login with `aula_list_courses`. Needs Node 20+.

## Calling tools

```bash
node ~/.utn-mcp/utn-call.js aula_list_courses '{}'
node ~/.utn-mcp/utn-call.js aula_open '{"direccion":"/curso/391"}'
node ~/.utn-mcp/utn-call.js aula_grades '{"direccion":"/curso/391"}'
```

The helper prints the tool's text content on stdout. The first call of a sandbox fetches the Moodle token (~20 s); after that the session renews itself while the env vars are set.

## Rules

- **Writes need explicit confirmation first**: `aula_forum_post`, `aula_assign_submit`, `aula_choice_answer`, `aula_send_message`, `aula_calendar_add_event` publish or submit in his name. Show him exactly what will be sent and wait for his yes.
- University TPs: he does the heavy work himself. Guide steps and sources; don't produce results he must submit.
- Never print, log or commit credentials or tokens. `UTN_USER`/`UTN_PASS`/`UTN_REGIONAL` only as env vars injected from the secret store.
- Sysacad (autogestión): same flow with `SYSACAD_ASP_USER` / `SYSACAD_ASP_PASS` env vars (separate secret-store entry); the autogestión connector installs on `npx utn-mcp login autogestion` or on demand. Autogestión tools are read-only.
