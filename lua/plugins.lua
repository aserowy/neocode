require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- dependencies
    use("rktjmp/lush.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("kyazdani42/nvim-web-devicons")

    -- completion
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
            require("nvim-autopairs").setup()
        end,
    })
    use({
        "hrsh7th/nvim-compe",
        config = function()
            require("completion.plugin_compe").setup()
        end,
    })
    use({
        "hrsh7th/vim-vsnip",
        requires = {
            "hrsh7th/vim-vsnip-integ",
        },
    })

    -- git
    -- TODO: https://github.com/sindrets/diffview.nvim
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("git.plugin_gitsigns")
        end,
    })

    -- helper
    use("famiu/bufdelete.nvim")
    use({
        "907th/vim-auto-save",
        config = function()
            vim.g.auto_save = 1
        end,
    })
    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end,
    })

    -- language
    use({
        "stevearc/aerial.nvim",
        setup = function()
            require("language.plugin_aerial").setup()
        end,
    })
    use("ray-x/lsp_signature.nvim")
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim")
    use("kabouzeid/nvim-lspinstall")
    use({
        "onsails/lspkind-nvim",
        config = function()
            require("lspkind").init()
        end,
    })
    use({
        "glepnir/lspsaga.nvim",
        config = function()
            require("language.plugin_lspsaga").setup()
        end,
    })

    -- layout
    -- FIX: interfers with session restores..
    --[[ use {
        'glepnir/dashboard-nvim',
        config = function() require'layout.plugin_dashboard' end,
    } ]]
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("layout.plugin_indentblankline")
        end,
    })
    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({})
        end,
    })

    -- linting
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("linting.plugin_colorizer")
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("linting.plugin_treesitter")
        end,
        run = ":TSUpdate",
    })
    use({
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    })
    use({
        "RRethy/nvim-treesitter-textsubjects",
        after = "nvim-treesitter",
    })
    use({
        "romgrk/nvim-treesitter-context",
        config = function()
            require("treesitter-context.config").setup({
                enable = true,
            })
        end,
        after = "nvim-treesitter",
    })

    -- motion
    use({
        "phaazon/hop.nvim",
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
    use({
        "dstein64/nvim-scrollview",
        config = function()
            require("motion.plugin_scrollview")
        end,
    })
    use("unblevable/quick-scope")

    -- navigation
    use({
        "aserowy/tmux.nvim",
        config = function()
            require("navigation.plugin_tmux").setup()
        end,
    })
    use({
        "akinsho/nvim-bufferline.lua",
        config = function()
            require("navigation.plugin_bufferline").setup()
        end,
    })
    use({
        "folke/lsp-trouble.nvim",
        config = function()
            require("navigation.plugin_trouble")
        end,
    })
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("navigation.plugin_tree")
        end,
    })
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("navigation.plugin_telescope")
        end,
    })

    -- session
    -- TODO: https://github.com/rmagatti/session-lens maybe with leader + s?
    use({
        "rmagatti/auto-session",
        config = function()
            require("session.plugin_auto-session").setup()
        end,
    })

    -- status
    use({
        "hoob3rt/lualine.nvim",
        config = function()
            require("status.plugin_lualine").setup()
        end,
    })

    -- terminal
    use({
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("terminal.plugin_toggleterm").setup()
        end,
    })

    -- theming
    use({
        "briones-gabriel/darcula-solid.nvim",
        cond = function()
            return require("conditions").is_current_theme("darcula")
        end,
        config = function()
            require("theming.theme").setup("darcula")
        end,
    })
    use({
        "sainnhe/edge",
        cond = function()
            return require("conditions").is_current_theme("edge")
        end,
        config = function()
            require("theming.theme").setup("edge")
        end,
    })
    use({
        "MordechaiHadad/nvim-papadark",
        cond = function()
            return require("conditions").is_current_theme("nord")
        end,
        config = function()
            require("theming.theme").setup("nord")
        end,
    })
    use({
        "monsonjeremy/onedark.nvim",
        cond = function()
            return require("conditions").is_current_theme("onedark")
        end,
        config = function()
            require("theming.theme").setup("onedark")
        end,
    })
    use({
        "sainnhe/sonokai",
        cond = function()
            return require("conditions").is_current_theme("sonokai")
        end,
        config = function()
            require("theming.theme").setup("sonokai")
        end,
    })
    use({
        "folke/tokyonight.nvim",
        cond = function()
            return require("conditions").is_current_theme("tokyonight")
        end,
        config = function()
            require("theming.theme").setup("tokyonight")
        end,
    })

    -- todo
    use({
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
    })
end)
