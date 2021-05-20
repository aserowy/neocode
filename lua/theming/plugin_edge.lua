---@diagnostic disable: undefined-global

local function setup()
    vim.cmd [[packadd edge]]

    local config = require'theming.configuration'.get({
        style = 'aura',
        transparent = false,
        flavour = 'dark',
    })

    vim.g.edge_enable_italic = 1
    vim.g.edge_sign_column_background = 'none'
    vim.g.edge_style = config.style
    vim.g.edge_transparent_background = config.transparent

    vim.o.background = config.flavour

    vim.cmd [[colorscheme edge]]
end

return {
    setup = setup
}
