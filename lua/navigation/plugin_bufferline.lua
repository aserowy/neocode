if not require'checker'.packadd_if_exists('nvim-bufferline.lua') then
    return
end

local M = {}
M.setup = function()
    require'bufferline'.setup({
        options = {
            offsets = {
                {filetype = "NvimTree", text = "Explorer", text_align = "left"},
                {filetype = "Outline", text = "Symbols", text_align = "left"},
            },
        }
    })
end

return M
