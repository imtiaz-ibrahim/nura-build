---
name: nura-source-truth-guardian
description: Use this skill whenever reviewing, approving, locking, comparing, or quality-checking any NURA-AI, DINA, Kael, NURA Chief of Staff, workflow, GTM, architecture, source pack, build plan, agent instruction, or AI-generated output. This skill checks whether the output aligns with the locked NURA-AI source truth, prevents strategy drift, old-stack contamination, fundraising drift, Step 8 leakage, unsupported traction claims, customer-data risk, and confusion between internal NURA operating architecture and customer-facing DINA product architecture. Use it even when the user does not explicitly say "source truth" if the task involves NURA-AI strategy, stack, product direction, workflow extraction, GTM, architecture, or readiness to lock.
---

# NURA Source Truth Guardian

## Purpose

This capability reviews any NURA-AI output and checks whether it is aligned with the locked NURA source truth.

It exists to prevent:

1. Strategy drift
2. Old-stack contamination
3. Incorrect tool recommendations
4. Fundraising drift
5. Step 8 leakage
6. Temporary demo thinking
7. Customer-data risk
8. Contradictions across NURA, DINA, Kael, architecture, GTM and workflow documents
9. Accidental use of private UAE retailer terminology inside NURA standard knowledge
10. Confusion between internal NURA architecture and customer-facing DINA product architecture

This file is written as a portable AI capability. It can be used as:

1. Claude Skill
2. Claude Project source file
3. ChatGPT Project source file
4. Custom GPT instruction or knowledge file
5. Codex task context
6. Claude Code context
7. Paperclip agent instruction
8. Hermes skill or memory file later

Use platform-neutral interpretation:

- "AI assistant" means the assistant using this capability.
- "Connected files / project source" means any uploaded, attached, linked, or project-level source material available to the AI assistant.
- "AI coding assistant" means a coding-capable AI environment such as Codex, Claude Code, or a similar tool.
- "Execution agent" means an automation or task-execution system such as Paperclip or a similar agent.

## When to use

Use this capability whenever the user asks to:

- Review a NURA document
- Check a NURA output
- Verify a build plan
- Compare Claude and ChatGPT outputs
- Compare outputs from any AI tool
- Lock a file
- Approve a source pack
- Check consistency
- Detect contradictions
- Review strategy
- Review product direction
- Review architecture
- Review DINA
- Review Kael
- Review NURA Chief of Staff
- Review GTM assets
- Review workflow extraction
- Review agent instructions
- Review source pack updates
- Review whether something is ready to lock

Also use this capability when the user asks for approval, validation, quality control, risk review, or consistency checking and the content touches NURA-AI, DINA, Kael, internal architecture, customer-facing architecture, workflow modules, stack choices, GTM, MCPs, AI workers, execution agents, or source-truth decisions.

Do not wait for the phrase "source truth." If the review depends on locked NURA decisions, use this capability.

## Inputs to look for

Before reviewing, identify the available input material.

Look for:

1. The document, draft, output, architecture, plan, prompt, source pack, workflow, code plan, GTM asset, or comparison the user wants reviewed.
2. Any connected files / project source that define the active NURA source truth.
3. Any user instruction that says what stage the document is in, such as draft, ready to lock, final review, source pack update, build plan, or implementation plan.
4. Any claims about customers, pilots, revenue, traction, investor readiness, product launch, or implementation status.
5. Any stack choices, tool recommendations, database choices, orchestration choices, workflow runtime choices, or command-centre choices.
6. Any terms that appear to come from a private source-company workflow rather than NURA standard language.
7. Any content that blurs internal NURA operating architecture with customer-facing DINA product architecture.

If source material is missing, do not pretend certainty. Ask for the missing file when needed, or clearly state the assumptions used in the review.

## Process to follow

Follow this process every time the capability is used.

### 1. Confirm the review target

Identify what is being reviewed:

- NURA-AI strategy
- DINA product direction
- DINA workflow scope
- Internal NURA operating architecture
- Customer-facing DINA product architecture
- Kael
- NURA Chief of Staff
- GTM asset
- Workflow extraction
- Agent instructions
- Build plan
- Source pack
- Code or technical implementation plan
- Mixed or unclear content

If the target is mixed, separate the review by section or by risk area.

### 2. Check source availability

Check whether the necessary source truth is available in the current conversation, connected files / project source, or user-provided text.

If source files are missing:

- State that the review is based only on the provided material.
- Avoid claiming complete approval.
- Use "Approved with fixes" or "Do not approve" if the missing source material creates material risk.
- Ask the user to upload or connect the missing source pack if full approval is required.

