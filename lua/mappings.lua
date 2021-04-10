local vim = vim

local a = vim.api
local opt = {noremap = true, silent = true}

local keymap = {}

-- file
a.nvim_set_keymap('n', '<Leader>fs', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
a.nvim_set_keymap('n', '<Leader>fo', [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
a.nvim_set_keymap('n', '<Leader>ft', ':NvimTreeToggle<CR>', opt)

a.nvim_set_keymap('n', '<Leader>fi', 'gg=G', opt)
a.nvim_set_keymap('n', '<Leader>fm', [[<Cmd>Neoformat<CR>]], opt)

-- file tree
keymap.file_tree = function(tree_cb)
    return {
        ['l'] = tree_cb('edit'),
        ['h'] = tree_cb('close_node'),
        ['<space>rn'] = tree_cb('full_rename'),
        ['cc'] = tree_cb('cut'),
        ['dd'] = tree_cb('remove'),
        ['yy'] = tree_cb('copy'),
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

-- terminal
a.nvim_set_keymap('n', '<Leader>tt', ':edit term://zsh<CR>', opt)
a.nvim_set_keymap('n', '<Leader>tv', ':vsplit term://zsh<CR>', opt)
a.nvim_set_keymap('n', '<Leader>tx', ':split term://zsh<CR>', opt)
a.nvim_set_keymap('t', '<Leader>td', '<C-\\><C-N>:bd!<CR>', opt)

a.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-w><C-j>', opt)
a.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-w><C-k>', opt)
a.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-w><C-l>', opt)
a.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-w><C-h>', opt)

-- lsp
keymap.lsp_on_attach = function(bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opt)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opt)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
    buf_set_keymap('n', '<space>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
    buf_set_keymap('n', '<space>sd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
    buf_set_keymap('n', '<space>dd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opt)
    buf_set_keymap('n', '<space>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opt)
    buf_set_keymap('n', '<space>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opt)
    buf_set_keymap('n', '<space>dl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opt)
end

-- selection
keymap.tree_sitter_textobjects = function()
    return {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
    }
end

return keymap
