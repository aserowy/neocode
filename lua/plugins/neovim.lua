return {
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                mappings = { "<C-u>", "<C-d>", "zt", "zz", "zb" },
            })
        end,
    },
    "lambdalisue/suda.vim",
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "907th/vim-auto-save",
        config = function()
            vim.g.auto_save = 1
        end,
    },
}
