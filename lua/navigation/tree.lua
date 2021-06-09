if not require'checker'.packadd_if_exists_for({'barbar.nvim', 'nvim-tree.lua'}) then
    return
end

local M = {}
M.open = function()
    local offset = require'theming.theme'.get_sidebar_offset()
    require'bufferline.state'.set_offset(offset)
    require'nvim-tree'.find_file(true)

    vim.cmd([[SymbolsOutlineClose]])
end

M.close = function()
    require'bufferline.state'.set_offset(0)
    require'nvim-tree'.close()
end

return M