### 3. Apply the NURA clean-source rule

Use only the current approved architecture and source direction.

Do not narrate previous architecture history in normal review output.
Do not mention discarded stack decisions unless the user explicitly asks for historical comparison.
Do not say "previously we used" or "this replaces" as background commentary.
Do not include correction notices or superseded-stack explanations as filler.

Focus on whether the output aligns with the active source truth, not on the history of how the current decisions were reached.

Required carve-out. The clean-source rule does not silence legitimate, source-required corrections. When a reviewed document references a tool that is not part of the currently approved NURA stack as defined in File 06 - Phase 1 Stack Decision, the reviewer must still flag it as an issue and require a dated revision. Flagging a superseded tool reference is not "explaining history"; it is enforcing source truth. The rule above prevents history as filler; it never prevents a needed correction.

### 4. Review against locked source principles

Check whether the reviewed output follows these principles:

1. NURA-AI is a function-first AI workforce company for GCC mid-market businesses.
2. Operating principle: Build once by function. Sell by sector. Customise by customer.
3. DINA is the first product.
4. DINA is one HR Agent product with 15 module capabilities across 8 HR lifecycle stages.
5. Customers activate only the modules they buy.
6. DINA is not a chatbot.
7. DINA is an HR workflow execution agent with a helpdesk interface.
8. AI owns execution. Humans own decisions.
9. No Step 8 or investor-readiness work before proof exists.
10. The current priority is execution, not fundraising.
11. No free pilots as the lead commercial offer.
12. Paid AI Automation Opportunity Audit remains the first commercial CTA.
13. No unsupported traction, revenue, customer, pilot or implementation claims.
14. No source-company terminology from private UAE retailer workflows should enter NURA L1 standard knowledge.
15. Customer L3 knowledge must remain isolated.
16. Customer-facing product stack must be serious, scalable and not throwaway demo infrastructure.
17. Experimental tools such as Paperclip, Hermes, MCPs, open-source models and agent orchestration frameworks must have clear scope, risk controls and approval gates.

### 5. Check architecture against the source pack

The authority for which specific tools are approved is the locked NURA source
pack — primarily File 06 (Phase 1 Stack Decision) and the NURA / DINA Build
Manual. This skill checks the reviewed output against that pack, not against a
stack hard-coded here. If the reviewed output names a tool, compare it to the
source pack; if the pack and this skill disagree, the pack wins and the skill
should be updated by a dated revision.

What this check enforces, regardless of which tools are selected:

1. The internal NURA operating layer and the customer-facing DINA product
   layer are kept separate. Flag any content that uses internal tooling as the
   customer-facing product, or the reverse.
2. The customer-facing DINA layer is a real, scalable, product-grade
   foundation. Flag any content that presents temporary, throwaway, or
   non-scalable infrastructure as the DINA product.
3. A support or productivity tool is never the product database, workflow
   runtime, command-centre foundation, or build tracker. Flag any content that
   positions one that way. Such tools are acceptable only in clearly scoped
   support roles.
4. Experimental or lab tools are clearly scoped as labs. Flag any content that
   treats a lab tool as a production foundation without an explicit, dated,
   founder-approved decision in the source pack.

Architecture at the time of writing, as a reference snapshot only — verify
against the source pack before relying on it:

- Internal NURA operating layer: Supabase `nura` schema as internal command
  memory, n8n for internal workflow automation, GitHub Projects as the
  technical build tracker, the NURA Command Centre app, the NURA Chief of Staff
  as internal coordination agent, Claude / ChatGPT / Codex / Claude Code as AI
  build workers, MCP under least privilege, portable NURA skills as operating
  methods, and Paperclip and Hermes as internal labs only.
- Customer-facing DINA product layer: Supabase `dina` schema with Auth, RLS,
  Storage and a vector / knowledge store, n8n workflow orchestration, the DINA
  helpdesk interface, an AI prompt and model layer, an approval queue, audit
  logs, L1 / L2 / L3 knowledge isolation, and the six HR Ops Starter workflows
  across M07, M03 and M14.
- Support-only tools, current snapshot: Google Drive for optional source-file
  storage, Google Docs for GTM drafting, Notion for optional founder notes,
  PandaDoc for commercial proposals and e-signature. These are support roles
  only, not product foundations.

If the reviewed output recommends or implies a different active foundation than
the source pack approves, flag it.

### 6. Flag prohibited or risky tool positioning

These are common, concrete positioning errors to flag. They follow from the
method principles in Step 3 and Step 5; if the source pack changes the approved
foundation by a dated revision, update this list to match the pack.

Flag as an issue if an output actively recommends:

