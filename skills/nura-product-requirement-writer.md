---
name: nura-product-requirement-writer
description: Create founder-readable, build-ready product requirement documents, build specs, user stories, acceptance criteria, technical handoff briefs, workflow requirements, agent requirements, frontend requirements, database requirements, module requirements, implementation briefs, product briefs, technical partner briefs, AI coding assistant build briefs, and GitHub issue briefs for NURA-AI, DINA, Kael, NURA Chief of Staff, the internal command centre, workflows, agents, and product modules. Use this skill whenever a product, feature, workflow, agent, module, or technical build needs to be specified clearly, even if the user does not explicitly say PRD.
---

# NURA Product Requirement Writer

This skill helps an AI assistant convert founder ideas, rough notes, workflow descriptions, screenshots, customer requirements, or connected files / project source into clear product requirement documents and build-ready implementation briefs.

Use it to create PRDs, build specs, user stories, acceptance criteria, technical handoff documents, AI coding assistant briefs, GitHub task briefs, and implementation specs for NURA-AI, DINA, Kael, NURA Chief of Staff, the NURA Command Centre, internal workflows, product modules, and agentic workflows.

The output must be clear enough for a non-coder founder to review and specific enough for an AI coding assistant, n8n builder, Supabase builder, frontend builder, GitHub Projects user, technical partner, execution agent, or future engineer to build from.

## 1. Core mission

When this skill is triggered, produce a build-ready specification that translates the user's intent into:

- Clear product or feature scope
- User types and jobs to be done
- User stories
- Functional requirements
- Workflow logic
- Supabase data model and workflow state where relevant
- n8n automation logic where relevant
- Frontend screen requirements
- AI prompt and model behaviour
- Approval gates
- Audit and logging requirements
- Security, RLS, permissioning, and data isolation requirements
- Acceptance criteria
- Test cases
- GitHub build tasks
- Founder, AI build, and technical partner ownership
- Open questions and founder approval checkpoints

Do not write vague product strategy. Write an execution-ready specification.

## 2. Trigger contexts

Use this skill whenever the user asks for any of the following, or when the task clearly requires one of these outputs:

- PRD
- Product requirements
- Build spec
- User stories
- Acceptance criteria
- Technical handoff
- Feature spec
- Product scope
- Workflow requirements
- Agent requirements
- Frontend requirements
- Database requirements
- Module requirements
- Implementation brief
- Product brief
- Technical partner brief
- AI coding assistant build brief
- GitHub issue brief
- Codex build brief
- Claude Code build brief
- n8n workflow specification
- Supabase schema specification
- DINA workflow specification
- NURA Command Centre requirement
- Kael workflow requirement
- NURA Chief of Staff requirement

Also use this skill when the user gives an idea and asks to make it build-ready, turn it into tasks, prepare it for a developer, or prepare it for implementation.

## 3. Platform-neutral use

Write the skill so it can be used as:

- A Claude-compatible skill
- A connected files / project source file
- A ChatGPT Project source file
- A Custom GPT instruction or knowledge file
- Codex task context
- AI coding assistant context
- Execution agent instruction
- Hermes skill or memory file later

Use platform-neutral language in generated specs:

- Say "AI assistant" instead of assuming one model platform.
- Say "connected files / project source" instead of assuming one project source system.
- Say "AI coding assistant" instead of naming only one coding environment.
- Say "execution agent" instead of naming only one orchestration platform.

Platform names may be used only when the user specifically asks for platform-specific output, such as a Codex build brief, Claude Code brief, GitHub issue, or Paperclip lab task.

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

## 5. DINA HR Ops Starter active scope

DINA HR Ops Starter includes six active workflows.

### 5.1 M07 Employee Records & Service

1. Employee Letter Request
2. Employee Record Lifecycle and Service Request

### 5.2 M03 Onboarding

3. Pre-Joining and Employment Readiness
4. First-Day and Onboarding Programme
5. New Joiner Workplace Access Provisioning

### 5.3 M14 Offboarding

6. Employee Resignation and Offboarding

### 5.4 V1 design-only / upsell modules

The following modules may be designed as future scope or upsell, but they are not active V1 execution scope unless the user explicitly changes the scope:

1. M15 Immigration & Labour Compliance
2. M08 Time & Attendance
3. M05 Payroll Operations

Clearly label these as design-only, future scope, or upsell modules.

## 6. NURA-specific requirements

Every NURA or DINA product spec must follow these rules:

