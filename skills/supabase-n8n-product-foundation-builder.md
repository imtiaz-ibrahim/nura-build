---
name: supabase-n8n-product-foundation-builder
description: Use this skill whenever the user discusses Supabase, n8n, product backend, database schema, RLS, auth, workflow orchestration, approval queues, audit logs, multi-tenant SaaS, customer isolation, DINA backend, NURA command memory, NURA Command Centre, n8n workflow blueprints, Supabase schema design, workflow state tables, API backend, frontend integration, scalable DINA build, replacing temporary tools, or creating a real product foundation. This skill designs product-grade Supabase and n8n foundations for NURA and DINA while enforcing the approved NURA architecture and avoiding throwaway demo architecture.
---

# Supabase + n8n Product Foundation Builder

## Purpose

Use this capability to design and build the real NURA and DINA product foundation using Supabase and n8n.

The AI assistant must create product-grade specifications that can be used by:

- AI coding assistants
- Codex
- Claude Code
- Supabase MCP
- n8n
- frontend builders
- technical partners
- execution agents
- Paperclip-assigned lab agents
- Hermes lab agent, if approved

Do not create throwaway demo architecture. Build a scalable, testable, modular foundation that can move from founder demo to real customer pilot without being rebuilt from scratch.

## Platform-neutral usage

This file must work as:

1. Claude Skill
2. Claude Project source file
3. ChatGPT Project source file
4. Custom GPT instruction or knowledge file
5. Codex task context
6. Claude Code context
7. Paperclip agent instruction
8. Hermes skill or memory file later

Use platform-neutral language when generating outputs:

- Say **AI assistant**, not only Claude.
- Say **connected files / project source**, not only Claude project source.
- Say **AI coding assistant**, not only Claude Code.
- Say **execution agent**, not only Paperclip agent.

## NURA clean-source rule

A skill encodes method. Tool choices are decisions, and decisions live in one
place: the locked NURA-AI source pack. This skill defers to that pack rather than
hard-coding a stack of its own.

### The single source of truth for tool decisions

The currently approved NURA and DINA architecture is defined in the locked
source pack — primarily File 06 (Phase 1 Stack Decision) and the NURA / DINA
Build Manual, with File 00 as the control map. When this skill is applied,
treat that pack as the authority for which specific tools are approved. If the
pack and this skill ever disagree on a named tool, the pack wins, and the
disagreement should be flagged so the skill can be updated.

Before relying on any specific tool name below, confirm it against the current
source pack. Tool selection can change by a dated, founder-approved revision to
the pack; the method in this skill does not.

### Architecture at the time of writing

At the time this skill was written, the approved architecture is:

- Internal NURA operating layer: a product-grade database for internal command
  memory (Supabase `nura` schema), a workflow automation layer (n8n), a
  technical build tracker (GitHub Projects), the NURA Command Centre app, and
  the NURA Chief of Staff as internal coordination agent.
- Customer-facing DINA product layer: a product-grade database with
  authentication, row-level security, file storage and a vector / knowledge
  store (Supabase `dina` schema), a workflow orchestration layer (n8n), the
  DINA helpdesk interface, an AI prompt and model layer, an approval queue,
  audit logs, and L1 / L2 / L3 knowledge isolation.
- AI build workforce: Claude, ChatGPT, Codex, Claude Code, and one embedded
  technical partner.
- Controlled connectivity: MCP and API connectors under least privilege.
- Labs: Paperclip (orchestration lab) and Hermes (persistent Chief of Staff
  lab) — internal labs only, not production.

These specific names are the current decision, not the method. Verify them
against the source pack before use.

### Durable method principles

These principles hold regardless of which tools are selected, and are the part
of this rule the skill enforces directly:

1. Build a real, scalable product foundation. Do not present throwaway demo
   infrastructure as the product.
2. The customer-facing DINA product layer and the internal NURA operating
   layer are separate concerns. Do not let internal tooling stand in for the
   customer-facing product, or the reverse.
3. A product-grade database — not loose files, spreadsheets, or notes tools —
   holds product and command data, with authentication, row-level security and
   audit logging.
4. A dedicated workflow layer runs execution, with approval gates where a
   decision matters.
5. Connectivity uses least privilege: read-only first, scoped, environment-
   separated, approval-gated for writes and external actions.
