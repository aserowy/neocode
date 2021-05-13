local keymaps = require'nvim.keymaps'

local mappings = {}
mappings.setup = function()
    -- TODO reorder like documentation

    -- zen
    keymaps.register('n', {
        ['<C-z>'] = [[<cmd>TZMinimalist<cr>]]
    })

    -- functions
    keymaps.register('n', {
        ['<C-e>'] = [[<cmd>lua require'custom.tree'.open()<cr>]],
        ['<C-f>'] = [[<cmd>lua require'custom.search'.git_or_local()<cr>]],
        ['<C-g>'] = [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]],
        ['<C-s>'] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>]],
        ['<C-q>'] = [[<cmd>LspTrouble lsp_workspace_diagnostics<cr>]],
        ['<C-x>'] = [[<cmd>LspTrouble quickfix<cr>]],
    })

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
        ['<cr>'] = [[v:lua.completion.confirm()]],
        ['<S-tab>'] = [[v:lua.completion.jump_previous('<S-tab>')]],
        ['<tab>'] = [[v:lua.completion.jump_next('<tab>')]],
    }, {expr = true})

    keymaps.register('s', {
        ['<cr>'] = [[v:lua.completion.confirm()]],
        ['<S-tab>'] = [[v:lua.completion.jump_previous('<S-tab>')]],
        ['<tab>'] = [[v:lua.completion.jump_next('<tab>')]],
    }, {expr = true})
end

-- file tree
mappings.file_tree = {
    ['l'] = 'edit',
    ['h'] = 'close_node',
    ['r'] = 'full_rename',
    ['m'] = 'cut',
    ['d'] = 'remove',
    ['y'] = 'copy',
}

mappings.file_tree_no_cb = {
    ['<C-c>'] = [[<cmd>lua require'custom.tree'.close()<cr>]],
    ['q'] = [[<cmd>lua require'custom.tree'.close()<cr>]],
}

-- File/grep/symbol search
mappings.telescope = function(actions)
    return {
        ['<C-q>'] = actions.send_to_qflist
    }
end

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
