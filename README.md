# dotfiles

## Codex skills

The Codex installer copies the skills in `agents/skills/` into dox-agent's
shared store at `${XDG_CONFIG_HOME:-$HOME/.config}/dox-agent/skills`. The copies
avoid pointing sandboxed skill reads outside the shared store. Rerunning the
installer updates only skills it previously installed; it leaves unrelated
skills in the store untouched.

On a machine with existing provider skill directories, run
`dox-agent skills migrate --dry-run` from a normal terminal, review the plan,
then run `dox-agent skills migrate` to link provider directories to the shared
store. Run the Codex installer afterwards to refresh the dotfiles-managed copies.