6. Experimental or lab tools stay clearly scoped as labs — with a defined use
   case, risk controls, data boundaries, approval gates and a fallback — and do
   not become production foundations without an explicit, dated, founder-
   approved decision in the source pack.
7. Customer L3 knowledge stays isolated per customer and is never mixed into
   L1 or L2.

### Build-tracker note

GitHub Projects is the active technical build tracker. It connects build tasks,
issues, pull requests, code changes and technical partner review into one
execution system.

### Required carve-out

The clean-source rule does not silence legitimate, source-required corrections.
When a reviewed action, plan or document references a tool that is not part of
the currently approved NURA stack as defined in File 06 - Phase 1 Stack
Decision, still flag it and require a dated revision. The rule prevents
architecture history as filler; it never prevents a needed correction.

### Tools that must not become the product foundation

Regardless of stack changes, a support or productivity tool must never be
presented as the customer-facing product database, the workflow runtime, the
command-centre foundation, or the technical build tracker. This includes
general notes tools, general file-storage tools, and lightweight no-code
databases and app builders. They may appear only as clearly scoped support,
documentation, import, prototype or reference tools. If the source pack later
approves a different foundation, that approved foundation replaces the current
one — but the principle that the foundation must be product-grade does not
change.

## Excluded active backbone tools

A product-grade database, a dedicated workflow layer and a real build tracker
are the backbone — this is a method principle and does not change. The specific
tools that are *not* the backbone follow from that principle.

At the time of writing, tools such as Notion, Google Drive, Airtable,
Whalesync, Lindy, Lovable and Asana are not the active product database,
workflow runtime, command-centre foundation or technical build tracker. They
may be mentioned only as optional documentation, input collection, temporary
reference, or external productivity layers.

If the source pack later approves a different foundation by a dated revision,
follow the pack — but the principle holds: a support or no-code productivity
tool must not be presented as the customer-facing product backbone.

## DINA HR Ops Starter active scope

DINA HR Ops Starter includes six active workflows.

### M07 Employee Records & Service

1. Employee Letter Request
2. Employee Record Lifecycle and Service Request

### M03 Onboarding

3. Pre-Joining and Employment Readiness
4. First-Day and Onboarding Programme
5. New Joiner Workplace Access Provisioning

### M14 Offboarding

6. Employee Resignation and Offboarding

### V1 design-only / upsell modules

These are design-only or upsell modules for V1. Do not treat them as active MVP workflows unless the user explicitly expands scope.

1. M15 Immigration & Labour Compliance
2. M08 Time & Attendance
3. M05 Payroll Operations

DINA is not a chatbot. DINA is an HR workflow execution agent with a helpdesk interface.

## Core build principles

When this capability is used, the AI assistant must:

1. Treat Supabase as the product database, auth, storage, vector and audit foundation.
2. Treat n8n as the workflow orchestration layer.
3. Treat GitHub Projects as the technical build tracker.
4. Keep Notion, Google Drive, Airtable, Whalesync, Lindy, Lovable and Asana out of the active product backbone.
5. Build for modular DINA activation by customer, module and workflow.
6. Include customer isolation from the first schema design.
7. Include role-based access.
8. Include audit logs.
9. Include approval queues.
10. Include workflow state tables.
11. Include n8n triggers, actions, waits and error handling.
12. Include AI calls for classification, drafting and summarisation.
13. Include safety rules for HR, payroll, legal and government workflows.
14. Include tests.
15. Include founder approval checkpoints.
16. State what a technical partner must review.
17. State what an AI coding assistant can build.
18. State what must not be exposed to customer data during testing.
19. Separate the `nura` internal schema from the `dina` customer-facing schema.
20. Include development, staging and production environment separation.

## Environment model

Always separate environments:

| Environment | Purpose | Data rule | Access rule |
|---|---|---|---|
| Development | Build schema, migrations, functions, frontend and n8n workflows | Synthetic data only | Founder, AI coding assistant, technical partner |
| Staging | Validate workflows, RLS, approvals, audit logs and demo flows | Sanitised or approved pilot data only | Founder, technical partner, selected testers |
| Production | Live customer operation | Real customer data only | Approved customer users, NURA admins under least privilege |

Do not let AI tools, execution agents or lab agents access production customer data unless the user explicitly confirms an approved production-safe access model.

## Baseline Supabase schema guidance

Adapt the final schema to the specific feature being built. Do not blindly output every table if the requested feature needs only a subset.

