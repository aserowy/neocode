local M = {}
M.setup = function()
    require("auto-session").setup({
        auto_save_enabled = true,
    })
end

return M
