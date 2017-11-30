# Bash completion
. $(brew --prefix)/etc/bash_completion

# Asdf version manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' -e 's/\s+//g'
}

ruby_version() {
  asdf current ruby | sed -e 's/No version set for ruby//g' -e 's/(\(.*\))//' -e 's/ //g'
}

export PATH="$HOME/.bin:$PATH"

export PS1="\w \[\033[1;33m\]\$(ruby_version)\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
