# Start ssh-agent if not already running
pgrep -l ssh-agent > /dev/null
if [[ $? -ne 0 ]]; then
    ssh-agent > ~/.ssh/agent-env
fi

if [[ -f ~/.ssh/agent-env ]]; then
    . ~/.ssh/agent-env > /dev/null
fi

# load OS specific configs
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    if [[ -f "$HOME/.zsh/mac" ]]; then
        source "$HOME/.zsh/mac"
    else
        echo "Warning: ~/.zsh/mac not found."
    fi
elif [[ "$(uname)" == "Linux" ]]; then
    # Linux
    if [[ -f "$HOME/.zsh/linux" ]]; then
        source "$HOME/.zsh/linux"
    else
        echo "Warning: ~/.zsh/linux not found."
    fi
else
    echo "Unsupported OS: $(uname)"
fi

# Check if lsd is installed
if command -v lsd &> /dev/null; then
  alias ls='lsd'
else
  alias ls='ls --color=auto' # Fallback to default ls with color
fi

if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

# Load custom config
if [[ -f "$HOME/.zsh/custom" ]]; then
        source "$HOME/.zsh/custom"
fi

eval "$(starship init zsh)"

