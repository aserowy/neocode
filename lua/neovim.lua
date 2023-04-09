local M = {}

function M.setup()
    require("mappings").setup()
    require("settings").setup()
end

function M.configure_lsp()
    require("language").setup()
end

return M
