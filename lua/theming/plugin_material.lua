local function setup()
    vim.cmd [[packadd material.nvim]]

    local config = require'theming.configuration'.get({
        style = 'oceanic',
        transparent = false,
    })

    vim.g.material_style = config.style
    vim.g.material_disable_background = config.transparent

    require'material'.set()
end

return {
    setup = setup
}
