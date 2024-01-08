local M = {}

function M.exists(path)
    local f = io.open(path, "r")
    return f ~= nil and io.close(f)
end

function M.lines(path)
    if not M.exists(path) then
        return {}
    end

    local lines = {}
    for line in io.lines(path) do
        lines[#lines + 1] = line
    end

    return lines
end

return M
