# Start ssh-agent if not already running
pgrep -l ssh-agent > /dev/null
if [[ $? -ne 0 ]]; then
    ssh-agent > ~/.ssh/agent-env
fi

if [[ -f ~/.ssh/agent-env ]]; then
    . ~/.ssh/agent-env > /dev/null
fi


source "$HOME/.zsh/homebrew.sh"

# Check if lsd is installed
if command -v lsd &> /dev/null; then
  alias ls='lsd'
else
  alias ls='ls --color=auto' # Fallback to default ls with color
fi
alias la='ls -a'
alias ll='ls -l'

if command -v fzf &> /dev/null; then
  if fzf --zsh &> /dev/null; then
    source <(fzf --zsh)
  fi
fi

# Load zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

if command -v nvim &> /dev/null; then
  alias v='nvim'
  alias vim='nvim'
  alias vi='nvim'
fi

# mini conda
if command -v conda &> /dev/null; then
  eval "$(conda "shell.$(basename "${SHELL}")" hook)"
fi

# Load custom config
if [[ -f "$HOME/.zsh/custom" ]]; then
        source "$HOME/.zsh/custom"
fi

eval "$(starship init zsh)"


