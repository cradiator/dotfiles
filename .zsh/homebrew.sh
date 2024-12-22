if command -v /usr/local/bin/brew &>/dev/null; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

if command -v /opt/homebrew/bin/brew &>/dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if command -v /home/linuxbrew/.linuxbrew/bin/brew &>/dev/null; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
