---@diagnostic disable: undefined-global

local function setup()
    vim.cmd [[packadd gruvbox-material]]

    local config = require'theming.configuration'.get({
        style = 'mix',
        flavour = 'dark',
    })

    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_sign_column_background = 'none'
    vim.g.gruvbox_material_style = config.style

    vim.o.background = config.flavour

    vim.cmd [[colorscheme gruvbox-material]]
end

return {
    setup = setup
}
