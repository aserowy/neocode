if not require("checker").packadd_if_exists("auto-session") then
	return
end

local M = {}
M.setup = function()
	require("auto-session").setup({
		auto_save_enabled = true,
	})
end

return M
