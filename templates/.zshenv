# Update path env
export PATH="$HOME/.bin:$HOME/.local/bin:/usr/local/sbin/:/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/dev/infra/works-on-my-machine/bin:$PATH"

# Set Zed as default editor
export EDITOR="zed -w"

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

# Anthropic Claude Code
export ANTHROPIC_BASE_URL=https://api.anthropic.com

# Secure tokens from keychain
# Updating keychain password:
#   $ security add-generic-password -a "$USER" -s "anthropic_api_key" -U -w <new-value>
#   $ security add-generic-password -a "$USER" -s "dox_cli_github_token" -U -w <new-value>
export ANTHROPIC_API_KEY=$(security find-generic-password -a "$USER" -s "anthropic_api_key" -w)
export DOXCLI_GITHUB_TOKEN=$(security find-generic-password -a "$USER" -s "dox_cli_github_token" -w)
