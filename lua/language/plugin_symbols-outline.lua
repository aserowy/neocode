local M = {}
M.setup = function()
    vim.g.symbols_outline = {
        highlight_hovered_item = false,
        show_guides = false,
        auto_preview = false,
        position = 'left',
        keymaps = {
            close = '<C-c>',
            goto_location = '<Cr>',
            focus_location = 'o',
            hover_symbol = 'K',
            rename_symbol = 'r',
            code_actions = 'a',
        },
        lsp_blacklist = {},
    }
end

return M
