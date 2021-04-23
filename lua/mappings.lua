require'custom.completion'

local keymaps = require'nvim.keymaps'

local mappings = {}

-- session
keymaps.register('n', {
    ['<Leader>sl'] = '<cmd>SessionLoad<CR>',
    ['<Leader>ss'] = '<cmd>SessionSave<CR>',
})

-- file
keymaps.register('n', {
    ['<C-f>'] = [[<cmd>lua require'custom.search'.git_or_local()<CR>]],
    ['<C-g>'] = [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]],
    ['<C-s>'] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<CR>]],
    ['<C-e>'] = ':NvimTreeToggle<CR>',

    -- TODO format or indent if no formater available
    -- ['<Leader>fi'] = 'gg=G',
    ['<Leader>f'] = [[<cmd>Neoformat<CR>]],
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
    ['<C-[>'] = 'close',
}

-- buffer
keymaps.register('n', {
    ['<C-w><C-c>'] = [[<cmd>BufferClose<CR>]],
    ['<C-n>'] = [[<cmd>BufferNext<CR>]],
    ['<C-p>'] = [[<cmd>BufferPrevious<CR>]],
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
    ['<C-t>'] = [[<cmd>lua require'FTerm'.toggle()<CR>]],
    ['<C-c>'] = [[<cmd>lua require'FTerm'.close()<CR>]],

    ['<C-j>'] = [[<cmd>lua require'FTerm'.close()<CR><C-w><C-j>]],
    ['<C-k>'] = [[<cmd>lua require'FTerm'.close()<CR><C-w><C-k>]],
    ['<C-l>'] = [[<cmd>lua require'FTerm'.close()<CR><C-w><C-l>]],
    ['<C-h>'] = [[<cmd>lua require'FTerm'.close()<CR><C-w><C-h>]],
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
    ['gD'] = '<cmd>lua vim.lsp.buf.declaration()<CR>',
    ['gd'] = [[<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>]],
    ['K'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
    ['gi'] = '<cmd>lua vim.lsp.buf.implementation()<CR>',
    ['<space>h'] = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
    ['<space>d'] = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    ['<space>r'] = '<cmd>lua vim.lsp.buf.rename()<CR>',
    ['gr'] = [[<cmd>lua require'telescope.builtin'.lsp_references()<CR>]],
    ['<space>q'] = [[<cmd>lua require'telescope.builtin'.lsp_code_actions()<CR>]],
    ['<space>l'] = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    ['<space>p'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
    ['<space>n'] = '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
    ['<C-q>'] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_diagnostics()<CR>]],
}

-- selection
mappings.tree_sitter_textobjects = {
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
}

return mappings
