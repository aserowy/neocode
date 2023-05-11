local theme_dictionary = {
    hardhacker = require("theming.plugin_hardhacker"),
    onedark = require("theming.plugin_onedark"),
}

local M = {}
M.setup = function(theme)
    theme_dictionary[theme].setup()
end

M.get_lualine = function()
    local theme = require("settings").theme().theme

    return theme_dictionary[theme].lualine_theme
end

return M
