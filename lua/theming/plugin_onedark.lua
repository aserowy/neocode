local M = {}
M.setup = function()
	if not require("checker").packadd_if_exists("onedark.nvim") then
		return
	end

	local config = require("theming.configuration").get({
		transparent = false,
	})

	vim.g.onedark_italic_keywords = false
	vim.g.onedark_sidebars = { "qf", "vista_kind", "terminal", "packer", "outline" }
	vim.g.onedark_transparent = config.transparent

	if config.transparent then
		vim.g.onedark_hide_inactive_statusline = true
	end

	vim.cmd([[colorscheme onedark]])
end

return M
