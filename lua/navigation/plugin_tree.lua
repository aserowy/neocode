if not require("checker").packadd_if_exists("nvim-tree.lua") then
	return
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback

local mappings = {}
for key, value in pairs(require("mappings").explorer) do
	mappings[key] = tree_cb(value)
end

for key, value in pairs(require("mappings").explorer_nocallback) do
	mappings[key] = value
end

vim.g.nvim_tree_bindings = mappings
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
