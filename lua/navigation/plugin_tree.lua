local vim = vim
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local mappings = {}
for key, value in pairs(require'mappings'.file_tree) do
    mappings[key] = tree_cb(value)
end

for key, value in pairs(require'mappings'.file_tree_no_cb) do
    mappings[key] = value
end

vim.g.nvim_tree_bindings = mappings
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
