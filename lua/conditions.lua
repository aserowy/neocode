local M = {}
M.is_current_theme = function(theme)
    local result = require("settings").theme().theme == theme
    -- print(theme, result)
    return result
end

return M
