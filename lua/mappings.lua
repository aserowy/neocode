require'custom.completion'

local keymaps = require'nvim.keymaps'

local mappings = {}

-- session
keymaps.register('n', {
['<Leader>sl'] = '<cmd>SessionLoad<CR>',
['<Leader>ss'] = '<cmd>SessionSave<CR>',
})

-- zen
keymaps.register('n', {
['<C-z>'] = [[<cmd>TZMinimalist<CR>]]
})

-- file
keymaps.register('n', {
['<C-f>'] = [[<cmd>lua require'custom.search'.git_or_local()<CR>]],
['<C-g>'] = [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]],
['<C-s>'] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<CR>]],
['<C-e>'] = ':NvimTreeFindFile<CR>',
})

-- file tree
mappings.file_tree = {
['l'] = 'edit',
['h'] = 'close_node',
['r'] = 'full_rename',
['m'] = 'cut',
['d'] = 'remove',
['y'] = 'copy',
['<C-c>'] = 'close',
}

-- buffer
keymaps.register('n', {
['<C-a>'] = [[<cmd>enew<CR>]],
['<C-c>'] = [[<cmd>BufferClose<CR>]],
['<C-n>'] = [[<cmd>BufferNext<CR>]],
['<C-p>'] = [[<cmd>BufferPrevious<CR>]],

['gs'] = [[<cmd>w<CR>]],
['gc'] = [[gg=G<C-o>zz<cmd>Neoformat<CR>]],
})

-- window
keymaps.register('n', {
['<C-j>'] = '<C-w><C-j>',
['<C-k>'] = '<C-w><C-k>',
['<C-l>'] = '<C-w><C-l>',
['<C-h>'] = '<C-w><C-h>',
})

-- terminal
keymaps.register('n', {
['<C-t>'] = [[<cmd>lua require'FTerm'.toggle()<CR>]],
})

keymaps.register('t', {
['<C-c>'] = [[<cmd>lua require'FTerm'.close()<CR>]],
['<C-k>'] = [[<cmd>lua require'FTerm'.close()<CR>]],
['<C-j>'] = [[<cmd>lua require'FTerm'.close()<CR>]],
})

-- completion & snippets
keymaps.register('i', {
['<CR>'] = [[v:lua.completion.complete('<CR>')]],
['<S-tab>'] = [[v:lua.completion.completion_or_jump_up('<S-tab>')]],
['<tab>'] = [[v:lua.completion.completion_or_jump_down('<tab>')]],
}, {expr = true})

keymaps.register('s', {
['<CR>'] = [[v:lua.completion.complete('<CR>')]],
['<S-tab>'] = [[v:lua.completion.completion_or_jump_up('<S-tab>')]],
['<tab>'] = [[v:lua.completion.completion_or_jump_down('<tab>')]],
}, {expr = true})

-- lsp
mappings.lsp_on_attach = {
['gd'] = [[<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>]],
['gf'] = '<cmd>lua vim.lsp.buf.declaration()<CR>',
['gH'] = [[<cmd>lua require'telescope.builtin'.lsp_references()<CR>]],
['gi'] = '<cmd>lua vim.lsp.buf.implementation()<CR>',
['K'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
['gh'] = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
['gy'] = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
['gr'] = '<cmd>lua vim.lsp.buf.rename()<CR>',
['gq'] = [[<cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>]],
['gl'] = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
['gp'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
['gn'] = '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
}

keymaps.register('n', {
['<C-q>'] = [[<cmd>LspTroubleOpen<CR>]],
})

mappings.lsp_trouble = {
['close'] = '<C-c>',
['cancel'] = '<esc>',
['refresh'] = 'r',
['jump'] = '<cr>',
['hover'] = 'K',
['toggle_fold'] = '<space>',
['previous'] = '<C-p>',
['next'] = '<C-n>',
}

-- selection
mappings.tree_sitter_textobjects = {
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
}

return mappings
