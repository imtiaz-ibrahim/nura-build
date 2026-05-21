# NURA Portable Skills

These ten markdown files are the NURA portable skill methods. They are the methods AI workers follow when executing NURA build tasks.

Skills are portable: the same file works in Claude (via Claude.ai skill upload), Claude Code, and Codex.

The ten skills:

1. `nura-source-truth-guardian` — checks any output against locked NURA source truth.
2. `nura-architecture-reviewer` — checks any build decision against the approved architecture.
3. `nura-security-approval-guardrail` — checks integrations, permissions and data access for least-privilege and HITL.
4. `nura-ai-execution-task-writer` — turns a build need into a clear, scoped task for an AI worker.
5. `nura-product-requirement-writer` — writes product requirements for DINA features.
6. `nura-agent-builder` — designs NURA AI agents (DINA, Kael, NURA Chief of Staff, lab agents).
7. `nura-workflow-builder` — converts SOPs/processes into executable DINA workflow specs.
8. `dina-hr-agent-product-builder` — builds DINA as a product-grade HR workflow execution agent.
9. `supabase-n8n-product-foundation-builder` — designs the Supabase + n8n product foundation.
10. `nura-mcp-integration-planner` — plans MCP and API connector access under least privilege.

Per the Build Manual, these are installed in Claude.ai's skill settings (for chat use) AND committed here (for repo / Claude Code / Codex / future tool use).

Source: NURA / DINA Build Manual, Part 1, Step 1.6.
