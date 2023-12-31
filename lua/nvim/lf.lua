local M = {
    is_handle_valid_pattern = "term://[%w/~]+:lf %-print%-selection [%w/]+",
}

function M.open()
    local current = vim.api.nvim_replace_termcodes(vim.api.nvim_buf_get_name(0), true, false, true)

    vim.cmd("vsplit | term lf -print-selection " .. current)
end

function M.handle_termclose()
    local function file_exists(name)
        local f = io.open(name, "r")
        return f ~= nil and io.close(f)
    end

    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    if #lines == 0 then
        vim.cmd("bd")
        return
    end

    local path = lines[1]
    if not file_exists(path) then
        vim.cmd("bd")
        return
    end

    vim.cmd("e " .. path)
    vim.cmd("bd#")
    vim.cmd("filetype detect")
end

return M
