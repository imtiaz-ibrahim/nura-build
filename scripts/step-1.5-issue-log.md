# Step 1.5 — Issue Creation Log

This log captures every GitHub issue created on the `imtiaz-ibrahim/nura-build` repository as part of Step 1.5: loading the Build Manual into the GitHub Projects board.

**Source files:**
- `docs/NURA_DINA_Build_Manual.md` — authoritative execution guide.
- `docs/NURA_Solo_Build_Boundary_Map.md` — solo-build phase override of the Manual's per-step worker assignments.

**Totals:** 13 parent Part issues + 51 child Step sub-issues = **64 issues**.

**Worker label tally (children, after Boundary Map override):** founder 18 · claude 18 · claude-code 14 · technical-partner 1 (Step 2.5, the Tier 3 RLS gate, also carries `security-review`).

**State labels:** `needs-founder-approval` on Part 1 parent only, per Step 1.5 spec. State labels stay off everything else.

**Sub-issue linking:** Every child is linked to its parent via GitHub's native sub-issue feature.

**Project board:** All issues auto-flow onto `/projects/1` (Backlog) via the configured auto-add workflow.

---

## Part issues (parents)

| # | Title | Phase label | URL |
|---|---|---|---|
| 8 | Part 1 — Build Control System | `part-1-control` | https://github.com/imtiaz-ibrahim/nura-build/issues/8 |
| 15 | Part 2 — Supabase Foundation | `part-2-supabase` | https://github.com/imtiaz-ibrahim/nura-build/issues/15 |
| 23 | Part 3 — n8n Foundation | `part-3-n8n` | https://github.com/imtiaz-ibrahim/nura-build/issues/23 |
| 28 | Part 4 — NURA Command Centre App | `part-4-command-centre` | https://github.com/imtiaz-ibrahim/nura-build/issues/28 |
| 32 | Part 5 — NURA Chief of Staff Agent | `part-5-chief-of-staff` | https://github.com/imtiaz-ibrahim/nura-build/issues/32 |
| 40 | Part 6 — DINA Product Foundation | `part-6-dina-foundation` | https://github.com/imtiaz-ibrahim/nura-build/issues/40 |
| 46 | Part 7 — DINA Workflow Orchestration | `part-7-dina-workflows` | https://github.com/imtiaz-ibrahim/nura-build/issues/46 |
| 53 | Part 8 — AI Model and Prompt Layer | `part-8-ai-layer` | https://github.com/imtiaz-ibrahim/nura-build/issues/53 |
| 57 | Part 9 — Testing and Demo | `part-9-testing-demo` | https://github.com/imtiaz-ibrahim/nura-build/issues/57 |
| 62 | Part 10 — Paperclip Lab | `part-10-paperclip-lab` | https://github.com/imtiaz-ibrahim/nura-build/issues/62 |
| 65 | Part 11 — Hermes Lab | `part-11-hermes-lab` | https://github.com/imtiaz-ibrahim/nura-build/issues/65 |
| 68 | Part 12 — GTM Execution Setup | `part-12-gtm` | https://github.com/imtiaz-ibrahim/nura-build/issues/68 |
| 70 | Part 13 — NURA Persona Production (deferred) | `part-13-persona-production` | https://github.com/imtiaz-ibrahim/nura-build/issues/70 |

