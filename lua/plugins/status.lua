return {
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("status.plugin_indentblankline")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("status.plugin_lualine").setup()
        end,
    },
}
