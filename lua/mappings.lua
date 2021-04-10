local keymaps = require'nvim.keymaps'

local mappings = {}

-- file
keymaps.register('n', {
    ['<Leader>fs'] = [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
    ['<Leader>fo'] = [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]],
    ['<Leader>ft'] = ':NvimTreeToggle<CR>',

    ['<Leader>fi'] = 'gg=G',
    ['<Leader>fm'] = [[<Cmd>Neoformat<CR>]],
})

-- file tree
mappings.file_tree = {
    ['l'] = 'edit',
    ['h'] = 'close_node',
    ['<space>rn'] = 'full_rename',
    ['cc'] = 'cut',
    ['dd'] = 'remove',
    ['yy'] = 'copy',
}

-- buffer
keymaps.register('n', {
    ['<Leader>bs'] = [[<Cmd>lua require('telescope.builtin').buffers()<CR>]],
    ['<Leader>bd'] = [[<Cmd>bdelete<CR>]],
    ['<Leader>bn'] = [[<Cmd>BufferLineCycleNext<CR>]],
    ['<Leader>bp'] = [[<Cmd>BufferLineCyclePrev<CR>]],
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
    ['<Leader>tt'] = ':edit term://zsh<CR>',
    ['<Leader>tv'] = ':vsplit term://zsh<CR>',
    ['<Leader>tx'] = ':split term://zsh<CR>',
})

keymaps.register('t', {
    ['<Leader>td'] = '<C-\\><C-N>:bd!<CR>',

    ['<C-j>'] = '<C-\\><C-N><C-w><C-j>',
    ['<C-k>'] = '<C-\\><C-N><C-w><C-k>',
    ['<C-l>'] = '<C-\\><C-N><C-w><C-l>',
    ['<C-h>'] = '<C-\\><C-N><C-w><C-h>',
})

-- snippets
keymaps.register('i', {
    ['<C-h>'] = '<cmd>lua return require"snippets".advance_snippet(-1)<CR>',
    ['<C-l>'] = '<cmd>lua return require"snippets".expand_or_advance(1)<CR>',
})

-- lsp
mappings.lsp_on_attach = {
    ['gD'] = '<Cmd>lua vim.lsp.buf.declaration()<CR>',
    ['gd'] = '<Cmd>lua vim.lsp.buf.definition()<CR>',
    ['K'] = '<Cmd>lua vim.lsp.buf.hover()<CR>',
    ['gi'] = '<cmd>lua vim.lsp.buf.implementation()<CR>',
    ['<space>sh'] = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
    ['<space>sd'] = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    ['<space>rn'] = '<cmd>lua vim.lsp.buf.rename()<CR>',
    ['gr'] = '<cmd>lua vim.lsp.buf.references()<CR>',
    ['<space>dd'] = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    ['<space>dp'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
    ['<space>dn'] = '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
    ['<space>dl'] = '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
}

-- selection
mappings.tree_sitter_textobjects = {
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
}

return mappings
