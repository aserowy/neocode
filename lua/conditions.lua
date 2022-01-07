local M = {}
M.is_current_theme = function(theme)
    return require("settings").theme().theme == theme
end

return M
