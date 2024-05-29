# Update path env
export PATH="$HOME/.bin:$HOME/.local/bin:/usr/local/sbin/:/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/dev/infra/works-on-my-machine/bin:$PATH"

# Set Visual Studio Code as default editor
export EDITOR="code -w"

# Keep iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# Enable terminal colors
export CLICOLOR=1

# Silence direnv logs
export DIRENV_LOG_FORMAT=""

# Compilers to find libffi
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

# Dox CLI token from keychain
# Updating keychain password:
#   $ security add-generic-password -a "$USER" -s "dox_cli_github_token" -U -w <new-value>
export DOXCLI_GITHUB_TOKEN=$(security find-generic-password -a "$USER" -s "dox_cli_github_token" -w)
