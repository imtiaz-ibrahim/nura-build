---
name: nura-mcp-integration-planner
description: Plan safe MCP and API connector access for NURA-AI, DINA, NURA Chief of Staff, Kael, Codex, ChatGPT, Claude Code, Paperclip lab, Hermes lab, and other AI workers. Use this skill whenever a user asks about MCP, API connectors, tool access, agent permissions, connecting AI assistants to external systems, GitHub MCP, Supabase MCP, n8n MCP or API, Gmail MCP, Google Drive MCP, browser automation, Playwright MCP, Filesystem MCP, Claude Code integration, Codex integration, ChatGPT integration, MCP setup, MCP security, MCP risks, or which tools an AI agent should be allowed to use. Trigger strongly whenever any AI tool, AI assistant, AI coding assistant, execution agent, or persistent agent is being connected to external systems, files, databases, workflows, email, browser sessions, calendars, repositories, or customer data.
---

# NURA MCP Integration Planner

## Purpose

Use this capability to plan MCP and API integrations for NURA-AI, DINA, NURA Chief of Staff, Kael, Codex, ChatGPT, Claude Code, AI coding assistants, execution agents, Paperclip lab, Hermes lab, and future NURA agents.

The goal is to decide which MCPs or connectors should be used, what permissions they need, what they can do, what they must not do, what data they can access, how they should be tested safely, and when founder approval is required.

This capability is conservative by design. The default position is read-only, sandbox first, least privilege, no customer data unless explicitly approved, and no production write access unless there is a clear operational reason.

## Platform-neutral usage

This file is written to work as:

1. Claude-compatible skill file
2. Connected file / project source
3. ChatGPT Project source file
4. Custom GPT instruction / knowledge file
5. Codex task context
6. AI coding assistant context
7. Execution agent instruction
8. Hermes or persistent-agent memory file later

Use platform-neutral language when applying this capability:

- Say "AI assistant" when referring to the model using this file.
- Say "connected files / project source" when referring to the context source.
- Say "AI coding assistant" when referring to coding tools such as Codex or Claude Code.
- Say "execution agent" when referring to automation or task-running agents such as Paperclip.

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

## When to use this capability

Use this capability whenever the user asks about any of the following:

- MCP
- Claude Code integration
- Codex integration
- ChatGPT integration
- Tool access
- Supabase MCP
- GitHub MCP
- n8n MCP
- n8n API connector
- Gmail MCP
- Google Drive MCP
- Browser MCP
- Playwright MCP
- Filesystem MCP
- API connectors
- Agent tool permissions
- Connecting agents to tools
- Which MCPs are needed
- MCP security
- MCP setup
- MCP risks
- Tool permissions for an AI worker
- Tool access for NURA, DINA, Kael, NURA Chief of Staff, Codex, ChatGPT, AI coding assistants, execution agents, Paperclip lab, or Hermes lab

Trigger strongly whenever an AI tool or agent is being connected to an external system, file store, repository, database, workflow engine, browser session, email inbox, calendar, customer record, or production environment.

## Core planning principles

Apply these principles in every MCP or API connector plan:

1. Use least privilege.
2. Prefer read-only access first.
3. Use development, test, sandbox, or staging environments before production.
4. Block customer HR data unless explicitly approved by the founder.
5. Block uncontrolled shell, browser, or filesystem access unless isolated and scoped.
6. Require founder approval before external actions.
7. Require logging for every write action.
8. Define rollback before any write or execute permission is granted.
9. Recommend MCP only when it materially helps build, testing, operations, GTM, or support.
10. Avoid adding MCPs just because they are interesting.
11. Separate build-time MCPs from production and customer-data MCPs.
12. Define setup ownership clearly: founder, AI coding assistant, or technical partner.
13. Explain risk in simple language.
14. Require environment separation: development, staging, production.
15. Treat production-write permissions as exceptional, not default.
16. Prefer scoped service accounts over personal accounts.
17. Prefer temporary credentials over permanent credentials where possible.
18. Store secrets only in approved secret-management locations.
19. Do not expose credentials in prompts, logs, screenshots, chat history, or files.
20. If current MCP availability or connector status is unknown, instruct the AI assistant to verify using current official documentation before making a final setup recommendation.

## MCP and connector shortlist

Evaluate candidate integrations in this order unless the user gives a clear reason to do otherwise:

