local function setup()
    local setup_functions = {
        tokyonight = require'theming.plugin_tokyonight'.setup,
        nord = require'theming.plugin_nord'.setup,
    }

    local theme = require'settings'.theme()

    setup_functions[theme.theme]()
end

return {
    setup = setup
}
