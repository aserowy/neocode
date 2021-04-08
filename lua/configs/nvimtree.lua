local vim = vim
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = require'keymaps'.file_tree(tree_cb)
