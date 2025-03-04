if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Check if ~/.local/bin exists and add it to PATH if not already included
if test -d "$HOME/.local/bin"
    if not contains "$HOME/.local/bin" $PATH
        set -p PATH "$HOME/.local/bin"
    end
end
