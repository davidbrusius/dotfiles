# Update path env
export PATH="$HOME/.bin:$HOME/.local/bin:$HOME/go/bin:/usr/local/sbin/:/usr/local/opt/go/libexec/bin:/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/work/infra/dox-eks/scripts:$PATH"
export PATH="$HOME/work/works-on-my-machine/bin:$PATH"

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
#   $ security add-generic-password -a "$USER" -s "nexus_base64" -U -w <new-value>
#   $ security add-generic-password -a "$USER" -s "fireworks_api_key" -U -w <new-value>

export NEXUS_BASE64=$(security find-generic-password -a "$USER" -s "nexus_base64" -w)
export FIREWORKS_API_KEY=$(security find-generic-password -a "$USER" -s "fireworks_api_key" -w)
