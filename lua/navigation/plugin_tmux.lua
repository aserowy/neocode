--[[ if not require("checker").packadd_if_exists("tmux.nvim") then
return
end
]]
local M = {}
M.setup = function()
	require("tmux").setup({
		navigation = {
			cycle_navigation = false,
			persist_zoom = true,
		},
	})
end

return M
