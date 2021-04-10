-- themes at http://chriskempson.com/projects/base16/
local theme = {
    name = 'solarized-dark'
}

theme.init = function()
    theme.set(theme.name)
end

theme.set = function(name)
    local base16 = require'base16'
    base16(base16.themes[name], true)
end

theme.get_theme = function()
    local base16 = require'base16'
    return base16.themes[theme.name]
end

return theme
