# MCP Token Inventory

Canonical inventory of Personal Access Tokens and API credentials used by Model Context Protocol (MCP) servers in this workspace. Lists active tokens, their rotation policy, and deliberately disabled MCP access paths.

This file is the source of truth for MCP credential governance. Future MCP additions (n8n, etc.) should be appended as new entries here, following the same template as `supabase-nura-dev` below.

## Active tokens

### supabase-nura-dev

Read-only, project-pinned access to the Supabase `nura-dev` project via the official `@supabase/mcp-server-supabase` MCP server.

**Token metadata**
- Token type: Supabase Personal Access Token (PAT)
- Token storage: `SUPABASE_ACCESS_TOKEN` env var, exported from `~/.zshrc`
- Revocation URL: https://supabase.com/dashboard/account/tokens
- Created: 2026-05-22
- Rotation cadence: every 90 days (next rotation due 2026-08-20)

**Rotation history**
- 2026-05-22 — Initial setup. Three PATs were generated in sequence; the second PAT was exposed in a screenshot and was rotated immediately. The third-generation PAT is the current live token. The first two are revoked.

**Enforcement**

Defense in depth: even if the PAT had broader Supabase permissions, server-level flags block unsafe calls before they reach the API.

- Server-level flags:
  - `--read-only` → disables write / DDL / SQL-execute tools at the MCP server layer
  - `--project-ref=lczzrquwcirlcbordbwy` → confines all calls to the nura-dev project; no list-projects, no cross-project access
- Config location: `~/.claude.json` (project-keyed to `/Users/imtiazibrahim/Documents/Code/nura-build`)
- Scope decision: `--scope local`, smallest blast radius. Rejected alternatives:
  - `--scope user` (global section of `~/.claude.json`): would apply this MCP to every project on the machine
  - `--scope project` (`.mcp.json` in repo root): would commit the config (though not the token value) to git; shareable but harder to revoke per-user
- Auth method: `SUPABASE_ACCESS_TOKEN` env var inherited from the shell that launched Claude Code. The value is **not** passed via `--env` and does **not** appear anywhere in `~/.claude.json` or in the repo. The MCP server child process inherits the variable from Claude Code's process environment at launch.

**Verify config**

Re-run after any MCP change to confirm token absence in the on-disk config:

```bash
grep -c 'sbp_' ~/.claude.json   # should return 0
```

If this ever returns non-zero, a PAT value has leaked into the config file — investigate and rotate the affected token immediately.

**Guardrail validation (2026-05-22)**

Empirically verified that both layers of the read-only defense hold, by attempting DDL through the two write-capable MCP tools against the live nura-dev project. Both calls were refused; no objects were created.

- **Test 1 — MCP server layer.** Called `apply_migration` with `CREATE TABLE public.guardrail_probe (id int primary key);`. Server returned: `Error: Cannot apply migration in read-only mode.` The `--read-only` flag rejected the call inside the MCP server, before any SQL was sent to Postgres.
- **Test 2 — Postgres layer.** Called `execute_sql` with the same `CREATE TABLE` statement. Postgres returned: `ERROR: 25006: cannot execute CREATE TABLE in a read-only transaction`. The statement reached the database, but the session was opened as a read-only transaction, so Postgres itself refused the DDL (SQLSTATE `25006`).
- **Defense in depth confirmed.** Each layer was exercised independently and each refused on its own — the Postgres-level guard would still hold even if the MCP server-level flag were ever bypassed or misconfigured.
- **Net result.** No table created. `list_tables` on `public` continues to return `{"tables": []}`; schema state is unchanged from before the probe.

## Disabled / deprecated MCP access paths

### claude.ai-hosted Supabase MCP (mcp.supabase.com)

- Status: deliberately disabled at https://claude.ai/customize/connectors
- Reason: dual-access overlap. Leaving this remote OAuth-based MCP active would defeat the least-privilege model of `supabase-nura-dev` — any agent in any Claude Code session could call broader (likely write-capable, non-project-pinned) Supabase tools via the claude.ai pathway, bypassing the server-level guardrails on `supabase-nura-dev`.
- Re-enablement policy: temporary only. If broader Supabase access is genuinely required for a one-off task:
  1. Enable the connector at claude.ai/customize/connectors.
  2. Perform the task.
  3. Disable the connector again immediately.

  Never leave the claude.ai-hosted Supabase MCP persistently active.

