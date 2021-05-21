local function setup()
    vim.cmd [[packadd tokyonight.nvim]]

    local config = require'theming.configuration'.get({
        style = 'storm',
        transparent = false,
    })

    vim.g.tokyonight_style = config.style
    vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
    vim.g.tokyonight_transparent = config.transparent

    vim.cmd [[colorscheme tokyonight]]
end

return {
    setup = setup
}
