local vim = vim

local a = vim.api
local opt = {noremap = true, silent = true}

local keymap = {}

-- file
a.nvim_set_keymap('n', '<Leader>fs', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
a.nvim_set_keymap('n', '<Leader>fo', [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
a.nvim_set_keymap('n', '<Leader>ft', ':NvimTreeToggle<CR>', opt)
a.nvim_set_keymap('n', '<Leader>fm', [[<Cmd>Neoformat<CR>]], opt)

-- file tree
keymap.file_tree = function(tree_cb)
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

-- window
a.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', opt)
a.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', opt)
a.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', opt)
a.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', opt)

-- navigation
keymap.lsp_on_attach = function(bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opt)
    buf_set_keymap("n", "<space>h", "<Cmd>lua vim.lsp.buf.hover()<CR>", opt)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    buf_set_keymap("n", "<space>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    buf_set_keymap("n", "<space>d", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opt)
    buf_set_keymap("n", "<space>dp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opt)
    buf_set_keymap("n", "<space>dn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opt)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opt)
end

-- selection
keymap.tree_sitter_incremental = function()
    return {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
    }
end

keymap.tree_sitter_textobjects = function()
    return {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
    }
end

return keymap
