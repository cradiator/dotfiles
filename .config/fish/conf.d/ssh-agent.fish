# Start ssh-agent if not already running
if not pgrep -x ssh-agent >/dev/null
    ssh-agent | awk -F'; ' '/=/ {split($1, kv, "="); print "set -gx", kv[1], kv[2]}' | grep -v '^echo' > ~/.ssh/agent-env.fish
end

if test -f ~/.ssh/agent-env.fish
    source ~/.ssh/agent-env.fish
end
