local function setup()
    vim.cmd [[packadd tokyonight.nvim]]

    local theme = require'settings'.theme()

    local setting = {
        style = 'storm',
        transparent = false,
    }

    vim.g.tokyonight_style = theme.style
    vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
    vim.g.tokyonight_transparent = theme.transparent

    vim.cmd[[colorscheme tokyonight]]
end

return {
    setup = setup
}
