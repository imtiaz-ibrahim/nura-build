# NURA-AI — DINA Build Manual (Real Product Foundation Edition)

**Project:** NURA-AI
**Primary product:** DINA, the HR Agent
**Document role:** Step-by-step build manual for a non-coder founder using AI build workers, on the approved hybrid architecture
**Architecture basis:** File 06 - NURA-AI Phase 1 Stack Decision, File 04 - DINA + NURA Build Workbook, and this Build Manual.
**Status:** Working build document. The locked source files 00–07 remain unchanged.
**Operating principle:** Build once by function. Sell by sector. Customise by customer.
**Governance principle:** AI owns execution. Humans own decisions.

---

## How To Read This Manual

This manual is the active execution guide for the NURA / DINA build. It builds on the locked Phase 1 stack defined in File 06 — Phase 1 Stack Decision, and on the canonical build structure in File 04 — Build Workbook. The strategy, the DINA knowledge, the workflow library, the modules and the governance rules in Files 01, 02, 03 and the HR knowledge base are the source of truth. This manual is how that source truth is executed, step by step.

The manual is written for a founder who does not code. Every step names the AI worker that does the actual work, the skill that worker should follow, the integration it needs, the exact context to give it, the exact prompt to paste, and what the founder must check before moving on. A founder can run this manual with AI build workers and one embedded technical partner.

This manual does not build anything by itself. It is the instruction. The build happens when the founder works through it.

### One source-truth flag before you start

The locked files (File 00 and File 06) name **GitHub Projects** as the build tracker, consistent with this manual. The NURA build — Supabase schema, n8n workflow definitions, skills, configuration — lives in Git, and the AI coding workers read and write that build directly. GitHub Projects is the task tracker that sits on top of the same Git repository, so build tasks, issues, pull requests and code changes stay in one execution system. The locked files and this manual agree on the build tracker.

---

# Part 0 — Non-Coder Founder Orientation

## 0.1 What you are building

You are building two things at once, and the manual keeps them strictly separate.

The **first thing** is the real DINA product foundation. DINA is the first NURA product. It is not a chatbot. It is an HR workflow execution agent with a helpdesk interface. The foundation you build here is the actual database, the actual workflow engine and the actual interface that real customers will use. It is not a demo that gets thrown away. You build the first version of the real product, then you demo that real product.

The **second thing** is the NURA internal operating system — your command centre. This is how you, the founder, run the company: track the build, see what to do next, see which AI worker is doing it, approve work, log decisions and log risks. It is internal. Customers never see it.

These two things share one principle: build the real thing first, in small pieces, and demo the real thing. No fake demo.

## 0.2 The architecture in plain language

Think of the system as four layers. Each layer has one job.

The **data layer** is Supabase. Supabase is a real, managed database with built-in login, security and file storage. It is where DINA's customer data lives, and it is where your command centre data lives. Two separate areas, one platform to learn. Supabase is the foundation. Everything sits on it.

The **workflow layer** is n8n. n8n is where work actually runs. When an employee asks for a salary letter, an n8n workflow wakes up, checks the request, asks the AI to draft the letter, stops and waits for a human to approve it, then records what happened. n8n is the engine room.

The **agent layer** is your AI workers plus one coordinator. The coordinator is the NURA Chief of Staff — a persistent AI assistant that remembers everything about your build and helps you run it. The workers are Claude, Claude Code, Codex and ChatGPT. The Chief of Staff thinks and tracks. The workers build and draft.

The **control layer** is GitHub Projects plus, much later, Paperclip. GitHub Projects is your build task tracker right now. Paperclip is a system for coordinating many AI agents at once — you only need it later, when you genuinely have many agents running. For now it stays in a lab.

## 0.3 Who does the work

You will hear these names throughout the manual. Here is who they are.

The **Founder** is you. You make decisions, approve work, provide context and run prompts. You do not write code.

A **technical partner** is one embedded senior AI engineer. Some steps are genuinely not non-coder tasks — creating the production n8n server, writing database security rules. Those steps are marked for the technical partner.

Active Solo Build Boundary rule: per the NURA-AI Solo Build Boundary Map, the founder runs the build solo with AI workers until the defined Tier 3 gate. Technical partner steps in this manual are reassigned according to the Boundary Map's Tier 1 / Tier 2 / Tier 3 classification. A scoped paid engineer review is required at the Tier 3 customer-data / production gate, including Step 2.5 row-level security, production Supabase project and region/data-residency choice, production n8n deployment, production credentials and secrets, and production deploy readiness, before customer one's real HR data is loaded. No embedded or retained technical partner hire is required until 3–4 paying customers exist.

**Claude** is a reasoning and drafting worker. It plans, writes, reviews and explains. You use it through the chat interface for thinking work.

**Claude Code** is an agentic engineering worker. It builds — it writes the database schema, the workflow logic and the configuration, working directly in your Git repository.

**Codex** is a second agentic engineering worker. It is used the same way as Claude Code, for engineering and code generation, and is useful as a second pair of hands or a cross-check.

**ChatGPT** is a general reasoning and drafting worker, used like Claude for thinking and writing tasks where you want a second view.

**n8n** is named as a "worker" in some steps because the act of building inside n8n — placing nodes, wiring a workflow — is done in the n8n interface, by the founder with partner support.

**Supabase**, **Paperclip lab** and **Hermes lab** appear as "workers" in the same sense: the step is done inside that tool.

## 0.4 The portable NURA skills

A skill is a written method — a document that tells an AI worker how to do a NURA task properly, every time. Skills are portable: the same skill works in Claude, Claude Code and Codex. This manual uses ten NURA skills. All ten are supplied as finished markdown files in the project package under `claude-skills/`, one file per skill, named after the skill. Part 1, Step 1.6 installs and commits them. The ten skills are:

1. `nura-source-truth-guardian` — checks any output against locked NURA source truth.
2. `nura-architecture-reviewer` — checks any build decision against the approved architecture.
3. `nura-security-approval-guardrail` — checks integrations, permissions and data access for least-privilege and HITL.
4. `nura-ai-execution-task-writer` — turns a build need into a clear, scoped task for an AI worker.
5. `nura-product-requirement-writer` — writes product requirements for DINA features.
6. `nura-mcp-integration-planner` — plans which MCP or integration to use, with scope and risk controls.
7. `nura-agent-builder` — the method for building a NURA agent.
8. `nura-workflow-builder` — the method for building a DINA workflow in n8n.
9. `dina-hr-agent-product-builder` — the method for building DINA product features end to end.
10. `supabase-n8n-product-foundation-builder` — the method for building on the Supabase plus n8n foundation.

All ten skills already exist as finished files in the project package. Part 1, Step 1.6 installs them in Claude's skill settings and commits them to the build repository.

## 0.5 The integrations you will use

An integration, or MCP server, is how an AI worker reaches a real system. File 06 - Phase 1 Stack Decision is firm: install few, not many. Two or three active at a time. The shortlist for this whole manual:

1. **GitHub MCP** — lets AI workers read and write your build repository, issues and pull requests.
2. **Supabase MCP** — lets AI workers inspect the database schema. Used read-only during the build.
3. **n8n API or n8n MCP** — used if available, to let workers inspect or manage workflows; otherwise n8n is operated by hand.
4. **Filesystem MCP, restricted** — lets AI workers read and write local build files, scoped to the build folder only.
5. **Browser / Playwright MCP** — used only for testing the DINA interface. Not always on.
6. **Google Drive MCP** — used only to let workers read your source files (Files 00–07). Never connected to customer product data.
7. **Gmail / Calendar MCP** — used only later, for founder-approved GTM outreach. Not part of the product.

## 0.6 The rules that never bend

These rules hold across every step.

DINA is not a chatbot. It is an HR workflow execution agent with a helpdesk interface. If any worker output describes DINA as a chatbot, reject it.

AI owns execution. Humans own decisions. Every workflow has a human approval gate where a decision matters.

The DINA product foundation is real infrastructure. Supabase and n8n. Never a notes tool, a file-storage tool, a lightweight no-code database or a consumer sync tool as the product database.

Internal command centre tooling is separate from customer-facing DINA infrastructure. Do not mix them.

Customer data is isolated per customer. One customer's data is never visible to another, and customer-specific knowledge never enters NURA's standard knowledge.

No Step 8. No investor-readiness content. No customer or traction claims without real proof. The job now is to build and to sell paid audits — not to raise.

## 0.7 How to use a build step

Every step from Part 1 onward uses the same template. Read the whole step before starting. Gather the source context it names. Open the named worker. Activate the named skill. Paste the prompt. Check the expected output. Run the test. Do the founder approval check. Only then go to the next step. If a step fails, the step itself tells you what to do.

---

# Part 1 — Build Control System

This part sets up the place where the whole build is tracked: a GitHub repository, a GitHub Projects board, task labels, issue templates and the build phases. It also installs and commits the ten NURA portable skills. When Part 1 is done, you have a build control system and a worker method library.

## Build phases overview

Your GitHub Projects board will track twelve build phases, one per Part of this manual. Each step in this manual becomes an issue on that board.

---

### Step 1.1 — Create the NURA build repository

**Goal:**
Create the single Git repository that holds the entire NURA build — schema, workflow definitions, skills, configuration and documentation.

**Build worker to use:**
Founder, with technical partner.

**Skill to use:**
None yet. Skills are created in Step 1.6. Follow this step directly.

**MCP or integration needed:**
None. This is done in the GitHub web interface.

**Source context to provide:**
This step. The project name "NURA-AI" and product name "DINA".

**Prompt to paste:**
No AI prompt. Founder action: create a free GitHub account if you do not have one. Create a new private repository named `nura-build`. Add a one-line description: "NURA-AI build — DINA HR Agent product foundation and internal operating system." Initialise it with a README file. Founder keeps the repository private. Do not invite a technical partner at Step 1.1. External technical access is only added later for a scoped paid engineer review at the Tier 3 customer-data / production gate, per the NURA-AI Solo Build Boundary Map.
**Expected output:**
A private GitHub repository named `nura-build` with a README file, accessible to the founder and the technical partner.

**Founder approval checkpoint:**
Confirm the repository is private. Confirm only you and the technical partner have access. A private repository is required because build configuration will reference real systems.

**Test to run:**
Open the repository in a browser. Confirm you can see the README.

**Success looks like:**
You see a private repository called `nura-build` with a README.

**If it fails:**
If you cannot create a private repository, check that you are signed in to GitHub. Private repositories are free on personal accounts. If access for the partner fails, re-send the invite from the repository settings.

**Next step:**
Step 1.2.

---

### Step 1.2 — Set up the GitHub Projects board

**Goal:**
Create the GitHub Projects board that tracks every build phase and every build step as an issue.

**Build worker to use:**
Founder.

**Skill to use:**
None yet.

**MCP or integration needed:**
None. Done in the GitHub web interface.

**Source context to provide:**
This step. The twelve Part names of this manual (Part 0 through Part 12).

**Prompt to paste:**
No AI prompt. Founder action: in the `nura-build` repository, open the Projects tab and create a new project named "NURA Build". Choose the board layout. Create these columns: `Backlog`, `Ready`, `In Progress`, `Needs Founder Approval`, `Blocked`, `Done`. Save.

**Expected output:**
A GitHub Project named "NURA Build" with six columns.

**Founder approval checkpoint:**
Confirm all six columns exist and are in a sensible left-to-right order. The `Needs Founder Approval` column is essential — it is where work waits for you.

**Test to run:**
Create one test card in `Backlog` named "Test card". Move it to `Done`. Delete it.

**Success looks like:**
You can create cards and move them between columns.

**If it fails:**
If the Projects tab is missing, confirm Projects is enabled in repository settings. If columns cannot be added, confirm you selected the board layout, not the table layout.

**Next step:**
Step 1.3.

---

### Step 1.3 — Create task labels

**Goal:**
Create the labels that classify every build issue, so you can see at a glance which worker owns a task and which phase it belongs to.

**Build worker to use:**
Claude, to generate the label list. Founder, to enter the labels.

**Skill to use:**
None yet.

**MCP or integration needed:**
None for entry. Optional GitHub MCP later for bulk creation; not needed now.

**Source context to provide:**
This step. The worker names from Part 0.3. The twelve Part names.

**Prompt to paste:**
```
You are helping set up a GitHub Projects label scheme for the NURA-AI build.

Produce a clean list of GitHub labels in three groups. Give each label a name and a short description. Do not invent extra categories.

Group 1 — Worker labels, one per build worker:
founder, technical-partner, claude, claude-code, codex, chatgpt, n8n, supabase, paperclip-lab, hermes-lab.

Group 2 — Phase labels, one per manual Part:
part-1-control, part-2-supabase, part-3-n8n, part-4-command-centre, part-5-chief-of-staff, part-6-dina-foundation, part-7-dina-workflows, part-8-ai-layer, part-9-testing-demo, part-10-paperclip-lab, part-11-hermes-lab, part-12-gtm, part-13-persona-production (deferred — created as a placeholder label so future Part 13 tasks can be tagged; not in use until Phase 1 build is stable and locked Step 8 conditions are met).

Group 3 — State labels:
needs-founder-approval, blocked, security-review, source-truth-review.

Output as a simple table with columns: Label name, Group, Description. Nothing else.
```

**Expected output:**
A table of roughly 26 labels in three groups.

**Founder approval checkpoint:**
Check that every build worker from Part 0.3 has a label and every Part has a label. Confirm the four state labels are present.

**Test to run:**
In the repository Labels page, create the labels from the table. Open one build issue later and confirm labels can be applied.

**Success looks like:**
All labels exist and can be applied to issues.

**If it fails:**
If the list is incomplete, paste the worker and Part names again and ask Claude to regenerate. Do not add categories beyond the three groups.

**Next step:**
Step 1.4.

---

### Step 1.4 — Create issue templates

**Goal:**
Create a GitHub issue template so every build task is captured in the same shape as this manual's step template.

**Build worker to use:**
Claude Code, to write the template file into the repository. Founder, to approve.

**Skill to use:**
None yet.

**MCP or integration needed:**
GitHub MCP, so Claude Code can write the template file into `nura-build`. If GitHub MCP is not yet set up, the technical partner can add the file by hand from Claude Code's output.

**Source context to provide:**
This step. The eleven-field step template from this manual's introduction, listed in the prompt below.

**Prompt to paste:**
```
You are creating a GitHub issue template for the NURA-AI build repository.

Create a file at .github/ISSUE_TEMPLATE/build-step.md

The template must reproduce the NURA build step format. It must include these fields as markdown headings with a blank line under each for the author to fill in:

- Goal
- Build worker to use
- Skill to use
- MCP or integration needed
- Source context to provide
- Prompt to paste
- Expected output
- Founder approval checkpoint
- Test to run
- Success looks like
- If it fails
- Next step

At the top, include YAML front matter that sets the template name to "NURA Build Step" and the default label to the relevant phase (leave a placeholder the author edits).

Output only the file content. Do not change anything else in the repository.
```

**Expected output:**
One file, `.github/ISSUE_TEMPLATE/build-step.md`, with all twelve fields.

**Founder approval checkpoint:**
Open a new issue in the repository and confirm the "NURA Build Step" template appears and contains every field. The template fields must match this manual's step template so build tasks and the manual stay aligned.

**Test to run:**
Create one issue using the template. Confirm all fields render. Close the issue.

**Success looks like:**
New issues offer the "NURA Build Step" template with all fields.

**If it fails:**
If the template does not appear, confirm the file path is exactly `.github/ISSUE_TEMPLATE/build-step.md`. If a field is missing, ask Claude Code to correct only that file.

**Next step:**
Step 1.5.

---

### Step 1.5 — Load the build phases as issues

**Goal:**
Turn every step in this manual into an issue on the NURA Build board, so the whole build is visible and trackable.

**Build worker to use:**
Claude, to generate the issue list. Founder, to create the issues.

**Skill to use:**
`nura-ai-execution-task-writer` once it exists. For this first pass, before the skill is created, follow the prompt directly. After Step 1.6, you may re-run with the skill active.

**MCP or integration needed:**
GitHub MCP, optional, to let a worker create issues in bulk. Manual creation is acceptable for the first pass.

**Source context to provide:**
This step. The full list of step numbers and step names from this manual, Parts 1 through 12.

**Prompt to paste:**
```
You are converting a build manual into GitHub issues for the NURA-AI build.

I will give you a list of build steps, each as "Step X.X — Step name".

For each step, produce one GitHub issue with:
- Title: "Step X.X — Step name"
- Phase label: the matching part-N label
- A one-line summary of the goal, taken only from the step name. Do not invent detail.

Output as a table: Title, Phase label, One-line summary.

Here is the step list:
[paste the full Step X.X — name list from Parts 1 to 12 of this manual. Do not include Part 13; it is deferred and has no current step list.]
```