### `nura` schema baseline

Use the `nura` schema for internal NURA command memory and founder operations.

Recommended baseline tables:

1. `build_tasks`
2. `agent_tasks`
3. `decision_log`
4. `risk_register`
5. `source_files`
6. `weekly_reviews`
7. `tool_register`
8. `architecture_decisions`
9. `founder_approvals`
10. `gtm_tasks`

Use the `nura` schema for internal coordination only. Do not mix customer-facing HR data into the `nura` schema.

### `dina` schema baseline

Use the `dina` schema for customer-facing DINA product data.

Recommended baseline tables:

1. `customers`
2. `users`
3. `customer_users`
4. `employees`
5. `modules`
6. `module_activation`
7. `workflows`
8. `workflow_instances`
9. `workflow_steps`
10. `hr_requests`
11. `workflow_tasks`
12. `workflow_checklists`
13. `task_assignments`
14. `approvals`
15. `documents`
16. `document_templates`
17. `notifications`
18. `audit_logs`
19. `knowledge_sources`
20. `knowledge_chunks`
21. `knowledge_citations`
22. `prompt_templates`
23. `prompt_runs`
24. `agent_outputs`
25. `model_routing_log`
26. `customer_config`
27. `escalation_rules`
28. `role_permissions`

## Minimum table design expectations

When designing tables, include:

- Table purpose
- Key fields
- Primary key
- Foreign keys
- Required indexes
- Status fields where relevant
- Created, updated and deleted timestamps where relevant
- `customer_id` on customer-facing tables
- RLS implications
- Audit log touchpoints
- n8n read/write touchpoints
- Frontend read/write touchpoints

For workflow tables, include lifecycle states such as:

- `draft`
- `submitted`
- `missing_information`
- `in_progress`
- `pending_approval`
- `approved`
- `rejected`
- `escalated`
- `completed`
- `cancelled`
- `failed`

## Auth and role model

Use Supabase Auth as the authentication layer. Design roles through `dina.customer_users` and `dina.role_permissions`, not only through app-side logic.

Typical roles:

- `nura_super_admin`
- `customer_admin`
- `hr_manager`
- `hr_ops`
- `line_manager`
- `employee`
- `auditor`
- `ai_service_role`

Role design must cover:

- Who can create requests
- Who can view employee data
- Who can approve outputs
- Who can trigger workflow actions
- Who can view audit logs
- Who can manage customer configuration
- Which service roles n8n can use

## RLS policy requirements

Every customer-facing table that stores customer or employee data must have RLS enabled.

RLS policies must enforce:

1. Customer isolation using `customer_id`.
2. Role-based access using authenticated user mappings.
3. Service-role access only for approved backend and n8n workflows.
4. Employee self-service limits where employees see only their own requests and documents.
5. HR access limits based on assigned customer, module and workflow permissions.
6. Audit access limited to customer admins, auditors and approved NURA admin roles.

When producing an RLS plan, include:

- Plain-English policy intent
- Tables covered
- Role allowed
- Conditions
- Example SQL policy skeleton where useful
- Risks or edge cases
- Test cases to prove isolation

## Storage requirements

Use Supabase Storage for customer-facing documents and generated outputs.

Storage design must include:

- Bucket names
- Folder structure
- Customer isolation strategy
- File naming convention
- Upload permissions
- Download permissions
- Retention policy
- Document versioning rule
- Virus or malware scanning recommendation where relevant
- Signed URL policy for temporary access

Example bucket pattern:

```text
dina-documents/{customer_id}/{employee_id}/{workflow_instance_id}/{document_type}/{version}/file.pdf
```

## Knowledge and vector requirements

Use Supabase knowledge tables and vector store patterns for DINA knowledge retrieval.

Separate knowledge into three layers, consistent with the locked DINA HR Knowledge Base (File 02):

- L1: NURA standard HR operating knowledge — generic HR policy, workflow logic and DINA operating knowledge. NURA-owned, reused across all customers.
- L2: Regional UAE/GCC knowledge — labour, immigration, document and business context for the UAE and GCC. NURA-owned, reused across GCC customers.
- L3: Customer-specific knowledge — customer SOPs, policies, templates, systems, roles, SLAs, approval matrix, employee records and workflow context. Customer-owned, isolated per customer.

Knowledge isolation matters because HR data is sensitive. Never allow L3 customer-specific data to bleed into L1 or L2 retrieval, and never expose one customer's L3 data to another customer.

