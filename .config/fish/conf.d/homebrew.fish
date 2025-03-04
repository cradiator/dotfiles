if command -v /usr/local/bin/brew >/dev/null
    /usr/local/bin/brew shellenv | source
end

if command -v /opt/homebrew/bin/brew >/dev/null
    /opt/homebrew/bin/brew shellenv | source
end

if command -v /home/linuxbrew/.linuxbrew/bin/brew >/dev/null
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end