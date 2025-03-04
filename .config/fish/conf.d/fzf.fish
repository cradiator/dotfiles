if command -v fzf >/dev/null
    if fzf --fish >/dev/null
        fzf --fish | source
    end
end
