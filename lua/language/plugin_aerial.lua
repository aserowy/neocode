local M = {}
M.setup = function()
    vim.g.aerial = {
        default_direction = "left",
        manage_folds = "false",
        max_width = 30,
        min_width = 30,
    }
end

return M
