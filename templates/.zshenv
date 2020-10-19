# Set GOPATH env
export GOPATH=~/go

# Update path env
export PATH="$HOME/.bin:/usr/local/sbin/:$GOPATH/bin:/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/libpq/bin:$PATH"

# Set Visual Studio Code as default editor
export EDITOR="code -w"

# Keep iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# Enable terminal colors
export CLICOLOR=1

# Silence direnv logs
export DIRENV_LOG_FORMAT=""
