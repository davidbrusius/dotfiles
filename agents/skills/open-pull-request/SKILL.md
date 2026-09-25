---
name: open-pull-request
description: Open a GitHub pull request after rebasing the current branch and completing the repository PR template.
metadata:
  short-description: Open a GitHub pull request safely
---

# Open Pull Request

Use when asked to open or create a GitHub pull request.

1. Fetch `origin` and confirm the current branch contains the latest `origin/master`:
   ```sh
   git fetch origin
   git merge-base --is-ancestor origin/master HEAD
   ```
   If it does not, rebase onto `origin/master` before opening the PR. Resolve conflicts if safe; otherwise abort the rebase and report the blocker. Do not open the PR until the rebase succeeds.
2. Locate the repository's GitHub PR template (including `.github/PULL_REQUEST_TEMPLATE.md`, `.github/pull_request_template.md`, root-level templates, or configured template directories). Use that template as the PR body and complete its applicable sections. If no template exists or multiple templates make the choice ambiguous, stop and ask the user rather than inventing one.
3. Ask the user whether to create the PR as a draft. Do not infer a default; wait for their answer before creating the PR.
4. Ensure the branch is pushed and the working tree is clean before creating the PR.
5. Create the PR with `gh pr create`, targeting the requested base branch (default `master`) and using the completed template body. Pass `--draft` when the user requests a draft PR.

## Title rule

**Never include a Jira story or ticket ID in the PR title.** Keep Jira references in the PR body only when the repository template calls for them.
