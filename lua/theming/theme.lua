local M = {}
M.setup = function(theme)
    local setup_functions = {
        github = require("theming.plugin_github").setup,
        material = require("theming.plugin_material").setup,
        tokyonight = require("theming.plugin_tokyonight").setup,
    }

    setup_functions[theme]()
end

M.get_lualine = function()
    local mappings = {
        material = "material-nvim",
    }

    local theme = require("settings").theme().theme
    if mappings[theme] then
        return mappings[theme]
    end

    return theme
end

return M
