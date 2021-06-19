local M = {}
M.is_nvim_environment = function()
	return vim.g.vscode == nil
end

M.is_vscode_environment = function()
	return vim.g.vscode ~= nil
end

M.is_current_theme = function(theme)
	if not require("conditions").is_nvim_environment() then
		return false
	end
	local result = require("settings").theme().theme == theme
	-- print(theme, result)
	return result
end

return M
