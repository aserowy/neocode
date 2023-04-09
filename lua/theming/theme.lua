local M = {}
M.setup = function(theme)
    local setup_functions = {
        onedark = require("theming.plugin_onedark").setup,
    }

    setup_functions[theme]()
end

M.get_lualine = function()
    local mappings = {
    }

    local theme = require("settings").theme().theme
    if mappings[theme] then
        return mappings[theme]
    end

    return theme
end

return M
