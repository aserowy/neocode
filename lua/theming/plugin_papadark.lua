local M = {}
M.setup = function()
    if not require'theming.packer'.packadd_if_exists('lush.nvim') then
        return
    end
    if not require'theming.packer'.packadd_if_exists('nvim-papadark') then
        return
    end

    vim.cmd [[colorscheme papadark]]
end

return M
