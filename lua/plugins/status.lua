local function setup_lualine()
    local settings = require("settings")
    local theme = require("theming.themes").get_lualine(settings.theme.name, settings.theme.style)
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

                        local padding = tab_max_length - #name
                        local pad_left = math.floor(padding / 2)
                        local pad_right = math.ceil(padding / 2)

                        return string.rep(" ", pad_left) .. name .. string.rep(" ", pad_right)
                    end,
                },
            },
        },
    })
end

return {
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = { indent = { char = "▏" } },
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            setup_lualine()
        end,
        dependencies = {
            "arkav/lualine-lsp-progress",
        },
    },
    {
        "SmiteshP/nvim-navic",
    },
}
