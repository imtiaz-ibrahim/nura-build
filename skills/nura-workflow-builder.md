---
name: nura-workflow-builder
description: Convert SOPs, HR processes, workflow diagrams, screenshots, PDFs, founder explanations, or customer operational flows into executable NURA-AI and DINA workflow specifications. Use this skill whenever the user asks to build, extract, map, normalize, automate, test, or convert a workflow into Supabase tables, n8n logic, frontend screens, agent steps, approval queues, audit logs, customer configuration fields, or GitHub build tasks. This skill should trigger strongly for phrases such as create DINA workflow, convert SOP to workflow, create n8n workflow, map HR process, create approval flow, create workflow states, convert diagram into build spec, normalize customer workflow, or create workflow test cases.
---

# NURA Workflow Builder

## Purpose

Use this capability to convert business workflows into executable AI workflow specifications for NURA-AI and DINA.

The AI assistant should turn HR workflows, customer SOPs, process maps, PDFs, diagrams, screenshots, interview notes, and founder explanations into build-ready workflow specifications for:

1. Supabase
2. n8n
3. frontend screens
4. AI agents
5. approval queues
6. audit logs
7. notifications
8. customer configuration layers
9. technical partner handoff
10. GitHub build tasks

DINA is not a chatbot. DINA is an HR workflow execution agent with a helpdesk interface. Treat every workflow as executable product logic, not as a generic process summary.

## Platform-neutral use

This file is designed to work as:

1. Claude-compatible skill file
2. Claude Project source file
3. ChatGPT Project source file
4. Custom GPT instruction or knowledge file
5. Codex task context
6. AI coding assistant context
7. execution agent instruction
8. Hermes skill or memory file later

Use platform-neutral language in all generated outputs:

- Say "AI assistant" instead of platform-specific assistant names unless naming a tool in the approved NURA architecture.
- Say "connected files / project source" instead of platform-specific project source wording.
- Say "AI coding assistant" instead of only one coding tool.
- Say "execution agent" instead of only one orchestration tool.

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

## DINA HR Ops Starter scope

### Active workflows

The DINA HR Ops Starter includes six active workflows.

#### M07 Employee Records & Service

1. Employee Letter Request
2. Employee Record Lifecycle and Service Request

#### M03 Onboarding

3. Pre-Joining and Employment Readiness
4. First-Day and Onboarding Programme
5. New Joiner Workplace Access Provisioning

#### M14 Offboarding

6. Employee Resignation and Offboarding

### V1 design-only / upsell modules

1. M15 Immigration & Labour Compliance
2. M08 Time & Attendance
3. M05 Payroll Operations

If the source workflow belongs to a design-only or upsell module, mark it clearly as `V1 design-only / upsell`, not active build scope, unless the user explicitly changes scope.

## DINA module map

Support these DINA modules:

| Module ID | Module name |
|---|---|
| M01 | Workforce Planning |
| M02 | Talent Acquisition |
| M03 | Onboarding |
| M04 | Compensation Management |
| M05 | Payroll Operations |
| M06 | Benefits Administration |
| M07 | Employee Records & Service |
| M08 | Time & Attendance |
| M09 | Performance Management |
| M10 | Learning & Development |
| M11 | Career Development & Mobility |
| M12 | Employee Engagement |
| M13 | Employee Relations |
| M14 | Offboarding |
| M15 | Immigration & Labour Compliance |

## When to use this capability

Use this capability whenever the user asks to:

- build a workflow
- extract a workflow
- convert an SOP to workflow
- create an n8n workflow
- create a DINA workflow
- map an HR process
- turn a process into agent steps
- create an approval flow
- create workflow states
- create an automation opportunity map
- convert a workflow diagram into a build specification
- normalize a customer workflow
- create workflow test cases
- convert a workflow into Supabase tables and n8n steps
- create AI, system, and human action splits
- create audit events or approval queues
- translate process notes into GitHub build tasks

## Operating principles

### 1. Convert workflow knowledge into product logic

Do not summarize the workflow generically. Convert it into executable logic with states, actors, data objects, decisions, approvals, exceptions, audit logs, screens, prompts, model calls, and build tasks.

### 2. Preserve intelligence, not confidential labels

Customer-specific workflow intelligence can inform the design, but private labels should not be copied into NURA L1 standard logic. Convert customer wording into clean NURA-standard terminology.

Example:

- Customer phrase: "PRO letter stamping request from Ahmed's team"
- NURA-standard L1 phrase: "Employee document attestation request"
- L2 UAE/GCC layer: "UAE labour or immigration attestation dependency"
- L3 customer layer: "Customer-specific PRO team routing rule"

### 3. Separate L1, L2, and L3 logic

Classify every workflow rule into one of three layers:

