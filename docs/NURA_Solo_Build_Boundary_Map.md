# NURA-AI Build — Solo vs. Engineer-Review Boundary Map

**Document role:** Working execution reference for the NURA / DINA build. Not a
locked source file. It sits alongside the NURA / DINA Build Manual and is
updated as the build situation changes.

**Precedence:** This map governs founder / engineer role assignment for the
build. Where it conflicts with the per-step "Build worker to use: Technical
partner" assignments in the NURA / DINA Build Manual, **this map supersedes
those assignments** — the Build Manual's per-step worker lines assume an
embedded technical partner is present, and that assumption does not currently
hold. This map does not change anything else in the Build Manual: the steps,
prompts, skills, MCP integrations, governance gates, test requirements and
build sequence all stand as written. The map changes only *who does which
step*, nothing else.

**Purpose:** You are building without a technical partner until you have 3–4
customers. This map tells you exactly which Build Manual steps you can run
completely solo with AI workers, and the one boundary where a short paid
engineer review is required before real customer HR data goes live.

**The core principle:** You can build the entire product solo on synthetic
data. The engineer is needed at one gate only — the moment you cross from
"tested on fake data" to "holding a real customer's real HR data in
production." Everything before that gate is yours.

---

## The boundary in one line

> Build everything, test everything, demo everything — solo, on synthetic
> data. Before customer one's real employee data enters the system, pay an
> engineer for a few days to review the production setup and the security
> rules. Not before. Not for anything else.

---

## Tier 1 — Run completely solo. No engineer. No risk.

These steps use your own data or synthetic data only. No real customer HR
records are involved, so there is no breach risk. Build them yourself with
Claude, Claude Code, Codex and ChatGPT.

### Part 1 — Build Control System (entirely solo)
- Step 1.1 — Create the `nura-build` GitHub repository
- Step 1.2 — Set up the GitHub Projects board
- Step 1.3 — Create task labels
- Step 1.4 — Create issue templates
- Step 1.5 — Load the build phases as issues
- Step 1.6 — Install and commit the ten NURA portable skills

  *Note:* The manual lists "technical partner" as a helper on some Part 1 steps
  (repo access, writing a template file). None of this is security-critical.
  You can do all of Part 1 yourself. Where the manual says "partner adds the
  file," you paste the AI worker's output in yourself.

### Part 4 — NURA Command Centre App (entirely solo)
- Step 4.1 — Write the command centre product requirement
- Step 4.2 — Build the command centre app
- Step 4.3 — Connect the command centre to live build status

  *Why solo is fine:* The Command Centre is internal. It holds your build
  data, not customer HR data. Build it, deploy it, use it. No engineer needed.

### Part 5 — NURA Chief of Staff Agent (solo)
- Step 5.1 — Define the Chief of Staff role and memory
- Step 5.2 — Build the Chief of Staff memory store (`nura` schema — internal)
- Step 5.3 — Configure and run the Chief of Staff

### Part 8 — AI Model and Prompt Layer (solo, on synthetic data)
- Step 8.1 — Define model routing
- Step 8.2 — Build the prompt template library
- Step 8.3 — Wire the prompt layer into the workflows

### Part 9 — Testing and Demo (solo, on synthetic data)
- Step 9.1 — Build the test case suite
- Step 9.2 — Create demo records (synthetic data — you load it yourself)
- Step 9.3 — Run red-team, HITL and privacy tests
- Step 9.4 — Build the ten-minute demo flow

### Part 10 & 11 — Paperclip Lab, Hermes Lab (solo — labs only)
- Steps 10.1, 10.2, 11.1, 11.2 — all lab definition work, no customer data.

### Part 12 — GTM Execution Setup (entirely solo)
- Step 12.1 — Build the paid audit and pipeline tracker (`nura` schema)
- Step 12.2 — Build the outreach approval queue and Kael draft workflow

---

## Tier 2 — Build solo on synthetic data, but the production deploy needs review

These steps you can fully **build and test yourself on synthetic data**. The
AI workers generate the schema, the policies, the workflows, the interface.
What you cannot self-clear is **deploying them to production and putting real
customer HR data behind them.** That deploy is the engineer-review gate.

### Part 2 — Supabase Foundation
- Step 2.1 — Create the Supabase project — *engineer sets up production;
  for solo build, you can create a development project yourself.*
- Step 2.2 — Connect the Supabase MCP read-only — *you can do this yourself.*
- Step 2.3 — Build the DINA product schema — *Claude Code generates the SQL;
  you apply it to a development project yourself.*
- Step 2.4 — Set up authentication — *buildable solo on development.*
- **Step 2.5 — Row-level security for customer isolation — THIS IS THE GATE.
  See Tier 3.**
- Step 2.6 — Storage, audit, approval, module activation — *buildable solo on
  development.*
- Step 2.7 — NURA command centre schema — *internal, fully solo.*