**Expected output:**
A table with one row per build step, ready to enter as issues.

**Founder approval checkpoint:**
Check the count of rows matches the count of steps in this manual. Spot-check three rows for the correct phase label.

**Test to run:**
Create the Part 1 issues first. Confirm they appear on the board in `Backlog` with the correct labels.

**Success looks like:**
Every manual step exists as an issue on the NURA Build board.

**If it fails:**
If issue count is wrong, re-paste the step list and regenerate. Do not let the worker add steps that are not in the manual.

**Next step:**
Step 1.6.

---

### Step 1.6 — Install and commit the ten NURA portable skills

**Goal:**
Install and commit the ten NURA portable skills as markdown files stored in the repository, so AI workers follow consistent NURA methods.

**Build worker to use:**
Founder, to install the skills in Claude's skill settings. Claude Code, to commit the skill files to the repository.

**Skill to use:**
`nura-source-truth-guardian` — use it to review each skill for source-truth alignment before committing.

**MCP or integration needed:**
GitHub MCP, so the skill files are written into `nura-build` under a `skills/` folder. Filesystem MCP, restricted, as an alternative if the founder works locally.

**Source context to provide:**
The ten finished NURA skills, supplied in the project package under `claude-skills/` as flat markdown files (one per skill, named after the skill). The relevant locked files for each skill — for example, File 02 and File 03 for the workflow and product skills, File 06 - Phase 1 Stack Decision for the architecture and MCP skills.

**What to do:**
The ten NURA skills already exist as finished markdown files in the project package, one file per skill. This step installs them and commits them to the build repository — it does not write them from scratch.

1. Install all ten skills from `claude-skills/` into Claude's skill settings (claude.ai/customize/skills → Create skill). Each `.md` file uploads as a single skill; its YAML frontmatter tells Claude when to invoke it.
2. Commit the same ten skill files into `nura-build/skills/` so Claude Code and Codex use the same methods.
3. Run the `nura-source-truth-guardian` review over each skill to confirm source-truth alignment before the build relies on it.

**The ten NURA skills:**
`nura-source-truth-guardian`, `nura-architecture-reviewer`, `nura-security-approval-guardrail`, `nura-ai-execution-task-writer`, `nura-product-requirement-writer`, `nura-mcp-integration-planner`, `nura-agent-builder`, `nura-workflow-builder`, `dina-hr-agent-product-builder`, `supabase-n8n-product-foundation-builder`.

**Expected output:**
Ten skill files installed in Claude's skill settings and committed to the repository under `skills/`.

**Founder approval checkpoint:**
For each skill, run the `nura-source-truth-guardian` review. The skill must not invent strategy, must not weaken governance, and must not contradict the approved architecture. Only rely on a skill after it passes that review. This is the most important checkpoint in Part 1 — these skills shape every later step.

**Test to run:**
Load one skill, for example `nura-architecture-reviewer`, into a fresh Claude session and ask it to review a deliberately wrong statement: "We will use a lightweight no-code spreadsheet tool as the DINA product database." The skill should reject it.

**Success looks like:**
Ten skill files committed to `nura-build/skills/` and installed in Claude's skill settings, each passing source-truth review, each catching an obvious error in a test.

**If it fails:**
If a skill is vague, give Claude a sharper purpose line and the specific locked sections. If a skill drifts into new strategy, reject it and regenerate with a tighter instruction to enforce only existing source truth.

**Next step:**
Part 2, Step 2.1.

---

# Part 2 — Supabase Foundation

This part creates the Supabase project and builds the real DINA product database: the schema, authentication, row-level security for customer isolation, storage, the audit table, the approval table and the module activation table. This is the foundation. It is production-grade from the first build, and it is never thrown away.

The DINA schema is the twenty-table model defined in File 04 — Build Workbook, Section 9. This part builds that model in Supabase Postgres. The table contents do not change; this part puts them into a real database with security and audit.

---

### Step 2.1 — Create the Supabase project

**Goal:**
Create the Supabase project that will hold both the DINA product database and, in a separate schema, the NURA command centre database.

**Build worker to use:**
Technical partner. Creating and configuring the project is not a non-coder task.

**Skill to use:**
`supabase-n8n-product-foundation-builder`.

**MCP or integration needed:**
None for creation. The Supabase MCP is added in Step 2.2.

**Source context to provide:**
This step. The File 06 - Phase 1 Stack Decision, on the DINA product foundation. The instruction that one Supabase project will hold two separate schemas: `dina` for product data and `nura` for command centre data.

**Prompt to paste:**
No AI prompt. Technical partner action: create a Supabase account and a new project named `nura-ai`. Choose a region appropriate for UAE and GCC data — a region in or near the Middle East where available, otherwise the closest compliant region. Record the project URL and keys in a secure place, not in the Git repository. Confirm two schemas will be used: `dina` and `nura`.

**Expected output:**
A Supabase project named `nura-ai`, with the region recorded and credentials stored securely.

**Founder approval checkpoint:**
Confirm with the partner that the region choice considered UAE and GCC data residency. Confirm credentials are stored securely and are not in Git. Confirm the plan to keep `dina` and `nura` as separate schemas.

**Test to run:**
The partner opens the Supabase project dashboard and confirms it loads.

**Success looks like:**
A working Supabase project the partner can open.

**If it fails:**
If region options are unclear, the partner picks the closest compliant region and notes it as a decision in the command centre decision log for later review.

**Next step:**
Step 2.2.

---

### Step 2.2 — Connect the Supabase MCP, read-only

**Goal:**
Connect the Supabase MCP so AI workers can inspect the schema during the build, with read-only access only.

**Build worker to use:**
Technical partner.

**Skill to use:**
`nura-mcp-integration-planner` and `nura-security-approval-guardrail`.

**MCP or integration needed:**
Supabase MCP.

**Source context to provide:**
This step. File 06 - Phase 1 Stack Decision on the MCP shortlist and MCP security. The rule: the Supabase MCP is read-only during the build and uses a narrowly-scoped role, never the service key.

**Prompt to paste:**
```
Plan the Supabase MCP connection for the NURA build, applying the nura-mcp-integration-planner and nura-security-approval-guardrail skills.

Constraints:
- Access must be read-only. Workers inspect schema; they do not write data through this MCP.
- Use a narrowly-scoped database role, never the service key or any god-mode credential.
- Personal scope only. Do not make this a project-shared MCP yet.
- This MCP must never be pointed at customer production data.

Output:
1. The exact least-privilege role and permissions to create in Supabase for this MCP.
2. The MCP configuration steps.
3. A short risk note covering the Supabase-Cursor token-leak pattern and how this configuration avoids it.
```

**Expected output:**
A least-privilege role definition, MCP configuration steps, and a risk note.

**Founder approval checkpoint:**
Confirm the role is read-only. Confirm no service key is used. Confirm the MCP is personal-scope. If any of these is not true, do not proceed.

**Test to run:**
The partner connects the MCP and asks a worker to list the tables. The worker should be able to read schema and should fail if it attempts a write.

**Success looks like:**
A worker can read the Supabase schema and cannot write through the MCP.

**If it fails:**
If a write succeeds, the role is too broad. Revoke it and recreate it as read-only before continuing.

**Next step:**
Step 2.3.

---

### Step 2.3 — Build the DINA product schema

**Goal:**
Create the twenty DINA product tables in the `dina` schema of Supabase, ported from the locked Build Workbook schema.

**Build worker to use:**
Claude Code, to generate the schema as SQL. Technical partner, to review and apply it. Founder, to confirm the table list matches the source.

**Skill to use:**
`supabase-n8n-product-foundation-builder` and `dina-hr-agent-product-builder`.

**MCP or integration needed:**
GitHub MCP, to store the schema SQL in the repository. Supabase MCP, read-only, to verify the result after the partner applies it.

**Source context to provide:**
The locked Build Workbook (File 04), Section 9 — the full twenty-table schema: Customers, Contacts, Employees, HR Requests, New Joiners, Offboarding Cases, Workflows, Workflow Steps, Approvals, Documents, Notifications, Audit Logs, Dashboard Metrics, Modules, and the remaining tables in that section. Provide every field, type and purpose as written there.

**Prompt to paste:**
```
You are generating the DINA product database schema as PostgreSQL DDL for Supabase, applying the supabase-n8n-product-foundation-builder and dina-hr-agent-product-builder skills.

I am providing the locked NURA Build Workbook Section 9, which defines twenty tables with their fields, types and purpose. Port that model faithfully to Postgres.

Rules:
- Create all tables in a schema named "dina".
- Translate the logical field types from File 04 to correct Postgres types: single line text to text, long text to text, single select to text with a CHECK constraint listing the allowed values, date to date, created time to timestamptz default now(), link fields to foreign keys with proper references, attachment fields to a text column holding a Supabase Storage path.
- Every table that holds customer-scoped data must include a customer_id column that is a foreign key to dina.customers.
- Add primary keys. Add foreign keys for every link relationship.
- Make the audit_logs table append-only in intent: no update or delete is expected against it. Add a comment saying so.
- Do not add tables that are not in the source. Do not drop fields from the source.

Output: one SQL file, dina_schema.sql, with all twenty tables. Add a short comment above each table naming its source table from Section 9.

Here is the source schema:
[paste File 04 Section 9 in full]
```

**Expected output:**
One SQL file, `dina_schema.sql`, defining all twenty tables in the `dina` schema, stored in the repository.

**Founder approval checkpoint:**
Confirm the table list is exactly the twenty tables from File 04 Section 9 — no more, no fewer. Confirm every customer-scoped table has a `customer_id`. Confirm `audit_logs` is marked append-only. You do not need to read SQL; you need to confirm the table list and the customer_id rule with the partner.

**Test to run:**
The partner applies the SQL to a development branch of the Supabase project. Using the read-only Supabase MCP, a worker lists the tables and confirms twenty tables exist in the `dina` schema.

**Success looks like:**
Twenty DINA tables exist in Supabase, matching the locked schema, each customer-scoped table carrying a `customer_id`.

**If it fails:**
If a table is missing, re-provide that table's definition and ask Claude Code to add only it. If types are wrong, the partner corrects the SQL. Do not let the schema drift from File 04.

**Next step:**
Step 2.4.

---

### Step 2.4 — Set up authentication

**Goal:**
Configure Supabase Auth so DINA has real user accounts: HR users and, where relevant, employees, each tied to one customer.

**Build worker to use:**
Technical partner.

**Skill to use:**
`supabase-n8n-product-foundation-builder` and `nura-security-approval-guardrail`.

**MCP or integration needed:**
None beyond the Supabase project.

**Source context to provide:**
This step. File 06 - Phase 1 Stack Decision — Supabase Auth governs access. The DINA user roles from File 04: HR Operations, People Partner, HR Director, Line Manager and, where the interface allows it, Employee.

**Prompt to paste:**
```
Plan the Supabase Auth setup for DINA, applying the supabase-n8n-product-foundation-builder and nura-security-approval-guardrail skills.

Requirements:
- Every user account belongs to exactly one customer. Store a customer_id and a role on each user, using Supabase Auth user metadata or a linked profiles table — recommend which.
- Roles to support: HR Operations, People Partner, HR Director, Line Manager, and Employee.
- The role and customer_id must be available to row-level security policies, because Part 2 Step 2.5 depends on them.
- No shared logins. No god-mode account used for normal access.

Output:
1. The recommended way to store customer_id and role for each user.
2. The auth configuration steps.
3. A note on how RLS in the next step will read these values.
```

**Expected output:**
An auth design that ties every user to one customer and one role, and a configuration the partner can apply.

**Founder approval checkpoint:**
Confirm every user is tied to exactly one customer. Confirm the roles match the DINA HR roles. Confirm there is no shared login.

**Test to run:**
The partner creates two test users for two different test customers. Each can sign in. Each carries the correct customer_id and role.

**Success looks like:**
Test users exist, sign in, and carry a customer_id and role.

**If it fails:**
If role or customer_id is not reachable by policies, fix the storage method before Step 2.5 — RLS depends on it.

**Next step:**
Step 2.5.

---

### Step 2.5 — Build row-level security for customer isolation

**Goal:**
Write the row-level security policies that guarantee one customer can never see another customer's data, and that enforce the L1, L2 and L3 knowledge-layer boundaries.

**Build worker to use:**
Claude Code, to draft the policies. Technical partner, to review, apply and verify. Founder, to approve the isolation guarantee.

**Skill to use:**
`supabase-n8n-product-foundation-builder` and `nura-security-approval-guardrail`.

**MCP or integration needed:**
GitHub MCP, to store the policy SQL. Supabase MCP, read-only, to verify.

**Source context to provide:**
This step. File 06 - Phase 1 Stack Decision — row-level security enforces customer-by-customer isolation and the L1/L2/L3 boundaries. The locked rule from File 02: customer L3 knowledge stays isolated per customer and is never mixed into L1 or L2. The auth design from Step 2.4.

**Prompt to paste:**
```
You are writing PostgreSQL row-level security policies for the DINA product database in Supabase, applying the supabase-n8n-product-foundation-builder and nura-security-approval-guardrail skills.

Context: every authenticated user carries a customer_id and a role, set up in the previous step. The schema has twenty tables in the "dina" schema; every customer-scoped table has a customer_id column.

Requirements:
- Enable RLS on every table in the dina schema.
- For every customer-scoped table, write a policy so a user can only read or write rows where the row's customer_id equals the user's customer_id. No exceptions.
- Knowledge-layer rule: L1 standard knowledge is readable by all customers. L2 regional knowledge is readable by all customers. L3 customer knowledge is readable only by the customer that owns it. Apply this to whichever tables hold knowledge content.
- The audit_logs table: a user may read only their own customer's audit rows. No user may update or delete audit rows.
- Default deny: if no policy grants access, access is denied.

Output: one SQL file, dina_rls.sql, with every policy, each with a comment explaining what it protects.
```

**Expected output:**
One SQL file, `dina_rls.sql`, with RLS enabled on all `dina` tables and policies enforcing customer isolation, knowledge-layer boundaries and audit protection.

**Founder approval checkpoint:**
This is a high-severity checkpoint. Confirm with the partner that the isolation test in the next step passes before any further build. Customer data isolation is a locked NURA rule and a UAE data-protection requirement. If the test does not pass, the build stops here.

**Test to run:**
The partner signs in as a user of test customer A and attempts to read test customer B's employee rows. The result must be zero rows. The partner then attempts to read an L3 knowledge row belonging to customer B. The result must be zero rows. The partner attempts to delete an audit row. The result must be a permission denial.

**Success looks like:**
Customer A sees none of customer B's data, no L3 leakage across customers, and audit rows cannot be deleted.

**If it fails:**
If any cross-customer data is visible, the build stops. Do not proceed to any later part. Fix the policy, re-apply, re-test. Treat this as the single most important gate in the manual.

**Next step:**
Step 2.6.

---

### Step 2.6 — Set up storage, audit, approval and module activation

**Goal:**
Confirm and finish the supporting tables and storage: Supabase Storage for generated HR documents, the audit log table, the approval queue table and the module activation table.

**Build worker to use:**
Claude Code, to generate any finishing SQL and storage configuration. Technical partner, to apply. Founder, to confirm coverage.

**Skill to use:**
`supabase-n8n-product-foundation-builder`.

**MCP or integration needed:**
GitHub MCP and Supabase MCP, read-only.

**Source context to provide:**
This step. The relevant tables from File 04 Section 9: Audit Logs, Approvals, Documents, Modules. The five-state HITL model from File 02, Section 12 — Auto, Notify, Approve before action, Escalate, Block — which the Approvals table must be able to record.

**Prompt to paste:**
```
You are finishing the DINA supporting layer in Supabase, applying the supabase-n8n-product-foundation-builder skill.

Tasks:
1. Storage: define a Supabase Storage bucket for DINA generated documents. Files must be customer-scoped. Recommend the bucket structure and the access rule so a customer can only reach its own files.
2. Audit: confirm the audit_logs table from the schema records, at minimum: timestamp, customer_id, related case, module, event type, actor, the HITL gate state applied, before value, after value, and source knowledge layer. If any field is missing, output the SQL to add it.
3. Approvals: confirm the approvals table can record the HITL gate type using the five states: Auto, Notify, Approve before action, Escalate, Block. If the constraint is missing those values, output SQL to fix it.
4. Module activation: confirm a table records which modules — M07, M03, M14, and the V1 modules M15, M08, M05 — are active for each customer. If missing, output the SQL.

Output: a SQL file dina_supporting.sql plus the storage configuration steps. Comment each change.
```