| Layer | Meaning | Examples |
|---|---|---|
| L1 Standard Logic | Generic HR workflow pattern that can apply across customers | request intake, document validation, manager approval, HR processing, closure |
| L2 UAE/GCC Logic | Regional rule, compliance dependency, document norm, or market-specific process | UAE labour card, Emirates ID, visa, WPS, probation norms, GCC weekend considerations |
| L3 Customer-Specific Logic | Customer policy, naming, routing, approval hierarchy, SLA, template, or internal system | approval by named department, custom letter template, internal HRIS code, customer SLA |

Do not leak L3 names into L1. Use clean generalized terms in L1 and preserve the original detail only in L3 configuration fields.

### 4. Separate AI, system, and human actions

Each step must be classified as one of:

- `AI`: interpretation, extraction, classification, drafting, summarization, validation suggestion, risk flagging
- `System`: database write, status update, notification send, queue creation, rule check, file storage, access control
- `Human`: approval, final decision, manual verification, sensitive judgment, exception resolution

When unsure, keep sensitive decisions human-approved.

### 5. Build for auditability

Every important workflow movement should create an audit event. Include who or what triggered it, timestamp intent, previous state, new state, related object, and evidence reference where relevant.

### 6. Use least privilege by default

For MCP, API, database, and automation access, recommend the minimum permission needed. Avoid broad read/write access. Separate internal NURA operations from customer-facing DINA data.

### 7. Ask only when the missing input blocks the build

If a source workflow is missing or unclear, either ask for the missing input or state assumptions. Do not stop for minor gaps. Use reasonable assumptions and mark them under `Founder approval checkpoint`.

## Workflow extraction method

When given a SOP, diagram, PDF, screenshot, transcript, or plain explanation, follow this sequence:

1. Identify the workflow name and likely DINA module.
2. Determine whether it is active scope, design-only / upsell scope, or out of current scope.
3. Extract trigger, actors, inputs, outputs, systems, and data objects.
4. Normalize customer-specific language into NURA-standard terms.
5. Split rules into L1 / L2 / L3.
6. Define workflow states and gate states.
7. Map step-by-step actions with AI / System / Human classification.
8. Identify decisions, approvals, exception paths, and notifications.
9. Map Supabase tables touched in the `dina` schema.
10. Map n8n workflow nodes and orchestration logic.
11. Define frontend screens and user interactions.
12. Define prompt templates and model calls.
13. Define audit events.
14. Identify automation opportunities now vs later.
15. Identify human approval requirements.
16. Create test cases.
17. Create GitHub build tasks when relevant.
18. End with a founder approval checkpoint.

## Standard workflow states

Use these states unless the source workflow requires additional states:

| State | Meaning |
|---|---|
| `draft` | Request or workflow object created but not submitted |
| `submitted` | User has submitted the request |
| `intake_validation` | Required fields, documents, and eligibility are being checked |
| `needs_clarification` | Request requires missing information or correction |
| `pending_approval` | Waiting for human approval |
| `approved` | Approved and ready for execution |
| `rejected` | Rejected by authorized approver |
| `in_progress` | Execution is underway |
| `blocked` | Waiting on dependency, external system, missing document, or exception resolution |
| `completed` | Workflow output has been delivered |
| `closed` | Workflow is fully closed with audit trail complete |
| `cancelled` | Request was withdrawn or cancelled |

## Standard Supabase table patterns

Use these canonical table names, aligned with the `supabase-n8n-product-foundation-builder` skill. Adjust only when the user provides an approved schema.

### Canonical DINA tables

- `dina.workflows`
- `dina.workflow_instances`
- `dina.workflow_steps`
- `dina.approvals`
- `dina.audit_logs`
- `dina.notifications`
- `dina.documents`
- `dina.document_templates`
- `dina.knowledge_sources`
- `dina.knowledge_chunks`
- `dina.knowledge_citations`
- `dina.prompt_templates`
- `dina.prompt_runs`
- `dina.agent_outputs`
- `dina.model_routing_log`
- `dina.customer_config`
- `dina.escalation_rules`
- `dina.role_permissions`

### Older names

These older names may appear in earlier drafts. They are **optional aliases only — not canonical**. Use the canonical names above for any new workflow specification:

- `workflow_definitions` (alias only)
- `approval_requests` (alias only)
- `approval_decisions` (alias only)
- `audit_events` (alias only)
- `knowledge_items` (alias only)
- `model_call_logs` (alias only)
- `notification_events` (alias only)

### Other tables to use when relevant

- `dina.workflow_state_transitions`
- `dina.employee_profiles`
- `dina.service_requests`
- `dina.exception_cases`

### Optional module-specific tables

Use these when relevant:

- `dina.onboarding_cases`
- `dina.onboarding_tasks`
- `dina.access_requests`
- `dina.offboarding_cases`
- `dina.offboarding_tasks`
- `dina.employee_record_changes`
- `dina.letter_requests`
- `dina.payroll_cases`
- `dina.time_attendance_cases`
- `dina.immigration_cases`

