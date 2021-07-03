if not require("checker").packadd_if_exists("tmux.nvim") then
	return
end

local M = {}
M.setup = function()
	require("tmux").setup({
		copy_sync = {
			enable = true,
			redirect_to_clipboard = true,
		},
		navigation = {
			cycle_navigation = false,
			enable_default_keybindings = true,
			persist_zoom = true,
		},
		resize = {
			enable_default_keybindings = true,
		},
	})
end

return M
