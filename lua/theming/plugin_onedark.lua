local M = {}
M.setup = function()
    if not require'theming.packer'.packadd_if_exists('onedark.nvim') then
        return
    end

    local config = require'theming.configuration'.get({
        style = 'default',
    })

    if config.style ~= 'default' then
        vim.g.onedark_style = config.style
    end

    require('onedark').setup()
end

return M
