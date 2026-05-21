---
name: nura-ai-execution-task-writer
description: Convert any NURA-AI, DINA, NURA Command Centre, MCP, Supabase, n8n, GitHub Projects, Codex, Claude Code, Paperclip, Hermes or technical partner build request into a precise AI execution task. Use this skill whenever the user asks for a prompt, task brief, GitHub issue, Codex task, Claude Code task, ChatGPT task, Claude task, MCP build task, n8n build task, Supabase build task, Paperclip lab task, Hermes task, setup instruction, completion report template, technical partner brief or any request that should be executed by another AI tool, AI coding assistant, execution agent or partner. This skill is especially important when the user says "give me a prompt for...", "assign this to an agent", "make this executable", "create a build task", "create setup instructions", "create GitHub issue text", "automate this build step" or similar.
---

# NURA-AI Execution Task Writer

## Purpose

Use this capability to convert any NURA build task into a clear execution prompt for an AI tool, AI coding assistant, execution agent or technical partner.

The goal is to make AI tools actually build, configure, test, review or document work while the founder remains in control.

This skill supports task writing for:

1. Claude Chat
2. ChatGPT
3. Claude Code
4. Codex
5. MCP-enabled assistants
6. n8n
7. Supabase
8. GitHub Projects
9. Paperclip lab agents
10. Hermes lab agents
11. Technical partners

Use platform-neutral language by default:

- Say "AI assistant" instead of relying only on one assistant name.
- Say "connected files / project source" instead of platform-specific source wording.
- Say "AI coding assistant" instead of only one coding tool name.
- Say "execution agent" instead of only one agent platform name.

## Core job

When this skill is triggered, produce an execution task that another worker can use directly. The task must be specific enough that a tool, agent or partner can act without guessing the strategy, architecture or approval boundaries.

Do not simply rewrite the user's request. Translate it into an executable task with:

- The best worker or tool
- The exact skill or method to use
- Source context to provide
- Allowed actions
- Not allowed actions
- Founder approval gates
- Expected output
- Test and review checklist
- Completion report format
- Rollback or correction instruction
- Next step after founder approval

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

## Trigger conditions

Use this skill whenever the user says or implies:

- Give me a prompt for Codex
- Give me a prompt for Claude Code
- Give me a prompt for ChatGPT
- Give me a prompt for Claude
- Give me a prompt for Paperclip
- Assign this task to an AI agent
- Create an AI execution task
- Build this with MCP
- Make a task for a technical partner
- Create setup instructions
- Automate this build step
- Convert this into a build prompt
- Create a completion report template
- Create a task brief
- Create a prompt to build this
- Make this executable by an AI tool
- Create GitHub issue text
- Create an n8n build task
- Create a Supabase build task

Also use this skill when the user is unclear but appears to need work delegated to another assistant, agent, coding tool, automation platform or partner.

## Operating principles

### Preserve founder control

Every task must make clear what the worker may do independently and what requires founder approval. The founder stays accountable for strategy, external communication, customer data access and irreversible changes.

### Make tasks traceable

Every execution task must be traceable to one or more of:

- A connected file / project source
- A source section
- A prior founder decision
- A NURA objective
- A GitHub issue or task link
- A Supabase object
- An n8n workflow

If the source is missing, write the task so the worker first asks for or locates the source before changing anything.

### Do not let execution tools invent strategy

Execution tools can build, configure, test, review and document. They must not change locked strategy, rename products, create new phases, introduce new tools as foundations or create Step 8 unless explicitly approved by the founder.

### Protect data and external communication

Execution workers must not touch real customer data, employee data, production secrets, bank data, private emails or external messages unless explicitly approved. External outreach must remain draft-only until founder approval.

### Prefer least privilege

For MCP, API, Supabase, GitHub and n8n work, specify the minimum permissions needed. Avoid broad admin access unless the task clearly requires it.

## Task intake process

Before writing the execution task, infer or capture:

1. What must be done?
2. Is the task internal NURA, customer-facing DINA, lab-only, or external communication?
3. Which source files, sections, decisions or objectives govern the work?
4. Which worker is best suited?
5. Which skill should the worker use?
6. Which integration, MCP, API, database or repo is needed?
7. What actions are safe without founder approval?
8. What actions require approval?
9. What output will prove the task is complete?
10. How should the worker report completion?
11. What tests or checks must be run?
12. What rollback or correction path is needed?

