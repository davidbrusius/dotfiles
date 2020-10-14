# Update path env
export PATH="$HOME/.bin:/usr/local/sbin/:$GOPATH/bin:/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/libpq/bin:$PATH"

# Set Visual Studio Code as default editor
export EDITOR="code -w"

# Set GOPATH env
export GOPATH=~/go

# Keep iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# Disable javac compilation and use native openssl installation to build erlang
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl)"
