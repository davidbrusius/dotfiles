# Oh My ZSH config
export ZSH=$HOME/.oh-my-zsh
zstyle ":omz:update" mode reminder
COMPLETION_WAITING_DOTS="true"

# Oh My ZSH theme
ZSH_THEME="robbyrussell"

# Oh My ZSH plugins
plugins=(
  asdf
  aws
  git
  kubectl
  terraform
)

source $ZSH/oh-my-zsh.sh

# Case-insensitive globbing
setopt NO_CASE_GLOB

# Automatically switch directories when path is provided without `cd` command
setopt AUTO_CD

# Setup shell history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Set a higher open files limit to allow multiple kafka consumers using Elixir
ulimit -n 350

# Aliases
alias dc="docker-compose"
alias deeplink="xcrun simctl openurl booted"
alias ims="iex -S mix phx.server"
alias kc="kubectl"
alias lsa="ls -lah"
alias ms="mix phx.server"

# Disable javac compilation and use native openssl installation to build erlang
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl)"

# Enable autojump integration
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# Add Docker and custom functions configs
fpath=(~/.zsh/completion ~/.zsh/functions $fpath)

# Dox CLI autocomplete
dox completion zsh > "${fpath[1]}/_dox"

# Start autocomplete
autoload -Uz compinit && compinit

# Autoload custom functions
autoload codej
autoload dusort
autoload rpromptcustom
autoload tfvar

# Hook direnv to zsh shell
eval "$(direnv hook zsh)"

# Init dox compose
eval "$("$HOME/dev/doximity/dox-compose/bin/dox-init")"
source ~/.config/doxcompose.sh

# Hide username from prompt context
prompt_context() {}

# RPROMPT customization
RPROMPT='$(rpromptcustom)'
