if not require("checker").packadd_if_exists("nvim-bufferline.lua") then
	return
end

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
				{ filetype = "Outline", text = "Symbols", text_align = "left" },
			},
		},
	})
end

return M
