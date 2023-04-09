local M = {}

function M.set_mappings()
    require("mappings").setup()
end

function M.configure()
    require("language").setup()
    require("settings").setup()
end

return M
