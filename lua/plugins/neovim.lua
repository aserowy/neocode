return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    "lambdalisue/suda.vim",
    "mbbill/undotree",
    {
        "907th/vim-auto-save",
        config = function()
            vim.g.auto_save = 1
        end,
    },
}
