# Bash completion
. $(brew --prefix)/etc/bash_completion

# Asdf version manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/\s+//g'
}

elixir_version() {
  asdf current elixir | sed -e 's/(\(.*\))//' -e 's/ //g'
}

export PS1="\w\[\033[1;33m\] \$(elixir_version)\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export GOPATH=~/go
export PATH="$HOME/.bin:/usr/local/sbin/:$GOPATH/bin:/bin:$PATH"
export EDITOR="code -w"

# Keep iex history
export ERL_AFLAGS="-kernel shell_history enabled"

####################
# Aliases
####################
alias dc="docker-compose"
alias lsa="ls -la"
alias ms="mix phx.server"
alias ims="iex -S mix phx.server"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davidbrusius/google-cloud-sdk/path.bash.inc' ]; then . '/Users/davidbrusius/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/davidbrusius/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/davidbrusius/google-cloud-sdk/completion.bash.inc'; fi