1. Separate internal NURA tools from customer-facing DINA product.
2. Avoid throwaway demo logic.
3. Build toward real product foundation.
4. Include Supabase data model and workflow state when relevant.
5. Include n8n workflow logic when relevant.
6. Include frontend screen requirements.
7. Include AI prompt and model behaviour.
8. Include approval queue requirements.
9. Include audit log requirements.
10. Include L1 / L2 / L3 citation or isolation where relevant.
11. Include out-of-scope clearly.
12. Include non-functional requirements covering security, data isolation, observability, permissions, and reliability.
13. Include test cases.
14. Keep language founder-readable while still being build-ready.
15. Define what the founder owns versus what AI coding assistants or technical partners own.
16. Respect NURA source truth and DINA product direction.
17. Avoid unsupported claims, investor-style hype, or vague transformation language.
18. Keep customer data protection visible.

## 7. Source handling and assumptions

Before writing the PRD or build brief:

1. Read relevant connected files / project source if available.
2. Extract concrete requirements, constraints, workflow steps, user roles, data fields, and decisions.
3. Do not invent missing customer-specific policies, legal rules, employee data fields, approval matrices, SLA values, or integration endpoints.
4. If a required source file is missing, state the assumption and list what is needed.
5. If the user asks for a complete draft despite missing sources, proceed with clearly marked assumptions.
6. If there is conflict between old notes and the NURA clean-source rule, follow the NURA clean-source rule and flag the conflict.

Use direct, practical language. Do not make the founder chase hidden caveats.

## 8. Output selection

Choose the right output type based on the user's request.

| User asks for | Output to create |
|---|---|
| PRD, product requirement, feature spec | Full Product Requirement Document |
| Build spec, implementation brief | Build-ready implementation specification |
| Codex, Claude Code, AI coding assistant brief | Developer-style build brief with task list and file expectations |
| GitHub issue brief | GitHub-ready issue with scope, acceptance criteria, and tasks |
| Workflow requirements | Workflow PRD with state model and n8n logic |
| Agent requirements | Agent spec with triggers, permissions, prompts, tools, memory, and guardrails |
| Frontend requirements | Screen and component spec with states and user journeys |
| Database requirements | Supabase schema and RLS spec |
| Approval queue or audit log | Data model, workflow state, permissions, event logging, and test cases |

When the user does not specify an output type, default to the full Product Requirement Document format.

## 9. Required PRD format

Use this exact structure for a full PRD.

```markdown
# Product Requirement Document

## 1. Product / feature name

## 2. Background

## 3. Problem

## 4. User types

## 5. Jobs to be done

## 6. Scope

## 7. Out of scope

## 8. User stories

## 9. Functional requirements

## 10. Workflow logic

## 11. Supabase data model

## 12. n8n workflow logic

## 13. Frontend screen requirements

## 14. Integrations

## 15. AI prompt and model behaviour

## 16. Human approval gates

## 17. Audit and logging

## 18. Security, RLS and data isolation

## 19. Non-functional requirements

## 20. Acceptance criteria

## 21. Test cases

## 22. GitHub build tasks

## 23. Founder tasks

## 24. AI build tasks

## 25. Technical partner tasks

## 26. Open questions

## 27. Founder approval checkpoint

## 28. Final build recommendation
```

Do not skip sections. If a section is not applicable, write "Not applicable for this scope" and briefly explain why.

## 10. Section guidance

### 10.1 Product / feature name

Use a clear name that identifies the product, module, workflow, or agent.

Examples:

- DINA Employee Letter Request Workflow
- NURA Chief of Staff Command Centre Coordination Layer
- Supabase Approval Queue and Audit Log Foundation
- Kael Founder-Approved Outreach Workflow

### 10.2 Background

Explain where the requirement comes from and why it matters. Reference NURA, DINA, Kael, internal command centre, or the relevant workflow context.

### 10.3 Problem

Define the operational problem in plain language. Avoid investor-style claims.

### 10.4 User types

List user types in a table where useful.

Typical user types may include:

- Founder
- NURA Chief of Staff
- HR employee
- HR operations user
- HR manager
- Approver
- Admin
- Technical partner
- AI coding assistant
- Execution agent
- Customer admin

### 10.5 Jobs to be done

Write practical jobs to be done.

Example format:

| User type | Job to be done | Success outcome |
|---|---|---|
| HR employee | Request an employment letter without emailing HR manually | Request submitted with required data and visible status |

### 10.6 Scope

Split scope into:

- In scope
- Conditional scope
- Future scope

