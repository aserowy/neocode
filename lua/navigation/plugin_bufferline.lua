if not require'checker'.packadd_if_exists('nvim-bufferline.lua') then
    return
end

local M = {}
M.setup = function()
    require'bufferline'.setup({
    })
end

return M