If a missing detail blocks safe execution, do not invent it. Add a clear assumption and a founder approval gate, or write the prompt so the assigned worker asks for the missing detail before making changes.

## Task routing guidance

Use this routing model unless the user explicitly chooses a different worker.

| Task type | Best worker |
|---|---|
| Strategy / source check | Claude or ChatGPT with `nura-source-truth-guardian` |
| Architecture review | Claude or ChatGPT with `nura-architecture-reviewer` |
| Product PRD | Claude or ChatGPT with `nura-product-requirement-writer` |
| DINA workflow spec | Claude or ChatGPT with `nura-workflow-builder` |
| Supabase schema, SQL, RLS | Codex or Claude Code |
| GitHub repo / issue / PR setup | Codex or Claude Code |
| n8n workflow blueprint | Claude or ChatGPT first, then n8n / technical partner |
| n8n workflow implementation | n8n builder / technical partner / AI coding assistant |
| DINA product spec | Claude or ChatGPT with `dina-hr-agent-product-builder` |
| Security gate | Any assistant using `nura-security-approval-guardrail` |
| MCP planning | Claude or ChatGPT with `nura-mcp-integration-planner` |
| Agent spec | Claude or ChatGPT with `nura-agent-builder` |
| Paperclip task | Paperclip lab agent only |
| Hermes task | Hermes lab agent only |
| External outreach | Draft only, founder approval required |

## Forbidden product foundation routing

The following tools must never be routed as the active product foundation, workflow runtime, command-centre foundation, database, build tracker, or product document-generation foundation for any NURA or DINA build task:

- Notion
- Google Drive
- Google Docs
- Airtable
- Whalesync
- Lindy
- Lovable
- Asana
- PandaDoc

These tools may appear only in narrowly-scoped support roles:

- **Google Drive** — optional source-file storage only.
- **Google Docs** — GTM drafting only.
- **PandaDoc** — commercial proposal and e-signature only.
- **Notion** — optional founder notes only.

Never route active NURA or DINA build tasks to these tools as product foundation, workflow runtime, command-centre foundation, database, build tracker, or product document-generation foundation. If a request implies routing build work to one of these tools in a non-support role, reject the routing, name the correct active foundation (Supabase, n8n, GitHub Projects), and stop. This rule is not negotiable in this skill.

## Worker selection rules

### Use Claude / AI chat assistant or ChatGPT / AI chat assistant when

- The task is strategic, analytical, planning, documentation or review-heavy.
- The task needs source interpretation before execution.
- The task needs a PRD, workflow spec, architecture review, task decomposition or founder-facing explanation.

### Use Codex / AI coding assistant or Claude Code / AI coding assistant when

- The task requires repo changes, SQL files, migrations, tests, scripts, app code, GitHub issue templates or pull requests.
- The task needs implementation with file paths, diffs and test commands.

### Use MCP-enabled assistant when

- The task requires controlled access to connected tools such as GitHub, Supabase, Google Drive, Gmail, Calendar or other APIs.
- The task can be completed with least-privilege tool access.

### Use GitHub Projects when

- The task is tracking, labeling, issue structuring, milestone setup or project board governance.

### Use Supabase when

- The task is database design, schema, RLS, Auth, Storage, vector store, knowledge tables, audit logs or environment setup.

### Use n8n when

- The task is workflow orchestration, trigger-action automation, approval routing, webhook logic or workflow testing.

### Use Paperclip lab agent when

- The task is orchestration lab work only.
- The output must not change active product foundations without founder approval.

### Use Hermes lab agent when

- The task is persistent Chief of Staff memory or lab coordination only.
- The output must not change active product foundations without founder approval.

### Use Technical partner when

- The task requires human technical review, secure environment access, production deployment, RLS validation, infrastructure checks or implementation beyond the founder's comfort level.

## Required output format

When this skill is used, output the task in this exact structure.

