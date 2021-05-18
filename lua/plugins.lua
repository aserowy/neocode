local function is_nvim_environment()
    return vim.g.vscode == nil
end

local function is_vscode_environment()
    return vim.g.vscode ~= nil
end

require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- vscode only
    use {
        'asvetliakov/vim-easymotion',
        cond = is_vscode_environment,
    }

    -- completion
    use {
        'windwp/nvim-autopairs',
        cond = is_nvim_environment,
        config = function() require'nvim-autopairs'.setup() end,
    }
    use {
        'hrsh7th/nvim-compe',
        cond = is_nvim_environment,
        config = function() require'completion.plugin_compe'.setup() end,
        after = 'nvim-autopairs',
    }
    use {
        'hrsh7th/vim-vsnip',
        cond = is_nvim_environment,
        requires = 'hrsh7th/vim-vsnip-integ'
    }

    -- formatting
    use {
        'b3nj5m1n/kommentary',
        cond = is_nvim_environment,
        config = function() require'kommentary.config' end,
    }
    use {
        'sbdchd/neoformat',
        cond = is_nvim_environment,
    }

    -- git
    -- TODO: https://github.com/sindrets/diffview.nvim
    use {
        'lewis6991/gitsigns.nvim',
        cond = is_nvim_environment,
        config = function() require'git.plugin_gitsigns' end,
        requires = 'nvim-lua/plenary.nvim'
    }

    -- helper
    use {
        '907th/vim-auto-save',
        cond = is_nvim_environment,
        config = function() vim.g.auto_save = 1 end,
    }
    use {
        'folke/which-key.nvim',
        cond = is_nvim_environment,
        config = function() require'which-key'.setup() end,
    }

    -- language
    use {
        'neovim/nvim-lspconfig',
        cond = is_nvim_environment,
    }
    use {
        'ray-x/lsp_signature.nvim',
        cond = is_nvim_environment,
    }
    use {
        'kabouzeid/nvim-lspinstall',
        cond = is_nvim_environment,
        config = function() require'language.plugin_lspinstall'.setup() end,
        after = {
            'nvim-lspconfig',
            'lsp_signature.nvim',
        }
    }
    use {
        'onsails/lspkind-nvim',
        cond = is_nvim_environment,
        config = function() require('lspkind').init() end,
    }
    use {
        'glepnir/lspsaga.nvim',
        cond = is_nvim_environment,
        config = function() require'language.plugin_lspsaga'.setup() end,
    }

    -- layout
    -- TODO: add plugins to functions
    use {
        'glepnir/dashboard-nvim',
        cond = is_nvim_environment,
        config = function() require'layout.plugin_dashboard' end,
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua',
        cond = is_nvim_environment,
        config = function() require'layout.plugin_indentblankline' end,
    }
    use {
        'kdav5758/TrueZen.nvim',
        cond = is_nvim_environment,
        config = function() require'true-zen' end,
    }

    -- linting
    use {
        'norcalli/nvim-colorizer.lua',
        cond = is_nvim_environment,
        config = function() require'linting.plugin_colorizer' end,
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        cond = is_nvim_environment,
        config = function() require'linting.plugin_treesitter' end,
        run = 'TSUpdate',
        requires = {
            {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'},
            {'romgrk/nvim-treesitter-context', after = 'nvim-treesitter'},
            {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
        }
    }

    -- motion
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        cond = is_nvim_environment,
        config = function() require'hop'.setup {} end
    }
    use {
        'karb94/neoscroll.nvim',
        cond = is_nvim_environment,
        config = function() require'motion.plugin_neoscroll' end,
    }
    use {
        'nacro90/numb.nvim',
        cond = is_nvim_environment,
        config = function() require'numb'.setup() end,
    }
    use {
        'dstein64/nvim-scrollview',
        cond = is_nvim_environment,
        config = function() require'motion.plugin_scrollview' end,
    }
    use 'unblevable/quick-scope'

    -- navigation
    use {
        'romgrk/barbar.nvim',
        cond = is_nvim_environment,
        requires = 'kyazdani42/nvim-web-devicons',
    }
    use {
        'folke/lsp-trouble.nvim',
        cond = is_nvim_environment,
        config = function() require'navigation.plugin_trouble' end,
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'kyazdani42/nvim-tree.lua',
        cond = is_nvim_environment,
        config = function() require'navigation.plugin_tree' end,
        requires = 'kyazdani42/nvim-web-devicons',
        after = 'barbar.nvim',
    }
    use {
        'nvim-telescope/telescope.nvim',
        cond = is_nvim_environment,
        config = function() require'navigation.plugin_telescope' end,
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        }
    }

    -- status
    use {
        'hoob3rt/lualine.nvim',
        cond = is_nvim_environment,
        config = function() require'status.plugin_lualine'.setup() end,
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- terminal
    use {
        'akinsho/nvim-toggleterm.lua',
        cond = is_nvim_environment,
        config = function() require'terminal.plugin_toggleterm'.setup() end,
    }

    -- theming
    use {
        'marko-cerovac/material.nvim',
        cond = is_nvim_environment,
        config = function() require'theming.theme'.setup() end
    }
    use {
        'shaunsingh/nord.nvim',
        cond = is_nvim_environment,
        config = function() require'theming.theme'.setup() end
    }
    use {
        'folke/tokyonight.nvim',
        cond = is_nvim_environment,
        config = function() require'theming.theme'.setup() end
    }

    -- todo
    use {
        'folke/todo-comments.nvim',
        cond = is_nvim_environment,
        config = function() require'todo-comments'.setup({}) end,
    }
end)
