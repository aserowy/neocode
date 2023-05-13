local M = {}
M.setup = function()
    local theme = require("theming.theme").get_lualine()
    local tab_max_length = 23

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
        tabline = {
            lualine_a = {
                {
                    "tabs",
                    max_length = vim.o.columns,
                    mode = 2,
                    fmt = function(name)
                        name = string.sub(name, 1, tab_max_length)
                        return string.format("%-".. tab_max_length .. "s", name)
                    end,
                },
            },
        },
    })
end

return M
