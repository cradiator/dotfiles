# Check if lsd is installed
if command -v lsd >/dev/null
    alias ls lsd
else
    alias ls 'ls --color=auto' # Fallback to default ls with color
end
alias l ls
alias la 'ls -a'
alias ll 'ls -l'