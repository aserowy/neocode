local theme_dictionary = {
    catppuccin = require("theming.plugin_catppuccin"),
    hardhacker = require("theming.plugin_hardhacker"),
    onedark = require("theming.plugin_onedark"),
    tokyonight = require("theming.plugin_tokyonight"),
}

local M = {}
M.setup = function(theme)
    for _, plugin_theme in pairs(theme_dictionary) do
        if plugin_theme ~= nil then
            plugin_theme.setup()
        end
    end

    theme_dictionary[theme].activate()
end

M.get_lualine = function()
    local theme = require("settings").theme().theme

    return theme_dictionary[theme].lualine_theme
end

return M
