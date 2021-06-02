local M = {}
M.setup = function()
    if not require'theming.packer'.packadd_if_exists('tokyonight.nvim') then
        return
    end

    local config = require'theming.configuration'.get({
        style = 'storm',
        transparent = false,
    })

    vim.g.tokyonight_style = config.style
    vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer', 'outline' }
    vim.g.tokyonight_transparent = config.transparent

    vim.cmd [[colorscheme tokyonight]]
end

return M
