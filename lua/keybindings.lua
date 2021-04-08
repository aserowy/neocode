local a = vim.api
local opt = {noremap = true, silent = true}

local kb = {}

-- file
a.nvim_set_keymap('n', '<Leader>fs', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
a.nvim_set_keymap('n', '<Leader>fo', [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)

a.nvim_set_keymap('n', '<Leader>ft', ':NvimTreeOpen<CR>', opt)

a.nvim_set_keymap('n', '<Leader>fm', [[<Cmd>Neoformat<CR>]], opt)

-- file tree
function kb.file_tree(tree_cb)
	return {
		["l"] = tree_cb("edit"),
		["h"] = tree_cb("close_node"),
	}
end

-- buffer
a.nvim_set_keymap('n', '<Leader>bs', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)

a.nvim_set_keymap('n', '<Leader>bd', [[<Cmd>bdelete<CR>]], opt)

a.nvim_set_keymap('n', '<Leader>bn', [[<Cmd>BufferLineCycleNext<CR>]], opt)
a.nvim_set_keymap('n', '<Leader>bp', [[<Cmd>BufferLineCyclePrev<CR>]], opt)

-- help
a.nvim_set_keymap('n', '<Leader>hs', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)

return kb
