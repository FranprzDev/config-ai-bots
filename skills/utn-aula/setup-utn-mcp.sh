#!/usr/bin/env bash
# utn-aula: one-command utn-mcp setup for a fresh agent sandbox.
#
# Expects UTN_USER, UTN_PASS and UTN_REGIONAL in the environment, injected by
# the agent platform's secret store. Never hardcode credentials, never pass
# them as CLI arguments (they would leak into the process list).
#
# Usage:
#   curl -sL https://raw.githubusercontent.com/FranprzDev/config-ai-bots/main/skills/utn-aula/setup-utn-mcp.sh | bash
# Afterwards, call any tool with:
#   node ~/.utn-mcp/utn-call.js <tool> '<json-args>'
set -euo pipefail

UTN_MCP_VERSION="${UTN_MCP_VERSION:-0.9.4}"
UTN_MCP_HOME="${UTN_MCP_HOME:-$HOME/.utn-mcp}"

: "${UTN_USER:?set UTN_USER from the secret store}"
: "${UTN_PASS:?set UTN_PASS from the secret store}"
: "${UTN_REGIONAL:?set UTN_REGIONAL (e.g. frt)}"

node -e 'process.exit(Number(process.versions.node.split(".")[0]) >= 20 ? 0 : 1)' \
  || { echo "[utn-setup] Node 20+ is required" >&2; exit 1; }

mkdir -p "$UTN_MCP_HOME"
cd "$UTN_MCP_HOME"

echo "[utn-setup] installing utn-mcp@$UTN_MCP_VERSION in $UTN_MCP_HOME"
npm install --no-audit --no-fund --loglevel=error "utn-mcp@$UTN_MCP_VERSION"

cat > utn-call.js <<'UTN_CALL_JS'
#!/usr/bin/env node
// Minimal STDIO MCP client for utn-mcp, written by setup-utn-mcp.sh.
// Usage: node utn-call.js <tool> [json-args]
// Requires UTN_USER, UTN_PASS, UTN_REGIONAL in the environment.
// Prints the tool's text content on stdout; server logs stay on stderr.
const { spawn } = require('node:child_process');
const path = require('node:path');

const tool = process.argv[2];
if (!tool) {
  console.error('usage: node utn-call.js <tool> [json-args]');
  process.exit(2);
}
const toolArgs = JSON.parse(process.argv[3] || '{}');

const serverEntry = path.join(__dirname, 'node_modules', 'utn-mcp', 'build', 'index.js');
const child = spawn(process.execPath, [serverEntry], { stdio: ['pipe', 'pipe', 'inherit'] });

let buffer = '';
function send(msg) {
  child.stdin.write(JSON.stringify(msg) + '\n');
}

child.stdout.on('data', (chunk) => {
  buffer += chunk;
  let i;
  while ((i = buffer.indexOf('\n')) >= 0) {
    const line = buffer.slice(0, i).trim();
    buffer = buffer.slice(i + 1);
    if (!line) continue;
    let msg;
    try {
      msg = JSON.parse(line);
    } catch {
      continue;
    }
    if (msg.id === 1) {
      send({ jsonrpc: '2.0', method: 'notifications/initialized' });
      send({ jsonrpc: '2.0', id: 2, method: 'tools/call', params: { name: tool, arguments: toolArgs } });
    } else if (msg.id === 2) {
      if (msg.error) {
        console.error(JSON.stringify(msg.error));
        child.kill();
        process.exit(1);
      }
      const text = (msg.result.content || [])
        .filter((c) => c.type === 'text')
        .map((c) => c.text)
        .join('\n');
      console.log(text);
      child.kill();
      process.exit(msg.result.isError ? 1 : 0);
    }
  }
});

send({
  jsonrpc: '2.0',
  id: 1,
  method: 'initialize',
  params: {
    protocolVersion: '2025-03-26',
    capabilities: {},
    clientInfo: { name: 'utn-call', version: '1.0.0' },
  },
});

setTimeout(() => {
  console.error('[utn-call] timed out waiting for the server');
  child.kill();
  process.exit(1);
}, 180000).unref();
UTN_CALL_JS

echo "[utn-setup] verifying aula login with aula_list_courses"
node utn-call.js aula_list_courses '{}'

echo "[utn-setup] ready. Call tools with: node $UTN_MCP_HOME/utn-call.js <tool> '<json-args>'"
