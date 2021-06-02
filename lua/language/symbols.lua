local M = {}
M.open = function()
    require'navigation.tree'.close()

    vim.cmd([[SymbolsOutlineOpen]])
end

M.close = function()
    vim.cmd([[SymbolsOutlineClose]])
end

return M
