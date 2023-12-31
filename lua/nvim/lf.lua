local M = {
    is_handle_valid_pattern = "term://[%w/~]+:lf %-print%-selection [%w/]+",
}

local function file_exists(name)
    local f = io.open(name, "r")
    return f ~= nil and io.close(f)
end

function M.open(split)
    local current = vim.api.nvim_buf_get_name(0)
    if not file_exists(current) then
        return
    end

    if split ~= "" then
        vim.cmd(split)
    end

    if vim.fn.executable("lf") == 1 then
        vim.cmd("term lf -print-selection " .. current)
    else
        vim.cmd("Explore")
    end
end

function M.handle_termclose()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    if #lines == 0 then
        vim.cmd("b# | bd#")
        return
    end

    local path = lines[1]
    if not file_exists(path) then
        vim.cmd("b# | bd#")
        return
    end

    vim.cmd("e " .. path)
    vim.cmd("bd#")
    vim.cmd("filetype detect")
end

return M
