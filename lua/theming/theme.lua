local M = {}
M.setup = function(theme)
    local setup_functions = {
        edge = require'theming.plugin_edge'.setup,
        papadark = require'theming.plugin_papadark'.setup,
        sonokai = require'theming.plugin_sonokai'.setup,
        tokyonight = require'theming.plugin_tokyonight'.setup,
    }

    setup_functions[theme]()
end

M.get_lualine = function()
    local mappings = {
        edge = 'onedark',
        material = 'material-nvim',
        omni = 'nightfly',
        papadark = 'nord',
        sonokai = 'material',
    }

    local theme = require'settings'.theme().theme
    if mappings[theme] then
        return mappings[theme]
    end

    return theme
end

M.get_sidebar_offset = function()
    local custom_offsets = {
        material = 30,
        moonlight = 30,
        omni = 30,
        tokyonight = 30,
    }

    local theme = require'settings'.theme().theme
    if custom_offsets[theme] then
        return custom_offsets[theme]
    end

    return 31
end

return M
