# Bash completion
. $(brew --prefix)/etc/bash_completion

# Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

rbenv_version() {
  rbenv version-name
}

export PATH="$HOME/.rbenv/bin:$HOME/.bin:$PATH"
export POSTGRESQL_PORT="15432"

export PS1="\w \[\033[1;33m\]\$(rbenv_version)\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

eval "$(rbenv init -)"
eval "$(nodenv init -)"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
