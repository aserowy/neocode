local M = {}

function M.open()
    local current_file = vim.api.nvim_buf_get_name(0)
    local cmd = vim.api.nvim_replace_termcodes("lf " .. current_file .. "<cr>", true, false, true)

    vim.cmd("vsplit | term " .. cmd)
end

return M
