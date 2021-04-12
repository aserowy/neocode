local settings = require'settings'

-- themes at http://chriskempson.com/projects/base16/
local theme = {}

theme.init = function()
    theme.set(settings.theme)
end

theme.set = function(name)
    local base16 = require'base16'
    base16(base16.themes[name], true)
end

theme.get_theme = function()
    local base16 = require'base16'
    return base16.themes[settings.theme]
end

return theme
