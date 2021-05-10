require'custom.completion'

local keymaps = require'nvim.keymaps'

local mappings = {}

-- session
keymaps.register('n', {
    ['<leader>sl'] = '<cmd>SessionLoad<cr>',
    ['<leader>ss'] = '<cmd>SessionSave<cr>',
})

-- zen
keymaps.register('n', {
    ['<C-z>'] = [[<cmd>TZMinimalist<cr>]]
})

-- functions
keymaps.register('n', {
    ['<C-e>'] = ':NvimTreeFindFile<cr>',
    ['<C-f>'] = [[<cmd>lua require'custom.search'.git_or_local()<cr>]],
    ['<C-g>'] = [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]],
    ['<C-s>'] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>]],
    ['<C-q>'] = [[<cmd>LspTrouble lsp_workspace_diagnostics<cr>]],
    ['<C-x>'] = [[<cmd>LspTrouble quickfix<cr>]],
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
    ['<C-a>'] = [[<cmd>enew<cr>]],
    ['<C-c>'] = [[<cmd>BufferClose<cr>]],
    ['<C-n>'] = [[<cmd>BufferNext<cr>]],
    ['<C-p>'] = [[<cmd>BufferPrevious<cr>]],

    ['ga'] = [[gg=G<C-o>zz<cmd>Neoformat<cr>]],
    ['gs'] = [[<cmd>w<cr>]],
})

-- motion
keymaps.register('n', {
    ['<leader>w'] = [[<cmd>HopWord<cr>]],
})

-- window
keymaps.register('n', {
    ['<C-j>'] = '<C-w><C-j>',
    ['<C-k>'] = '<C-w><C-k>',
    ['<C-l>'] = '<C-w><C-l>',
    ['<C-h>'] = '<C-w><C-h>',
})

-- File/grep/symbol search
mappings.telescope = function(actions)
    return {
        ['<C-q>'] = actions.send_to_qflist
    }
end

-- terminal
keymaps.register('n', {
    ['<C-t>'] = [[<cmd>lua require'FTerm'.toggle()<cr>]],
})

keymaps.register('t', {
    ['<C-c>'] = [[<cmd>lua require'FTerm'.close()<cr>]],
    ['<C-k>'] = [[<cmd>lua require'FTerm'.close()<cr>]],
    ['<C-j>'] = [[<cmd>lua require'FTerm'.close()<cr>]],
})

-- completion & snippets
keymaps.register('i', {
    ['<cr>'] = [[v:lua.completion.complete('<cr>')]],
    ['<S-tab>'] = [[v:lua.completion.completion_or_jump_up('<S-tab>')]],
    ['<tab>'] = [[v:lua.completion.completion_or_jump_down('<tab>')]],
}, {expr = true})

keymaps.register('s', {
    ['<cr>'] = [[v:lua.completion.complete('<cr>')]],
    ['<S-tab>'] = [[v:lua.completion.completion_or_jump_up('<S-tab>')]],
    ['<tab>'] = [[v:lua.completion.completion_or_jump_down('<tab>')]],
}, {expr = true})

-- lsp
mappings.lsp_on_attach = {
    ['gd'] = [[<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>]],
    ['gf'] = '<cmd>lua vim.lsp.buf.declaration()<cr>',
    ['gH'] = [[<cmd>lua require'telescope.builtin'.lsp_references()<cr>]],
    ['gi'] = '<cmd>lua vim.lsp.buf.implementation()<cr>',
    ['K'] = '<cmd>lua vim.lsp.buf.hover()<cr>',
    ['gh'] = '<cmd>lua vim.lsp.buf.signature_help()<cr>',
    ['gr'] = '<cmd>lua vim.lsp.buf.rename()<cr>',
    ['gq'] = [[<cmd>lua require'telescope.builtin'.lsp_code_actions()<cr>]],
    ['gl'] = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>',
    ['gp'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>',
    ['gn'] = '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>',
}

-- diagnostic
mappings.lsp_trouble = {
    ['close'] = '<C-c>',
    ['cancel'] = '<C-k>',
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
