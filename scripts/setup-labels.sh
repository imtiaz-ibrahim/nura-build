#!/bin/bash
# NURA-AI build — GitHub label setup (Step 1.3)
# Target repo: imtiaz-ibrahim/nura-build
# Run from anywhere; -R flag scopes to the repo.

set -euo pipefail

REPO="${REPO:-imtiaz-ibrahim/nura-build}"

# Colours: workers = blue, phases = purple, states = amber/red
WORKER_COLOR="1f6feb"
PHASE_COLOR="8957e5"
STATE_APPROVAL="fbca04"
STATE_BLOCKED="d73a4a"
STATE_SECURITY="b60205"
STATE_SOURCETRUTH="0e8a16"

echo "Creating worker labels..."
gh label create "founder" -R "$REPO" -c "$WORKER_COLOR" -d "Task owned and executed by the founder." --force
gh label create "technical-partner" -R "$REPO" -c "$WORKER_COLOR" -d "Task requires the scoped paid engineer (Tier 3 gate work)." --force
gh label create "claude" -R "$REPO" -c "$WORKER_COLOR" -d "Task to be drafted or executed by Claude (chat)." --force
gh label create "claude-code" -R "$REPO" -c "$WORKER_COLOR" -d "Task to be executed by Claude Code in the repo." --force
gh label create "codex" -R "$REPO" -c "$WORKER_COLOR" -d "Task to be executed by Codex." --force
gh label create "chatgpt" -R "$REPO" -c "$WORKER_COLOR" -d "Task to be drafted or executed by ChatGPT." --force
gh label create "n8n" -R "$REPO" -c "$WORKER_COLOR" -d "Task built or configured inside n8n." --force
gh label create "supabase" -R "$REPO" -c "$WORKER_COLOR" -d "Task built or configured inside Supabase." --force
gh label create "paperclip-lab" -R "$REPO" -c "$WORKER_COLOR" -d "Task scoped to the Paperclip internal orchestration lab only." --force
gh label create "hermes-lab" -R "$REPO" -c "$WORKER_COLOR" -d "Task scoped to the Hermes internal lab only." --force

echo "Creating phase labels..."
gh label create "part-1-control" -R "$REPO" -c "$PHASE_COLOR" -d "Part 1 — Build Control System (repo, Projects board, labels, skills)." --force
gh label create "part-2-supabase" -R "$REPO" -c "$PHASE_COLOR" -d "Part 2 — Supabase foundation (nura and dina schemas, RLS)." --force
gh label create "part-3-n8n" -R "$REPO" -c "$PHASE_COLOR" -d "Part 3 — n8n foundation and standard workflow patterns." --force
gh label create "part-4-command-centre" -R "$REPO" -c "$PHASE_COLOR" -d "Part 4 — NURA Founder Command Centre app." --force
gh label create "part-5-chief-of-staff" -R "$REPO" -c "$PHASE_COLOR" -d "Part 5 — NURA Chief of Staff agent (role, memory, persona scaffolding, operating rhythm)." --force
gh label create "part-6-dina-foundation" -R "$REPO" -c "$PHASE_COLOR" -d "Part 6 — DINA product foundation (helpdesk, HR inbox, approval queue, audit view)." --force
gh label create "part-7-dina-workflows" -R "$REPO" -c "$PHASE_COLOR" -d "Part 7 — DINA workflow orchestration (the six HR Ops Starter workflows in n8n)." --force
gh label create "part-8-ai-layer" -R "$REPO" -c "$PHASE_COLOR" -d "Part 8 — AI model and prompt layer (routing, prompt library, citation rule)." --force
gh label create "part-9-testing-demo" -R "$REPO" -c "$PHASE_COLOR" -d "Part 9 — Testing, red-team, HITL, privacy tests, and the demo of the real foundation." --force
gh label create "part-10-paperclip-lab" -R "$REPO" -c "$PHASE_COLOR" -d "Part 10 — Paperclip lab scope, tests and adoption criteria." --force
gh label create "part-11-hermes-lab" -R "$REPO" -c "$PHASE_COLOR" -d "Part 11 — Hermes lab scope, tests and adoption criteria." --force
gh label create "part-12-gtm" -R "$REPO" -c "$PHASE_COLOR" -d "Part 12 — GTM execution setup (paid audit tracker, pipeline, Kael draft workflow)." --force
gh label create "part-13-persona-production" -R "$REPO" -c "$PHASE_COLOR" -d "Part 13 — NURA Persona Production. Deferred placeholder; not in use until Phase 1 build is stable and locked Step 8 conditions are met." --force

echo "Creating state labels..."
gh label create "needs-founder-approval" -R "$REPO" -c "$STATE_APPROVAL" -d "Task or output is waiting on a founder decision before it can move forward." --force
gh label create "blocked" -R "$REPO" -c "$STATE_BLOCKED" -d "Task cannot progress until a dependency, decision, or external input is resolved." --force
gh label create "security-review" -R "$REPO" -c "$STATE_SECURITY" -d "Task touches credentials, permissions, customer data, RLS, production or external actions and requires nura-security-approval-guardrail." --force
gh label create "source-truth-review" -R "$REPO" -c "$STATE_SOURCETRUTH" -d "Task output must pass nura-source-truth-guardian review before it is locked, approved or committed." --force

echo ""
echo "Done. 28 labels created on $REPO."
echo "Verify at: https://github.com/$REPO/labels"
