local function setup()
    require'packer'.install()

    local setup_functions = {
        edge = require'theming.plugin_edge'.setup,
        gruvbox = require'theming.plugin_gruvbox'.setup,
        material = require'theming.plugin_material'.setup,
        nord = require'theming.plugin_nord'.setup,
        omni = require'theming.plugin_omni'.setup,
        papadark = require'theming.plugin_papadark'.setup,
        sonokai = require'theming.plugin_sonokai'.setup,
        tokyonight = require'theming.plugin_tokyonight'.setup,
    }

    local theme = require'settings'.theme()

    setup_functions[theme.theme]()
end

local function get_lualine()
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

local function get_sidebar_offset()
    local custom_offsets = {
        material = 30,
        omni = 30,
        tokyonight = 30,
    }

    local theme = require'settings'.theme().theme
    if custom_offsets[theme] then
        return custom_offsets[theme]
    end

    return 31
end

return {
    setup = setup,
    get_sidebar_offset = get_sidebar_offset,
    get_lualine = get_lualine,
}