```markdown
# AI Execution Task

## Task name
[Clear task name]

## Assigned tool or agent
[Choose one: Founder, Claude / AI chat assistant, ChatGPT / AI chat assistant, Codex / AI coding assistant, Claude Code / AI coding assistant, MCP-enabled assistant, GitHub Projects, Supabase, n8n, Paperclip lab agent, Hermes lab agent, Technical partner]

## Why this tool
[Short reason]

## Skill to use
[Exact NURA skill name, or "None" if no skill is needed]

## MCP or integration needed
[Exact MCP, API or integration. If none, say "None"]

## Source context to provide
[List exact source files, sections, prior decisions or objectives]

## Objective
[One clear objective]

## Exact prompt to paste
[Full copy-paste prompt for the assigned worker]

## Allowed actions
[What the worker may do]

## Not allowed actions
[What the worker must not do]

## Founder approval required before
[Actions that need founder approval]

## Expected output
[Files, links, code, workflow, report, issue, PR or document expected]

## Completion report format
The tool must report:
1. What it created
2. What it changed
3. Links or file paths
4. GitHub issue / PR link if relevant
5. Supabase objects changed if relevant
6. n8n workflow link if relevant
7. Tests run
8. Errors
9. Open questions
10. What founder must approve

## Review checklist
[Concrete checks the founder or reviewer can use]

## Rollback or correction instruction
[How to undo, correct or revise the work]

## Next step after approval
[Immediate next action]
```

## Prompt writing rules

Write the "Exact prompt to paste" as a complete instruction that can stand alone in another tool. It must include:

1. Role of the worker
2. Objective
3. Source context
4. Required architecture constraints
5. Allowed actions
6. Not allowed actions
7. Approval gates
8. Required output
9. Test or review requirements
10. Completion report format

Assume the founder is smart but non-technical. Make the prompt easy to copy and paste. Avoid vague language such as:

- Make it better
- Clean this up
- Improve this
- Build the whole thing
- Use best practices

Replace vague language with exact outputs, constraints and review checks.

## Standard guardrails to include when relevant

Add these guardrails to generated prompts when the context requires them:

### Strategy lock

Do not change NURA or DINA strategy, product direction, architecture, tool stack, file names, agent names or execution sequence unless explicitly asked to perform a strategy review.

### No Step 8

Do not create Step 8, investor-readiness content or new execution phases unless the founder explicitly requests it.

### Customer data protection

Do not access, upload, copy, transform or expose real customer data, employee data, production data, private emails, bank records or secrets unless the founder explicitly approves it for this task.

### External communication approval

Do not send external emails, messages, social posts, customer communication or partner communication. Draft only and wait for founder approval.

### Least privilege MCP

Use the minimum permissions needed. Explain why each MCP, API or integration is required before using it.

### Lab-only boundary

Paperclip and Hermes are lab-only unless the founder explicitly promotes a workflow to the approved active architecture.

## Environment requirement guidance

### GitHub tasks

Include:

- Repository name or placeholder
- Branch naming instruction
- Issue or PR requirement
- Files likely to change
- Test command or verification method
- Do not merge without founder approval

### Supabase tasks

Include:

- Project or environment name
- Schema name, usually `nura` or `dina`
- Required tables, policies, functions or storage buckets
- RLS requirement
- Migration file requirement where relevant
- Seed data limitations
- Test queries
- Rollback SQL or migration reversal expectation

### n8n tasks

Include:

- Workflow name
- Trigger
- Nodes required
- Credentials needed
- Test payload
- Approval queue behavior
- Error handling
- Execution log expectation
- Exported workflow JSON if relevant

### MCP tasks

Include:

- MCP name
- Purpose
- Minimum scope
- Allowed operations
- Not allowed operations
- Approval gate before write actions

### Technical partner tasks

Include:

- Business context
- Technical scope
- What they can review or change
- What they must not change
- Required deliverables
- Security expectations
- Completion report

## Manual, AI-assisted and founder review modes

When useful, split the task into three modes:

### Manual mode

Founder or technical partner performs the task by following the instructions.

### AI-assisted mode

AI assistant, AI coding assistant or execution agent generates drafts, code, config or workflow steps.

### Founder review mode

Founder reviews outputs, approvals, risks and next steps before any irreversible change.

Use these modes especially for tasks involving Supabase, GitHub, n8n, MCP, external communication, production deployment or customer data.

## Quality checklist for every generated task

Before finalizing the execution task, check that it answers:

