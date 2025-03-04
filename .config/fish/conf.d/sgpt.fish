if command -v sgpt >/dev/null
    function _sgpt_fish
        set _prev_cmd (commandline)
        if test -n "$_prev_cmd"
            set _sgpt_result (sgpt --shell --no-interaction -- $_prev_cmd 2>/dev/null)
            if test -n "$_sgpt_result"
                commandline --replace "$_sgpt_result"
            end
        end
    end

    bind alt-l _sgpt_fish  # 绑定 Alt+L
end
