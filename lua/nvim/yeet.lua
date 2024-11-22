local buffer = require("nvim.buffer")
local file = require("nvim.file")

local M = {
    is_executable = vim.fn.executable("yeet"),
    tmp_selection_file = os.tmpname(),
    valid_for_pattern = "term://[%w\\/~:]+:yeet %-%-selection%-to%-file%-on%-open",
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

    vim.cmd("term yeet --selection-to-file-on-open '" .. M.tmp_selection_file .. "' '" .. current .. "'")
end

function M.close()
    local lines = file.lines(M.tmp_selection_file)

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