For DINA, clearly separate active HR Ops Starter workflows from design-only / upsell modules.

### 10.7 Out of scope

Be explicit. This prevents uncontrolled expansion.

Examples:

- Payroll calculation is out of scope for DINA HR Ops Starter V1.
- Immigration case execution is design-only unless separately approved.
- Direct production data writes by AI without human approval are out of scope.

### 10.8 User stories

Use this format:

| ID | As a | I want | So that | Priority |
|---|---|---|---|---|
| US-001 | HR employee | Submit a letter request | I do not need to email HR manually | Must have |

### 10.9 Functional requirements

Use numbered requirements.

Example:

| ID | Requirement | Priority | Notes |
|---|---|---|---|
| FR-001 | The system shall capture request type, employee ID, purpose, language, and delivery preference | Must have | Validate required fields before submission |

### 10.10 Workflow logic

Describe the state model and transitions.

Include:

- Trigger
- Intake
- Validation
- AI processing
- Human review
- Approval or rejection
- Completion
- Exception handling
- Notifications
- Audit events

Use state names like:

- `draft`
- `submitted`
- `needs_more_info`
- `validated`
- `ai_generated`
- `pending_approval`
- `approved`
- `rejected`
- `completed`
- `cancelled`
- `failed`

### 10.11 Supabase data model

Include data model when the requirement touches workflows, users, knowledge, documents, approvals, audit logs, settings, or integrations.

For internal NURA systems, use the `nura` schema.
For DINA customer-facing systems, use the `dina` schema.

Recommended table format:

| Table | Purpose | Key fields | RLS / isolation notes |
|---|---|---|---|

Include workflow state fields where relevant:

- `id`
- `tenant_id`
- `employee_id`
- `request_type`
- `status`
- `priority`
- `assigned_to`
- `created_by`
- `created_at`
- `updated_at`
- `approved_by`
- `approved_at`
- `metadata`

Do not over-engineer the schema. Include enough to build V1 safely.

### 10.12 n8n workflow logic

Include n8n logic when automation is relevant.

Use this structure:

| Step | n8n node / action | Input | Output | Error handling |
|---|---|---|---|---|

Cover:

- Trigger node
- Supabase read / write nodes
- AI model call
- Conditional branching
- Approval queue update
- Notification step
- Audit log write
- Failure handling

### 10.13 Frontend screen requirements

Include screens, components, user actions, empty states, error states, and permission-based visibility.

Recommended structure:

| Screen | User type | Required components | Key actions | States |
|---|---|---|---|---|

### 10.14 Integrations

List integrations only if they are needed for the scope.

For each integration, specify:

- Purpose
- Direction of data flow
- Required permission
- Data written
- Data read
- Failure handling
- Whether it is V1 or future scope

Apply least privilege by default.

### 10.15 AI prompt and model behaviour

Define what the AI can and cannot do.

Include:

- Role of the AI assistant or agent
- Allowed inputs
- Allowed outputs
- Required citations or source references where relevant
- L1 / L2 / L3 knowledge boundary rules where relevant
- Refusal or escalation conditions
- Human approval requirements
- Tone and language expectations

For DINA, the AI must support workflow execution. It must not behave like an unrestricted chatbot.

### 10.16 Human approval gates

Clearly state what requires human review.

Examples:

- Employee-facing document release
- Sensitive employee data update
- External customer communication
- Policy interpretation where confidence is low
- Workflow completion for high-risk cases

### 10.17 Audit and logging

Include audit events.

Recommended event fields:

- `event_id`
- `tenant_id`
- `actor_type`
- `actor_id`
- `entity_type`
- `entity_id`
- `event_name`
- `previous_state`
- `new_state`
- `source_reference`
- `timestamp`
- `metadata`

Audit logs must support traceability, customer trust, and debugging.

### 10.18 Security, RLS and data isolation

For DINA, explicitly cover:

- Tenant isolation
- Role-based access
- Supabase RLS assumptions
- Storage bucket permissions
- L1 / L2 / L3 knowledge separation
- Approval queue permissions
- Audit log immutability expectations
- Sensitive employee data protection

### 10.19 Non-functional requirements

Include:

- Security
- Data isolation
- Observability
- Permissions
- Reliability
- Performance expectations
- Error recovery
- Maintainability
- Usability

### 10.20 Acceptance criteria

Use measurable criteria.

Example:

| ID | Acceptance criterion | Verification method |
|---|---|---|
| AC-001 | A user can submit a request only after all mandatory fields are completed | Manual test |

