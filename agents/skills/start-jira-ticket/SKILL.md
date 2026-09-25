---
name: start-jira-ticket
description: Set up a repository to begin a Jira story. Use when given a Jira ticket ID or link and a custom dashed branch name, and the task is to update local master from origin, create a branch named db/<ticket-id>/<custom-dashed-name>, self-assign unassigned stories, and move eligible stories to In Progress.
---

# Start Story Work

1. Accept a Jira ticket ID (for example, `ABC-123`) or Jira URL. Extract and normalize the ticket ID to uppercase. Before Jira work, confirm authentication succeeds with `acli auth status`. When no custom dashed branch name is provided, fetch the Jira story and infer a concise descriptive name from its title and, if useful, its content. Ask only if the ticket cannot be accessed or no suitable name can be inferred.
2. Confirm the custom name is lowercase dashed words (`[a-z0-9]+(?:-[a-z0-9]+)*`). When inferred, normalize it to that format and tell the user the selected name before creating the branch.
3. Run from the target repository. Check that the working tree is clean, `origin` exists, and `master` exists locally or on `origin`. Stop and report any failed precondition; never discard, stash, or overwrite work without explicit user approval.
4. Update master safely:

   ```sh
   git fetch origin master
   git checkout master
   git pull --ff-only origin master
   ```

5. Create and switch to the branch:

   ```sh
   git checkout -b "db/<TICKET-ID>/<custom-dashed-name>"
   ```

   If that branch already exists locally, switch to it only after telling the user; do not recreate or reset it. If it exists only on `origin`, ask whether to track the remote branch or use a different name.
6. After successfully checking out the branch, inspect the story's current Jira assignee. If it is unassigned, assign it to the authenticated user:

   ```sh
   acli jira workitem assign --key <TICKET-ID> --assignee "@me" --yes
   ```

   Do not change an existing assignee. If the assignment fails, report the failure; do not undo the branch setup.
7. Inspect the story's current Jira status. If it is `Backlog` or `Selected for Development`, transition it to `In Progress`:

   ```sh
   acli jira workitem transition --key <TICKET-ID> --status "In Progress" --yes
   ```

   Do not change the status for stories in any other status. If the transition fails, report the failure; do not undo the branch setup.
8. Report the checked-out branch, the master commit used as its base, and whether the Jira story was assigned or transitioned. Do not make any product-code changes as part of setup.
