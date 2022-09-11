local M = {}
M.setup = function()
    require("bufferline").setup({
        options = {
            close_command = function(bufnum)
                require("bufdelete").bufdelete(bufnum, true)
            end,
            middle_mouse_command = function(bufnum)
                require("bufdelete").bufdelete(bufnum, true)
            end,
            offsets = {
                { filetype = "NvimTree", text = "Explorer", text_align = "left" },
            },
            show_buffer_close_icons = false,
        },
    })
end

return M