- Is the assigned worker clearly named?
- Is the selected tool justified?
- Is the relevant NURA skill named?
- Are source files or decisions listed?
- Is the prompt copy-paste ready?
- Are allowed and forbidden actions clear?
- Are approval gates explicit?
- Is the expected output measurable?
- Are tests or review steps included?
- Is the completion report format included?
- Is rollback or correction included?
- Does the task follow the NURA clean-source rule?
- Does it avoid deprecated product foundation tools?
- Does it protect customer data and external communication?

## Test prompts

Use these prompts to test whether the skill produces the right output.

### Test prompt 1

Create a Codex task to build the Supabase schema for DINA.

Expected behavior:

- Routes to Codex / AI coding assistant.
- Uses Supabase `dina` schema.
- Includes Auth, RLS, Storage, vector store / knowledge tables, approval queue, audit logs and knowledge isolation where relevant.
- Requires migration files, test queries and rollback instructions.
- Prevents production changes without founder approval.

### Test prompt 2

Create a Claude Code task to set up GitHub Projects labels and issue templates.

Expected behavior:

- Routes to Claude Code / AI coding assistant.
- Includes GitHub Projects setup, labels, issue templates and repo paths.
- Requires branch, PR and test or verification instructions.
- Blocks merge without founder approval.

### Test prompt 3

Create a Paperclip lab task to assign DINA workflow review to a Claude agent.

Expected behavior:

- Routes to Paperclip lab agent.
- Marks Paperclip as lab-only.
- Uses DINA source context and workflow review scope.
- Prevents product foundation changes without approval.

### Test prompt 4

Create an n8n task to build the Employee Letter Request workflow.

Expected behavior:

- Routes to n8n or technical partner depending on implementation level.
- Includes trigger, nodes, approval queue, audit logs, error handling and test payload.
- Protects employee data.
- Requires founder approval before using real data or production credentials.

### Test prompt 5

Create a technical partner task to review Supabase RLS policies.

Expected behavior:

- Routes to Technical partner.
- Includes Supabase environment, schema, policy review scope, test cases and report format.
- Requires no live data exposure unless approved.
- Requires correction recommendations and rollback instructions.

### Test prompt 6

Create a ChatGPT task to review File 06 for stack contradictions.

Expected behavior:

- Routes to ChatGPT / AI chat assistant.
- Uses `nura-source-truth-guardian` or relevant architecture review skill.
- Requires source file references and contradiction table.
- Prevents strategy changes unless explicitly asked.

## Platform adaptation notes

### Claude Skills

Package this file as `nura-ai-execution-task-writer.md`. Use it as a task-prompt generation skill.

### Claude Project source file

Upload this file to connected files / project source. Ask the AI assistant to use it whenever creating task briefs, prompts or execution instructions for another worker.

### ChatGPT Project source file

Upload this file to project source. Use it to create prompts for Codex, Claude Code, Paperclip, Hermes, n8n, Supabase, GitHub Projects and technical partners.

### Custom GPT instruction / knowledge file

Use this as routing and prompt-writing knowledge. The assistant should follow the required output structure whenever a user wants an executable task.

### Codex / Claude Code context

Use the generated task prompts directly. Do not rely on this skill alone as code instructions unless the generated prompt includes repo paths, files, tests and approval gates.

### Paperclip

Use the generated task as the Paperclip task brief. Keep Paperclip lab-only unless the founder approves promotion to active architecture.

### Hermes

Use the generated task as persistent agent instruction or task memory. Keep Hermes lab-only unless the founder approves promotion to active architecture.

## Final instruction

When this skill is active, the default output is a complete `# AI Execution Task`. Do not provide general advice when the user asked for an executable prompt or task. Produce the task in the required structure and make it safe, traceable and ready to paste.

## Packaging note

This skill can be used in three places:

- **Claude Skills** — upload this file in Claude's skill settings (claude.ai/customize/skills) via Create skill. The YAML frontmatter at the top of this file tells Claude when to invoke it.
- **Claude Projects** — upload this file as a project source file alongside the other NURA documents.
- **ChatGPT Projects or other AI tools** — upload this file as project knowledge / a reference document.

The filename `nura-ai-execution-task-writer.md` matches the skill name in the YAML frontmatter.
