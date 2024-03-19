return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("language.dap.init").setup()
        end,
        dependencies = { "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui" },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
            require("nvim-dap-virtual-text").setup({})
        end,
    },
}