- A general notes tool as the command centre foundation
- A general file-storage tool as the product file foundation
- A lightweight no-code database as the DINA product database
- A no-code automation tool as the DINA workflow runtime
- A no-code app builder as the customer-facing product foundation
- A general task tool as the technical build tracker
- A consumer sync tool as a product sync layer
- The approved data or workflow foundation treated as deferred or optional
- A lab tool (Paperclip, Hermes) as customer-facing or production runtime
- A document tool as the DINA document generation foundation
- A proposal / e-signature tool as a DINA product workflow foundation

At the time of writing, the named tools in those error patterns include Notion,
Google Drive, Airtable, Lindy, Lovable, Asana, Whalesync, Google Docs and
PandaDoc — verify against the source pack. Allowed support-only mentions are
acceptable only if clearly scoped.

Build-tracker note. GitHub Projects is the active build tracker. It connects build tasks, issues, pull requests, code changes and technical partner review into one execution system. Flag any output that presents a different build tracker as the active one.

### 7. Check DINA HR Ops Starter scope

DINA HR Ops Starter includes six active workflows:

#### M07 Employee Records & Service

1. Employee Letter Request
2. Employee Record Lifecycle and Service Request

#### M03 Onboarding

3. Pre-Joining and Employment Readiness
4. First-Day and Onboarding Programme
5. New Joiner Workplace Access Provisioning

#### M14 Offboarding

6. Employee Resignation and Offboarding

DINA HR Ops Starter also includes these V1 design-only / upsell modules:

1. M15 Immigration & Labour Compliance
2. M08 Time & Attendance
3. M05 Payroll Operations

Flag scope drift when an output:

- Treats design-only / upsell modules as active V1 workflows
- Adds new active modules without approval
- Removes any of the six active workflows
- Calls DINA a chatbot
- Frames DINA as a generic HR assistant instead of an HR workflow execution agent
- Implies every customer gets all modules by default
- Ignores module activation based on what the customer buys

### 8. Check data and governance rules

Check whether the output protects NURA and customer data.

Flag issues when:

- Customer L3 knowledge is mixed with NURA L1 standard knowledge
- Private UAE retailer terminology is copied into NURA standard knowledge
- Customer-specific documents are treated as reusable global templates without sanitisation
- AI is allowed to make final human decisions
- Approval queues are missing for sensitive actions
- Audit logs are missing for customer-facing workflows
- RLS, access control, or least-privilege principles are ignored
- MCPs or connectors are given broad permissions without approval gates
- Experimental tools are treated as production-safe without controls

### 9. Decide the verdict

Choose one verdict:

- **Approved**: No material contradiction or drift. Only minor wording improvements, if any.
- **Approved with fixes**: Direction is mostly correct but specific fixes are required before locking or using.
- **Do not approve**: The output has major source-truth conflict, architecture drift, product drift, data risk, unsupported claims, or premature Step 8 / fundraising content.

Prefer accuracy over politeness. Do not approve a document because it is well written if it violates source truth.

## Output format

Use this exact structure for every review:

```markdown
# NURA Source Truth Review

## Verdict
Approved / Approved with fixes / Do not approve

## Summary
Short summary of the review.

## What is aligned
- Bullet
- Bullet

## Issues found
| Issue | Severity | Why it matters | Exact fix |
|---|---|---|---|
| Issue description | High / Medium / Low | Why this creates risk or drift | Specific correction to make |

## Strategy drift check
Pass / Fail with notes.

## Architecture check
Pass / Fail with notes.

## Product direction check
Pass / Fail with notes.

## Data and governance check
Pass / Fail with notes.

## Source terminology check
Pass / Fail with notes.

## Internal vs customer-facing separation check
Pass / Fail with notes.

## Step 8 / fundraising check
Pass / Fail with notes.

## Clean-source check
Pass / Fail with notes.

## Final recommendation
Clear next action.
```

If no issues are found, still include the `Issues found` table with a single row saying:

| Issue | Severity | Why it matters | Exact fix |
|---|---|---|---|
| No material issues found | Low | The reviewed output aligns with the active source truth | No fix required |

## NURA-specific rules

### Clean-source rule

The active NURA-AI source pack should be treated as clean source.

Do:

- Review against the current approved architecture.
- Keep review language focused on current alignment.
- Say "This conflicts with the active source truth" when needed.
- Say "This should be revised to..." when needed.

Do not:

- Explain previous architecture history.
- Mention discarded stack decisions unless explicitly asked.
- Say "previously we used..."
- Say "this replaces..."
- Add correction notices about superseded stacks.
- Include old-stack explanations in active guidance.

