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
export PATH="$HOME/.bin:/usr/local/sbin/:$GOPATH/bin:/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/libpq/bin:$PATH"
export EDITOR="code -w"

# Keep iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# Disable javac compilation and use native openssl installation to build erlang
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl)"

# Disable zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set a higher open files limit to allow multiple kafka consumers using Elixir
ulimit -n 350

####################
# Aliases
####################
alias dc="docker-compose"
alias lsa="ls -lah"
alias ms="mix phx.server"
alias ims="iex -S mix phx.server"
alias deeplink="xcrun simctl openurl booted"

# Update PATH for the Google Cloud SDK.
if [ -f '/Users/davidbrusius/google-cloud-sdk/path.bash.inc' ]; then . '/Users/davidbrusius/google-cloud-sdk/path.bash.inc'; fi

# Enable shell command completion for gcloud.
if [ -f '/Users/davidbrusius/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/davidbrusius/google-cloud-sdk/completion.bash.inc'; fi

# Enable autojump integration
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Enable autocomplete for brew packages
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# Enable heroku autocomplete
heroku autocomplete:script bash > /dev/null

# Direnv setup
export DIRENV_LOG_FORMAT=""
eval "$(direnv hook bash)"
