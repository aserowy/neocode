local buffer = require("nvim.buffer")
local file = require("nvim.file")

local M = {
    is_executable = vim.fn.executable("yeet") == 1,
    valid_for_pattern = "term://[%w\\/~:]+:yeet %-%-stdout%-on%-open",
}

function M.open(split)
    local current = vim.api.nvim_buf_get_name(0)
    local type = buffer.get_type(current)

    if type == buffer.type.UNKNOWN then
        return
    end

    if split ~= "" then
        vim.cmd(split)
    end

    if type ~= buffer.type.PATH then
        current = vim.fn.getcwd()
    end

    vim.cmd("term yeet --stdout-on-open " .. current)
end

function M.close()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    if #lines == 0 then
        return 1
    end

    local path = file.resolve(lines)
    if not path then
        return 1
    end

    vim.cmd("e " .. path)
    vim.cmd("bd#")
    vim.cmd("filetype detect")

    return 0
end

return M