When designing knowledge retrieval, include:

- Source table
- Chunking approach
- Embedding storage
- Metadata fields
- Customer filtering
- Module filtering
- Workflow filtering
- Citation tracking
- Retrieval permissions
- Prompt injection controls
- Human approval points for sensitive outputs

## n8n workflow blueprint requirements

For every n8n workflow, define:

1. Trigger
2. Webhook or scheduled start
3. Input validation
4. Record creation in Supabase
5. AI classification
6. Required field check
7. Knowledge lookup
8. Draft generation
9. Approval queue creation
10. Wait for approval
11. Post-approval action
12. Notification
13. Audit log update
14. Error path
15. Escalation path
16. Completion status
17. Retry logic
18. Founder or HR approval checkpoint where required

## n8n node design pattern

When creating n8n workflow blueprints, use this practical structure:

| Step | Node type | Purpose | Input | Output | Supabase touchpoint | Error handling |
|---|---|---|---|---|---|---|
| 1 | Webhook / Schedule / App trigger | Start workflow | Request payload | Validated start event | `hr_requests` or `workflow_instances` | Reject invalid payload |
| 2 | Function / Code | Validate fields | Start event | Normalised payload | None | Route to missing-info branch |
| 3 | Supabase | Create or update record | Normalised payload | Record ID | Relevant workflow tables | Retry then escalate |
| 4 | AI model | Classify, draft or summarise | Context and prompt | Structured output | `prompt_runs`, `agent_outputs` | Validate output schema |
| 5 | Supabase | Create approval task | Draft output | Approval ID | `approvals`, `workflow_tasks` | Escalate if failed |
| 6 | Wait | Pause until approval | Approval ID | Approval decision | `approvals` | Timeout escalation |
| 7 | Supabase / Storage / Email | Execute approved action | Approved output | Final artefact or notification | `documents`, `notifications`, `audit_logs` | Rollback or mark failed |
| 8 | Supabase | Close workflow | Final status | Completion record | `workflow_instances`, `audit_logs` | Alert admin |

## AI model call rules

Use AI calls for:

- Request classification
- Missing information detection
- Policy or knowledge summarisation
- Drafting HR letters or responses
- Extracting checklist items
- Creating structured notes for approvers
- Summarising workflow history

Do not use AI calls as the final decision-maker for:

- Payroll decisions
- Legal compliance decisions
- Government or immigration submissions
- Employment termination decisions
- Final approvals
- Anything requiring customer HR authority

All AI calls must be logged through `prompt_runs`, `agent_outputs` and `model_routing_log` where relevant.

## Approval queue requirements

Use approval queues whenever a workflow output affects employee records, legal standing, payroll, access rights, official documents, government process, or customer-facing communication.

Approval design must include:

- Approval type
- Approver role
- SLA
- Escalation rule
- What the approver sees
- What the approver can edit
- What happens on approve
- What happens on reject
- What happens on timeout
- Audit log event

## Audit log requirements

Audit logs are mandatory for DINA.

Capture:

- User actions
- AI-generated outputs
- Approval decisions
- Document generation
- Workflow state changes
- Permission changes
- Data access events where relevant
- n8n workflow execution errors
- Escalations

Audit log records should include:

- Actor type: user, AI, n8n, system, admin
- Actor ID
- Customer ID
- Entity type
- Entity ID
- Action
- Before value where appropriate
- After value where appropriate
- Timestamp
- IP or source where available
- Correlation ID or workflow run ID

## Webhook requirements

For each webhook, define:

- Name
- Purpose
- Direction: frontend to n8n, n8n to app, app to Supabase Edge Function, or external system
- Payload shape
- Authentication method
- Idempotency key
- Rate limit consideration
- Success response
- Error response
- Audit event

## Frontend integration requirements

When describing frontend integration, include:

- Screens or components needed
- Supabase reads and writes
- n8n trigger points
- Role-based visibility
- Approval queue UI
- Request status timeline
- Document preview or download
- Audit trail display where required
- Empty states and error states

## Demo data rules

Use synthetic demo data only unless the user explicitly confirms approved pilot data.

Demo data must:

- Avoid real employee personal data
- Avoid real payroll information
- Avoid passport, Emirates ID, visa or bank details
- Avoid real termination or disciplinary cases
- Include realistic but fake HR scenarios
- Be clearly labelled as demo data