Part 1 parent (#8) additionally carries `needs-founder-approval` so it shows up immediately. Part 13 (#70) has no child Steps — deferred until Phase 1 build stability and locked Step 8 conditions are met.

---

## Step issues (children)

| # | Title | Parent | Worker label | URL |
|---|---|---|---|---|
| 9 | Step 1.1 — Create the NURA build repository | #8 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/9 |
| 10 | Step 1.2 — Set up the GitHub Projects board | #8 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/10 |
| 11 | Step 1.3 — Create task labels | #8 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/11 |
| 12 | Step 1.4 — Create issue templates | #8 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/12 |
| 13 | Step 1.5 — Load the build phases as issues | #8 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/13 |
| 14 | Step 1.6 — Install and commit the ten NURA portable skills | #8 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/14 |
| 16 | Step 2.1 — Create the Supabase project | #15 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/16 |
| 17 | Step 2.2 — Connect the Supabase MCP, read-only | #15 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/17 |
| 18 | Step 2.3 — Build the DINA product schema | #15 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/18 |
| 19 | Step 2.4 — Set up authentication | #15 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/19 |
| 20 | **Step 2.5 — Build row-level security for customer isolation (Tier 3 GATE)** | #15 | `technical-partner` + `security-review` | https://github.com/imtiaz-ibrahim/nura-build/issues/20 |
| 21 | Step 2.6 — Set up storage, audit, approval and module activation | #15 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/21 |
| 22 | Step 2.7 — Create the NURA command centre schema | #15 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/22 |
| 24 | Step 3.1 — Deploy the n8n workspace | #23 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/24 |
| 25 | Step 3.2 — Set up credentials and environment variables | #23 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/25 |
| 26 | Step 3.3 — Build the standard test workflow | #23 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/26 |
| 27 | Step 3.4 — Establish the webhook and error-handling pattern | #23 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/27 |
| 29 | Step 4.1 — Write the command centre product requirement | #28 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/29 |
| 30 | Step 4.2 — Build the command centre app | #28 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/30 |
| 31 | Step 4.3 — Connect the command centre to live build status | #28 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/31 |
| 33 | Step 5.1 — Define the Chief of Staff role, persona and memory | #32 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/33 |
| 34 | Step 5.2 — Build the Chief of Staff memory store | #32 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/34 |
| 35 | Step 5.3 — Configure and run the Chief of Staff | #32 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/35 |
| 36 | Step 5.4 — Define NURA's brand voice and persona guide | #32 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/36 |
| 37 | Step 5.5 — Define NURA's operating rhythm | #32 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/37 |
| 38 | Step 5.6 — Define the hub-and-spoke topology and pod-lead role scaffolding | #32 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/38 |
| 39 | Step 5.7 — Define NURA's KPI framework | #32 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/39 |
| 41 | Step 6.1 — Write the DINA product foundation requirement | #40 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/41 |
| 42 | Step 6.2 — Build the employee request interface | #40 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/42 |
| 43 | Step 6.3 — Build the HR inbox | #40 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/43 |
| 44 | Step 6.4 — Build the approval queue | #40 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/44 |
| 45 | Step 6.5 — Build the audit trail view | #40 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/45 |
| 47 | Step 7.1 — Build Workflow 1: Employee Letter Request | #46 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/47 |
| 48 | Step 7.2 — Build Workflow 2: Employee Record Lifecycle and Service Request | #46 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/48 |
| 49 | Step 7.3 — Build Workflow 3: Pre-Joining and Employment Readiness | #46 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/49 |
| 50 | Step 7.4 — Build Workflow 4: First-Day and Onboarding Programme | #46 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/50 |
| 51 | Step 7.5 — Build Workflow 5: New Joiner Workplace Access Provisioning | #46 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/51 |
| 52 | Step 7.6 — Build Workflow 6: Employee Resignation and Offboarding | #46 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/52 |
| 54 | Step 8.1 — Define model routing | #53 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/54 |
| 55 | Step 8.2 — Build the prompt template library | #53 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/55 |
| 56 | Step 8.3 — Wire the prompt layer into the workflows | #53 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/56 |
| 58 | Step 9.1 — Build the test case suite | #57 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/58 |
| 59 | Step 9.2 — Create demo records | #57 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/59 |
| 60 | Step 9.3 — Run red-team, HITL and privacy tests | #57 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/60 |
| 61 | Step 9.4 — Build the ten-minute demo flow | #57 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/61 |
| 63 | Step 10.1 — Define the Paperclip lab scope and entry condition | #62 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/63 |
| 64 | Step 10.2 — Define the Paperclip lab test company and adoption criteria | #62 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/64 |
| 66 | Step 11.1 — Define the Hermes lab scope and Chief of Staff candidacy | #65 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/66 |
| 67 | Step 11.2 — Define the Hermes memory, tool, safety tests and adoption criteria | #65 | `claude` | https://github.com/imtiaz-ibrahim/nura-build/issues/67 |
| 69 | Step 12.1 — Build the paid audit and pipeline tracker | #68 | `claude-code` | https://github.com/imtiaz-ibrahim/nura-build/issues/69 |
| 71 | Step 12.2 — Build the outreach approval queue and Kael draft workflow | #68 | `founder` | https://github.com/imtiaz-ibrahim/nura-build/issues/71 |

Note: Issue #70 is the Part 13 deferred parent (between #69 Step 12.1 and #71 Step 12.2). The numbering gap is because Step 12.2's initial create call hit a transient network error; the retry consumed the next available number after Part 13's create.

---

## Boundary Map application — summary of overrides

The NURA / DINA Build Manual marks several Steps as `technical-partner` work. The Solo Build Boundary Map supersedes those assignments for the current solo-build phase. The actual overrides applied:

| Step | Manual says | Boundary Map override | Reason |
|---|---|---|---|
| 1.1 | Founder + technical partner | **`founder`** | Part 1 entirely solo per Map. |
| 1.4, 1.6 | Mentions partner help | **`claude-code` / `founder`** | Part 1 entirely solo; founder pastes AI worker output directly. |
| 2.1 | Technical partner | **`founder`** | Dev Supabase project is solo; production setup deferred to Tier 3 gate. |
| 2.2 | Technical partner | **`founder`** | Map: "you can do this yourself." |
| 2.3 | Claude Code + TP review/apply | **`claude-code`** | Founder applies to dev project solo; production apply deferred to Tier 3. |
| 2.4 | Technical partner | **`founder`** | Map: "buildable solo on development." |
| 2.5 | Claude Code + TP verify | **`technical-partner` + `security-review`** | **Tier 3 GATE — the only step that stays TP.** Engineer must verify RLS isolation. |
| 2.6, 2.7 | Claude Code + TP apply | **`claude-code`** | Founder applies on dev solo. |
| 3.1 | Technical partner | **`founder`** | Dev n8n is solo; production queue-mode deploy deferred to Tier 3. |
| 3.2 | Technical partner | **`founder`** | Dev credentials on synthetic data is solo; production credentials handling deferred to Tier 3. |
| 5.2 | Claude Code + TP apply | **`claude-code`** | Founder applies dev SQL solo. |
| 5.3 | Founder + TP wire memory | **`founder`** | Founder wires the dev Supabase connection. |
| 6.2–6.5 | Claude Code + TP review/deploy | **`claude-code`** | Build solo on synthetic data; production deploy deferred to Tier 3. |
| 7.1–7.6 | Founder + TP support | **`founder`** | Founder builds in n8n canvas solo; Claude generates the build guide as context input. |
| 8.1 | Claude + TP confirm | **`claude`** | Founder does the n8n config check solo. |
| 8.3 | Founder + TP | **`founder`** | n8n canvas update is founder's work. |
| 9.2 | Claude + TP load data | **`claude`** | Founder loads demo data on dev solo. |
| 9.3 | Founder + TP privacy tests | **`founder`** | Primary executor is founder running tests. |
| 10.1–11.2 | Founder + Claude + TP run lab | **`claude`** | Labs are deferred in Phase 1. Substantive deliverable is Claude's lab definition. |
| 12.1 | Claude Code + TP review | **`claude-code`** | Internal GTM tracker, solo. |
| 12.2 | Founder + TP support | **`founder`** | Founder builds the workflow in n8n. |

**Steps 2.1, 3.1, 3.2** each carry an explicit body note that the production component of the work is deferred to the Tier 3 engineer-review gate before customer one's real HR data goes live. The Step itself is operable solo for the development/synthetic phase.

---

## Execution notes

- **Two transient network errors** during the bulk run, both retried successfully:
  - Sub-issue link for Step 7.4 → Part 7 (#46) — retried, linked.
  - Initial create for Step 12.2 — retried; the new issue is #71 (between Step 12.1 at #69 and Part 13 parent at #70).
- **Auto-add to project** verified: all 64 issues flowed onto `/projects/1` → Backlog automatically via the configured workflow.
- **Authored by:** `imtiaz-ibrahim` (the account the GitHub MCP server is connected as).
