if not require'checker'.packadd_if_exists('nvim-tree.lua') then
    return
end

local M = {}
M.open = function()
    local offset = require'theming.theme'.get_sidebar_offset()
    require'nvim-tree'.find_file(true)

    vim.cmd([[SymbolsOutlineClose]])
end

M.close = function()
    require'nvim-tree'.close()
end

return M
