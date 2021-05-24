local M = {}
M.setup = function()
    if not require'theming.packer'.packadd_if_exists('onedark.nvim') then
        return
    end

    local config = require'theming.configuration'.get({
        transparent = false,
    })

    vim.g.onedark_italic_keywords = false
    vim.g.onedark_sidebars = {'qf', 'vista_kind', 'terminal', 'packer'}
    vim.g.onedark_transparent = config.transparent

    vim.cmd [[colorscheme onedark]]
end

return M
