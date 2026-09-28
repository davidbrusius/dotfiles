---
name: write-jira-ticket
description: Draft and create clear Jira story tickets using the team's required Description, Technical Details, and Acceptance Criteria template. Use when asked to write, draft, prepare, or create a Jira ticket, story, or issue.
---

# Write Jira Ticket

Gather the ticket requirements from the request and repository context before drafting. Ask concise follow-up questions only for information that is missing.

## Required questions

Collect these before creating the ticket. Ask **exactly one required question per assistant message**, wait for the user's answer, and then ask the next unanswered question. Never bundle multiple required questions into one message. When an interactive user-input tool is available, use it rather than plain text questions, preserving free-text fallback for every field.

1. **Title:** Generate three concise, action-oriented titles from the request. Present each as a selectable option and allow a custom free-text title.
2. **Parent:** Present numbered options: `1. No parent` and `2. Parent Jira ticket`. Allow the user to enter a parent Jira ticket link or key for option 2.
3. **Assignee:** Present numbered options: `1. Assign to me` and `2. Leave unassigned`.
4. **Status:** Present numbered options: `1. Backlog` and `2. Selected for Development`.

If interactive input is unavailable, ask the same questions one at a time in plain text with their numbered options, and explicitly allow a custom title and parent link.

If the request does not contain enough information to write a useful ticket body, ask targeted questions for the missing problem statement, intended implementation, or testable outcomes.

## Drafting

Write the ticket body with native Jira Heading 3 sections, retaining empty sections only when the user explicitly wants a draft without enough detail. In drafts, show the sections using Jira wiki markup:

```text
h3. Description

h3. Technical Details

h3. Acceptance Criteria
```

* State the user impact and desired outcome in **Description**.
* Describe implementation constraints, affected systems, dependencies, and non-goals in **Technical Details**.
* Use `*` bullet lists for line items, including observable, testable acceptance criteria; do not use checkbox syntax (`[ ]`).
* Keep facts separate from assumptions. Label assumptions and confirm them before creating the Jira issue.

## Jira project

Create every ticket in the **SA** Jira project by default. Use another project only when the user explicitly requests it.

## Create the issue

Present the completed title and body for confirmation unless the user explicitly asked to create it immediately. Then use the available Jira integration to create the story, set its parent when supplied; assign it to the user only when requested; and set the selected status. Submit the description as Atlassian Document Format (ADF), using `heading` nodes with `level: 3` for the three required sections, so the headings render correctly in Jira. When the draft uses backticks for inline code, create the corresponding ADF text node with a `code` mark so it renders as inline code in Jira; plain backticks in text do not apply code formatting. When the draft contains a URL, create an ADF text node with a `link` mark and its `href` set to that URL; plain URL text does not create a clickable Jira link. If the user chooses Selected for Development, apply that matching transition; otherwise leave it in Backlog. If no matching transition is available, report that status must be changed manually. Report the resulting Jira link.
