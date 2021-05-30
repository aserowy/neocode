require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- vscode only
    use {
        'asvetliakov/vim-easymotion',
        cond = require'conditions'.is_vscode_environment,
    }

    -- completion
    use {
        'rafamadriz/friendly-snippets',
        cond = require'conditions'.is_nvim_environment,
    }
    use {
        'windwp/nvim-autopairs',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'nvim-autopairs'.setup() end,
    }
    use {
        'hrsh7th/nvim-compe',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'completion.plugin_compe'.setup() end,
        after = 'nvim-autopairs',
    }
    use {
        'hrsh7th/vim-vsnip',
        cond = require'conditions'.is_nvim_environment,
        requires = {
            {
                'hrsh7th/vim-vsnip-integ',
                cond = require'conditions'.is_nvim_environment,
            },
        }
    }

    -- formatting
    use {
        'b3nj5m1n/kommentary',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'kommentary.config' end,
    }
    use {
        'sbdchd/neoformat',
        cond = require'conditions'.is_nvim_environment,
    }

    -- git
    -- TODO: https://github.com/sindrets/diffview.nvim
    use {
        'lewis6991/gitsigns.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'git.plugin_gitsigns' end,
        requires = {
            {
                'nvim-lua/plenary.nvim',
                cond = require'conditions'.is_nvim_environment,
            },
        },
        after = 'plenary.nvim'
    }

    -- helper
    use {
        '907th/vim-auto-save',
        cond = require'conditions'.is_nvim_environment,
        config = function() vim.g.auto_save = 1 end,
    }
    use {
        'folke/which-key.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'which-key'.setup() end,
    }

    -- language
    use {
        'neovim/nvim-lspconfig',
        cond = require'conditions'.is_nvim_environment,
    }
    use {
        'ray-x/lsp_signature.nvim',
        cond = require'conditions'.is_nvim_environment,
    }
    use {
        'kabouzeid/nvim-lspinstall',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'language.plugin_lspinstall'.setup() end,
        after = {
            'nvim-lspconfig',
            'lsp_signature.nvim',
        }
    }
    use {
        'onsails/lspkind-nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require('lspkind').init() end,
    }
    use {
        'glepnir/lspsaga.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'language.plugin_lspsaga'.setup() end,
    }

    -- layout
    use {
        'glepnir/dashboard-nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'layout.plugin_dashboard' end,
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'layout.plugin_indentblankline' end,
    }

--[[ use {
'sunjon/Shade.nvim',
cond = require'conditions'.is_nvim_environment,
config = function() require'shade'.setup({}) end,
    } ]]

    use {
        'folke/zen-mode.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'zen-mode'.setup({}) end,
    }

    -- linting
    use {
        'norcalli/nvim-colorizer.lua',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'linting.plugin_colorizer' end,
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'linting.plugin_treesitter' end,
        run = 'TSUpdate',
        requires = {
            {
                'p00f/nvim-ts-rainbow',
                cond = require'conditions'.is_nvim_environment,
                after = 'nvim-treesitter'
            },
            {
                'nvim-treesitter/nvim-treesitter-textobjects',
                cond = require'conditions'.is_nvim_environment,
                after = 'nvim-treesitter'
            },
        }
    }
    use {
        'romgrk/nvim-treesitter-context',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'treesitter-context.config'.setup({}) end,
        after = 'nvim-treesitter',
    }


    -- motion
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'hop'.setup {} end
    }
    use {
        'karb94/neoscroll.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'motion.plugin_neoscroll' end,
    }
    use {
        'nacro90/numb.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'numb'.setup() end,
    }
    use {
        'dstein64/nvim-scrollview',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'motion.plugin_scrollview' end,
    }
    use 'unblevable/quick-scope'

    -- navigation
    -- TODO: https://github.com/wbthomason/packer.nvim/issues/272
    use {
        'kyazdani42/nvim-web-devicons',
        -- cond = require'conditions'.is_nvim_environment,
    }

    use {
        'romgrk/barbar.nvim',
        cond = require'conditions'.is_nvim_environment,
        requires = {
            {
                'kyazdani42/nvim-web-devicons',
                cond = require'conditions'.is_nvim_environment,
            },
        },
        after = {'nvim-web-devicons'}
    }
    use {
        'folke/lsp-trouble.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'navigation.plugin_trouble' end,
        requires = {
            {
                'kyazdani42/nvim-web-devicons',
                cond = require'conditions'.is_nvim_environment,
            },
        },
        after = {'nvim-web-devicons'}
    }
    use {
        'kyazdani42/nvim-tree.lua',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'navigation.plugin_tree' end,
        requires = {
            {
                'kyazdani42/nvim-web-devicons',
                cond = require'conditions'.is_nvim_environment,
            },
        },
        after = {'barbar.nvim', 'nvim-web-devicons'}
    }
    use {
        'nvim-telescope/telescope.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'navigation.plugin_telescope' end,
        requires = {
            {
                'nvim-lua/popup.nvim',
                cond = require'conditions'.is_nvim_environment,
            },
            {
                'nvim-lua/plenary.nvim',
                cond = require'conditions'.is_nvim_environment,
            },
        },
        after = {'popup.nvim', 'plenary.nvim'}
    }

    -- session
    -- TODO: https://github.com/rmagatti/session-lens maybe with leader + s?
    use {
        'rmagatti/auto-session',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'session.plugin_auto-session'.setup() end,
    }

    -- status
    use {
        'hoob3rt/lualine.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'status.plugin_lualine'.setup() end,
        requires = {
            {
                'kyazdani42/nvim-web-devicons',
                cond = require'conditions'.is_nvim_environment,
            },
        },
        after = {'nvim-web-devicons'}
    }

    -- terminal
    use {
        'akinsho/nvim-toggleterm.lua',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'terminal.plugin_toggleterm'.setup() end,
    }

    -- theming
    use {
        'briones-gabriel/darcula-solid.nvim',
        cond = function() return require'conditions'.is_current_theme('darcula') end,
        config = function() require'theming.theme'.setup('darcula') end,
        opt = true,
        requires = {
            {
                'rktjmp/lush.nvim',
                cond = require'conditions'.is_nvim_environment,
                opt = true,
            },
        }
    }
    use {
        'sainnhe/edge',
        cond = function() return require'conditions'.is_current_theme('edge') end,
        config = function() require'theming.theme'.setup('edge') end,
        opt = true,
    }
    use {
        'MordechaiHadad/nvim-papadark',
        cond = function() return require'conditions'.is_current_theme('nord') end,
        config = function() require'theming.theme'.setup('nord') end,
        opt = true,
        requires = {
            {
                'rktjmp/lush.nvim',
                cond = require'conditions'.is_nvim_environment,
                opt = true,
            },
        }
    }
    use {
        'monsonjeremy/onedark.nvim',
        cond = function() return require'conditions'.is_current_theme('onedark') end,
        config = function() require'theming.theme'.setup('onedark') end,
        opt = true,
    }
    use {
        'sainnhe/sonokai',
        cond = function() return require'conditions'.is_current_theme('sonokai') end,
        config = function() require'theming.theme'.setup('sonokai') end,
        opt = true,
    }
    use {
        'folke/tokyonight.nvim',
        cond = function() return require'conditions'.is_current_theme('tokyonight') end,
        config = function() require'theming.theme'.setup('tokyonight') end,
        opt = true,
    }

    -- todo
    use {
        'folke/todo-comments.nvim',
        cond = require'conditions'.is_nvim_environment,
        config = function() require'todo-comments'.setup({}) end,
    }
end)
