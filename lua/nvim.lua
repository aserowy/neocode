local M = {}

function M.configure()
    require("language").setup()

    require("settings").setup()
    require("mappings").setup()
end

--[[ function M.register_packages(use)
    use("wbthomason/packer.nvim")

    -- dependencies
    use({
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({})
        end,
    })
    use("rktjmp/lush.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("kyazdani42/nvim-web-devicons")
end ]]

return M