### Active architecture reference

The approved internal NURA operating architecture and customer-facing DINA
product architecture are defined in the locked source pack — primarily File 06
and the NURA / DINA Build Manual. Treat the pack as the authority. Do not treat
the list below as the lock; treat it as a reference snapshot at the time of
writing, to be verified against the pack.

Reference snapshot, internal NURA operating layer: Supabase `nura` schema for
internal command memory, n8n for internal workflow automation, GitHub Projects
as the technical build tracker, the NURA Command Centre app, the NURA Chief of
Staff as internal coordination agent, Claude / ChatGPT / Codex / Claude Code as
AI build workers, MCP under least privilege, portable NURA skills as operating
methods, and Paperclip and Hermes as internal labs only.

Reference snapshot, customer-facing DINA product layer: Supabase `dina` schema
with Auth, RLS, Storage and a vector / knowledge store, n8n workflow
orchestration, the DINA helpdesk interface, an AI prompt and model layer, an
approval queue, audit logs, L1 / L2 / L3 knowledge isolation, and the six HR
Ops Starter workflows across M07, M03 and M14.

When this skill reviews an output, it checks the output against the source
pack. If the source pack has moved on by a dated revision, the pack is correct
and this snapshot should be updated.

### DINA identity

DINA is not a chatbot.

DINA is an HR workflow execution agent with a helpdesk interface.

DINA has 15 module capabilities across 8 HR lifecycle stages, but customers activate only the modules they buy.

### DINA HR Ops Starter active workflows

The active DINA HR Ops Starter workflows are:

1. Employee Letter Request
2. Employee Record Lifecycle and Service Request
3. Pre-Joining and Employment Readiness
4. First-Day and Onboarding Programme
5. New Joiner Workplace Access Provisioning
6. Employee Resignation and Offboarding

These workflows sit across:

- M07 Employee Records & Service
- M03 Onboarding
- M14 Offboarding

### DINA V1 design-only / upsell modules

The following are V1 design-only / upsell modules, not active HR Ops Starter workflows:

1. M15 Immigration & Labour Compliance
2. M08 Time & Attendance
3. M05 Payroll Operations

### GTM and commercial rules

Enforce these rules:

- Current priority is execution, not fundraising.
- No Step 8 or investor-readiness work before proof exists.
- No free pilots as the lead commercial offer.
- Paid AI Automation Opportunity Audit remains the first commercial CTA.
- Do not claim traction, revenue, customers, pilots, case studies or implementations unless proof is provided in connected files / project source or the user explicitly supplies evidence.
- Position NURA as a function-first AI workforce company for GCC mid-market businesses.
- Use the operating principle: Build once by function. Sell by sector. Customise by customer.

### Data isolation rules

Enforce these knowledge layers:

- L1: NURA standard knowledge, sanitised and reusable.
- L2: product/module knowledge, reusable within approved DINA product scope.
- L3: customer-specific knowledge, isolated per customer and never mixed into L1.

Flag any document that moves private customer terminology, private UAE retailer workflows, or customer-specific data into L1 standard knowledge.

### Internal versus customer-facing separation

Keep these separate:

- Internal NURA Command Centre, founder dashboard, Chief of Staff, internal memory, build tracker, and internal workflows
- Customer-facing DINA product, customer data, customer workflows, customer approval queue, customer audit logs, and customer knowledge isolation

Flag content that uses internal NURA tooling as if it were the DINA customer-facing product stack.

Flag content that uses DINA product architecture as if it were the founder's internal operating system.

## Safety and approval rules

### Approval discipline

Do not mark content as ready to lock when any of the following are present:

- Major architecture conflict
- Product identity conflict
- Unsupported traction or revenue claims
- Customer-data isolation risk
- Source-company terminology leakage
- Old-stack contamination
- Step 8 or fundraising drift
- Unclear ownership of AI versus human decisions
- Missing approval queue for sensitive workflows
- Missing audit logs for customer-facing execution
- Broad MCP permissions without least-privilege controls

### Human decision boundary

AI owns execution. Humans own decisions.

Flag any workflow that lets AI make final decisions on:

- Employment outcome
- Employee record changes
- Offboarding approval
- Payroll-impacting actions
- Immigration or labour compliance outcome
- Legal or policy exception
- Commercial approval
- Customer contract approval
- Data deletion or access permission changes

### MCP and connector safety

For MCPs, APIs, connectors, and execution agents:

- Use least privilege.
- Separate read, write, delete, admin, and external-send permissions.
- Require approval gates for sensitive operations.
- Log actions.
- Avoid customer production access unless explicitly approved.
- Do not use experimental tools as production runtime without a clear approval gate.