**Expected output:**
A SQL file `dina_supporting.sql` and storage configuration, completing the audit, approval, document storage and module activation layer.

**Founder approval checkpoint:**
Confirm the audit log captures the HITL gate state — this is the governance proof that AI executed and a human decided. Confirm the approval table supports all five HITL states. Confirm module activation lists M07, M03, M14 as the active starter and M15, M08, M05 as V1.

**Test to run:**
The partner inserts one test approval row with gate type "Approve before action" and one test audit row, then confirms a generated document can be stored in the customer's storage bucket and not read by another customer.

**Success looks like:**
Approvals record HITL states, audit rows record gate state, documents store under the correct customer and are isolated.

**If it fails:**
If a HITL state cannot be recorded, fix the constraint before Part 7 — the workflows depend on it.

**Next step:**
Step 2.7.

---

### Step 2.7 — Create the NURA command centre schema

**Goal:**
Create the `nura` schema in the same Supabase project to hold the internal command centre data — kept strictly separate from the `dina` product data.

**Build worker to use:**
Claude Code, to generate the schema. Technical partner, to apply. Founder, to confirm the field list.

**Skill to use:**
`supabase-n8n-product-foundation-builder`.

**MCP or integration needed:**
GitHub MCP and Supabase MCP, read-only.

**Source context to provide:**
This step. The fourteen command centre fields the founder must be able to see, listed in this manual's Part 4 introduction and in the prompt below. The rule from the source-truth skill: internal command centre tooling is separate from customer-facing DINA infrastructure.

**Prompt to paste:**
```
You are creating the NURA internal command centre database in Supabase, applying the supabase-n8n-product-foundation-builder skill.

Create all tables in a schema named "nura", completely separate from the "dina" product schema.

The command centre must store, at minimum, these things:
- Build phases and steps: current build phase, the step, status, the assigned AI worker, the skill to use, the MCP needed, a GitHub issue link, a Supabase object link, an n8n workflow link, an output link, and founder approval status.
- A decision log: dated decisions with the reasoning.
- A risk log: risks with severity and status.
- DINA workflow progress: which of the six workflows is at which stage.
- GTM progress: paid audit pipeline stage per prospect.

Design sensible tables for the above. Use clear column names. Add primary keys. Timestamps on every table.

Output: a SQL file nura_command_centre_schema.sql, with a comment on each table.
```

**Expected output:**
One SQL file, `nura_command_centre_schema.sql`, creating the `nura` schema with build-tracking, decision log, risk log, DINA workflow progress and GTM progress tables.

**Founder approval checkpoint:**
Confirm the `nura` schema is separate from the `dina` schema. Confirm all fourteen command centre items from Part 4 are covered. Confirm there is a decision log and a risk log.

**Test to run:**
The partner applies the schema and inserts one test build-step row, one decision and one risk. A worker reads them back through the read-only MCP.

**Success looks like:**
The `nura` schema exists, separate from `dina`, with all command centre tables.

**If it fails:**
If a command centre field is missing, re-provide the Part 4 list and ask for only the missing column.

**Next step:**
Part 3, Step 3.1.

---

# Part 3 — n8n Foundation

This part stands up n8n as the workflow automation layer: the workspace, the credentials, the environment variables, a test workflow, the standard webhook pattern and the standard error handling pattern. When Part 3 is done, n8n can run real workflows and is ready for the command centre and the DINA workflows.

---

### Step 3.1 — Deploy the n8n workspace

**Goal:**
Deploy a production-ready n8n, running in queue mode so it can scale, connected to its own Postgres and Redis.

**Build worker to use:**
Technical partner. Deploying n8n in queue mode is not a non-coder task.

**Skill to use:**
`supabase-n8n-product-foundation-builder`.

**MCP or integration needed:**
None for deployment.

**Source context to provide:**
This step. File 06 - Phase 1 Stack Decision — n8n in queue mode, Docker with Postgres and Redis, gives the production scaling. The decision that n8n is the single workflow layer for both DINA workflows and internal automation.

**Prompt to paste:**
No AI prompt. Technical partner action: deploy n8n in queue mode using Docker, with a Postgres database and Redis, on a host the partner controls. Do not expose the n8n port directly to the public internet; place it behind proper access control. Record the n8n base URL and admin access securely. Confirm the founder can reach the n8n editor through a browser with a login.

**Expected output:**
A running n8n instance in queue mode, reachable by the founder through a browser login, not publicly exposed.

**Founder approval checkpoint:**
Confirm the partner used queue mode, not a single-process trial instance — this is the production layer. Confirm the n8n port is not publicly exposed. Confirm you can log in.

**Test to run:**
The founder logs in to the n8n editor and sees an empty workflow canvas.

**Success looks like:**
A working n8n the founder can log in to.

**If it fails:**
If n8n is slow or unstable, confirm Redis and Postgres are correctly connected; a missing queue backend is the usual cause.

**Next step:**
Step 3.2.

---

### Step 3.2 — Set up credentials and environment variables

**Goal:**
Store the credentials n8n needs — the Supabase connection, the AI model API keys — as secure n8n credentials and environment variables, never hard-coded in workflows.

**Build worker to use:**
Technical partner.

**Skill to use:**
`nura-security-approval-guardrail`.

**MCP or integration needed:**
None.

**Source context to provide:**
This step. The rule from the File 06 - Phase 1 Stack Decision: every database connection uses a least-privilege role, never a god-mode service key. The list of credentials n8n needs: a scoped Supabase role for reads and writes the workflows require, and the AI model API key or keys.

**Prompt to paste:**
```
Plan the n8n credentials and environment variables for the NURA build, applying the nura-security-approval-guardrail skill.

Requirements:
- The Supabase credential used by n8n must be a least-privilege role. It needs the specific table reads and writes the DINA workflows require, and nothing more. It must not be the Supabase service key.
- AI model API keys are stored as n8n credentials or environment variables, never written into a workflow node as plain text.
- List every environment variable n8n will need, with a one-line purpose for each.
- Note which credentials must be rotated and how often.

Output:
1. The least-privilege Supabase role definition for n8n.
2. The list of n8n credentials and environment variables.
3. A rotation note.
```

**Expected output:**
A least-privilege Supabase role for n8n, a list of credentials and environment variables, and a rotation note.

**Founder approval checkpoint:**
Confirm n8n uses a scoped role, not the service key. Confirm no API key is hard-coded in any workflow. Confirm the rotation note exists.

**Test to run:**
The partner adds the Supabase credential to n8n and runs a one-node test that reads one row from a non-sensitive table.

**Success looks like:**
n8n can connect to Supabase using the scoped credential.

**If it fails:**
If the read fails, the role is missing a permission; add only the specific permission needed. If the role can do more than the workflows require, narrow it.

**Next step:**
Step 3.3.

---

### Step 3.3 — Build the standard test workflow

**Goal:**
Build one simple end-to-end n8n workflow to prove the pattern: a trigger, a Supabase read, a Supabase write, and a finish.

**Build worker to use:**
Founder, with technical partner support. Building in the n8n canvas is a founder-operable task once n8n is running.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
The n8n Supabase connection from Step 3.2.

**Source context to provide:**
This step. The `nura` schema from Step 2.7, specifically a non-sensitive table such as the build-step table, to use as the read and write target.

**Prompt to paste:**
```
Give me a step-by-step build guide for a simple n8n test workflow, applying the nura-workflow-builder skill. I am a non-coder building this in the n8n canvas.

The workflow:
1. A manual trigger.
2. A node that reads one row from a named Supabase table in the nura schema.
3. A node that writes a timestamp back to that row, marking it as tested.
4. A node that ends the workflow.

For each node, tell me: the node type to add, the exact settings to enter, and what I should see. Keep it simple enough to follow without coding.
```

**Expected output:**
A four-node n8n workflow that reads from and writes to Supabase, built by the founder.

**Founder approval checkpoint:**
Confirm you built and ran it yourself. This step proves you can operate the n8n canvas — that matters, because you will build the DINA workflows in Part 7.

**Test to run:**
Run the workflow manually. Confirm the row in Supabase shows the new timestamp.

**Success looks like:**
The workflow runs and the Supabase row updates.

**If it fails:**
If the read fails, check the credential. If the write fails, confirm the n8n role has write permission on that table.

**Next step:**
Step 3.4.

---

### Step 3.4 — Establish the webhook and error-handling pattern

**Goal:**
Define and save the two standard patterns every DINA workflow will reuse: the webhook trigger pattern and the error-handling pattern.

**Build worker to use:**
Claude, to define the patterns. Founder, to build them as reusable references in n8n. Technical partner, to review.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
None beyond n8n.

**Source context to provide:**
This step. The fact that DINA workflows are triggered by employee requests and lifecycle events, so a webhook trigger is the standard entry point. File 06 - Phase 1 Stack Decision — every sensitive DINA action writes an audit row, so error handling must record failures.

**Prompt to paste:**
```
Define two standard n8n patterns for the NURA DINA build, applying the nura-workflow-builder skill.

Pattern 1 — Webhook trigger pattern. Every DINA workflow starts when something happens: an employee submits a request, or a lifecycle event occurs. Define the standard webhook trigger setup: how the webhook receives the request, how it validates that required fields are present, and what it does if a field is missing.

Pattern 2 — Error-handling pattern. Define how a DINA workflow handles a failure: a failed model call, a failed database write. The pattern must catch the error, write an audit row recording the failure, notify a human, and not silently lose the case.

For each pattern, give the node sequence, the settings, and a short explanation a non-coder can follow. These patterns will be reused in every Part 7 workflow.

Output the two patterns as clear reusable build references.
```

**Expected output:**
Two documented, reusable n8n patterns — webhook trigger and error handling — saved as build references.

**Founder approval checkpoint:**
Confirm the error pattern writes an audit row and notifies a human on failure. A workflow must never lose an HR case silently. Confirm both patterns are saved where Part 7 can reuse them.

**Test to run:**
Build the error pattern into the Step 3.3 test workflow, force a failure by pointing a node at a wrong table, and confirm an audit row records the failure and a notification is produced.

**Success looks like:**
A forced failure produces an audit row and a notification, and the case is not lost.

**If it fails:**
If the failure is silent, the error branch is not wired; connect the error output before continuing.

**Next step:**
Part 4, Step 4.1.

---

# Part 4 — NURA Command Centre App

This part builds the founder dashboard — a simple app on top of the `nura` Supabase schema and the GitHub build status. It is internal founder infrastructure, not customer-facing DINA infrastructure. The two must never be confused.

The command centre must let the founder see, for the build: the current build phase; the next action; the assigned AI worker; the skill to use; the MCP needed; the GitHub issue link; the Supabase object link; the n8n workflow link; the output link; the founder approval status; the decision log; the risk log; the DINA workflow progress; and the GTM progress.

---

### Step 4.1 — Write the command centre product requirement

**Goal:**
Write a short, clear product requirement for the command centre app, so the build worker knows exactly what to build.

**Build worker to use:**
Claude, to draft. Founder, to approve.

**Skill to use:**
`nura-product-requirement-writer`.

**MCP or integration needed:**
None.

**Source context to provide:**
This step. The fourteen command centre items listed in the Part 4 introduction. The `nura` schema from Step 2.7. The rule that the command centre is internal-only.

**Prompt to paste:**
```
Write a short product requirement for the NURA internal command centre app, applying the nura-product-requirement-writer skill.

The command centre is an internal founder dashboard. It is not customer-facing. It reads the nura schema in Supabase and the NURA Build GitHub Projects board.

It must let the founder see, in one place:
1. Current build phase
2. Next action
3. Assigned AI worker
4. Skill to use
5. MCP needed
6. GitHub issue link
7. Supabase object link
8. n8n workflow link
9. Output link
10. Founder approval status
11. Decision log
12. Risk log
13. DINA workflow progress
14. GTM progress

Keep the requirement short and concrete: the screens, what each screen shows, where the data comes from. No new features beyond the list. State clearly that this is internal infrastructure and separate from the DINA product.

Output a one-page product requirement.
```

**Expected output:**
A one-page product requirement for the command centre app.

**Founder approval checkpoint:**
Confirm all fourteen items are covered and nothing extra is added. Confirm the requirement states the app is internal-only.

**Test to run:**
Read the requirement. Confirm you could hand it to a build worker and they would know what to build.

**Success looks like:**
A clear one-page requirement covering the fourteen items.

**If it fails:**
If it adds features, cut them. If an item is missing, re-provide the list.

**Next step:**
Step 4.2.

---

### Step 4.2 — Build the command centre app

**Goal:**
Build the command centre app on top of the `nura` Supabase schema.

**Build worker to use:**
Claude Code or Codex, to build the app. Technical partner, to review and deploy. Founder, to test against the requirement.

**Skill to use:**
`dina-hr-agent-product-builder` for build discipline, and `supabase-n8n-product-foundation-builder`. (These skills carry the NURA build method; the command centre is built to the same standard even though it is internal.)

**MCP or integration needed:**
GitHub MCP, so the app can read the NURA Build board status and so the code lives in the repository. Supabase MCP, read-only, for the worker to confirm the `nura` schema.

**Source context to provide:**
The product requirement from Step 4.1. The `nura` schema from Step 2.7. The GitHub Projects board name "NURA Build" and its columns. The instruction to build the app with a real frontend approach — File 06 - Phase 1 Stack Decision allows a Next.js or comparable real frontend; do not use a throwaway tool.

**Prompt to paste:**
```
Build the NURA internal command centre app, applying the dina-hr-agent-product-builder and supabase-n8n-product-foundation-builder skills.

I am providing the one-page product requirement and the nura Supabase schema.

Build rules:
- The app reads the nura schema in Supabase for build steps, decisions, risks, DINA workflow progress and GTM progress.
- The app reads the NURA Build GitHub Projects board for issue status.
- Build it as a real, maintainable web app. Do not use a throwaway no-code tool. A Next.js frontend is acceptable.
- Screens: a build overview showing current phase, next action, assigned worker, skill, MCP, and the GitHub, Supabase, n8n and output links, with founder approval status; a decision log screen; a risk log screen; a DINA workflow progress screen; a GTM progress screen.
- This is internal founder infrastructure. It does not touch the dina product schema.

Work in the nura-build repository. Output the app code and the steps to run it.

Here is the requirement and schema:
[paste the Step 4.1 requirement and the nura schema]
```

**Expected output:**
A working command centre web app, code stored in `nura-build`, reading the `nura` schema and the GitHub board.

**Founder approval checkpoint:**
Confirm the app shows all fourteen items. Confirm it reads the `nura` schema only and does not touch the `dina` product schema. Confirm it is a real app, not a throwaway tool.

**Test to run:**
Open the app. Confirm the build overview shows real rows from the `nura` schema and the GitHub issue links open the correct issues.

**Success looks like:**
A working internal dashboard showing the build, decisions, risks, DINA progress and GTM progress.

**If it fails:**
If a screen is empty, confirm the `nura` schema has test rows. If GitHub status is missing, confirm the GitHub MCP or API connection.

**Next step:**
Step 4.3.

---

### Step 4.3 — Connect the command centre to live build status

**Goal:**
Make the command centre update from real build activity, so it reflects the true state of the build without manual entry.

**Build worker to use:**
Founder, to build the sync workflow in n8n. Technical partner, to review.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
The n8n Supabase connection. GitHub access from n8n for issue status.

**Source context to provide:**
This step. The webhook and error patterns from Step 3.4. The `nura` schema build-step table.

**Prompt to paste:**
```
Give me a step-by-step n8n workflow build guide, applying the nura-workflow-builder skill, for a workflow that keeps the NURA command centre in sync.

The workflow should, on a schedule:
1. Read the NURA Build GitHub Projects board issue statuses.
2. Update the matching build-step rows in the nura Supabase schema with the current status.
3. Use the standard error-handling pattern from Part 3.

Give me the node sequence and settings, simple enough for a non-coder to build.
```

**Expected output:**
An n8n workflow that syncs GitHub build status into the command centre `nura` schema on a schedule.

**Founder approval checkpoint:**
Confirm the command centre updates without you typing status by hand. Confirm the error pattern is included.

**Test to run:**
Move a test issue on the GitHub board, wait for the schedule, and confirm the command centre app reflects the change.

**Success looks like:**
The command centre updates itself from real build activity.

**If it fails:**
If the sync does not run, check the n8n schedule trigger. If status is wrong, check the field mapping between GitHub and the `nura` schema.

**Next step:**
Part 5, Step 5.1.

---

# Part 5 — NURA Chief of Staff Agent

This part builds the NURA Chief of Staff agent. NURA is three things at once:

