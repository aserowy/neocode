local file = require("nvim.file")

local M = {
    type = {
        UNKNOWN = -1,
        TERMINAL = 1,
        PATH = 2,
        EMPTY_BUFFER = 3,
    },
}

local function isempty(s)
    return s == nil or s == ""
end

function M.get_type(title)
    if isempty(title) then
        return M.type.EMPTY_BUFFER
    end

    if title:match("term://") then
        return M.type.TERMINAL
    end

    if vim.fn.filereadable(title) then
        return M.type.PATH
    end

    return M.type.UNKNOWN
end

return M