## Security guardrails

Always include these guardrails in product foundation outputs:

1. Least-privilege access for MCP, n8n, service roles and AI coding assistants.
2. No production customer data in development.
3. No direct unrestricted service-role keys in frontend code.
4. RLS enabled before real customer data is loaded.
5. Secrets stored only in approved secret managers or environment variables.
6. AI model calls logged and reviewable.
7. Human approval before official HR, payroll, legal or government outputs.
8. Customer isolation tested before pilot launch.
9. Prompt injection risks handled in knowledge retrieval.
10. Audit logs cannot be casually edited or deleted by normal users.

## Output format

When the user asks for a product foundation, schema, n8n blueprint, backend plan, RLS plan, approval queue, audit log architecture or scalable DINA build, use this structure unless the user asks for a narrower output.

# Supabase + n8n Product Foundation Spec

## Product area

State the exact NURA or DINA product area being designed.

## Architecture summary

Summarise the Supabase, n8n, frontend, AI model and approval architecture.

## Environment

Cover Development / Staging / Production.

## Supabase schema

List tables, fields, relationships, indexes and state models.

## `nura` schema impact

Describe internal command memory impact, if any.

## `dina` schema impact

Describe customer-facing product schema impact.

## Auth and roles

Define authentication and role-based access.

## RLS policy requirements

Define customer isolation and role restrictions.

## Storage requirements

Define buckets, paths, access and retention.

## Knowledge and vector requirements

Define L1 / L2 / L3 knowledge isolation and retrieval design.

## n8n workflow blueprint

Define triggers, actions, waits, branches, retries and status updates.

## Webhooks

Define webhook endpoints, payloads, auth and idempotency.

## AI model calls

Define classification, drafting, summarisation and logging.

## Approval queue

Define approval steps, roles, SLA and escalation.

## Audit logs

Define events, fields and immutability expectations.

## Prompt and model logging

Define prompt templates, runs, outputs and model routing logs.

## Error handling

Define retry, fallback, escalation and failed state handling.

## Frontend integration

Define screens, components, user actions and data flows.

## Demo data

Define synthetic test records and exclusions.

## Test cases

Define unit, integration, RLS, n8n and user acceptance tests.

## Security guardrails

Define data, access, AI, workflow and environment guardrails.

## GitHub build tasks

Break the work into actionable GitHub Project tasks.

## AI-assisted build prompts

Provide prompts that can be given to Codex, Claude Code or another AI coding assistant.

## Technical partner tasks

List what must be reviewed or executed by a technical partner.

## Founder approval checklist

List decisions that require founder sign-off.

## Migration or scaling notes

Explain how the design can move from demo to pilot to production without a rebuild.

## GitHub build task format

When creating build tasks, use this format:

```markdown
### Task: [Task title]

**Objective:**  
[What this task achieves]

**Scope:**  
[What is included]

**Out of scope:**  
[What must not be changed]

**Inputs:**  
[Files, schema, user stories or decisions needed]

**Deliverables:**  
[Expected output]

**Acceptance criteria:**  
- [ ] Criteria 1
- [ ] Criteria 2
- [ ] Criteria 3

**Dependencies:**  
[Prior tasks or decisions]

**Owner type:**  
Founder / AI coding assistant / technical partner / execution agent

**Approval checkpoint:**  
[Founder or technical review needed]
```

## AI-assisted build prompt format

When writing prompts for an AI coding assistant, use this format:

```markdown
You are an AI coding assistant working on the NURA / DINA product foundation.

## Context
[Relevant NURA architecture and product area]

## Task
[Specific build task]

## Constraints
- Use Supabase as the database, auth, storage and audit foundation.
- Use the `nura` schema only for internal NURA command memory.
- Use the `dina` schema only for customer-facing DINA product data.
- Do not use Notion, Google Drive, Airtable, Whalesync, Lindy, Lovable or Asana as the product backbone.
- Enforce RLS and customer isolation.
- Do not use production customer data.

## Required output
[Migration, SQL, TypeScript, n8n JSON, tests, docs or review notes]

## Acceptance criteria
[Clear checklist]
```

## Technical partner review checklist

For any schema, n8n workflow or backend plan, identify what a technical partner must review:

- RLS correctness
- Multi-tenant customer isolation
- Service-role usage
- Secrets handling
- n8n credential security
- Migration safety
- Indexing and performance
- Audit log completeness
- Data retention and deletion logic
- Storage access policies
- AI prompt and output logging
- Production deployment process

## Founder approval checklist

Founder approval is required for:

- Scope of active DINA workflows
- Any expansion beyond six HR Ops Starter workflows
- Role model and customer access assumptions
- Approval authority design
- Customer data handling
- Demo vs pilot data boundary
- Production readiness checkpoint
- Any use of Paperclip or Hermes lab agents
- Any AI access to sensitive HR, payroll, legal or government workflow context

## What can be built by an AI coding assistant

AI coding assistants can draft:

- Supabase migrations
- Schema SQL
- Seed data using synthetic records
- RLS policy skeletons
- Supabase Edge Function scaffolds
- TypeScript types
- Frontend data-access hooks
- n8n workflow JSON drafts
- Test files
- Documentation

AI-generated technical outputs must be reviewed before production use, especially RLS, secrets, auth, audit logs and workflow actions involving employee data.

## What must not be exposed during testing

Do not expose these to AI tools, execution agents or development environments unless the user explicitly confirms an approved safe process:

- Real employee IDs
- Passport details
- Emirates ID details
- Visa details
- Payroll records
- Bank details
- Medical records
- Termination cases
- Disciplinary records
- Legal correspondence
- Government portal credentials
- Production Supabase service-role keys
- Production n8n credentials

## Style guidance

Be product-grade and practical.

Do:

- Build for the real NURA and DINA foundation.
- Balance scalability with buildability.
- Keep the architecture clean and modular.
- Create outputs that a technical partner or AI coding assistant can execute.
- Include tests and approval checkpoints.
- Verify current tool details if implementation depends on live product behaviour.

Do not:

- Create fake or decorative demo logic.
- Recommend support tools as the customer-facing product foundation.
- Overbuild enterprise complexity before the first product foundation is proven.
- Mix internal NURA command memory with customer-facing DINA HR data.
- Skip RLS, audit logs, approval queues or environment separation.

## Platform adaptation notes

### Claude Skills

Use this as a Supabase + n8n product foundation skill.

### ChatGPT Projects

Upload this as source for backend and orchestration planning.

### Custom GPT

Use this as backend architecture instruction.

### Codex / Claude Code

Use this before building schema, migrations, functions, workflow code or tests.

### Paperclip

Use this as a task-quality checklist for assigning Supabase and n8n build work. Paperclip is lab-only unless approved.

### Hermes

Use this as persistent technical architecture memory. Hermes is lab-only unless approved.

## Test prompts

Use these prompts to test whether the capability triggers and produces useful outputs.

1. Design Supabase schema for DINA HR Ops Starter.
2. Create n8n workflow blueprint for Employee Letter Request.
3. Create Supabase + n8n architecture for DINA approval queue and audit log.
4. Create RLS policy plan for customer isolation.
5. Create Codex build task for Supabase migrations and seed data.
6. Design the `nura` schema for NURA Command Centre memory.
7. Create n8n workflow blueprint for Pre-Joining and Employment Readiness.

## Quality checklist

Before returning any output created with this capability, verify:

- [ ] Supabase is the database, auth, storage, vector and audit foundation.
- [ ] n8n is the workflow orchestration layer.
- [ ] GitHub Projects is the build tracker.
- [ ] `nura` and `dina` schemas are separated.
- [ ] DINA is treated as an HR workflow execution agent, not a chatbot.
- [ ] Active scope stays within the six HR Ops Starter workflows unless expansion is requested.
- [ ] Customer isolation and RLS are included.
- [ ] Approval queue and audit log design are included.
- [ ] Development, staging and production are separated.
- [ ] AI model calls are logged and human-reviewed where needed.
- [ ] Demo data is synthetic.
- [ ] Technical partner review tasks are included.
- [ ] Founder approval checkpoints are included.

## Packaging note

This skill can be used in three places:

- **Claude Skills** — upload this file in Claude's skill settings (claude.ai/customize/skills) via Create skill. The YAML frontmatter at the top of this file tells Claude when to invoke it.
- **Claude Projects** — upload this file as a project source file alongside the other NURA documents.
- **ChatGPT Projects or other AI tools** — upload this file as project knowledge / a reference document.

The filename `supabase-n8n-product-foundation-builder.md` matches the skill name in the YAML frontmatter.