## Future tokens

Placeholder for additional MCP server credentials (e.g., n8n, etc.). Each new entry should follow the `supabase-nura-dev` template:

- **Token metadata** — type, storage location, revocation URL, created date, rotation cadence
- **Rotation history** — dated entries for every rotation and the reason
- **Enforcement** — server-level flags, config location, scope decision, auth method
- **Verify config** — one-liner confirming the secret value is absent from on-disk configs

---

## Git authentication — SSH (no rotating credential)

**Decision date:** 2026-05-22
**Method:** SSH key authentication via `~/.ssh/id_ed25519_nura`
**Why:** Sustainable. No 90-day rotation. Public key on GitHub, private key on Mac only. Standard practice.

### Key details
- **Type:** Ed25519
- **Location:** `~/.ssh/id_ed25519_nura` (private), `~/.ssh/id_ed25519_nura.pub` (public)
- **Passphrase:** None (deliberate decision — see trade-off below)
- **Public key registered:** GitHub account `imtiaz-ibrahim` as "MacBook Pro - nura-build - 2026-05"
- **Network workaround:** Port 22 blocked on local network. Config routes `github.com` → `ssh.github.com:443` automatically.

### SSH config location
`~/.ssh/config` (permissions 600). Specifies host, port 443, identity file.

### No-passphrase trade-off (acknowledged 2026-05-22)
A no-passphrase private key means anyone with access to this Mac can push to NURA repos. Acceptable for now because:
- Solo founder on one personally-controlled Mac
- Key only authorises git operations (no Supabase prod, no customer data)
- Mac is FileVault-encrypted with login password

### Revisit conditions
Passphrase MUST be added before any of:
- Real customer HR data exists in a Supabase project this Mac can push to
- This Mac is used outside controlled environments (travel, public networks)
- Anyone else gains access to this Mac (partner, engineer, contractor)
- Tier 3 engineer review (final check before customer 1)

### Rotation
None required. SSH keys do not expire. Replace only if Mac is compromised, lost, or replaced.

### Revocation
If compromised: delete the corresponding key entry at https://github.com/settings/keys

---

## Git authentication — SSH (no rotating credential)

**Decision date:** 2026-05-22
**Method:** SSH key authentication via `~/.ssh/id_ed25519_nura`
**Why:** Sustainable. No 90-day rotation. Public key on GitHub, private key on Mac only. Standard practice.

### Key details
- **Type:** Ed25519
- **Location:** `~/.ssh/id_ed25519_nura` (private), `~/.ssh/id_ed25519_nura.pub` (public)
- **Passphrase:** None (deliberate decision — see trade-off below)
- **Public key registered:** GitHub account `imtiaz-ibrahim` as "MacBook Pro - nura-build - 2026-05"
- **Network workaround:** Port 22 blocked on local network. Config routes `github.com` → `ssh.github.com:443` automatically.

### SSH config location
`~/.ssh/config` (permissions 600). Specifies host, port 443, identity file.

### No-passphrase trade-off (acknowledged 2026-05-22)
A no-passphrase private key means anyone with access to this Mac can push to NURA repos. Acceptable for now because:
- Solo founder on one personally-controlled Mac
- Key only authorises git operations (no Supabase prod, no customer data)
- Mac is FileVault-encrypted with login password

### Revisit conditions
Passphrase MUST be added before any of:
- Real customer HR data exists in a Supabase project this Mac can push to
- This Mac is used outside controlled environments (travel, public networks)
- Anyone else gains access to this Mac (partner, engineer, contractor)
- Tier 3 engineer review (final check before customer 1)

### Rotation
None required. SSH keys do not expire. Replace only if Mac is compromised, lost, or replaced.

### Revocation
If compromised: delete the corresponding key entry at https://github.com/settings/keys
