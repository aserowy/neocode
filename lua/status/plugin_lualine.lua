local function setup()
    require'lualine'.setup({
        extensions = {'nvim-tree'},
        options = {
            theme = 'tokyonight',
            component_separators = {'', ''},
            section_separators = {'', ''},
        },
        sections = {
            lualine_b = {
                'branch',
                {
                    'diff',
                    symbols = {
                        added = ' ',
                        modified = ' ',
                        removed = ' ',
                    }
                },
            },
            lualine_c = {
                'filename',
                {
                    'diagnostics',
                    sources = {'nvim_lsp'},
                },
            }
        }
    })
end

return {
    setup = setup
}
