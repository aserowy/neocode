local M = {}
M.setup = function(theme)
    local setup_functions = {
        catppuccin = require("theming.plugin_catppuccin").setup,
        github = require("theming.plugin_github").setup,
        material = require("theming.plugin_material").setup,
        onedark = require("theming.plugin_onedark").setup,
        tokyonight = require("theming.plugin_tokyonight").setup,
    }

    setup_functions[theme]()
end

M.get_lualine = function()
    local mappings = {
        material = "material-nvim",
        -- FIX: lualine does not resolve the theme currently
        -- onedark = "onedark-nvim",
    }

    local theme = require("settings").theme().theme
    if mappings[theme] then
        return mappings[theme]
    end

    return theme
end

return M