1. **The founder's internal coordination agent** — persistent memory, source-truth-aware, surfaces risks, prepares decisions, routes work to build workers. (Steps 5.1, 5.2, 5.3.)
2. **The public brand persona of the company** — voice, tone, principles, signature patterns. Persona scaffolding is built here; persona *production* (video avatar via HeyGen, voice via ElevenLabs, NURA persona-led external channel activation) is deferred to Part 13. (Step 5.4.)
3. **The hub at the centre of NURA-AI's operating rhythm** — orchestrates the founder, the three pod-lead agents (Kael for Revenue, Mira for Product Engineering, Senna for Success & Risk per File 01), and reports back to the founder via chat, dashboards, voice (later) and video (later). (Steps 5.5, 5.6.)

Per File 06 - Phase 1 Stack Decision, NURA runs now as a disciplined Claude-based assistant with its memory in Supabase. Hermes is the later candidate to take the agent-engine role; that is tested in Part 11. Building it on Supabase memory now means the engine can be swapped later without losing memory.

NURA is internal-first. The persona scaffolding in this Part defines who NURA is; it does not deploy NURA externally. External deployment (website, social, demos, video avatar, voice calls) is Part 13 work, gated on the foundation being stable. The locked pack's Step 8 gate also applies — no investor-facing NURA presence until Step 8 conditions in File 00 are met.

Mira and Senna are named in File 01 as pod-leads but their full agent builds are not in Phase 1 active scope. Step 5.6 scaffolds their roles in NURA's memory and routing logic, so when they are built later (as separate Parts in a future Phase) their place in the architecture is already defined.

---

### Step 5.1 — Define the Chief of Staff role, persona and memory

**Goal:**
Define what NURA does, what NURA never does, NURA's persona (the brand voice), the hub-and-spoke topology of pod coordination, and how memory is stored in the `nura` Supabase schema.

**Build worker to use:**
Claude, to draft the definition. Founder, to approve.

**Skill to use:**
`nura-agent-builder`.

**MCP or integration needed:**
None for the definition.

**Source context to provide:**
This step. File 01 — NURA is the founder's internal meta-agent and chief of staff, *and* the public brand persona of the company, orchestrating three pod-lead agents (Kael, Mira, Senna). File 06 - Phase 1 Stack Decision — NURA is a persistent, memory-rich agent running as a Claude-based assistant with memory in Supabase until Hermes is lab-proven. The governance principle: AI owns execution, humans own decisions.

**Prompt to paste:**
```
Define the NURA agent, applying the nura-agent-builder skill.

NURA is the AI Chief of Staff of NURA-AI and the company's public brand persona. NURA is internal-first in Phase 1; public-facing persona production is deferred to Part 13. NURA is not customer-facing in the DINA product sense — DINA is the customer-facing HR agent. NURA is the founder's coordination partner and the brand voice of the company.

Define:

1. **Role.** NURA reads NURA source truth, tracks build tasks, surfaces risks, prepares decisions for the founder, routes work to the right build worker with the right skill, and orchestrates the three pod-lead agents (Kael, Mira, Senna). NURA is the hub at the centre of the operating rhythm.

2. **Hub-and-spoke topology.** NURA sits at the centre. The founder sits co-equal at the centre next to NURA. The three pod-leads are spokes: Kael (Revenue), Mira (Product Engineering), Senna (Success & Risk). Additional pods may be added later (Marketing, Legal, Finance) when business need is clear. NURA orchestrates the pods; NURA does not replace them. Each pod owns its functional scope. NURA holds cross-pod context.

3. **Boundaries.** NURA prepares decisions; the founder makes them. NURA never sends an external message without founder approval. NURA never edits a locked source file. NURA never represents the company externally in Phase 1 — that capability is built in Part 13 and gated on the locked Step 8 conditions.

4. **Persona — brand voice scaffolding.** NURA's register is a thoughtful strategic partner: warm but not chatty, direct but not blunt, analytical but not cold. NURA speaks like a senior Chief of Staff who holds context, has opinions, and uses words carefully. The full voice guide is built in Step 5.4.

5. **Operating principles (eight):**
   a. *Hold the whole.* NURA knows what every agent is doing. No pod operates out of context.
   b. *Drive rhythm, do not wait.* NURA initiates briefs, reviews and nudges; it does not wait for check-ins.
   c. *Take positions.* NURA has views and recommends. NURA does not synthesise without opinion.
   d. *Act within authority, escalate the rest.* NURA operates the HITL framework. Low-risk: decide and log. Medium-risk: notify and proceed. High-risk: escalate to founder.
   e. *No silent failures.* If a handoff breaks, an agent stalls, a workflow degrades — the founder hears about it from NURA first.
   f. *Remember everything.* Every decision, every override, every rationale is structured and retrievable from `nura` schema memory.
   g. *Stay human-present.* NURA takes positions and has a voice. The founder experiences NURA as a senior partner, not a tool.
   h. *Founder overrides everything.* However strong NURA's position, the founder is final authority. Overrides are executed cleanly and logged with the original recommendation preserved.

6. **Memory.** NURA stores context, decisions, overrides, task state, risks and pod-state in the `nura` schema in Supabase, so memory survives across sessions and so the underlying engine can later be swapped to Hermes without losing memory.

7. **Routing.** Given a build need, NURA proposes which worker and which skill should handle it. For pod-scope work, NURA routes to the relevant pod-lead (Kael for revenue, Mira for product engineering, Senna for success/risk) once those pods are built.

Output a clear role definition with: role statement, hub-and-spoke topology description, hard boundary list, persona summary (voice guide is Step 5.4), the eight operating principles, memory description, and routing logic.
```

**Expected output:**
A NURA role definition: role, topology, boundaries, persona summary, eight operating principles, memory design, routing logic.

**Founder approval checkpoint:**
Confirm the boundary list is firm: prepares decisions, never makes founder decisions, never sends external messages without approval, never edits locked files, never represents the company externally in Phase 1. Confirm memory lives in the `nura` Supabase schema. Confirm the eight operating principles read as enforceable, not aspirational.

