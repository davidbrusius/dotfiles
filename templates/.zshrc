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
alias lsa="ls -lah"
alias ms="mix phx.server"
alias ims="iex -S mix phx.server"
alias deeplink="xcrun simctl openurl booted"

# Disable javac compilation and use native openssl installation to build erlang
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl)"

# Enable autojump integration
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Enable autocomplete for brew packages
if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

# Heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/david.brusius/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Asdf config
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Docker config
fpath=(~/.zsh/completion $fpath)

# Hook direnv to zsh shell
eval "$(direnv hook zsh)"

# Initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Spaceship configs
SPACESHIP_DOCKER_SHOW=false
