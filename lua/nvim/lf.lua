local M = {
    valid_for_pattern = "term://[%w/~]+:lf %-print%-selection [%w/]+",
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

function M.close()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    if #lines == 0 then
        return 1
    end

    local path = lines[1]
    if not file_exists(path) then
        return 1
    end

    vim.cmd("e " .. path)
    vim.cmd("bd#")
    vim.cmd("filetype detect")

    return 0
end

return M