**Test to run:**
Read the definition. Confirm it could not be mistaken for a customer-facing agent (DINA's job). Confirm it could not be read as autonomous decision-making. Confirm the hub-and-spoke topology matches File 01's three-pod-lead structure (Kael, Mira, Senna).

**Success looks like:**
A clear, bounded role definition with Supabase-backed memory, persona scaffolding, eight operating principles, and the hub-and-spoke topology.

**If it fails:**
If the boundaries are soft, tighten them. If the topology drifts to a vertical hierarchy (NURA → pod-leads → sub-agents), correct to flat hub-and-spoke. If the persona reads as marketing fluff, sharpen using the signature patterns from Step 5.4.

**Next step:**
Step 5.2.

---

### Step 5.2 — Build the Chief of Staff memory store

**Goal:**
Confirm and finish the `nura` schema tables the Chief of Staff uses as memory: context, decisions, tasks and risks.

**Build worker to use:**
Claude Code, for any finishing SQL. Technical partner, to apply. Founder, to confirm.

**Skill to use:**
`nura-agent-builder` and `supabase-n8n-product-foundation-builder`.

**MCP or integration needed:**
GitHub MCP and Supabase MCP, read-only.

**Source context to provide:**
This step. The `nura` schema from Step 2.7. The Chief of Staff definition from Step 5.1.

**Prompt to paste:**
```
You are finishing the NURA Chief of Staff memory store in the nura Supabase schema, applying the nura-agent-builder and supabase-n8n-product-foundation-builder skills.

The Chief of Staff needs persistent memory across sessions. Confirm the nura schema has tables for:
1. Conversation and context memory — what the founder and the Chief of Staff have discussed and concluded.
2. Decisions — already present as the decision log; confirm it is sufficient.
3. Tasks — the build steps and their routing; already present; confirm.
4. Risks — already present as the risk log; confirm.

If any memory table is missing or thin, output the SQL to add it. Keep the design simple and queryable.

Output: any needed SQL as nura_chief_of_staff_memory.sql, with comments. If nothing is needed, say so explicitly.
```

**Expected output:**
Confirmation that the memory tables exist, plus any finishing SQL.

**Founder approval checkpoint:**
Confirm the Chief of Staff has a context memory table, not only decision and risk logs. It must remember discussion, not only outcomes.

**Test to run:**
The partner inserts one context memory row and reads it back.

**Success looks like:**
The `nura` schema can store and return Chief of Staff context memory.

**If it fails:**
If memory is only decisions and risks, add the context table — persistent context is the point of this agent.

**Next step:**
Step 5.3.

---

### Step 5.3 — Configure and run the Chief of Staff

**Goal:**
Configure the Claude-based Chief of Staff assistant with its role, its skills and its Supabase memory, and run it for the first time.

**Build worker to use:**
Founder, to operate. Claude, as the engine. Technical partner, to wire the Supabase memory connection.

**Skill to use:**
`nura-agent-builder`. The Chief of Staff itself, in operation, uses `nura-source-truth-guardian`, `nura-architecture-reviewer` and `nura-ai-execution-task-writer` as its working skills.

**MCP or integration needed:**
Supabase access for the Chief of Staff to read and write its `nura` schema memory. Filesystem MCP, restricted, or Google Drive MCP, to let it read the locked source files 00–07.

**Source context to provide:**
The Chief of Staff definition from Step 5.1. The locked source files 00–07. The list of build workers and skills from Part 0.

**Prompt to paste:**
```
You are the NURA Chief of Staff, the founder's internal coordination agent. You are running as a Claude-based assistant with persistent memory in the nura schema in Supabase.

Operate under this definition: [paste the Step 5.1 role definition].

Your working skills are nura-source-truth-guardian, nura-architecture-reviewer and nura-ai-execution-task-writer. Apply them.

Your boundaries: you prepare decisions, you never make a decision that is the founder's to make, you never send an external message, you never edit a locked source file.

Your source truth is the locked files 00 to 07 and File 06 - Phase 1 Stack Decision.

For this first run:
1. Read the locked source files and confirm in one paragraph what NURA is, what DINA is, and the current build priority.
2. Read the NURA build manual's step list and tell me which build step is next and which worker and skill it needs.
3. Save a context memory note recording this session.

Begin.
```

**Expected output:**
A running Chief of Staff that correctly summarises NURA and DINA, names the next build step with its worker and skill, and writes a memory note to Supabase.

**Founder approval checkpoint:**
Confirm the summary is correct — DINA described as an HR workflow execution agent with a helpdesk interface, not a chatbot. Confirm it named the correct next step. Confirm a memory note was saved.

**Test to run:**
Start a new session. Ask the Chief of Staff what was concluded last session. It should retrieve the memory note from Supabase.

**Success looks like:**
The Chief of Staff remembers across sessions and routes the next step correctly.

**If it fails:**
If memory does not persist, the Supabase memory connection is not wired; fix it with the partner. If it describes DINA as a chatbot, correct the role context and re-run.

**Next step:**
Step 5.4.

---

### Step 5.4 — Define NURA's brand voice and persona guide

**Goal:**
Define the brand voice of NURA in enough detail that any output (chat reply, social post, email draft, future video script) can be tested against the guide. This step produces the scaffolding only; persona *production* (video avatar, voice cloning, NURA persona-led external channel activation) is Part 13.

**Build worker to use:**
Claude, to draft. Founder, to approve and refine.

**Skill to use:**
`nura-agent-builder` and `nura-product-requirement-writer`.

**MCP or integration needed:**
None.

**Source context to provide:**
This step. Step 5.1 role definition. File 01 — NURA is the public brand persona of the company. The eight operating principles from Step 5.1.

**Prompt to paste:**
```
Write the NURA Brand Voice Guide, applying the nura-agent-builder and nura-product-requirement-writer skills.

NURA's role definition is in Step 5.1 of the NURA / DINA Build Manual. NURA is the AI Chief of Staff and the public brand persona of NURA-AI. This guide is the scaffolding; persona production (video avatar via HeyGen, voice via ElevenLabs, NURA persona-led external channel activation) happens in Part 13.

The guide must cover:

1. **Register.** Thoughtful strategic partner. Warm but not chatty. Direct but not blunt. Analytical but not cold. Senior Chief of Staff who holds context, has opinions, uses words carefully.

2. **Sounds like (positive examples).** Write 6-8 short concrete descriptors. For example: "A COO who knows everything happening in the business and speaks plainly about it. A trusted advisor who will tell the founder the hard truth when needed. A senior operator with opinions and the comfort to advocate for them."

3. **Does not sound like (negative examples).** Write 6-8 short anti-patterns. For example: "A generic AI assistant. A cheerful chatbot with exclamation marks. A neutral synthesiser who never takes a position. A junior analyst who hedges every statement."

4. **Signature patterns (rules for output).** Concrete enough to be enforceable. For example: "Opens with the point, then supports it — not the other way around. Names the specific agent, customer or step when relevant — not abstractions. Uses numbers when available, qualitative language when not. Distinguishes between what NURA knows, what NURA infers, and what NURA is uncertain about. Offers a recommendation whenever the founder is asking for a decision — never just lists options."

5. **Forbidden patterns.** Things NURA never does in voice. For example: "Never opens with 'Great question!' Never uses 'I'd be happy to help.' Never uses corporate-deck filler words like 'leverage', 'synergy', 'unlock'. Never expresses uncertainty as a hedge to avoid taking a position. Never invents customer data, traction, or commitments."

6. **Modality plan (Phase 1 vs Part 13).** Phase 1 (now): chat only, internal to founder. Part 13 (later): chat + voice + video + social copy permeation. Brand voice consistency rule: the same NURA voice across every modality, every channel, every audience.

7. **External-use gate.** No external NURA voice deployment until Part 13. Until then, NURA's persona scaffolding exists for two purposes: (a) to shape internal interactions with the founder, (b) to be ready when Part 13 production begins.

Output a Brand Voice Guide as a single document: register, sounds-like, does-not-sound-like, signature patterns, forbidden patterns, modality plan, external-use gate.
```

**Expected output:**
A NURA Brand Voice Guide document, committed to the repository at `docs/nura-brand-voice-guide.md`.

**Founder approval checkpoint:**
Read NURA's output through the guide. Confirm the voice is recognisable, the signature patterns are enforceable (not aspirational), and the forbidden patterns close real failure modes. Confirm the external-use gate is firm: no external deployment until Part 13.

**Test to run:**
Take three sample NURA outputs from Step 5.3 (the first-run summaries). Score each against the signature patterns and the forbidden patterns. At least two of three should pass cleanly. If they don't, the guide is too loose or NURA's system prompt does not yet enforce the voice — adjust either the guide or the prompt.

**Success looks like:**
A voice guide concrete enough that a third party could write a NURA reply and you'd recognise it as NURA. The same guide will drive Part 13 voice cloning, video avatar scripting, and social post tone.

**If it fails:**
If the voice is generic or aspirational, sharpen with more anti-patterns. If signature patterns are too soft, replace them with concrete rules ("never opens with X", "always names specific Y").

**Next step:**
Step 5.5.

---

### Step 5.5 — Define NURA's operating rhythm

**Goal:**
Define the cadence NURA runs: morning brief, evening close, weekly review, monthly review, on-demand summaries. This step produces the rhythm specification; the n8n schedules that automate it are built in a later step alongside the Command Centre app from Part 4.

**Build worker to use:**
Claude, to draft. Founder, to approve.

**Skill to use:**
`nura-agent-builder` and `supabase-n8n-product-foundation-builder`.

**MCP or integration needed:**
None for the definition step.

**Source context to provide:**
This step. Step 5.1 role definition. The eight operating principles, especially "Drive rhythm, do not wait" and "No silent failures."

**Prompt to paste:**
```
Define NURA's Operating Rhythm, applying the nura-agent-builder skill.

NURA initiates. NURA does not wait for the founder to ask for status. The rhythm runs on schedule. The founder can interrupt, override, or ask off-rhythm at any time.

Define five cadence types. For each: what it does, when it runs, what input it reads from the nura schema, what output it produces, where the output goes (chat, email, dashboard, voice later, video later).

1. **Morning brief.** Daily, 08:00 Dubai. Reads overnight changes from build tasks, GitHub Projects status, any agent activity, any external signals. Outputs the founder's morning brief: priorities for today, what changed overnight, what needs attention, what's blocked, recommended next action.

2. **Evening close.** Daily, 18:00 Dubai. Reads what moved during the day. Outputs what shifted, what closed, what stayed open, what's at risk for tomorrow.

3. **Weekly review.** Friday afternoon. Reads the week's KPIs across the build, the pods (once built), and any customer signals. Outputs trend commentary, pattern recognition, recommended adjustments for next week.

4. **Monthly review.** Last day of the month. Reads month-level patterns. Outputs strategic considerations — not tactical updates. What is the business learning. What should change in approach.

5. **On-demand summaries.** Any cut, any timeframe, any agent, any customer. Founder asks; NURA returns. Same voice, same signature patterns from Step 5.4.

For each cadence, write:
- Cadence name
- Schedule (cron-style or human-readable)
- Inputs read (from nura schema tables, GitHub Projects, etc.)
- Output content (what it tells the founder)
- Output channel (chat in Phase 1; voice and video added in Part 13)
- Trigger override (founder can postpone, cancel, or interrupt any scheduled brief)

Output a single Operating Rhythm document.
```

**Expected output:**
A NURA Operating Rhythm document, committed to the repository at `docs/nura-operating-rhythm.md`.

**Founder approval checkpoint:**
Confirm five cadence types with concrete schedules. Confirm each cadence has defined inputs and outputs, not "NURA decides what's relevant" hand-waving. Confirm the founder has explicit override at any cadence (briefs are servants, not masters).

**Test to run:**
Take one cadence (morning brief). Walk through it manually with NURA's current Claude-based assistant — feed it the inputs the cadence would read, ask it to produce the output. The output should be recognisably a "NURA morning brief" per the brand voice guide from Step 5.4.

**Success looks like:**
A rhythm document that, when handed to n8n automation in a later step (or to the Command Centre app), produces structured, scheduled outputs the founder actually wants to read.

**If it fails:**
If the briefs are too long or read like raw data dumps, the rhythm is over-engineered — cut. If they're too short to be useful, expand the input list.

**Next step:**
Step 5.6.

---

### Step 5.6 — Define the hub-and-spoke topology and pod-lead role scaffolding

**Goal:**
Lock the hub-and-spoke topology in NURA's memory: NURA at centre, founder co-equal at centre, Kael / Mira / Senna as the three Phase 1 spokes, with explicit scaffolding for what each pod-lead will own when fully built. This step does not build Kael, Mira or Senna as full agents — it scaffolds their roles in NURA's routing logic so when they are built later (as their own future Build Manual parts) their place is already defined.

**Build worker to use:**
Claude, to draft. Founder, to approve.

**Skill to use:**
`nura-agent-builder`.

**MCP or integration needed:**
None.

**Source context to provide:**
This step. Step 5.1 role definition (especially the hub-and-spoke topology section). File 01 — NURA orchestrates three pod-lead agents: Kael (Revenue), Mira (Product Engineering), Senna (Success & Risk).

**Prompt to paste:**
```
Write the NURA Hub-and-Spoke Topology and Pod-Lead Scaffolding document, applying the nura-agent-builder skill.

The topology is NURA at the centre, the founder co-equal at the centre next to NURA, and three pod-lead agents on spokes: Kael (Revenue), Mira (Product Engineering), Senna (Success & Risk). Additional pods (Marketing, Legal, Finance) are deferred to later phases when business need is clear and named.

This document scaffolds the three Phase 1 pod-leads. It does not build them as full agents — those are future Build Manual parts. It defines their role so NURA can route work to them once they exist, and so the founder has a clear picture of what each pod owns.

For each of the three pod-leads, write:

1. **Pod name and lead agent name.** e.g., Revenue pod — Kael.

2. **Scope — what the pod does (concrete responsibilities).**
   - **Kael (Revenue):** copy and content drafting, lead generation, initial lead communication, early query handling, founder-approved outreach sequences, reply classification, meeting booking. Kael is the only pod-lead with customer-facing communication; everything customer-facing requires founder approval in Phase 1.
   - **Mira (Product Engineering):** per-customer DINA deployment, customer technical query handling, customer technical problem solving, integration setup, configuration management. Mira works with the technical partner during the engineer-review gate (per Solo Build Boundary Map).
   - **Senna (Success & Risk):** customer health monitoring, evaluation and drift detection, audit log review, KPI tracking, escalation when customer signals turn negative. Senna does not act on customers; Senna informs the founder.

3. **Boundaries.** What the pod-lead never does. Each pod-lead is internal-first in Phase 1. None of them sends external customer messages without founder approval. None of them edits locked source files. None of them touches real customer HR data outside of the approved boundary review gate.

4. **NURA orchestration interface.** How NURA routes work to this pod-lead. Which `nura` schema tables track pod-lead work. What NURA expects back (output format, cadence).

5. **Build readiness.** Phase 1 status (Kael: build active in Part 12; Mira: scaffolding only, full build in a future Part; Senna: scaffolding only, full build in a future Part). Note any blockers preventing earlier build.

6. **Future pods.** A short note that Marketing, Legal, Finance and other functional pods may be added later — and the criterion for adding them: a named, recurring business need that the founder cannot or should not absorb personally and that does not fit cleanly into an existing pod.

7. **Capability registry.** Each pod lead owns specific capability areas inherited from the earlier 14-agent plan. These are capability labels, not active agents. Reproduce the canonical Pod Capability Registry from File 04 here:
   - **Kael** owns: Myra capability (prospecting and outreach), Zaid capability (discovery and qualification), Ayaan capability (scoping and solution design), Raya capability (proposals and pricing).
   - **Mira** owns: Sara capability (HR solutions and DINA workflow design — the only Phase 1 active capability), Omar capability (future finance solutions), Lina capability (future operations, planning and supply chain solutions), Rayyan capability (future commercial and customer solutions).
   - **Senna** owns: Amal capability (client success and adoption), Noor capability (QA, compliance and governance).
   - None of these capability names are active agents in Phase 1. They are scopes under their pod lead.

Output the topology document, including a simple ASCII or text diagram of the hub-and-spoke (NURA + Founder at centre, three spokes labelled Kael, Mira, Senna, dotted lines indicating future pods), and the capability registry as a sub-section.
```

**Expected output:**
A NURA Hub-and-Spoke Topology document, committed to the repository at `docs/nura-topology-and-pods.md`.

**Founder approval checkpoint:**
Confirm the topology is flat hub-and-spoke, not vertical hierarchy. Confirm each pod-lead has concrete responsibilities (not generic "owns X function" placeholders). Confirm Phase 1 build status is accurate: Kael in Part 12, Mira and Senna scaffolded but not built. Confirm the criterion for adding future pods (Marketing, Legal, Finance) is explicit — they are added when business need names them, not by template.

**Test to run:**
Hand the document to NURA's Claude-based assistant. Ask: "I have a new build task — a customer wants a custom workflow added to their DINA deployment. Which pod owns this?" NURA should route to Mira (Product Engineering) and explain why, citing the scope from this document.

**Success looks like:**
A topology document NURA can use as a routing reference. Mira and Senna's roles are scaffolded in `nura` schema memory so future build work can extend them without re-litigating scope.

**If it fails:**
If the scope between pods is fuzzy, sharpen it. If a single piece of customer-facing work could be routed to two pods, the scope boundary is wrong — fix it.

**Next step:**
Step 5.7.

---

### Step 5.7 — Define NURA's KPI framework

**Goal:**
Define how NURA measures its own performance. Four KPI categories: Orchestration, Founder Support, System Health, External Representation (the last is Part 13 territory — KPIs defined now, measured later). This is the framework that tells the founder whether NURA is actually adding value.

**Build worker to use:**
Claude, to draft. Founder, to approve.

**Skill to use:**
`nura-agent-builder` and `nura-product-requirement-writer`.

**MCP or integration needed:**
None.

**Source context to provide:**
This step. Step 5.1 role definition. The eight operating principles.

**Prompt to paste:**
```
Write the NURA KPI Framework, applying the nura-agent-builder and nura-product-requirement-writer skills.

NURA measures itself across four categories. For each KPI: define it, set target direction (up / down / hold), say where the data comes from, and say when it is reviewed.

A. **Orchestration KPIs.**
- Handoff validation rate (percentage of inter-pod handoffs validated before the receiving pod starts work). Target: up.
- Handoff repair rate (how often NURA fixes incomplete handoffs vs escalating). Target: holds steady once a baseline exists.
- Cross-pod conflict resolution time (from detection to resolution or escalation). Target: down.
- Stalled workflow detection lead time (how early NURA catches things going cold before the founder notices). Target: up (earlier).

B. **Founder Support KPIs.**
- Founder time saved per week (self-reported by founder weekly). Target: up.
- Decision latency reduction (time from question asked to founder decision made, when NURA is involved). Target: down.
- Morning and evening brief delivery reliability (daily target: 100% on schedule). Target: hold at 100%.
- Brief quality score (founder weekly rubric: was this brief actually useful, 1-5). Target: up, with floor of 4.

C. **System Health KPIs.**
- Cross-schema data consistency (no orphan records between nura schema and dina schema). Target: hold at zero orphans.
- HITL threshold adherence (false escalations rate, missed escalations rate). Target: both down.
- Founder override rate (how often the founder overrides NURA's recommendation). Target: this is informational, not "down" — a healthy rate means NURA is taking real positions; zero would mean NURA isn't taking positions.
- Memory recall accuracy (when NURA cites prior decisions, are the citations correct). Target: hold at 100%.

D. **External Representation KPIs (Part 13 measurement, defined now).**
- Demo conversion rate when NURA participates (deferred until NURA is deployed externally in Part 13).
- Investor meeting sentiment (qualitative, per meeting, deferred until Step 8 gate is met and investor meetings begin).
- Video session technical reliability (deferred until video avatar deployed in Part 13).
- Brand voice consistency score (cross-channel, deferred until NURA appears on more than one external channel).

For each KPI, also note: which `nura` schema table or `dina` schema table (where applicable) provides the data. The framework should be implementable from data NURA already has access to.

Output a NURA KPI Framework document.
```

**Expected output:**
A NURA KPI Framework document, committed to the repository at `docs/nura-kpi-framework.md`.

**Founder approval checkpoint:**
Confirm the four categories. Confirm Orchestration and Founder Support KPIs are measurable from data NURA already has in `nura` schema. Confirm the founder override rate is correctly framed as informational, not as a "drive to zero" metric (a healthy NURA *gets* overridden sometimes — that means it's taking real positions). Confirm External Representation KPIs are explicitly deferred to Part 13.

**Test to run:**
Pick one Orchestration KPI (handoff validation rate). Confirm that data exists or can exist in the `nura` schema to compute it. If the data path is unclear, the KPI is aspirational — either fix the schema gap or remove the KPI.

**Success looks like:**
A KPI framework the founder can use in the Weekly review (Step 5.5) to see whether NURA is actually working. Each KPI has a data source, a measurement cadence, and a target direction.

**If it fails:**
If most KPIs require data that doesn't exist in `nura` schema, the framework is aspirational. Cut to measurable ones first; expand later as schema grows.

**Next step:**
Part 6, Step 6.1. (Future: Part 13 will be NURA Persona Production — video avatar build via HeyGen, voice via ElevenLabs, NURA avatar / voice / persona-led external channel activation, public deployment. Part 13 is gated on Phase 1 build stability and the locked Step 8 conditions in File 00.)

---

# Part 6 — DINA Product Foundation

This part builds the DINA HR Ops Starter product foundation: the data model is already in Supabase from Part 2; this part builds the helpdesk interface, the employee request interface, the HR inbox, the approval queue and the audit trail view. DINA is the first NURA product. It is an HR workflow execution agent with a helpdesk interface. It is not a chatbot.

---

### Step 6.1 — Write the DINA product foundation requirement

**Goal:**
Write the product requirement for the DINA HR Ops Starter foundation: the interface, the request flow, the HR inbox, the approval queue and the audit view.

**Build worker to use:**
Claude, to draft. Founder, to approve.

**Skill to use:**
`nura-product-requirement-writer` and `dina-hr-agent-product-builder`.

**MCP or integration needed:**
None.

**Source context to provide:**
File 02, the DINA HR Knowledge Base — the product definition, the active modules M07, M03, M14, the five-state HITL model. File 04, the agent configuration and the DINA helpdesk router. File 06 - Phase 1 Stack Decision — the interface is a thin layer over the workflow-and-data foundation; logic and data do not live in the interface.

**Prompt to paste:**
```
Write the product requirement for the DINA HR Ops Starter product foundation, applying the nura-product-requirement-writer and dina-hr-agent-product-builder skills.

DINA is NURA's first product. It is an HR workflow execution agent with a helpdesk interface. It is not a chatbot, not an FAQ bot. It executes HR workflows and a human approves decisions.

The starter modules are M07 Employee Records and Service, M03 Onboarding, and M14 Offboarding.

The foundation needs:
1. A helpdesk-style interface where an employee submits an HR request — it is a structured request interface, not a chat window.
2. An HR inbox where HR sees incoming requests and their workflow status.
3. An approval queue where HR acts on the Approve-before-action and Escalate gates of the five-state HITL model.
4. An audit trail view showing the immutable record of what happened on each case.
5. All of it reads and writes the dina Supabase schema and triggers n8n workflows. The interface holds no business logic and no data of its own.

Write a clear product requirement: the screens, what each shows, the data source. Do not turn DINA into a chatbot. Do not add modules beyond M07, M03, M14.

Output a product requirement document.
```

**Expected output:**
A DINA product foundation requirement covering the helpdesk interface, employee request interface, HR inbox, approval queue and audit trail.

**Founder approval checkpoint:**
Confirm DINA is described as a workflow execution agent with a helpdesk interface, not a chatbot. Confirm the interface holds no logic or data — it is a thin layer. Confirm only M07, M03, M14 are in scope.

**Test to run:**
Run the requirement through the `nura-source-truth-guardian` skill. It must pass the product direction check.

**Success looks like:**
A requirement that passes source-truth review and correctly defines DINA.

**If it fails:**
If the requirement drifts toward a chatbot or adds modules, regenerate with the correction.

**Next step:**
Step 6.2.

---

### Step 6.2 — Build the employee request interface

**Goal:**
Build the helpdesk-style interface where an employee submits a structured HR request.

**Build worker to use:**
Claude Code or Codex, to build. Technical partner, to review and deploy. Founder, to test.

**Skill to use:**
`dina-hr-agent-product-builder` and `supabase-n8n-product-foundation-builder`.

**MCP or integration needed:**
GitHub MCP, for the code. Supabase MCP, read-only, to confirm the schema. The interface will trigger n8n via the webhook pattern from Step 3.4.

**Source context to provide:**
The Step 6.1 requirement. The `dina` schema, especially the HR Requests table. The webhook pattern from Step 3.4. The list of HR request types from File 03 — letter requests, record and service requests, and the onboarding and offboarding triggers.

**Prompt to paste:**
```
Build the DINA employee request interface, applying the dina-hr-agent-product-builder and supabase-n8n-product-foundation-builder skills.

This is a helpdesk-style interface. An employee selects the kind of HR request and fills a structured form. It is not a chat window.

Requirements:
- The employee signs in through Supabase Auth and is tied to one customer.
- They can submit requests covered by M07, M03 and M14: for example an employee letter request, an employee record or service request, and the requests that begin onboarding and offboarding.
- Submitting a request writes a row to the dina HR Requests table with the correct customer_id, and triggers the matching n8n workflow through the standard webhook.
- The employee can see the status of their own requests, and only their own.
- The interface holds no business logic. Classification, drafting and approval all happen in the n8n workflows.

Build it as a real, maintainable web app in the nura-build repository. Output the code and run steps.

Here is the requirement and schema:
[paste Step 6.1 requirement and the dina HR Requests table]
```

**Expected output:**
A working employee request interface that writes to the `dina` schema and triggers n8n.

**Founder approval checkpoint:**
Confirm it is a structured request interface, not a chat window. Confirm an employee sees only their own requests. Confirm submitting a request creates a correctly customer-scoped row.

**Test to run:**
Sign in as a test employee of test customer A. Submit a letter request. Confirm a row appears in the HR Requests table with customer A's customer_id. Sign in as a customer B employee and confirm customer A's request is not visible.

**Success looks like:**
Employees submit structured requests; requests are customer-isolated; n8n is triggered.

**If it fails:**
If cross-customer requests are visible, the RLS from Step 2.5 is not being applied through the interface; stop and fix it. If n8n is not triggered, check the webhook URL.

**Next step:**
Step 6.3.

---

### Step 6.3 — Build the HR inbox

**Goal:**
Build the HR inbox where HR users see incoming requests, workflow status and what needs attention.

**Build worker to use:**
Claude Code or Codex, to build. Technical partner, to review. Founder, to test.

**Skill to use:**
`dina-hr-agent-product-builder`.

**MCP or integration needed:**
GitHub MCP and Supabase MCP, read-only.

**Source context to provide:**
The Step 6.1 requirement. The `dina` schema — HR Requests, New Joiners, Offboarding Cases, Workflow Steps. The dashboard fields from File 03 and File 04.

**Prompt to paste:**
```
Build the DINA HR inbox, applying the dina-hr-agent-product-builder skill.

The HR inbox is the screen HR users work from. It shows:
- All HR requests for their customer, with status, current step, next action owner and SLA status.
- Onboarding cases and offboarding cases and their stage.
- A clear view of what is waiting on HR.

Rules:
- HR users see only their own customer's data, enforced by row-level security.
- The inbox reads the dina schema. It does not duplicate data.
- It links each case to its detail and, where relevant, to its approval.

Build it in the nura-build repository as part of the DINA app. Output the code and run steps.
```

**Expected output:**
A working HR inbox showing requests, onboarding and offboarding cases for the HR user's customer.

**Founder approval checkpoint:**
Confirm HR sees only their own customer's cases. Confirm SLA status and next action owner are visible — HR must see what is at risk and who owns it.

**Test to run:**
Sign in as HR for customer A. Confirm all of customer A's test requests appear and none of customer B's.

**Success looks like:**
A working, customer-isolated HR inbox.

**If it fails:**
If another customer's cases appear, stop and fix RLS. If SLA status is missing, confirm the field mapping from the schema.

**Next step:**
Step 6.4.

---

### Step 6.4 — Build the approval queue

**Goal:**
Build the approval queue where HR acts on the human decision gates — the Approve-before-action and Escalate states of the five-state HITL model.

**Build worker to use:**
Claude Code or Codex, to build. Technical partner, to review. Founder, to test.

**Skill to use:**
`dina-hr-agent-product-builder` and `nura-security-approval-guardrail`.

**MCP or integration needed:**
GitHub MCP and Supabase MCP, read-only.

**Source context to provide:**
The Step 6.1 requirement. The `dina` Approvals table. The five-state HITL model from File 02 Section 12 — Auto, Notify, Approve before action, Escalate, Block. The governance principle: AI owns execution, humans own decisions.

**Prompt to paste:**
```
Build the DINA approval queue, applying the dina-hr-agent-product-builder and nura-security-approval-guardrail skills.

The approval queue is where a human makes the decisions that AI must not make alone. It implements the human side of the five-state HITL model.

Requirements:
- It shows every approval in the Pending state for the HR user's customer.
- For each approval it shows: what is being approved, the related case, the module, the gate type, the DINA recommendation, and the approver role.
- The HR user can Approve, Reject or Escalate. The action writes the decision, the decider and the time to the Approvals table, and writes an audit row recording the gate state applied.
- After a decision, the linked n8n workflow continues. Before a decision, it cannot continue.
- Customer isolation applies: a user sees only their own customer's approvals.

Build it in the nura-build repository as part of the DINA app. Output the code and run steps.
```

**Expected output:**
A working approval queue that records human decisions, writes audit rows, and gates the workflows.

**Founder approval checkpoint:**
This is a high-severity checkpoint. Confirm a workflow cannot proceed past an Approve-before-action gate without a human decision. Confirm every decision writes an audit row. This is the proof that humans own decisions.

**Test to run:**
Create a test approval. Confirm the linked workflow is paused. Approve it. Confirm the workflow continues and an audit row records the approval, the approver and the gate state.

**Success looks like:**
Workflows pause at human gates and only continue after a recorded human decision.

**If it fails:**
If a workflow proceeds without approval, the gate is not enforced; stop and fix it before Part 7.

**Next step:**
Step 6.5.

---

### Step 6.5 — Build the audit trail view

**Goal:**
Build the audit trail view that shows the immutable record of everything that happened on a case.

**Build worker to use:**
Claude Code or Codex, to build. Founder, to test.

**Skill to use:**
`dina-hr-agent-product-builder`.

**MCP or integration needed:**
GitHub MCP and Supabase MCP, read-only.

**Source context to provide:**
The Step 6.1 requirement. The `dina` Audit Logs table from Step 2.6. The rule that audit logs are append-only.

**Prompt to paste:**
```
Build the DINA audit trail view, applying the dina-hr-agent-product-builder skill.

The audit trail view shows, for any HR case, the full immutable record from the audit_logs table: every event, with timestamp, event type, actor, the HITL gate state applied, before and after values, and the source knowledge layer.

Requirements:
- The view is read-only. No user can edit or delete an audit entry from the interface.
- It is reachable from any case in the HR inbox.
- Customer isolation applies: a user sees only their own customer's audit history.

Build it in the nura-build repository as part of the DINA app. Output the code and run steps.
```

**Expected output:**
A read-only audit trail view, reachable from any case, customer-isolated.

**Founder approval checkpoint:**
Confirm the audit view is read-only and cannot be edited from the interface. Confirm it shows the HITL gate state for each event — that is the governance evidence.

**Test to run:**
Open a test case that has been through an approval. Confirm the audit view shows the request creation, the approval request, the human decision and the gate state, and that nothing can be edited.

**Success looks like:**
A complete, read-only, customer-isolated audit trail for every case.

**If it fails:**
If an entry can be edited, the view is writing to the table; make it strictly read-only.

**Next step:**
Part 7, Step 7.1.

---

# Part 7 — DINA Workflow Orchestration

This part builds the six DINA HR Ops Starter workflows in n8n. Each workflow is built the same way, with the same template, reusing the webhook and error patterns from Part 3 and enforcing the five-state HITL model through the approval queue from Part 6. The six workflows, drawn from File 03's normalised workflow library and File 04's build instruction, are:

1. Employee Letter Request
2. Employee Record Lifecycle and Service Request
3. Pre-Joining and Employment Readiness
4. First-Day and Onboarding Programme
5. New Joiner Workplace Access Provisioning
6. Employee Resignation and Offboarding

---

### Step 7.1 — Build Workflow 1: Employee Letter Request

**Goal:**
Build the Employee Letter Request workflow in n8n end to end: intake, eligibility check, AI drafting, human approval, issuance and audit.

**Build worker to use:**
Founder, to build in the n8n canvas, with technical partner support. Claude, to generate the node-by-node build guide.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
The n8n Supabase connection. The AI model credential from Step 3.2. No new MCP.

**Source context to provide:**
File 03, WF-01 Employee Letter Request and Issuance — the normalised workflow, its steps, build objects, dashboard fields, audit events and test cases. File 02 Section 14 (Standard Workflow Behaviour) and the WF-M07-001 card in File 03 — for prompt and configuration patterns. The `dina` schema HR Requests, Approvals, Documents and Audit Logs tables. The webhook and error patterns from Step 3.4. The five-state HITL model.

**Prompt to paste:**
```
Give me a node-by-node n8n build guide for the DINA Employee Letter Request workflow, applying the nura-workflow-builder skill. I am a non-coder building this in the n8n canvas with technical partner support.

I am providing the normalised workflow WF-01 from File 03 and the configuration from File 04.

The workflow must:
1. Start from the standard webhook trigger when an employee submits a letter request.
2. Validate the request and write or update the HR Requests row in the dina schema.
3. Run an eligibility check.
4. Call the AI model to draft the letter, using the correct template and language, citing the source knowledge layer.
5. Stop at an Approve-before-action HITL gate: create an Approvals row and pause. The workflow must not continue until the approval queue records a human decision.
6. On approval, finalise the document, store it in Supabase Storage, and mark the request Issued.
7. Write audit rows at every significant event, recording the HITL gate state.
8. Use the standard error-handling pattern throughout.

For each node give the node type, the settings, and what I should see. Map every step back to WF-01.

Here is WF-01 and the File 04 configuration:
[paste File 03 WF-M07-001 card, plus File 02 Section 14]
```

**Expected output:**
A complete Employee Letter Request workflow in n8n, with the HITL gate enforced and audit rows written.

**Founder approval checkpoint:**
Confirm the workflow pauses at the Approve-before-action gate and cannot issue a letter without a human approval. Confirm every step writes an audit row with the gate state. Confirm the drafted letter cites its source layer.

**Test to run:**
Use the test cases from File 03 WF-01. Submit a test salary certificate request with non-sensitive data. Confirm the workflow drafts, pauses for approval, and only issues after approval, with a full audit trail.

**Success looks like:**
A letter request runs end to end, the human gate holds, and the audit trail is complete.

**If it fails:**
If the letter issues without approval, the gate is broken; stop and fix it. If drafting is wrong, check the model prompt and the template selection against File 04.

**Next step:**
Step 7.2.

---

### Step 7.2 — Build Workflow 2: Employee Record Lifecycle and Service Request

**Goal:**
Build the Employee Record Lifecycle and Service Request workflow in n8n end to end.

**Build worker to use:**
Founder, to build in n8n, with technical partner support. Claude, to generate the build guide.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
The n8n Supabase connection and the AI model credential. No new MCP.

**Source context to provide:**
File 03, WF-02 Employee Record Lifecycle and Service Request. File 02 Section 14 (Standard Workflow Behaviour) and the WF-M07-002 card (Card 1A) in File 03 — for prompt and configuration patterns. The `dina` schema HR Requests, Employees, Approvals and Audit Logs tables. The Part 3 webhook and error patterns. The five-state HITL model.

**Prompt to paste:**
```
Give me a node-by-node n8n build guide for the DINA Employee Record Lifecycle and Service Request workflow, applying the nura-workflow-builder skill. I am a non-coder building in the n8n canvas with partner support.

I am providing WF-02 from File 03 and the configuration from File 04.

The workflow must:
1. Start from the standard webhook trigger.
2. Classify the service request and validate it, updating the HR Requests row in the dina schema.
3. Apply the correct HITL state per the five-state model — some record updates may be Auto or Notify, others need Approve-before-action; follow WF-02.
4. Where a human gate applies, create an Approvals row and pause until the approval queue records a decision.
5. Update the Employees record only as the workflow and the gates allow.
6. Write audit rows at every significant event with the gate state.
7. Use the standard error-handling pattern.

For each node give the node type, settings and what I should see. Map every step to WF-02.

Here is WF-02 and the File 04 configuration:
[paste File 03 WF-M07-002 card (Card 1A), plus File 02 Section 14]
```

**Expected output:**
A complete Employee Record Lifecycle and Service Request workflow in n8n, with HITL states applied per WF-02.

**Founder approval checkpoint:**
Confirm the workflow applies the correct HITL state at each step — not everything is Auto, and anything affecting the employee record where judgement is needed has a human gate. Confirm audit rows record the gate state.

**Test to run:**
Use the File 03 WF-02 test cases with non-sensitive data. Confirm record updates that need approval pause for it, and Auto steps complete cleanly, all with an audit trail.

**Success looks like:**
The workflow runs end to end with correct HITL states and a complete audit trail.

**If it fails:**
If a judgement step runs as Auto, correct the gate against WF-02 before continuing.

**Next step:**
Step 7.3.

---

### Step 7.3 — Build Workflow 3: Pre-Joining and Employment Readiness

**Goal:**
Build the Pre-Joining and Employment Readiness workflow in n8n end to end.

**Build worker to use:**
Founder, to build in n8n, with technical partner support. Claude, to generate the build guide.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
The n8n Supabase connection and the AI model credential. No new MCP.

**Source context to provide:**
File 03, WF-03 Onboarding: Pre-Joining and Documentation. File 02 Section 14 (Standard Workflow Behaviour) and the WF-M03-001 card in File 03 — for prompt and configuration patterns. The `dina` schema New Joiners, Workflow Steps, Approvals and Audit Logs tables. The Part 3 patterns. The five-state HITL model.

**Prompt to paste:**
```
Give me a node-by-node n8n build guide for the DINA Pre-Joining and Employment Readiness workflow, applying the nura-workflow-builder skill. I am a non-coder building in the n8n canvas with partner support.

I am providing WF-03 from File 03 and the configuration from File 04.

The workflow must:
1. Start from the standard webhook trigger when a new joiner case begins.
2. Create or update the New Joiners row and its Workflow Steps in the dina schema.
3. Manage the document collection checklist and the readiness checks described in WF-03.
4. Apply the correct HITL states; where a human readiness sign-off is required, create an Approvals row and pause.
5. Track stage progression through the New Joiners stages.
6. Write audit rows at every significant event with the gate state.
7. Use the standard error-handling pattern.

For each node give the node type, settings and what I should see. Map every step to WF-03.

Here is WF-03 and the File 04 configuration:
[paste File 03 WF-M03-001 card, plus File 02 Section 14]
```

**Expected output:**
A complete Pre-Joining and Employment Readiness workflow in n8n.

**Founder approval checkpoint:**
Confirm the document checklist and readiness checks match WF-03. Confirm human sign-off gates pause the workflow. Confirm audit rows are written.

**Test to run:**
Use the File 03 WF-03 test cases with a test new joiner. Confirm the checklist progresses, readiness sign-off pauses for a human, and the audit trail is complete.

**Success looks like:**
The workflow runs end to end, checklist and gates working, audit complete.

**If it fails:**
If stage progression is wrong, check the New Joiners stage mapping against the schema and WF-03.

**Next step:**
Step 7.4.

---

### Step 7.4 — Build Workflow 4: First-Day and Onboarding Programme

**Goal:**
Build the First-Day and Onboarding Programme workflow in n8n end to end.

**Build worker to use:**
Founder, to build in n8n, with technical partner support. Claude, to generate the build guide.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
The n8n Supabase connection and the AI model credential. No new MCP.

**Source context to provide:**
File 03, WF-04 Onboarding: Joining and Induction. File 02 Section 14 (Standard Workflow Behaviour) and the WF-M03-002 card in File 03 — for prompt and configuration patterns. The `dina` schema New Joiners, Workflow Steps, Notifications and Audit Logs tables. The Part 3 patterns. The five-state HITL model.

**Prompt to paste:**
```
Give me a node-by-node n8n build guide for the DINA First-Day and Onboarding Programme workflow, applying the nura-workflow-builder skill. I am a non-coder building in the n8n canvas with partner support.

I am providing WF-04 from File 03 and the configuration from File 04.

The workflow must:
1. Start from the standard webhook trigger or a scheduled trigger tied to the start date.
2. Drive the first-day and induction programme steps from WF-04, updating Workflow Steps in the dina schema.
3. Produce the notifications the programme requires; notifications follow the HITL model — drafted and, where required, approved before sending.
4. Apply the correct HITL states; pause where a human gate applies.
5. Track stage progression to Joined.
6. Write audit rows at every significant event with the gate state.
7. Use the standard error-handling pattern.

For each node give the node type, settings and what I should see. Map every step to WF-04.

Here is WF-04 and the File 04 configuration:
[paste File 03 WF-M03-002 card, plus File 02 Section 14]
```

**Expected output:**
A complete First-Day and Onboarding Programme workflow in n8n.

**Founder approval checkpoint:**
Confirm the induction steps match WF-04. Confirm notifications follow the HITL model and are not sent without the required gate. Confirm audit rows are written.

**Test to run:**
Use the File 03 WF-04 test cases. Confirm the programme steps run, notifications follow their gates, and the case reaches Joined with a full audit trail.

**Success looks like:**
The workflow runs end to end with correct gates and audit.

**If it fails:**
If a notification sends without its gate, correct it against the HITL model before continuing.

**Next step:**
Step 7.5.

---

### Step 7.5 — Build Workflow 5: New Joiner Workplace Access Provisioning

**Goal:**
Build the New Joiner Workplace Access Provisioning workflow in n8n end to end.

**Build worker to use:**
Founder, to build in n8n, with technical partner support. Claude, to generate the build guide.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
The n8n Supabase connection and the AI model credential. No new MCP.

**Source context to provide:**
File 03, WF-05 New Joiner Workplace Access Provisioning. File 02 Section 14 (Standard Workflow Behaviour) and the WF-M03-003 card in File 03 — for prompt and configuration patterns. The `dina` schema New Joiners, Workflow Steps, Approvals and Audit Logs tables. The Part 3 patterns. The five-state HITL model.

**Prompt to paste:**
```
Give me a node-by-node n8n build guide for the DINA New Joiner Workplace Access Provisioning workflow, applying the nura-workflow-builder skill. I am a non-coder building in the n8n canvas with partner support.

I am providing WF-05 from File 03 and the configuration from File 04.

The workflow must:
1. Start from the standard webhook trigger when access provisioning is required for a new joiner.
2. Create the access provisioning Workflow Steps in the dina schema, with the correct owners — DINA, HR Operations, IT, Security per WF-05.
3. Route each access item to its owner and track completion.
4. Apply the correct HITL states; access grants that need human authorisation pause at an Approve-before-action gate.
5. Track provisioning to complete.
6. Write audit rows at every significant event with the gate state, including an access-issued event.
7. Use the standard error-handling pattern.

For each node give the node type, settings and what I should see. Map every step to WF-05.

Here is WF-05 and the File 04 configuration:
[paste File 03 WF-M03-003 card, plus File 02 Section 14]
```

**Expected output:**
A complete New Joiner Workplace Access Provisioning workflow in n8n.

**Founder approval checkpoint:**
Confirm access items route to the correct owners. Confirm access grants needing authorisation pause for a human. Confirm an access-issued audit event is written.

**Test to run:**
Use the File 03 WF-05 test cases. Confirm access items route, authorisation gates pause, and access-issued events appear in the audit trail.

**Success looks like:**
The workflow runs end to end, routing and gates working, audit complete.

**If it fails:**
If access is issued without authorisation, correct the gate before continuing.

**Next step:**
Step 7.6.

---

### Step 7.6 — Build Workflow 6: Employee Resignation and Offboarding

**Goal:**
Build the Employee Resignation and Offboarding workflow in n8n end to end.

**Build worker to use:**
Founder, to build in n8n, with technical partner support. Claude, to generate the build guide.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
The n8n Supabase connection and the AI model credential. No new MCP.

**Source context to provide:**
File 03, WF-06 Offboarding: Resignation and Final Settlement. File 02 Section 14 (Standard Workflow Behaviour) and the WF-M14-001 card in File 03 — for prompt and configuration patterns. The `dina` schema Offboarding Cases, Workflow Steps, Approvals, Documents and Audit Logs tables. The Part 3 patterns. The five-state HITL model.

**Prompt to paste:**
```
Give me a node-by-node n8n build guide for the DINA Employee Resignation and Offboarding workflow, applying the nura-workflow-builder skill. I am a non-coder building in the n8n canvas with partner support.

I am providing WF-06 from File 03 and the configuration from File 04.

The workflow must:
1. Start from the standard webhook trigger when a resignation is received.
2. Create the Offboarding Case and its Workflow Steps in the dina schema.
3. Drive the offboarding stages from WF-06: HR review, notice period, clearance, asset return, and the handoffs.
4. Apply the correct HITL states; resignation acceptance, clearance sign-off and final document release are human-gated — pause at those gates.
5. Produce the offboarding documents — for example a resignation acceptance letter and an exit clearance form — following the HITL model.
6. Mark the V1 handoffs for immigration cancellation and final settlement as design-only handoff points, not active builds.
7. Write audit rows at every significant event with the gate state.
8. Use the standard error-handling pattern.

For each node give the node type, settings and what I should see. Map every step to WF-06.

Here is WF-06 and the File 04 configuration:
[paste File 03 WF-M14-001 card, plus File 02 Section 14]
```

**Expected output:**
A complete Employee Resignation and Offboarding workflow in n8n.

**Founder approval checkpoint:**
Confirm resignation acceptance, clearance sign-off and final document release are human-gated. Confirm the immigration and final-settlement handoffs are treated as design-only handoff points, not built as active workflows — M15 and M05 are V1. Confirm audit rows are written.

**Test to run:**
Use the File 03 WF-06 test cases. Confirm the offboarding stages run, the human gates hold, documents follow their gates, and the audit trail is complete.

**Success looks like:**
The workflow runs end to end, gates holding, V1 handoffs marked, audit complete.

**If it fails:**
If a V1 handoff is built as an active workflow, remove it — only M07, M03, M14 are active. If a gate is missing, correct it.

**Next step:**
Part 8, Step 8.1.

---

# Part 8 — AI Model and Prompt Layer

This part defines the AI model and prompt layer that the Part 7 workflows call: model routing, prompt templates, classification prompts, drafting prompts, review prompts and the source citation rule. The prompts are stored in the repository and version-controlled, so every workflow uses the same governed prompt.

---

### Step 8.1 — Define model routing

**Goal:**
Define which AI model is used for which kind of task, and store that routing as a reference the workflows follow.

**Build worker to use:**
Claude, to draft. Founder, to approve. Technical partner, to confirm against the n8n setup.

**Skill to use:**
`dina-hr-agent-product-builder` and `nura-architecture-reviewer`.

**MCP or integration needed:**
None.

**Source context to provide:**
This step. File 05 and File 06 — the model routing research and the locked model routing policy. Claude is the primary reasoning model and routing stays flexible.

**Prompt to paste:**
```
Define the AI model routing for the DINA workflows, applying the dina-hr-agent-product-builder and nura-architecture-reviewer skills.

Use the model routing research and policy from File 05 and File 06 as the basis. Do not invent a new policy.

Define:
1. The primary reasoning model for DINA workflow tasks.
2. Which task types exist — classification, drafting, review — and which model serves each.
3. How routing stays flexible so a model can be swapped without rebuilding workflows.
4. Where the routing is configured in n8n.

Output a clear model routing reference.
```

**Expected output:**
A model routing reference: primary model, task-type routing, flexibility approach.

**Founder approval checkpoint:**
Confirm the routing matches the locked policy in File 05 and File 06. Confirm routing is flexible — a model swap should not require rebuilding workflows.

**Test to run:**
Read the reference. Confirm a workflow builder could configure the model for a task from it.

**Success looks like:**
A clear, source-aligned model routing reference.

**If it fails:**
If the routing contradicts File 06, regenerate against the locked policy.

**Next step:**
Step 8.2.

---

### Step 8.2 — Build the prompt template library

**Goal:**
Build the version-controlled library of prompt templates the workflows use: classification, drafting and review prompts, plus the source citation rule.

**Build worker to use:**
Claude, to draft the templates. Founder, to approve. Claude Code, to commit them to the repository.

**Skill to use:**
`dina-hr-agent-product-builder` and `nura-source-truth-guardian`.

**MCP or integration needed:**
GitHub MCP, to store the prompt templates in `nura-build`.

**Source context to provide:**
File 02 DINA fixed lines, HITL rules and source-layer citation rules. File 03 workflow cards for the six active workflows. File 04 canonical DINA data model. File 04 AI governance logging schema. Build Manual Part 7 workflow steps.

**Prompt to paste:**
```
Build the DINA prompt template library, applying the dina-hr-agent-product-builder and nura-source-truth-guardian skills.

Base the templates on:
- File 02 DINA fixed lines, HITL rules and source-layer citation rules
- File 03 workflow cards for the six active workflows
- File 04 canonical DINA data model
- File 04 AI governance logging schema
- Build Manual Part 7 workflow steps

Do not invent new product behaviour.

Produce:
1. Classification prompts — how DINA classifies an incoming request to the right workflow.
2. Drafting prompts — how DINA drafts each document type, using the correct template and language.
3. Review prompts — how a draft is checked before it reaches a human approver.
4. The source citation rule — every answer or document cites whether it used L1, L2 or L3 knowledge, per File 02 Section 15.
5. DINA's fixed lines from File 02 Section 13, so DINA's wording stays consistent.

Each template must keep DINA as a workflow execution agent with a helpdesk interface, never a chatbot.

Output the templates as files for the repository, one clearly named file per template group.

Here is the source material:
[paste File 02 DINA rules, the relevant File 03 workflow cards, File 04 canonical schema fields, File 04 AI governance schema fields, and Build Manual Part 7 workflow steps]
```

**Expected output:**
A set of prompt template files — classification, drafting, review — plus the citation rule and fixed lines, stored in the repository.

**Founder approval checkpoint:**
Run the templates through `nura-source-truth-guardian`. Confirm they keep DINA correctly defined, include the L1/L2/L3 citation rule, and do not introduce chatbot behaviour. Confirm they are version-controlled in Git.

**Test to run:**
Take the drafting prompt for a salary certificate and run it with test data. Confirm the draft is correct and cites its source layer.

**Success looks like:**
A governed, version-controlled prompt library that passes source-truth review.

**If it fails:**
If a template drops the citation rule or drifts toward chat behaviour, regenerate that template with the correction.

**Next step:**
Step 8.3.

---

### Step 8.3 — Wire the prompt layer into the workflows

**Goal:**
Connect the governed prompt templates into the Part 7 workflows, so every workflow uses the version-controlled prompt rather than a prompt typed into a node.

**Build worker to use:**
Founder, to update the workflows in n8n, with technical partner support.

**Skill to use:**
`nura-workflow-builder`.

**MCP or integration needed:**
The n8n Supabase connection and the AI model credential.

**Source context to provide:**
This step. The prompt template library from Step 8.2. The model routing reference from Step 8.1. The six Part 7 workflows.

**Prompt to paste:**
```
Give me a step-by-step guide, applying the nura-workflow-builder skill, to wire the governed prompt templates into the six DINA n8n workflows.

For each workflow, the AI model node should use the correct prompt template from the library and the correct model from the routing reference, rather than a prompt typed directly into the node.

Tell me, per workflow, which template and which model the model node should use, and how to point the node at the governed template.

Keep it simple enough for a non-coder to apply in the n8n canvas.
```

**Expected output:**
The six Part 7 workflows updated to use the governed prompt templates and the model routing.

**Founder approval checkpoint:**
Confirm no workflow has a hand-typed prompt in a node where a governed template exists. Confirm each workflow uses the correct template and model.

**Test to run:**
Re-run the Workflow 1 test from Step 7.1. Confirm it now uses the governed drafting template and still produces a correct, source-cited letter.

**Success looks like:**
Every workflow runs on the governed, version-controlled prompt layer.

**If it fails:**
If a workflow still uses a hand-typed prompt, replace it with the template reference.

**Next step:**
Part 9, Step 9.1.

---

# Part 9 — Testing and Demo

This part proves the real product foundation works: test cases, demo records, red-team tests, HITL tests, privacy tests and a ten-minute demo flow. The demo is a demo of the real product, not a fake. Nothing in this part claims customers or traction.

---

### Step 9.1 — Build the test case suite

**Goal:**
Assemble the full test case suite for the six workflows from the locked test cases.

**Build worker to use:**
Claude, to assemble. Founder, to approve. Technical partner, to confirm coverage.

**Skill to use:**
`dina-hr-agent-product-builder`.

**MCP or integration needed:**
None.

**Source context to provide:**
File 03 — the workflow test cases for WF-01 through WF-06. File 04, Section on test cases. The `dina` schema.

**Prompt to paste:**
```
Assemble the DINA test case suite, applying the dina-hr-agent-product-builder skill.

Use the workflow test cases already defined in File 03 for WF-01 to WF-06 and the test cases in File 04. Do not invent new test logic; assemble what exists into one suite.

For each of the six workflows, produce a test table: the test case, the input, the expected workflow path, the expected HITL gate behaviour, the expected audit events, and the expected final state.

Output one consolidated test suite document.

Here are the source test cases:
[paste File 03 test cases for WF-01 to WF-06 and File 04 test cases]
```

**Expected output:**
A consolidated test suite covering all six workflows.

**Founder approval checkpoint:**
Confirm every workflow has test cases and each test names the expected HITL behaviour and audit events.

**Test to run:**
Pick one test from each workflow and run it against the built workflow. Confirm actual behaviour matches expected.

**Success looks like:**
A complete test suite, and the sampled tests pass.

**If it fails:**
If a test fails, fix the workflow, not the test — the test reflects locked source behaviour.

**Next step:**
Step 9.2.

---

### Step 9.2 — Create demo records

**Goal:**
Create a clean set of demo data — a demo customer, demo employees and demo cases — that shows DINA working on realistic but non-sensitive data.

**Build worker to use:**
Claude, to generate the demo data. Founder, to approve. Technical partner, to load it.

**Skill to use:**
`dina-hr-agent-product-builder`.

**MCP or integration needed:**
Supabase MCP, read-only, to confirm; the partner loads the data with a scoped role.

**Source context to provide:**
This step. The `dina` schema. The rule from File 02: demo data is marked Demo Only and is never real customer data.

**Prompt to paste:**
```
Generate a clean DINA demo dataset, applying the dina-hr-agent-product-builder skill.

Create realistic but entirely fictional data for one demo customer:
- One demo customer, marked Data Status: Demo Only.
- A small set of demo employees.
- A few in-progress cases across M07, M03 and M14, so a demo can show letter requests, an onboarding case and an offboarding case at different stages.

All data must be fictional. No real person, no real company, no private source-company terminology.

Output the demo data as insert-ready rows mapped to the dina schema tables.
```

**Expected output:**
A fictional demo dataset mapped to the `dina` schema, marked Demo Only.

**Founder approval checkpoint:**
Confirm all data is fictional and marked Demo Only. Confirm no private source-company terminology appears. Confirm it sits under one demo customer and respects isolation.

**Test to run:**
Load the data. Open the DINA app as the demo customer's HR user and confirm the demo cases appear.

**Success looks like:**
A clean demo dataset that shows DINA working, clearly marked as demo.

**If it fails:**
If any data looks real or uses source-company terms, regenerate it as fully fictional.

**Next step:**
Step 9.3.

---

### Step 9.3 — Run red-team, HITL and privacy tests

**Goal:**
Stress-test DINA's governance: red-team the workflows, confirm the HITL gates cannot be bypassed, and confirm customer privacy isolation holds.

**Build worker to use:**
Founder, to run the tests. Claude, to generate the red-team test set. Technical partner, to run the technical privacy tests.

**Skill to use:**
`nura-security-approval-guardrail` and `nura-source-truth-guardian`.

**MCP or integration needed:**
Browser / Playwright MCP, for interface testing only. Supabase MCP, read-only.

**Source context to provide:**
This step. File 06 - Phase 1 Stack Decision — the MCP and prompt-injection risks, and the Supabase-Cursor incident pattern. The five-state HITL model. The customer isolation rule from Step 2.5.

**Prompt to paste:**
```
Generate a red-team, HITL and privacy test set for the DINA product foundation, applying the nura-security-approval-guardrail and nura-source-truth-guardian skills.

Produce three groups of tests:

1. Red-team tests. Attempt to make a workflow do something it should not: try prompt injection through an employee-submitted request field, since employee-submitted text is untrusted content. Confirm the workflow does not act on injected instructions.

2. HITL tests. For each human gate in the six workflows, attempt to make the workflow proceed without a human decision. Confirm every gate holds and nothing issues, grants or releases without a recorded human decision.

3. Privacy tests. Confirm a user of one customer cannot see another customer's data through any screen, any workflow or any audit view. Confirm L3 customer knowledge does not leak across customers.

For each test give the steps, the expected safe result, and what a failure would look like.

Output the three test groups.
```

**Expected output:**
A red-team, HITL and privacy test set, with safe expected results.

**Founder approval checkpoint:**
This is a high-severity checkpoint. No demo of DINA happens until these tests pass. Confirm injected instructions are ignored, every HITL gate holds, and no cross-customer data is ever visible.

**Test to run:**
Run all three test groups against the built foundation.

**Success looks like:**
Injection attempts fail safely, every HITL gate holds, and customer isolation is total.

**If it fails:**
If any test fails, stop. Do not demo DINA. Fix the failure, re-test, and only proceed when all three groups pass.

**Next step:**
Step 9.4.

---

### Step 9.4 — Build the ten-minute demo flow

**Goal:**
Build a ten-minute demo flow that shows the real DINA product foundation working end to end.

**Build worker to use:**
Claude, to draft the demo flow. Founder, to rehearse and approve.

**Skill to use:**
`dina-hr-agent-product-builder` and `nura-source-truth-guardian`.

**MCP or integration needed:**
None.

**Source context to provide:**
This step. The demo dataset from Step 9.2. The six built workflows. The rule: this demos the real product; it makes no claim of customers, traction or results.

**Prompt to paste:**
```
Build a ten-minute DINA demo flow, applying the dina-hr-agent-product-builder and nura-source-truth-guardian skills.

This demo shows the real DINA product foundation — the actual Supabase-backed, n8n-driven product — working on the demo dataset. It is not a fake demo and not a slideshow.

The flow should, in ten minutes:
1. Show an employee submitting a structured HR request through the helpdesk interface.
2. Show the n8n workflow executing: classification, drafting, the source-cited output.
3. Show the workflow pausing at the human approval gate.
4. Show an HR user approving in the approval queue.
5. Show the workflow completing and the document issued.
6. Show the audit trail proving AI executed and a human decided.

The script must describe DINA as an HR workflow execution agent with a helpdesk interface. It must not claim NURA has customers, pilots or results. It demonstrates capability, nothing more.

Output a minute-by-minute demo script.
```

**Expected output:**
A minute-by-minute ten-minute demo script of the real product.

**Founder approval checkpoint:**
Confirm the demo shows the real product, not a mock-up. Confirm it shows a real HITL gate and a real audit trail. Confirm it makes no customer or traction claim. Run the script through `nura-source-truth-guardian`.

**Test to run:**
Rehearse the full demo end to end on the demo data, timed.

**Success looks like:**
A ten-minute demo of the real DINA foundation, governance visible, no false claims, that runs within time.

**If it fails:**
If the demo overruns or a step does not work live, tighten the flow or fix the workflow. If the script implies traction, cut it.

**Next step:**
Part 10, Step 10.1.

---

# Part 10 — Paperclip Lab

This part defines how and when to test Paperclip — strictly as a lab, not as a production foundation. Per File 06 - Phase 1 Stack Decision, Paperclip is the multi-agent control plane, adopted only when NURA genuinely has several standing agents. Until then it is lab-only.

---

### Step 10.1 — Define the Paperclip lab scope and entry condition

**Goal:**
Define exactly when the Paperclip lab starts, what it tests, and what it must never touch.

**Build worker to use:**
Founder, to decide. Claude, to draft the lab definition. Technical partner, to run the lab.

**Skill to use:**
`nura-architecture-reviewer` and `nura-security-approval-guardrail`.

**MCP or integration needed:**
None at definition stage. Paperclip runs self-hosted, on localhost behind a tunnel, when the lab starts.

**Source context to provide:**
File 06 - Phase 1 Stack Decision — Paperclip is a multi-agent control plane, premature as a foundation, adopted later, stood up by the technical partner, run on localhost. The threshold from the report: Paperclip earns its value at many agents, not one.

**Prompt to paste:**
```
Define the NURA Paperclip lab, applying the nura-architecture-reviewer and nura-security-approval-guardrail skills.

Paperclip is a multi-agent orchestration control plane. File 06 - Phase 1 Stack Decision is clear: it is not a day-one foundation; it is adopted only when NURA has several standing agents.

Define:
1. Entry condition — the specific situation that makes the Paperclip lab worth starting. Tie it to the number of standing NURA agents, not to a date.
2. What the lab tests — Paperclip's org-chart orchestration, per-agent budgets, approval gates, rollback and multi-company isolation.
3. What the lab must never touch — it must not be connected to the DINA customer product, to customer data, or to the production Supabase product schema. It is internal experimentation only.
4. Operational rules — self-hosted, localhost only, behind a tunnel, ports never exposed.

Output a Paperclip lab definition with these four parts.
```

**Expected output:**
A Paperclip lab definition: entry condition, test scope, hard exclusions, operational rules.

**Founder approval checkpoint:**
Confirm the entry condition is tied to having several standing agents, not a date and not impatience. Confirm the lab is walled off from DINA, customer data and the product Supabase schema.

**Test to run:**
Read the definition. Confirm it could not be read as permission to put Paperclip near the product.

**Success looks like:**
A clear lab definition that keeps Paperclip experimental and walled off.

**If it fails:**
If the scope is loose, tighten the exclusions. Paperclip near customer data is not acceptable.

**Next step:**
Step 10.2.

---

### Step 10.2 — Define the Paperclip lab test company and adoption criteria

**Goal:**
Define what test company and test agents to create inside the Paperclip lab, and the criteria that would justify adopting Paperclip as the real control plane.

**Build worker to use:**
Founder, to decide. Claude, to draft. Technical partner, to run the lab when it starts.

**Skill to use:**
`nura-architecture-reviewer`.

**MCP or integration needed:**
None at definition stage.

**Source context to provide:**
The Step 10.1 lab definition. File 06 - Phase 1 Stack Decision — Paperclip can orchestrate other agents, including Hermes, as workers. The list of NURA agents that could one day be orchestrated: the Chief of Staff, the Kael revenue agent, DINA-build agents.

**Prompt to paste:**
```
Define the Paperclip lab test setup and adoption criteria, applying the nura-architecture-reviewer skill.

Using the Paperclip lab definition from the previous step:

1. Test company — define a fictional internal test company to create inside Paperclip, used only to learn the tool. No real NURA data.
2. Test agents — define a small set of test agents to create, modelling the kind of standing agents NURA might one day run: a coordination agent, a revenue agent, a build agent. Test agents only; not the real Chief of Staff and not connected to anything real.
3. What not to connect — restate that the lab connects to nothing real: not DINA, not customer data, not the product Supabase schema, not the real Chief of Staff memory.
4. Adoption criteria — the specific evidence from the lab that would justify adopting Paperclip as NURA's real multi-agent control plane: it reliably coordinates several agents, enforces budgets and approval gates, isolates companies, and the technical partner can operate it safely.

Output the test setup and the adoption criteria.
```

**Expected output:**
A Paperclip lab test company, test agents and a clear adoption criteria list.

**Founder approval checkpoint:**
Confirm the test setup uses only fictional test data and connects to nothing real. Confirm adoption criteria are concrete evidence, not enthusiasm.

**Test to run:**
Read the adoption criteria. Confirm they would produce a clear yes or no decision.

**Success looks like:**
A safe lab test setup and decision-grade adoption criteria.

**If it fails:**
If adoption criteria are vague, make them specific and evidence-based.

**Next step:**
Part 11, Step 11.1.

---

# Part 11 — Hermes Lab

This part defines how and when to test Hermes, and whether it can replace the Claude-based Chief of Staff. Per File 06 - Phase 1 Stack Decision, Hermes is the leading candidate for the persistent Chief of Staff role because of its memory and skill-building strengths, but production-grade self-hosting is a technical-partner task, so Hermes is lab-tested before any adoption.

---

### Step 11.1 — Define the Hermes lab scope and Chief of Staff candidacy

**Goal:**
Define what the Hermes lab tests, and the question it must answer: can Hermes become the NURA Chief of Staff.

**Build worker to use:**
Founder, to decide. Claude, to draft. Technical partner, to run the lab.

**Skill to use:**
`nura-architecture-reviewer` and `nura-agent-builder`.

**MCP or integration needed:**
None at definition stage. Hermes runs self-hosted when the lab starts.

**Source context to provide:**
File 06 - Phase 1 Stack Decision — Hermes is a single self-improving agent with persistent cross-session memory and autonomous skill creation, the leading Chief of Staff candidate, but production hardening is significant and a technical-partner task. The Chief of Staff role definition from Part 5.

**Prompt to paste:**
```
Define the NURA Hermes lab, applying the nura-architecture-reviewer and nura-agent-builder skills.

Hermes is a single self-improving agent with persistent memory. File 06 - Phase 1 Stack Decision names it the leading candidate for the NURA Chief of Staff role, to be lab-tested before adoption.

Define:
1. Scope — the Hermes lab tests whether Hermes can take over the Chief of Staff role currently run by a Claude-based assistant.
2. The question to answer — can Hermes hold NURA context with persistent memory, route work to build workers, and respect the Chief of Staff boundaries, at least as well as the current assistant.
3. What the lab must never touch — Hermes in the lab connects to nothing real: not DINA, not customer data, not the product Supabase schema. It may use a copy of non-sensitive command-centre context only.
4. Operational rules — self-hosted, the technical partner operates it, restrained execution model, no exposed ports.

Output the Hermes lab definition with these four parts.
```

**Expected output:**
A Hermes lab definition: scope, the candidacy question, hard exclusions, operational rules.

**Founder approval checkpoint:**
Confirm the lab tests Hermes only as a Chief of Staff candidate, not as anything customer-facing. Confirm it touches no customer data and no product schema.

**Test to run:**
Read the definition. Confirm it keeps Hermes internal and walled off.

**Success looks like:**
A clear lab definition that keeps Hermes experimental and internal.

**If it fails:**
If scope is loose, tighten it. Hermes near customer data is not acceptable.

**Next step:**
Step 11.2.

---

### Step 11.2 — Define the Hermes memory, tool, safety tests and adoption criteria

**Goal:**
Define the specific Hermes tests — memory, tools, safety — and the criteria that would justify swapping the Chief of Staff engine from Claude-based to Hermes.

**Build worker to use:**
Founder, to decide. Claude, to draft. Technical partner, to run the lab.

**Skill to use:**
`nura-agent-builder` and `nura-security-approval-guardrail`.

**MCP or integration needed:**
None at definition stage.

**Source context to provide:**
The Step 11.1 lab definition. File 06 - Phase 1 Stack Decision — Hermes's persistent memory, autonomous skill creation and restrained security model. The Part 5 design point: memory lives in Supabase so the engine can be swapped without losing memory.

**Prompt to paste:**
```
Define the Hermes lab tests and adoption criteria, applying the nura-agent-builder and nura-security-approval-guardrail skills.

Using the Hermes lab definition from the previous step, define four things:

1. Memory tests — confirm Hermes holds context across sessions, recalls prior decisions, and can work with the NURA command-centre memory model. Test that swapping the Chief of Staff engine to Hermes would not lose the Supabase-held memory.

2. Tool tests — confirm Hermes can use the tools the Chief of Staff needs: reading source files, reading the command centre, routing work. Test its MCP use against the MCP security guardrails.

3. Safety tests — confirm Hermes respects the Chief of Staff boundaries: prepares decisions but does not make founder decisions, does not send external messages, does not edit locked files. Test its restrained execution model and confirm no exposed ports.

4. Adoption criteria — the specific evidence that would justify making Hermes the NURA Chief of Staff: it matches or beats the Claude-based assistant on memory and routing, it passes the safety tests, and the technical partner can operate a production-grade Hermes safely.

Output the four parts.
```

**Expected output:**
Hermes memory, tool and safety tests, plus concrete adoption criteria.

**Founder approval checkpoint:**
Confirm the safety tests check the Chief of Staff boundaries. Confirm adoption criteria require Hermes to match or beat the current assistant on evidence, not on novelty. Confirm the memory-swap test protects the Supabase-held memory.

**Test to run:**
Read the adoption criteria. Confirm they would produce a clear yes or no on swapping the Chief of Staff engine.

**Success looks like:**
A safe Hermes lab test plan and decision-grade adoption criteria.

**If it fails:**
If adoption criteria are vague, make them specific and evidence-based. The current Claude-based Chief of Staff stays in place until Hermes clearly earns the role.

**Next step:**
Part 12, Step 12.1.

---

# Part 12 — GTM Execution Setup

This part sets up the go-to-market execution layer: the paid audit tracker, the customer pipeline, the outreach approval queue and the Kael draft workflow. Per the locked source truth, the first commercial call to action is the Paid AI Automation Opportunity Audit. Kael drafts outreach only; the founder approves before anything is sent. No traction is claimed. This is not Step 8.

---

### Step 12.1 — Build the paid audit and pipeline tracker

**Goal:**
Build the paid audit tracker and customer pipeline in the `nura` command centre schema, visible in the command centre app.

**Build worker to use:**
Claude Code or Codex, to build. Founder, to test. Technical partner, to review.

**Skill to use:**
`supabase-n8n-product-foundation-builder` and `nura-product-requirement-writer`.

**MCP or integration needed:**
GitHub MCP and Supabase MCP, read-only.

**Source context to provide:**
File 07 — the GTM assets, the paid audit offer and the customer-acquisition operating rhythm. File 01 — the four-stage commercial model. The `nura` command centre schema and the GTM progress requirement from Part 4. The locked rule: the Paid AI Automation Opportunity Audit is the first call to action; no free pilots as the lead offer.

**Prompt to paste:**
```
Build the NURA paid audit tracker and customer pipeline, applying the supabase-n8n-product-foundation-builder and nura-product-requirement-writer skills.

This is internal GTM execution tracking in the nura command centre schema. It is not Step 8 and makes no traction claims.

Build, in the nura schema and surfaced in the command centre app:
1. A paid audit tracker — each Paid AI Automation Opportunity Audit: the prospect, the stage, the audit status, the outcome.
2. A customer pipeline — prospects through the four-stage commercial model from File 01, from prospect to audit to implementation to live.
3. The GTM progress view the command centre needs.

Rules:
- The Paid AI Automation Opportunity Audit is the first commercial call to action. The tracker reflects that. Free pilots are not the lead offer.
- This tracks NURA's own GTM activity. It does not store customer product data and does not touch the dina schema.

Output the schema additions and the command centre screens. Work in the nura-build repository.
```

**Expected output:**
A paid audit tracker and customer pipeline in the `nura` schema, surfaced in the command centre app.

**Founder approval checkpoint:**
Confirm the tracker centres on the Paid AI Automation Opportunity Audit, not free pilots. Confirm it is in the `nura` schema and does not touch the `dina` product schema. Confirm it claims no traction.

**Test to run:**
Add one test prospect, move it through audit to implementation, and confirm the command centre GTM view updates.

**Success looks like:**
A working paid audit and pipeline tracker in the command centre.

**If it fails:**
If the tracker drifts toward free pilots or implies traction, correct it against the locked source truth.

**Next step:**
Step 12.2.

---

### Step 12.2 — Build the outreach approval queue and Kael draft workflow

**Goal:**
Build the Kael draft workflow and the outreach approval queue, so outreach is AI-drafted and founder-approved before anything is sent.

**Build worker to use:**
Founder, to build the workflow in n8n, with technical partner support. Claude, to generate the build guide.

**Skill to use:**
`nura-workflow-builder` and `nura-security-approval-guardrail`.

**MCP or integration needed:**
The n8n Supabase connection and the AI model credential. Gmail / Calendar MCP only later and only after the founder approves it for GTM — it is not wired up in this step. This step builds the draft-and-approve flow; actual sending stays manual or is enabled later under founder approval.

**Source context to provide:**
File 07 — the founder-led outreach sequences and the objection-handling material. The locked rule: Kael drafts outreach only; the founder approves before any external message is sent. The webhook and error patterns from Part 3.

**Prompt to paste:**
```
Give me a node-by-node n8n build guide for the Kael outreach draft workflow and the outreach approval queue, applying the nura-workflow-builder and nura-security-approval-guardrail skills. I am a non-coder building in the n8n canvas with partner support.

The locked rule: Kael drafts outreach only. The founder approves before any external message is sent. Nothing sends automatically.

The workflow must:
1. Take a prospect from the pipeline and the relevant outreach sequence from File 07.
2. Have the AI model, acting as Kael, draft the outreach message.
3. Write the draft into an outreach approval queue in the nura schema, in a Pending state.
4. Stop. The workflow must not send anything. It waits for the founder.
5. The founder reviews the draft in the command centre, and approves, edits or rejects it.
6. Only an approved message may be sent, and in this step sending stays manual. Do not wire up Gmail MCP now; note it as a later, founder-approved option.
7. Use the standard error-handling pattern. Write an audit row for each draft and each founder decision.

For each node give the node type, settings and what I should see.

Here is the File 07 outreach material:
[paste the relevant File 07 outreach sequences]
```

**Expected output:**
A Kael draft workflow that produces outreach drafts into a Pending approval queue, and an outreach approval queue in the command centre — nothing sent automatically.

**Founder approval checkpoint:**
This is a high-severity checkpoint. Confirm Kael only drafts. Confirm nothing can be sent without the founder's approval. Confirm Gmail MCP is not wired up in this step. Confirm every draft and decision writes an audit row.

**Test to run:**
Run the workflow for one test prospect. Confirm a draft appears in the approval queue in Pending, and confirm nothing is sent. Approve the draft and confirm it is marked approved, still not auto-sent.

**Success looks like:**
Outreach is AI-drafted, queued, and only ever sent after explicit founder approval.

**If it fails:**
If anything sends without approval, stop and remove the send path. The locked rule is that the founder approves before any external message goes out.

**Next step:**
The Build Manual is complete through Part 12. Return to the NURA Command Centre and NURA Chief of Staff to plan the next cycle: run the real product foundation, rehearse the demo, begin the paid audit motion from File 07, and keep Part 13 deferred until its gates are met.

---

## Closing Notes

This manual builds the real NURA and DINA foundation, in order, on the approved hybrid architecture: Supabase as the data foundation, n8n as the workflow layer, a persistent Chief of Staff as the coordination agent, GitHub Projects as the build tracker, AI workers doing the build, a tight set of MCP integrations, portable skills as methods, and Paperclip and Hermes held in clearly-scoped labs.

Three things to hold onto as the build runs.

First, this is the real product, built in small real pieces. There is no fake demo. Part 9 demos what Parts 2 through 8 actually built.

Second, the governance is not optional. The customer isolation gate in Part 2, the HITL gates in Parts 6 and 7, and the red-team and privacy tests in Part 9 are the steps that make DINA trustworthy. If one of them fails, the build stops there until it passes.

Third, the locked source truth still governs. The build stack in this manual is the one locked in File 06 — Phase 1 Stack Decision, and the locked files agree with it: Files 00 and 06 name GitHub Projects as the build tracker, the same as this manual. The source pack is consistent on the build stack.

Do not proceed to build from this manual until the founder has read it and the Boundary Map roles are clear. The founder runs the build solo with AI workers until the defined Tier 3 gate. A scoped paid engineer review is required at the Tier 3 customer-data / production gate, including Step 2.5 row-level security and the production deploy, before any real customer HR data is loaded, per the NURA-AI Solo Build Boundary Map. No embedded or retained technical partner hire is required until 3–4 paying customers exist. The manual is the instruction. The build begins when the founder decides to start.
