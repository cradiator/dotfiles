# Start ssh-agent if not already running
if command -v ssh-agent &> /dev/null; then
    pgrep -l ssh-agent > /dev/null
    if [[ $? -ne 0 ]]; then
        ssh-agent > ~/.ssh/agent-env
    fi

    if [[ -f ~/.ssh/agent-env ]]; then
        . ~/.ssh/agent-env > /dev/null
    fi
fi


[[ -f "$HOME/.zsh/homebrew.sh" ]] && source "$HOME/.zsh/homebrew.sh"
[[ -f "$HOME/.zsh/yazi.sh" ]] && source "$HOME/.zsh/yazi.sh"

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

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

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
  bindkey "\el" _sgpt_zsh  # alt + l
fi


_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)          fzf --preview 'tree {}'   "$@" ;;
    *)            fzf "$@" ;;
  esac
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ -x "/opt/homebrew/Caskroom/miniforge/base/bin/conda" ]; then
    __conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
            . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
        else
            export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi
# <<< conda initialize <<<

if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi


# Added by Antigravity
if [ -d "$HOME/.antigravity/antigravity/bin" ]; then
  export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
fi

if command -v claude &> /dev/null; then
  c-cmd() {
    local cmd
    cmd=$(claude -p "Generate a single shell command to: $*. Output ONLY the raw command — no explanation, no markdown, no code fences." --model claude-sonnet-4-6 2>/dev/null)
    [[ -n "$cmd" ]] && print -z "$cmd"
  }

  c-ask() {
    claude -p "$*" --model claude-sonnet-4-6
  }
fi