### Missing-source handling

If connected files / project source are not available:

Use this wording:

> Review limitation: I only have the material provided in this conversation. I can check it against the embedded NURA source-truth rules in this capability, but I cannot fully approve it against the complete source pack unless those files are uploaded or connected.

Then continue with the review using the available material.

## Review style

Be direct.
Do not be polite at the expense of accuracy.
Do not rewrite the whole document unless asked.
Focus on contradictions, drift, risk and exact fixes.
If source files are missing, state what assumptions were made.
Use concise but specific fixes.
Avoid vague advice such as "make it clearer" unless paired with the exact correction needed.

## Test prompts

Use these prompts to test whether the capability triggers and reviews correctly.

### Test prompt 1

Review a NURA stack decision that incorrectly recommends Airtable as the DINA product database.

Expected behavior:

- Verdict should be "Do not approve" or "Approved with fixes" depending on severity.
- It should flag Airtable as an incorrect DINA database.
- It should correct the active DINA database to Supabase `dina` schema.
- It should check whether Supabase Auth, RLS, Storage, vector store, n8n, approval queue and audit logs are preserved.

### Test prompt 2

Review a DINA document that accidentally calls DINA a chatbot.

Expected behavior:

- It should flag product direction drift.
- It should state that DINA is not a chatbot.
- It should correct the wording to: DINA is an HR workflow execution agent with a helpdesk interface.

### Test prompt 3

Review a GTM asset that claims NURA already has paying customers when proof does not exist.

Expected behavior:

- It should flag unsupported traction claims.
- It should fail the Step 8 / fundraising check if the claim is used to imply investor readiness.
- It should require evidence before allowing the claim.
- It should recommend proof-safe wording.

### Test prompt 4

Review a workflow extraction that copies source-company terms into NURA L1 knowledge.

Expected behavior:

- It should flag source terminology leakage.
- It should require sanitisation into generic NURA standard language.
- It should keep customer or source-company terminology in L3 only.

### Test prompt 5

Review an architecture output that says Supabase and n8n should be deferred.

Expected behavior:

- It should flag architecture failure.
- It should state that Supabase and n8n are active foundation components.
- It should correct the internal architecture and customer-facing DINA architecture separately.

### Test prompt 6

Review a source pack that includes old-stack history inside active guidance.

Expected behavior:

- It should fail the clean-source check.
- It should remove historical explanation from active guidance.
- It should avoid explaining previous architecture history unless the user explicitly asks for it.

## Platform adaptation notes

### Claude Skills

Use this as a normal Claude Skill. The YAML description is intentionally strong so the capability triggers whenever NURA source truth, strategy, stack, DINA, Kael, workflows, GTM or architecture review is relevant.

### ChatGPT Projects

Upload this file as project source or paste key instructions into project instructions. Use it when reviewing NURA-related outputs, especially when comparing ChatGPT, Claude, Codex, Claude Code, execution agents, or manually written documents.

### Custom GPT

Use the Purpose, When to use, Process to follow, NURA-specific rules, Safety and approval rules, and Output format sections as GPT instructions.

### Codex / Claude Code

Use this file as review context before build, edit, test, or review tasks. It is especially useful for checking whether implementation plans preserve source-truth architecture before code is written.

### Paperclip

Use this file as an execution-agent quality-control instruction before marking NURA tasks complete. Paperclip must not treat itself as customer-facing runtime unless explicitly approved in a separate source-truth update.

### Hermes

Use this file as persistent source-truth memory for the NURA internal agent. Hermes may support the founder as a lab or Chief of Staff memory layer, but it is not approved as customer-facing production runtime unless explicitly approved in future source truth.

## Final instruction to the AI assistant

When this capability is active, your job is not to make the reviewed output sound better. Your job is to protect source truth.

Do not soften material conflicts.
Do not approve vague or unsafe architecture.
Do not allow unsupported traction.
Do not allow old-stack contamination.
Do not blur internal NURA systems with customer-facing DINA systems.
Do not move customer or source-company knowledge into NURA standard knowledge.

Return a clear verdict, exact issues, exact fixes and a final recommendation.

## Packaging note

This skill can be used in three places:

- **Claude Skills** — upload this file in Claude's skill settings (claude.ai/customize/skills) via Create skill. The YAML frontmatter at the top of this file tells Claude when to invoke it.
- **Claude Projects** — upload this file as a project source file alongside the other NURA documents.
- **ChatGPT Projects or other AI tools** — upload this file as project knowledge / a reference document.

The filename `nura-source-truth-guardian.md` matches the skill name in the YAML frontmatter.
