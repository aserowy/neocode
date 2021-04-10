local vim = vim
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = require'mappings'.file_tree(tree_cb)
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
