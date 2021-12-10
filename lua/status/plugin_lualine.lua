local function setup()
    local theme = require("theming.theme").get_lualine()

    require("lualine").setup({
        extensions = { "nvim-tree" },
        options = {
            theme = theme,
            component_separators = { left = "", right = "" },
            disabled_filetypes = { "aerial", "toggleterm", "terminal" },
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_b = {
                "branch",
                {
                    "diff",
                    symbols = {
                        added = " ",
                        modified = " ",
                        removed = " ",
                    },
                },
            },
            lualine_c = {
                "filename",
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                },
            },
        },
    })
end

return {
    setup = setup,
}
