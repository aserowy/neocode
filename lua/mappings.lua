local vim = vim
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

-- completion & snippets
_G.snippet_jump = function()
    local ls = require'luasnip'
    if ls.jumpable(1) then
        ls.jump(1)
    end
    return ''
end

_G.completions = function()
    local ap = require('nvim-autopairs')
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()['selected'] ~= -1 then
            return vim.fn['compe#confirm']('<CR>')
        end
    end
    return ap.check_break_line_char()
end

keymaps.register('i', {
    ['<C-j>'] = 'pumvisible() ? "<C-n>" : "<C-j>"',
    ['<C-k>'] = 'pumvisible() ? "<C-p>" : "<C-k>"',
    ['<C-l>'] = 'pumvisible() ? v:lua.completions() : v:lua.snippet_jump()',
}, {expr = true})

keymaps.register('s', {
    ['<C-j>'] = 'pumvisible() ? "<C-n>" : "<C-j>"',
    ['<C-k>'] = 'pumvisible() ? "<C-p>" : "<C-k>"',
}, {expr = true})

keymaps.register('i', {
    ['<C-h>'] = '<cmd>lua require"luasnip".jump(-1)<CR>',
})

keymaps.register('s', {
    ['<C-h>'] = '<cmd>lua require"luasnip".jump(-1)<CR>',
    ['<C-l>'] = '<cmd>lua require"luasnip".jump(1)<CR>',
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
