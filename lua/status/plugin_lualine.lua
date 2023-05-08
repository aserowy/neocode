local M = {}
M.setup = function()
    local theme = require("theming.theme").get_lualine()

    require("lualine").setup({
        extensions = { "nvim-tree" },
        options = {
            theme = theme,
            component_separators = { left = "", right = "" },
            disabled_filetypes = { "toggleterm", "terminal" },
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_b = {
                "branch",
                {
                    "diff",
                    symbols = {
                        added = "󰐖 ",
                        modified = "󱗜 ",
                        removed = "󰍵 ",
                    },
                },
            },
            lualine_c = {
                "filename",
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                },
                "lsp_progress",
            },
        },
    })
end

return M
