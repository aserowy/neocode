local vim = vim

local function setup()
    require'custom.completion'

    vim.cmd([[autocmd BufEnter * lua require'completion'.on_attach()]])

    vim.g.completion_auto_change_source = 1
    vim.g.completion_chain_complete_list = {
        default = {
            {complete_items = {'lsp', 'snippet'}},
            {complete_items = {'path'}, triggered_only = {'/'}},
            {complete_items = {'buffers'}},
        },
        string = {
            {complete_items = {'path'}, triggered_only = {'/'}},
        },
        comment = {},
    }
    vim.g.completion_confirm_key = ''
    vim.g.completion_enable_snippet = 'vim-vsnip'
    vim.g.completion_items_priority = {
        Method = 10,
        Field = 9,
        Property = 9,
        Variables = 8,
        Function = 7,
        Interfaces = 6,
        Constant = 6,
        Class = 6,
        Struct = 6,
        Keyword = 5,
        Treesitter = 4,
        File  = 2,
        TabNine  = 1,
        Buffers  = 0,
    }
    vim.g.completion_matching_smart_case = 1
    vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
end

return {
    setup = setup,
}