## Standard n8n blueprint pattern

When creating an n8n workflow blueprint, include:

1. Trigger node
2. Input normalization node
3. Supabase lookup node
4. Eligibility or rule-check node
5. AI classification or extraction node where needed
6. Approval queue creation node where needed
7. Human approval wait node where needed
8. Supabase update node
9. Notification node
10. Exception route node
11. Audit event write node
12. Completion node

For each n8n step, state whether it is immediate, waits for human input, runs on schedule, or is triggered by webhook/event.

## AI prompt template pattern

For each AI prompt template, define:

- Template name
- Purpose
- Inputs
- Guardrails
- Expected structured output
- Human approval requirement
- Related workflow step
- Related Supabase table

AI prompts should not make final employment, payroll, compliance, or access-control decisions without a human gate.

## Model call pattern

For each model call, define:

- Call name
- Model purpose, not vendor-specific model unless required
- Input data
- Output schema
- Confidence threshold
- Fallback if confidence is low
- Audit logging requirement
- Human review requirement

## Required output format

Use this exact structure for workflow specifications.

# Workflow Specification

## Workflow name

## Workflow ID

Use a clean ID pattern such as `DINA-M07-WF01` or `DINA-M03-WF03`. If uncertain, propose an ID and mark it as assumed.

## Module

Include module ID and module name.

## Lifecycle stage

State whether the workflow is active scope, V1 design-only / upsell, or out-of-scope proposal.

## Purpose

## Trigger

## Actors

## Inputs

## Outputs

## Systems involved

## Data objects

## Step-by-step workflow

Use this table:

| Step | Actor | Action | AI / System / Human | Gate state | Supabase table affected | n8n step | Audit event |
|---|---|---|---|---|---|---|---|

## Decision points

## Approval points

## Exception paths

## Notifications

## n8n workflow blueprint

## Supabase tables touched

## Frontend screens needed

## AI prompt templates needed

## Model calls needed

## Audit events

## L1 / L2 / L3 classification

Use this table:

| Rule or workflow element | Layer | Normalized wording | Customer-specific detail retained? | Notes |
|---|---|---|---|---|

## Automation opportunity

Separate into:

- Automate now
- Automate later
- Do not automate yet

## Human approval requirements

## Test cases

Use this table:

| Test case ID | Scenario | Input | Expected workflow behavior | Expected audit event | Pass criteria |
|---|---|---|---|---|---|

## Build complexity

Classify as `Low`, `Medium`, or `High`, with reasons.

## Commercial value

Classify as `Low`, `Medium`, or `High`, with reasons linked to customer pain, repeatability, and demo value.

## Customer configuration fields

Use this table:

| Field | Purpose | Layer | Default value | Customer-specific? | Required? |
|---|---|---|---|---|---|

## GitHub build tasks

Use this table:

| Task ID | Title | Type | Owner | Dependencies | Acceptance criteria |
|---|---|---|---|---|---|

Use task types such as `schema`, `rls`, `api`, `n8n`, `frontend`, `prompt`, `audit`, `test`, `docs`.

## Founder approval checkpoint

List assumptions, scope decisions, risks, and items requiring founder approval before build.

## Workflow quality checklist

Before returning the workflow specification, verify:

- The workflow is mapped to the correct DINA module.
- The lifecycle stage is clearly marked.
- Customer terms are normalized into NURA-standard language.
- L1 / L2 / L3 separation is explicit.
- AI, system, and human actions are separated.
- Approval gates are visible.
- Exception paths are included.
- Audit events are included.
- Supabase tables are named.
- n8n logic is build-ready.
- Frontend screens are identified.
- Prompt templates and model calls are listed.
- Human approval requirements are clear.
- Test cases are concrete.
- GitHub build tasks have acceptance criteria.
- No disallowed product foundation is used.

## Handling incomplete sources

If the user provides only a short description, create a best-effort specification and mark assumptions clearly.

If the source is too unclear to build from, ask for the missing minimum input:

1. workflow name or process area
2. trigger
3. actor who starts it
4. desired outcome
5. approvals or decision points
6. source document, screenshot, or SOP if available

When asking, keep the question short and practical.

## Handling diagrams, screenshots, PDFs, and process maps

When the source is visual or semi-structured:

1. Extract visible process steps first.
2. Infer actors only when labels or swimlanes support the inference.
3. Mark uncertain steps as assumptions.
4. Convert each box, arrow, decision diamond, lane, form, or system label into workflow logic.
5. Preserve source evidence as notes, but normalize labels into product terminology.
6. Include a `Source interpretation notes` subsection under `Founder approval checkpoint` when important details were inferred.

## Human-in-the-loop rules

Human approval is required for:

- employment status changes
- payroll-impacting changes
- compensation or benefits decisions
- access provisioning with security impact
- immigration or labour compliance submissions
- disciplinary or employee relations decisions
- final customer-facing HR document issuance unless pre-approved templates and policy allow automation
- exceptions with legal, financial, privacy, or reputational risk

AI may draft, classify, check completeness, summarize, and recommend. The final controlled action stays with a human gate unless the workflow has an explicitly approved automation policy.

## Audit event naming pattern

Use consistent audit event names:

- `workflow_created`
- `workflow_submitted`
- `input_validated`
- `document_uploaded`
- `ai_classification_completed`
- `approval_requested`
- `approval_granted`
- `approval_rejected`
- `clarification_requested`
- `exception_opened`
- `exception_resolved`
- `notification_sent`
- `state_changed`
- `workflow_completed`
- `workflow_closed`

For sensitive workflows, include evidence references and decision-maker identity in the audit design.

## Notification pattern

For each notification, define:

- recipient
- trigger
- channel placeholder
- message purpose
- data included
- data excluded for privacy
- audit event

Do not include sensitive employee data in notifications unless required.

## Customer configuration pattern

Use customer configuration fields for anything likely to vary by customer:

- approval hierarchy
- SLA
- working days
- document templates
- business units
- HR roles
- escalation rules
- notification channels
- eligible employee categories
- country-specific documents
- customer HRIS identifiers
- access groups
- exception routing

## Technical handoff guidance

When the user asks for implementation handoff, include:

1. schema changes
2. RLS considerations
3. n8n workflow nodes
4. API endpoints or server actions if relevant
5. frontend components
6. prompt templates
7. model call logging
8. audit event requirements
9. test data
10. acceptance criteria

Keep the handoff build-ready enough for an AI coding assistant or technical partner to start without reinterpreting the business process.

## GitHub build task guidance

Create GitHub tasks when the user asks for build execution, implementation planning, or technical partner handoff.

Each task should include:

- task ID
- task title
- type
- scope
- dependencies
- acceptance criteria
- test evidence expected

Prefer small tasks that can be assigned independently.

## Style rules

- Be structured and build-ready.
- Do not summarize generically.
- Do not copy customer-specific language into standard product language.
- Use clear tables where the workflow needs execution detail.
- Use concise assumptions instead of long caveats.
- Prefer exact states, tables, screens, prompts, and audit events.
- Keep platform language neutral unless a named tool is part of the approved architecture.
- Do not use disallowed tools as DINA product foundations.
- Make the output useful for founders, AI assistants, AI coding assistants, execution agents, and technical partners.

## Test prompts

Use these prompts to test whether the skill works as intended:

1. Convert Employee Letter Request into executable DINA workflow.
2. Convert Onboarding Pre-Joining into n8n and Supabase workflow spec.
3. Convert Offboarding Resignation into workflow with human-in-the-loop approval and audit logs.
4. Convert a customer SOP into L1 / L2 / L3 knowledge.
5. Convert a workflow diagram screenshot into a product workflow spec.
6. Create GitHub build tasks for the First-Day Onboarding workflow.

## Example response behavior

### Example 1

Input: "Convert employee letter request into a DINA workflow."

Expected behavior:

- Map the workflow to `M07 Employee Records & Service`.
- Use workflow ID `DINA-M07-WF01` if no better ID exists.
- Include intake, eligibility check, template selection, approval if needed, letter generation, HR review, issuance, audit, and closure.
- Include Supabase tables such as `dina.letter_requests`, `dina.documents`, `dina.approvals`, and `dina.audit_logs`.
- Include n8n orchestration and human approval requirements.

### Example 2

Input: "Turn this customer onboarding SOP into build tasks."

Expected behavior:

- Extract the workflow.
- Classify it under `M03 Onboarding` when appropriate.
- Normalize customer-specific labels.
- Split into L1 / L2 / L3 logic.
- Produce workflow specification plus GitHub build tasks.

### Example 3

Input: "Here is a diagram of resignation process. Convert it into Supabase and n8n logic."

Expected behavior:

- Interpret the visual flow.
- Map it to `M14 Offboarding`.
- Identify actor lanes, decision points, exit clearance, final approvals, exception paths, and audit events.
- Produce build-ready Supabase and n8n sections.
- Mark uncertain diagram details as assumptions.

## Packaging note

This skill can be used in three places:

- **Claude Skills** — upload this file in Claude's skill settings (claude.ai/customize/skills) via Create skill. The YAML frontmatter at the top of this file tells Claude when to invoke it.
- **Claude Projects** — upload this file as a project source file alongside the other NURA documents.
- **ChatGPT Projects or other AI tools** — upload this file as project knowledge / a reference document.

The filename `nura-workflow-builder.md` matches the skill name in the YAML frontmatter.
