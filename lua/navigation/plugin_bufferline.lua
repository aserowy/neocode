local M = {}
M.setup = function()
    require("bufferline").setup({
        options = {
            offsets = {
                close_command = function(bufnum)
                    require("bufdelete").bufdelete(bufnum, true)
                end,
                middle_mouse_command = function(bufnum)
                    require("bufdelete").bufdelete(bufnum, true)
                end,
                { filetype = "NvimTree", text = "Explorer", text_align = "left" },
                { filetype = "aerial", text = "Symbols", text_align = "left" },
            },
        },
    })
end

return M
