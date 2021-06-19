if not require("checker").packadd_if_exists("lsp-trouble.nvim") then
	return
end

local mappings = require("mappings")

vim.cmd([[autocmd WinEnter * if winnr('$') == 1 && &ft == 'LspTrouble' | q | endif]])

require("trouble").setup({
	action_keys = mappings.diagnostics,
})
