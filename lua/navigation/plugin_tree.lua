local tree_cb = require("nvim-tree.config").nvim_tree_callback

local mappings = {}
for key, value in pairs(require("mappings").explorer) do
    table.insert(mappings, { key = key, cb = tree_cb(value) })
end

for key, value in pairs(require("mappings").explorer_nocallback) do
    table.insert(mappings, { key = key, cb = value })
end

vim.g.nvim_tree_bindings = mappings
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_indent_markers = 1

require("nvim-tree").setup({})
