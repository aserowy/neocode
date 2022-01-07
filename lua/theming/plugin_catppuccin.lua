local M = {}
M.setup = function()
    local config = require("theming.configuration").get({
        transparent = false,
    })

    require("catppuccin").setup({
        transparent_background = config.transparent,
        styles = {
            comments = "italic",
            functions = "NONE",
            keywords = "NONE",
            strings = "NONE",
            variables = "NONE",
        },
        integrations = {
            hop = true,
            lsp_trouble = true,
            lsp_saga = true,
            ts_rainbow = true,
            which_key = true,
        },
    })

    vim.cmd([[colorscheme catppuccin]])
end

return M
