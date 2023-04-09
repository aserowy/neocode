return {
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("motion.plugin_neoscroll")
        end,
    },
    "lambdalisue/suda.vim",
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("language.plugin_colorizer")
        end,
    },
    {
        "907th/vim-auto-save",
        config = function()
            vim.g.auto_save = 1
        end,
    },
}
