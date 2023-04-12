return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("language.dap.init").setup()
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup({})
        end,
    },
    { "rcarriga/nvim-dap-ui" },
}