### Part 3 — n8n Foundation
- Step 3.1 — Deploy the n8n workspace — *the manual marks this for the partner
  because production n8n in queue mode is not a non-coder task. For solo
  build, you can run n8n in a simpler local or single-instance mode for
  building and testing. The production-grade deploy is part of the
  engineer-review gate.*
- Step 3.2 — Credentials and environment variables — *part of the production
  deploy; for solo build/testing, use development credentials and synthetic
  data only.*
- Step 3.3 — Build the standard test workflow — *founder-operable, solo.*
- Step 3.4 — Webhook and error-handling pattern — *founder-operable, solo.*

### Part 6 — DINA Product Foundation (build solo on synthetic data)
- Step 6.1 — Write the DINA product foundation requirement — *solo.*
- Step 6.2 — Build the employee request interface — *build and test solo.*
- Step 6.3 — Build the HR inbox — *build and test solo.*
- Step 6.4 — Build the approval queue — *build and test solo.*
- Step 6.5 — Build the audit trail view — *build and test solo.*

### Part 7 — DINA Workflow Orchestration (build solo on synthetic data)
- Steps 7.1 to 7.6 — Build all six HR Ops Starter workflows in the n8n canvas.
  The manual already marks these "founder, to build in the n8n canvas." Claude
  generates the node-by-node build guide. You build and test on synthetic
  data, solo.

---

## Tier 3 — The one gate that requires a paid engineer review

There is exactly one place you cannot self-clear. It is not a hire. It is a
short, scoped, paid review — a few days of one qualified engineer's time —
and it happens once, late, before customer one goes live.

### What the engineer must review, before any real customer HR data is loaded:

1. **Step 2.5 — Row-level security (RLS) for customer isolation.**
   These are the rules that guarantee Customer A can never see Customer B's
   employee data, and that the L1 / L2 / L3 knowledge layers stay separated.
   Claude Code can *draft* these policies. The engineer must *verify* they
   actually hold — by signing in as Customer A and confirming Customer B's
   rows return zero, and that an audit row cannot be deleted. The Build Manual
   marks Step 2.5 as a high-severity checkpoint and says the build stops here
   until the isolation test passes. That verification is the engineer's job.

2. **Step 3.1 — The production n8n deployment.**
   Production n8n in queue mode, not exposed to the public internet, behind
   proper access control. The engineer stands this up and confirms it is
   secure.

3. **Step 3.2 — Production credentials and secrets handling.**
   Confirming Supabase keys and model API keys are stored as secure
   credentials, never in workflows or Git.

4. **The production Supabase project (Step 2.1 production setup) and the
   region / data-residency choice** for UAE and GCC data.

### Why this gate cannot be self-cleared

For everything else, if an AI worker gets it slightly wrong, you get a bug —
annoying, fixable, yours to absorb. For RLS, if it is slightly wrong, the
failure is a customer's employee records exposed to another customer. An AI
worker can produce RLS policies that *look* correct. Confirming they *are*
correct — airtight, tested, holding under the isolation test — needs a
qualified human who can read and verify them. That is the review you are
paying for. It protects the customer, and it protects you.

This is a scoped contract engagement, not a partner hire. Brief an engineer:
"Review and verify these RLS policies and this production setup against this
isolation test; confirm or correct." Days, not equity.

---

## Recommended sequence

1. **Now → build solo:** Part 1, then Part 4, then Part 5. All internal, all
   yours. This gives you the Command Centre to run the rest of the build from.

2. **Then build solo on synthetic data:** Parts 2 and 3 on a development setup,
   then Parts 6, 7, 8. Build the full DINA product. Use only synthetic
   employee data — never a real record.

3. **Then test solo:** Part 9. Run the test suite, the red-team and privacy
   tests, build the demo. Demo DINA to prospects on synthetic data.

4. **Then sell solo:** Part 12 plus File 07. Run paid audits. Win commitments.

5. **The gate — when a real customer is about to onboard, before their data
   goes in:** pay an engineer for the Tier 3 review. Production n8n, production
   Supabase, RLS verified against the isolation test. Then, and only then,
   customer one's real data goes live.

You run roughly 90% of this build entirely alone. The engineer touches one
gate, once, late, for a few days. That respects your "no partner until 3–4
customers" plan — a scoped paid review is not a partner hire — without putting
real employee data behind a security wall no qualified person has checked.

---

## One line not to cross

Do not let "I will have an AI worker verify the RLS too" become the plan. An
AI worker drafting RLS is fine and expected. An AI worker being the *only*
thing that confirms it is airtight before real HR data goes in is the single
corner where confident-looking output and correct output can differ, and the
cost of the gap lands on a customer. Build all of it solo. Test all of it
solo. Sell all of it solo. Just have one qualified human verify the isolation
wall before the first real employee record goes behind it.