1. GitHub MCP
2. Supabase MCP
3. n8n API or MCP if available
4. Filesystem MCP, restricted
5. Browser MCP or Playwright MCP for testing only
6. Google Drive MCP for source-file reading only
7. Gmail MCP for founder-approved GTM only
8. Google Calendar MCP for scheduling only
9. HubSpot MCP or API connector for GTM only
10. Custom API connector
11. Paperclip adapter, lab only
12. Hermes adapter, lab only

### Default recommendation logic

Use this decision logic:

- Use GitHub MCP when the task involves repositories, issues, pull requests, GitHub Projects, technical build tracking, or code review.
- Use Supabase MCP when the task involves database schema, migrations, RLS, SQL review, edge functions, data access, or `nura` and `dina` schemas.
- Use n8n API or MCP when the task involves workflow orchestration, triggers, job status, workflow logs, workflow updates, or DINA process automation.
- Use restricted Filesystem MCP only when the agent needs access to a clearly bounded local folder or generated build assets.
- Use Browser or Playwright MCP only for test automation, UI checks, screenshots, and controlled portal exploration. Do not use it for uncontrolled external actions.
- Use Google Drive MCP only to read approved connected files / project source. Do not turn it into the product foundation.
- Use Gmail MCP only for founder-approved GTM, outreach drafts, response review, or controlled sending. Do not allow autonomous sending by default.
- Use Google Calendar MCP only for scheduling and availability checks with explicit approval for booking or changes.
- Use HubSpot MCP or API only for GTM workflows, CRM updates, and lead management after permissions are scoped.
- Use a custom API connector only when no standard connector fits and the API scope is well understood.
- Use Paperclip and Hermes adapters only in lab mode until explicitly promoted by the founder.

## Environment policy

Always classify the requested integration into one environment:

### Development

Use for local builds, schema drafts, mock workflows, dummy data, and first-time testing.

Default permission posture: read-only or scoped write to test resources.

### Staging

Use for realistic testing before production. Staging may include realistic workflows but should avoid live customer HR data unless explicitly approved and masked where possible.

Default permission posture: read plus scoped write to staging resources.

### Production

Use only when the integration is proven, necessary, logged, reversible, and founder-approved.

Default permission posture: read-only. Production write access must be exceptional.

## Data policy

Classify data exposed to the MCP or connector:

- No data
- Public data
- Internal founder data
- Internal business data
- Technical metadata
- Source code
- Database schema
- Non-sensitive test records
- GTM contact data
- Email metadata
- Email content
- Calendar metadata
- Customer HR data
- Production customer data
- Secrets or credentials

### Data handling rules

- Do not expose customer HR data unless the founder explicitly approves the specific use case.
- Do not expose production customer data to lab agents.
- Do not expose secrets to any AI assistant unless the tool uses a secure secret mechanism and the assistant cannot read the secret directly.
- Use dummy data for development whenever possible.
- Use masked or synthetic data for tests.
- Separate build-time data from production customer data.

## Permission policy

Classify required permissions as:

- Read
- Write
- Execute
- Admin

### Permission defaults

- Read: acceptable for most development and review tasks when data exposure is safe.
- Write: require scoped target, logging, rollback, and founder approval.
- Execute: require sandboxing, clear command limits, logging, and rollback.
- Admin: reject by default unless a technical partner or founder has a very clear setup-only reason.

### Production permission rule

Do not recommend production write, execute, or admin access unless all of the following are true:

1. The use case is specific and necessary.
2. The target system is known.
3. The action is logged.
4. Rollback exists.
5. The founder approves before activation.
6. Safer read-only or staging alternatives are insufficient.

## Guardrails

Every plan must define practical guardrails.

Consider these guardrails by default:

- Read-only first.
- Sandbox or staging first.
- Scoped service account.
- Resource-specific permissions.
- No broad workspace access.
- No unrestricted shell access.
- No unrestricted filesystem access.
- No uncontrolled browser sessions.
- No autonomous external sending.
- No autonomous production writes.
- Human approval before external actions.
- Founder approval before customer-data access.
- Audit log for write actions.
- Change log for configuration changes.
- Rollback plan before activation.
- Test task before broader rollout.
- Time-boxed credentials where possible.
- Environment variables and secret vaults for credentials.
- Disable connector immediately if unexpected behavior appears.

## Action classification

Classify requested actions into one of these levels:

### Safe by default

Examples:

- Read repository issues.
- Read schema definitions.
- Read workflow names and statuses.
- Read approved connected files / project source.
- Generate setup instructions.
- Draft a workflow plan without executing it.

