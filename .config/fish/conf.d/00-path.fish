# Check if ~/.local/bin exists and add it to PATH if not already included
test -d "$HOME/.local/bin"; and set -p PATH "$HOME/.local/bin"