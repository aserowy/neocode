local vim = vim

local function setup()
    require'custom.completion'

    vim.cmd([[autocmd BufEnter * lua require'completion'.on_attach()]])

    vim.g.completion_confirm_key = ''
    vim.g.completion_enable_snippet = 'vim-vsnip'
    vim.g.completion_matching_smart_case = 1
end

return {
    setup = setup,
}