### Needs approval

Examples:

- Create GitHub issues.
- Create branches or pull requests.
- Apply staging database migrations.
- Update n8n staging workflows.
- Draft or schedule outreach.
- Read Gmail content for GTM context.
- Book calendar meetings.

### High risk

Examples:

- Production database writes.
- Production workflow edits.
- Sending emails externally.
- Browser automation on government, banking, HR, insurance, legal, or compliance portals.
- Accessing customer HR data.
- Running shell commands with broad filesystem access.

### Reject or defer by default

Examples:

- Admin access without clear setup need.
- Unrestricted browser automation.
- Unrestricted shell access.
- Access to all Google Drive files.
- Access to all Gmail messages without a scoped use case.
- Production customer-data access for lab agents.
- Using Notion, Airtable, Google Drive, Lovable, Lindy, Whalesync, or Asana as the active NURA product foundation.

## Required output format

When asked to plan an MCP or connector, return the following structure exactly.

# MCP Integration Plan

## MCP / connector name

Name the MCP, API connector, adapter, or tool integration.

## Purpose

Explain why this integration is needed.

## Tool or system connected

Name the external system, repository, database, workflow engine, app, file store, email inbox, calendar, browser session, or API.

## Use case

Describe the specific task the AI assistant, AI coding assistant, execution agent, or NURA agent will perform.

## Use now / Lab / Defer / Reject

Choose one:

- Use now
- Lab
- Defer
- Reject

Explain the reason.

## Internal or customer-facing

Classify as:

- Internal founder/build use
- Internal operations use
- GTM use
- Customer-facing use
- Customer-data use

## Environment

Classify as:

- Development
- Staging
- Production

## Required permissions

List required permissions only:

- Read
- Write
- Execute
- Admin

Explain why each permission is needed. If write, execute, or admin is requested, explain why read-only is insufficient.

## Data exposed

List the data categories exposed to the MCP or connector.

## Actions allowed

List the exact allowed actions.

## Actions blocked

List actions that must not be allowed.

## Security risks

Explain risks in simple language. Avoid vague security jargon.

## Required guardrails

List concrete guardrails, including approval, logging, scope limits, environment limits, and rollback.

## Setup owner

Choose one or more:

- Founder
- AI coding assistant
- Technical partner

Explain ownership boundaries.

## Setup steps

Give clear setup steps. If the current MCP status, connector availability, pricing, or permission model is unknown, include a step to verify current official documentation before setup.

## Test task

Define a small safe test task using dummy data, development resources, or staging resources.

## Success criteria

Define what must be true for the test to pass.

## Rollback plan

Define how to disable, revoke, revert, or undo the integration.

## Founder approval required before

List the exact actions that require founder approval.

## Final recommendation

Give a clear recommendation: proceed, proceed in lab only, defer, or reject.

## Recommendation standards

Use these standards when making a recommendation:

- Recommend "Use now" only when the use case is clear, the value is material, and permissions can be scoped safely.
- Recommend "Lab" when the tool may help but needs isolated testing before it touches active NURA systems.
- Recommend "Defer" when the integration is not needed for the current build step.
- Recommend "Reject" when the integration would violate the clean-source rule, expose sensitive data unnecessarily, create uncontrolled action risk, or duplicate existing architecture.

## Platform adaptation notes

### Claude Skills

Use this file as an MCP planning skill. The YAML frontmatter is the trigger surface. The body is the planning policy and output template.

### Connected files / project source

Upload this file as project source for MCP planning and connector review. The AI assistant should consult it before recommending any external tool connection.

### ChatGPT Projects

Use this as a project source file for NURA MCP planning, connector review, agent tool permissions, and safe integration architecture.

### Custom GPT

Use this as tool-access planning instructions. Configure the Custom GPT to consult this policy before enabling actions, APIs, file access, browsing, Gmail, calendar, code execution, or database tools.

### Codex / AI coding assistants

Use this before connecting AI coding assistants to GitHub, Supabase, n8n, filesystems, browser automation, or production systems. Default to read-only and development or staging resources.

### Paperclip

Use this as a permission policy before assigning execution agents tool access. Paperclip remains lab only unless explicitly promoted by the founder.

### Hermes

Use this as integration memory and guardrails for persistent agents. Hermes remains lab only unless explicitly promoted by the founder.

## Built-in test prompts

Use these prompts to test whether this capability produces safe, useful, and NURA-aligned integration plans:

