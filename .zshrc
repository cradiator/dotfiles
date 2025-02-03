# Start ssh-agent if not already running
pgrep -l ssh-agent > /dev/null
if [[ $? -ne 0 ]]; then
    ssh-agent > ~/.ssh/agent-env
fi

if [[ -f ~/.ssh/agent-env ]]; then
    . ~/.ssh/agent-env > /dev/null
fi


source "$HOME/.zsh/homebrew.sh"
source "$HOME/.zsh/yazi.sh"

# Check if lsd is installed
if command -v lsd &> /dev/null; then
  alias ls='lsd'
else
  alias ls='ls --color=auto' # Fallback to default ls with color
fi
alias l='ls'
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

if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

# zellij
if command -v zellij &> /dev/null; then
  alias zj='zellij'
fi

# Load custom config
if [[ -f "$HOME/.zsh/custom" ]]; then
        source "$HOME/.zsh/custom"
fi

# Check if ~/.local/bin exists and add it to PATH if not already included
if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

eval "$(starship init zsh)"

if command -v sgpt &> /dev/null; then
  # Shell-GPT integration ZSH v0.2
  _sgpt_zsh() {
  if [[ -n "$BUFFER" ]]; then
      _sgpt_prev_cmd=$BUFFER
      BUFFER+="⌛"
      zle -I && zle redisplay
      BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
      zle end-of-line
  fi
  }
  zle -N _sgpt_zsh
  bindkey ^l _sgpt_zsh
  # Shell-GPT integration ZSH v0.2
fi

