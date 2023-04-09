local M = {}

function M.setup()
    require("settings").setup()
end

function M.configure_mappings()
    require("mappings").setup()
end

function M.configure_lsp()
    require("language").setup()
end

return M
