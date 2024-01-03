local UNKNOWN = -1
local TERMINAL = 1
local PATH = 2
local EMPTY_BUFFER = 3

local M = {
    valid_for_pattern = "term://[%w/~]+:lf %-print%-selection [%w/]+",
}

local function isempty(s)
    return s == nil or s == ""
end

local function file_exists(name)
    local f = io.open(name, "r")
    return f ~= nil and io.close(f)
end

local function get_buffer_type(title)
    if isempty(title) then
        return EMPTY_BUFFER
    end

    if title:match("term://") then
        return TERMINAL
    end

    if file_exists(title) then
        return PATH
    end

    return UNKNOWN
end

function M.open(split)
    local current = vim.api.nvim_buf_get_name(0)
    local type = get_buffer_type(current)

    if type == UNKNOWN then
        return
    end

    if split ~= "" then
        vim.cmd(split)
    end

    if vim.fn.executable("lf") ~= 1 then
        vim.cmd("Explore")
        return
    end

    if type ~= PATH then
        current = vim.fn.getcwd()
    end

    vim.cmd("term lf -print-selection " .. current)
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
