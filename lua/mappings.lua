local vim = vim
local keymaps = require'nvim.keymaps'

local mappings = {}

-- session
keymaps.register('n', {
    ['<Leader>sl'] = '<cmd>SessionLoad<CR>',
    ['<Leader>ss'] = '<cmd>SessionSave<CR>',
})

-- file
keymaps.register('n', {
    ['<Leader>ff'] = [[<cmd>lua require'custom.search'.git_or_local()<CR>]],
    ['<Leader>fh'] = [[<cmd>lua require'telescope.builtin'.oldfiles()<CR>]],
    ['<Leader>fs'] = [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]],
    ['<Leader>ft'] = ':NvimTreeToggle<CR>',

    ['<Leader>fi'] = 'gg=G',
    ['<Leader>fm'] = [[<cmd>Neoformat<CR>]],
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
    ['<Leader>bb'] = [[<cmd>lua require'telescope.builtin'.buffers()<CR>]],
    ['<Leader>bd'] = [[<cmd>BufferClose<CR>]],
    ['<Leader>bn'] = [[<cmd>BufferNext<CR>]],
    ['<Leader>bp'] = [[<cmd>BufferPrevious<CR>]],
    ['<Leader>bm'] = [[<cmd>BufferOrderByDirectory<CR>]],
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
    ['<Leader>tt'] = [[<cmd>lua require'FTerm'.open()<CR>]],
})

keymaps.register('t', {
    ['<Leader>td'] = [[<C-\\><C-N><cmd>lua require'FTerm'.close()<CR>]],

    ['<C-j>'] = '<C-\\><C-N><C-w><C-j>',
    ['<C-k>'] = '<C-\\><C-N><C-w><C-k>',
    ['<C-l>'] = '<C-\\><C-N><C-w><C-l>',
    ['<C-h>'] = '<C-\\><C-N><C-w><C-h>',
})

-- completion & snippets
keymaps.register('i', {
    ['<C-h>'] = '<cmd>lua require"luasnip".jump(-1)<CR>',
    ['<C-l>'] = [[<cmd>lua require'custom.completion'.complete_or_jump('<C-l>')<CR>]],
})

keymaps.register('s', {
    ['<C-h>'] = '<cmd>lua require"luasnip".jump(-1)<CR>',
    ['<C-l>'] = '<cmd>lua require"luasnip".jump(1)<CR>',
})

-- lsp
mappings.lsp_on_attach = {
    ['gD'] = '<cmd>lua vim.lsp.buf.declaration()<CR>',
    ['gd'] = [[<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>]],
    ['K'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
    ['gi'] = '<cmd>lua vim.lsp.buf.implementation()<CR>',
    ['<space>sh'] = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
    ['<space>sd'] = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    ['<space>rn'] = '<cmd>lua vim.lsp.buf.rename()<CR>',
    ['gr'] = [[<cmd>lua require'telescope.builtin'.lsp_references()<CR>]],
    ['<space>ca'] = [[<cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>]],
    ['<space>dl'] = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    ['<space>dp'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
    ['<space>dn'] = '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
    ['<space>df'] = [[<cmd>lua require'telescope.builtin'.lsp_document_diagnostics()<CR>]],
    ['<space>dd'] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_diagnostics()<CR>]],
}

-- selection
mappings.tree_sitter_textobjects = {
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
}

return mappings
