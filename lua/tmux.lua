local vim = vim

local TMUX = os.getenv("TMUX")
local TMUX_PANE = os.getenv("TMUX_PANE")

local tmux_directions = {
    h = "L",
    j = "D",
    k = "U",
    l = "R",
}

local tmux_borders = {
    h = "left",
    j = "bottom",
    k = "top",
    l = "right",
}

local function get_socket()
    return vim.split(TMUX, ",")[1]
end

local function execute(arg)
    local t_cmd = string.format("tmux -S %s %s", get_socket(), arg)

    local handle = assert(io.popen(t_cmd), string.format("Navigator: Unable to execute > [%s]", t_cmd))
    local result = handle:read("l")

    handle:close()

    return result
end

local T = {
    is_tmux = TMUX ~= nil,
}

T.has_neighbor = function(direction)
    local command = string.format("display-message -p '#{pane_at_%s}'", tmux_borders[direction])

    return execute(command) ~= '1'
end

T.change_pane = function(direction)
    execute(string.format("select-pane -t '%s' -%s", TMUX_PANE, tmux_directions[direction]))
end

T.resize = function(direction)
    execute(string.format("resize-pane -t '%s' -%s 1", TMUX_PANE, tmux_directions[direction]))
end

T.is_zoomed = function()
    return execute("display-message -p '#{window_zoomed_flag}'") == "1"
end

return T
