local M = {
    path = vim.fn.stdpath("data") .. "/env/nvim",
}

function M.configure()
    require("language").setup()

    require("settings").setup()
    require("mappings").setup()
end

function M.register_packages(use)
    use("wbthomason/packer.nvim")

    -- dependencies
    use({
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({})
        end
    })
    use("rktjmp/lush.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("kyazdani42/nvim-web-devicons")
    use({
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#000000",
            })

            vim.notify = require("notify")
        end,
    })

    -- TODO: https://github.com/sindrets/diffview.nvim
    -- TODO: neogit
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("git.plugin_gitsigns")
        end,
    })

    use("rafamadriz/friendly-snippets")
    use({
        "b3nj5m1n/kommentary",
        config = function()
            require("kommentary.config")
        end,
    })
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("language.plugin_autopairs").setup()
        end,
        after = "nvim-cmp",
    })
    use("onsails/lspkind-nvim")
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("language.plugin_cmp").setup()
        end,
    })
    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("language.plugin_luasnip").setup()
        end,
    })
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-path")

    use({
        "stevearc/aerial.nvim",
        config = function()
            require("language.plugin_aerial").setup()
        end,
    })
    use("ray-x/lsp_signature.nvim")
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim")
    use({
        "williamboman/nvim-lsp-installer",
        config = function()
            require("nvim-lsp-installer").setup({})
        end
    })
    use({
        "kkharji/lspsaga.nvim",
        config = function()
            require("language.plugin_lspsaga").setup()
        end,
    })

    use({
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
    })
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("language.plugin_colorizer")
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("language.plugin_treesitter")
        end,
        run = ":TSUpdate",
    })
    use({
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    })

    use({
        "kazhala/close-buffers.nvim",
        config = function()
            require("close_buffers").setup({})
        end,
    })
    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end,
    })
    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({})
        end,
    })

    use({
        "phaazon/hop.nvim",
        branch = "v2",
        as = "hop",
        config = function()
            require("hop").setup({})
        end,
    })
    use({
        "karb94/neoscroll.nvim",
        config = function()
            require("motion.plugin_neoscroll")
        end,
    })
    use({
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup()
        end,
    })
    use("unblevable/quick-scope")

    use({
        "akinsho/nvim-bufferline.lua",
        config = function()
            require("navigation.plugin_bufferline").setup()
        end,
    })
    use({
        "folke/trouble.nvim",
        config = function()
            require("navigation.plugin_trouble")
        end,
    })
    use({
        "kyazdani42/nvim-tree.lua",
        tag = 'nightly',
        config = function()
            require("navigation.plugin_tree")
        end,
    })
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("navigation.plugin_telescope").setup()
        end,
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    use({
        "907th/vim-auto-save",
        config = function()
            vim.g.auto_save = 1
        end,
    })

    use("lambdalisue/suda.vim")

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("status.plugin_indentblankline")
        end,
    })
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("status.plugin_lualine").setup()
        end,
    })

    use({
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("terminal.plugin_toggleterm").setup()
        end,
    })
    use({
        "aserowy/tmux.nvim",
        config = function()
            require("terminal.plugin_tmux").setup()
        end,
    })

    use({
        "catppuccin/nvim",
        as = "catppuccin",
        --[[ cond = function()
            return require("conditions").is_current_theme("catppuccin")
        end, ]]
        config = function()
            require("theming.theme").setup("catppuccin")
        end,
    })
    use({
        "projekt0n/github-nvim-theme",
        --[[ cond = function()
            return require("conditions").is_current_theme("github")
        end, ]]
        config = function()
            require("theming.theme").setup("github")
        end,
    })
    use({
        "marko-cerovac/material.nvim",
        --[[ cond = function()
            return require("conditions").is_current_theme("material")
        end, ]]
        config = function()
            require("theming.theme").setup("material")
        end,
    })
    use({
        "navarasu/onedark.nvim",
        --[[ cond = function()
            return require("conditions").is_current_theme("onedark")
        end, ]]
        config = function()
            require("theming.theme").setup("onedark")
        end,
    })
    use({
        "folke/tokyonight.nvim",
        --[[ cond = function()
            return require("conditions").is_current_theme("tokyonight")
        end, ]]
        config = function()
            require("theming.theme").setup("tokyonight")
        end,
    })
end

return M