### 10.21 Test cases

Write test cases that a founder, AI coding assistant, or technical partner can execute.

Include:

- Happy path
- Missing information
- Permission denied
- Approval rejection
- AI low-confidence escalation
- n8n failure handling
- Audit log creation
- RLS / tenant isolation check

### 10.22 GitHub build tasks

Convert the PRD into GitHub-ready implementation tasks.

Use task format:

| Task ID | Title | Owner | Description | Acceptance criteria |
|---|---|---|---|---|

### 10.23 Founder tasks

List only decisions and inputs the founder must own.

Examples:

- Approve workflow scope
- Confirm sample policy documents
- Confirm approval matrix
- Confirm employee data fields
- Confirm customer demo data boundaries

### 10.24 AI build tasks

List tasks for AI coding assistants.

Examples:

- Draft Supabase migration
- Generate n8n workflow JSON outline
- Create frontend component structure
- Write test cases
- Create mock data

### 10.25 Technical partner tasks

List tasks that may need human engineering or technical partner validation.

Examples:

- Review RLS policies
- Validate production security
- Connect customer systems
- Review deployment architecture
- Validate logging and observability

### 10.26 Open questions

Ask only necessary questions. Do not block the whole output unless the missing answer changes the architecture or safety of the build.

### 10.27 Founder approval checkpoint

End with a clear checkpoint.

Example:

"Founder approval required before build starts: approve scope, data model, workflow states, approval gates, and out-of-scope items."

### 10.28 Final build recommendation

Give a practical recommendation:

- Build now
- Build after missing inputs are confirmed
- Design only
- Defer
- Split into smaller build tickets

Explain the reason briefly.

## 11. GitHub issue brief format

When the user asks for a GitHub issue brief, use this structure:

```markdown
# GitHub Issue Brief

## Title

## Context

## Objective

## Scope

## Out of scope

## Requirements

## Data model impact

## n8n workflow impact

## Frontend impact

## Security / RLS impact

## Acceptance criteria

## Test cases

## Build tasks

## Dependencies

## Founder approval needed
```

Keep it concise enough to paste into GitHub Projects, but specific enough to build.

## 12. AI coding assistant build brief format

When the user asks for a Codex, Claude Code, or AI coding assistant build brief, use this structure:

```markdown
# AI Coding Assistant Build Brief

## Build objective

## Product context

## Approved architecture constraints

## Files / areas likely affected

## Required behaviour

## Supabase schema requirements

## RLS and permission requirements

## n8n workflow requirements

## Frontend requirements

## AI prompt / model behaviour requirements

## Acceptance criteria

## Test plan

## Do not change

## Founder approval checkpoint
```

Include a strong "Do not change" section to prevent architecture drift.

## 13. Agent requirement format

When the user asks for an agent spec, include:

- Agent name
- Mission
- Trigger conditions
- Inputs
- Outputs
- Tools / connectors allowed
- Permissions
- Memory boundaries
- Supabase tables touched
- n8n workflows triggered
- Human approval gates
- Audit events
- Failure modes
- Escalation logic
- Test cases

For Kael or outreach workflows, make founder approval visible before any external send action.

## 14. Knowledge isolation rules for DINA

When the PRD touches DINA knowledge, retrieval, HR policies, employee documents, or citations, include L1 / L2 / L3 boundaries.

Use this model, which matches the locked DINA HR Knowledge Base (File 02), unless a newer approved source defines it differently:

| Level | Meaning | Owner | Example | Access pattern |
|---|---|---|---|---|
| L1 | General NURA standard HR operating knowledge | NURA-AI | Generic HR workflow logic, standard service taxonomy | Reused across all customers |
| L2 | Regional UAE/GCC HR, labour, immigration and business knowledge | NURA-AI | UAE labour rules, Emirates ID, visa and WPS context, GCC norms | Reused across GCC customers |
| L3 | Customer-specific knowledge | The customer | Customer SOPs, policies, templates, systems, roles, SLAs, approval matrix | Isolated per customer; strict role and case-level access |

L1 and L2 are NURA-owned assets. L3 is customer-specific.

DINA must not copy L3 customer-specific knowledge into L1 or L2.
DINA must not mix one customer's L3 knowledge with another customer's context.
DINA must not expose L3 employee-specific or case-specific data outside the approved role, case, or workflow.

## 15. Approval queue rules

When a workflow generates, changes, sends, approves, rejects, or completes something sensitive, include approval queue logic.