1. Plan a Supabase MCP setup for DINA schema build.
2. Plan a GitHub MCP setup for Codex and Claude Code.
3. Plan a Gmail MCP setup for Kael, founder-approved outreach only.
4. Plan an n8n API connector for DINA workflow orchestration.
5. Review whether Browser MCP should be used for government portal automation.
6. Plan a Playwright MCP setup for testing the DINA helpdesk interface.

## Expected behavior on test prompts

The response should:

- Use the required `# MCP Integration Plan` format.
- Keep permissions conservative.
- Prefer development or staging first.
- Separate internal build use from customer-facing or customer-data use.
- Block production write access unless clearly justified.
- Block customer HR data unless explicitly approved.
- Require founder approval before external sending, production writes, customer-data access, or browser automation on sensitive portals.
- Include setup owner, test task, success criteria, and rollback.
- Reject or defer tools that conflict with the NURA clean-source rule.

## Failure modes to avoid

Avoid these mistakes:

- Recommending every possible MCP without judging value.
- Giving broad admin access by default.
- Treating lab agents as production agents.
- Treating Google Drive, Notion, Airtable, Lovable, Lindy, Whalesync, or Asana as active NURA foundations.
- Allowing Gmail or browser agents to act externally without founder approval.
- Allowing uncontrolled shell or filesystem access.
- Ignoring environment separation.
- Forgetting rollback.
- Forgetting logging for write actions.
- Approving customer HR data access without explicit approval.
- Assuming an MCP exists or has certain permissions without checking current official documentation when status is uncertain.

## Compact decision checklist

Before recommending any MCP or connector, answer these questions:

1. What exact NURA, DINA, Kael, build, GTM, or operations task does this help?
2. Is MCP or API access materially better than manual upload, file source, or a one-time export?
3. Can the task start read-only?
4. Can the task start in development or staging?
5. What data will the tool see?
6. Does it touch customer HR data or production customer data?
7. What is the smallest permission set that works?
8. What actions are allowed?
9. What actions are blocked?
10. Who approves external actions?
11. What logs prove what happened?
12. How do we roll it back?
13. Who owns setup and maintenance?
14. Does it follow the NURA clean-source rule?
15. Is the final recommendation Use now, Lab, Defer, or Reject?

## Packaging note

This skill can be used in three places:

- **Claude Skills** — upload this file in Claude's skill settings (claude.ai/customize/skills) via Create skill. The YAML frontmatter at the top of this file tells Claude when to invoke it.
- **Claude Projects** — upload this file as a project source file alongside the other NURA documents.
- **ChatGPT Projects or other AI tools** — upload this file as project knowledge / a reference document.

The filename `nura-mcp-integration-planner.md` matches the skill name in the YAML frontmatter.

## Notes on --scope local behavior

Operational notes from real MCP installations. Append new findings here as they're discovered.

### `claude mcp add --scope local` writes to `~/.claude.json`, not to a repo-local file

**Discovered:** 2026-05-22, during `supabase-nura-dev` installation.

**Behavior:** Running `claude mcp add <name> --scope local -- <command>` writes the server configuration to `~/.claude.json` under a per-project keyed section (keyed by absolute repo path), **not** to `.claude/settings.local.json` inside the repo. The flag name `--scope local` suggests a repo-local file, but the actual file is in the user's home directory.

**Security impact: net positive.**

- The config file is outside the repo entirely — no git exposure risk, no `.gitignore` rule needed.
- Project-keyed activation is preserved: the MCP server only activates when Claude Code is launched from the specific repo path that was the cwd at registration time.

**Updated guidance for future `--scope local` MCP installations:**

- Predict the config landing at `~/.claude.json` (under the per-project key for the current repo path). Do not expect a repo-local file (`.claude/settings.local.json` or similar) to be created.
- Skip the `.gitignore` step that would otherwise be planned for `.claude/settings.local.json` — there is no such file to ignore.
- Token storage decision is unchanged regardless of where the config lands: prefer shell env vars (e.g., `~/.zshrc` export) over passing secrets via `--env`. The MCP server child process inherits env vars from the Claude Code parent process at launch.
- Verification command remains useful: `grep -c '<secret-prefix>' ~/.claude.json` should return 0 to confirm no token value leaked into the config file.

**Cross-reference:** see `docs/mcp-tokens.md` for the `supabase-nura-dev` entry this note was derived from, and for the broader MCP token inventory and rotation policy.