Approval queue requirements should define:

- What enters the queue
- Who can approve
- Who can reject
- What can be edited
- What is locked
- SLA or priority if known
- What happens after approval
- What happens after rejection
- What audit events are written

AI-generated employee-facing outputs must remain pending until approved by an authorized human user unless the user explicitly defines a safe auto-approval rule.

## 16. Customer data protection rules

Keep customer data protection visible in every customer-facing DINA PRD.

Mention:

- Tenant isolation
- RLS
- Role-based permissions
- Storage access controls
- Audit logs
- Approval gates
- Data minimization
- No unrestricted AI access to customer data
- No cross-tenant retrieval

## 17. Writing style

Write in a direct, founder-readable style.

Use:

- Clear headings
- Short paragraphs
- Tables where useful
- Numbered requirements
- Practical build language
- Explicit ownership
- Concrete workflow states
- Clear assumptions

Avoid:

- Vague transformation language
- Investor-style hype
- Generic AI buzzwords
- Unsupported claims
- Overly technical explanations without founder-readable context
- Tool drift away from the approved architecture
- Throwaway demo shortcuts

## 18. Common assumptions to state when needed

Use assumptions only when required information is missing.

Examples:

- "Assumption: The customer admin will configure tenant-specific HR policy documents before workflow activation."
- "Assumption: Employee master data exists in the `dina` schema or is loaded through a controlled import."
- "Assumption: External HRIS integration is future scope unless separately approved."
- "Assumption: Approval roles are configured per tenant."

## 19. Quality checklist

Before finalizing, verify that the output:

- Uses the correct architecture for internal NURA or customer-facing DINA.
- Does not specify banned tools as product foundations.
- Identifies active scope and out-of-scope items.
- Includes Supabase data model when data is involved.
- Includes workflow state when workflow execution is involved.
- Includes n8n logic when automation is involved.
- Includes approval gates for sensitive actions.
- Includes audit logs for traceability.
- Includes security, RLS, and data isolation.
- Includes acceptance criteria and test cases.
- Separates founder tasks, AI build tasks, and technical partner tasks.
- Is readable by a non-coder founder.
- Is specific enough for implementation.

## 20. Platform adaptation notes

### 20.1 Claude-compatible skill

Use this file as a PRD and build-spec skill. The YAML description is designed to trigger strongly when the user asks for product requirements or build specifications.

### 20.2 ChatGPT Projects

Upload this file as project source for PRDs, product specs, build specs, workflow specs, and technical handoff documents.

### 20.3 Custom GPT

Use this file as product-spec instruction content for a Custom GPT that writes NURA and DINA requirements.

### 20.4 Codex / Claude Code / AI coding assistants

Use this file as build context before implementation. It should guide the AI coding assistant to preserve the approved architecture and produce implementation tasks.

### 20.5 Paperclip

Use this file as the required format for assigning product build tasks to an execution agent in lab mode only. Paperclip must not be treated as the production product foundation.

### 20.6 Hermes

Use this file as persistent product-spec memory for internal agents in lab mode only. Hermes must not be treated as the production product foundation unless separately approved.

## 21. Test prompts

Use these prompts to test whether the skill is working correctly:

1. Write a PRD for DINA Employee Letter Request workflow.
2. Write a PRD for NURA Chief of Staff command centre.
3. Write a PRD for Supabase approval queue and audit log.
4. Write a PRD for Kael founder-approved outreach workflow.
5. Write a PRD for DINA module activation.
6. Write a GitHub build brief for a DINA workflow.

## 22. Expected test behaviour

A successful output should:

- Use the approved NURA architecture.
- Separate internal NURA requirements from customer-facing DINA requirements.
- Treat DINA as an HR workflow execution agent with a helpdesk interface.
- Include Supabase, n8n, frontend, AI behaviour, approval, audit, security, acceptance criteria, and test cases where relevant.
- Avoid banned foundation tools.
- Avoid hype and unsupported claims.
- Produce a document that can be reviewed by the founder and converted into GitHub build tasks.

## Packaging note

This skill can be used in three places:

- **Claude Skills** — upload this file in Claude's skill settings (claude.ai/customize/skills) via Create skill. The YAML frontmatter at the top of this file tells Claude when to invoke it.
- **Claude Projects** — upload this file as a project source file alongside the other NURA documents.
- **ChatGPT Projects or other AI tools** — upload this file as project knowledge / a reference document.

The filename `nura-product-requirement-writer.md` matches the skill name in the YAML frontmatter.
