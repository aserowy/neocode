local vim = vim

require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- formatting
    use {'b3nj5m1n/kommentary', config = function() require'kommentary.config' end}
    use 'sbdchd/neoformat'

    -- git
    -- https://github.com/sindrets/diffview.nvim
    use {'lewis6991/gitsigns.nvim', config = function() require'git.plugin_gitsigns' end, requires = 'nvim-lua/plenary.nvim'}

    -- helper
    vim.g.auto_save = 1
    use '907th/vim-auto-save'
    use {'folke/which-key.nvim', config = function() require'which-key'.setup() end}

    -- language support
    use {'neovim/nvim-lspconfig', config = function() require'language.plugin_lspconfig' end}
    use {'kabouzeid/nvim-lspinstall', config = function() require'language.plugin_lspinstall'.setup() end}
    use {'onsails/lspkind-nvim', config = function() require'language.plugin_lspkind' end}
    use {'glepnir/lspsaga.nvim', config = function() require'language.plugin_lspsaga'.setup() end}

    use {'windwp/nvim-autopairs', config = function() require'nvim-autopairs'.setup() end}
    use {'hrsh7th/nvim-compe', config = function() require'language.plugin_compe'.setup() end}
    use {'hrsh7th/vim-vsnip', requires = 'hrsh7th/vim-vsnip-integ'}

    -- layout
    -- TODO add plugins to functions
    use {'glepnir/dashboard-nvim', config = function() require'layout.plugin_dashboard' end}
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua', config = function() require'layout.plugin_indentblankline' end}
    use {'kdav5758/TrueZen.nvim', config = function() require'true-zen' end}

    -- linting
    use {'norcalli/nvim-colorizer.lua', config = function() require'linting.plugin_colorizer' end}

    use {'nvim-treesitter/nvim-treesitter', config = function() require'linting.plugin_treesitter' end, run = 'TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use 'romgrk/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- motion
    use {'phaazon/hop.nvim', as = 'hop', config = function() require'hop'.setup {} end}
    use {'karb94/neoscroll.nvim', config = function() require'motion.plugin_neoscroll' end}
    use {'nacro90/numb.nvim', config = function() require'numb'.setup() end}
    use {'dstein64/nvim-scrollview', config = function() require'motion.plugin_scrollview' end}
    use 'unblevable/quick-scope'

    -- navigation
    use {'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {'folke/lsp-trouble.nvim', config = function() require'navigation.plugin_trouble' end, requires = 'kyazdani42/nvim-web-devicons'}
    use {'kyazdani42/nvim-tree.lua', config = function() require'navigation.plugin_tree' end, requires = 'kyazdani42/nvim-web-devicons'}
    use {'nvim-telescope/telescope.nvim', config = function() require'navigation.plugin_telescope' end, requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

    -- status
    use {'hoob3rt/lualine.nvim', config = function() require'status.plugin_lualine'.setup() end, requires = 'kyazdani42/nvim-web-devicons'}

    -- terminal
    use {'numtostr/FTerm.nvim', config = function() require'FTerm'.setup() end}

    -- theming
    use {'folke/tokyonight.nvim', config = function() require'theming.plugin_tokyonight'.setup() end}

    -- todo
    -- use {"folke/todo-comments.nvim", config = function() require("todo-comments").setup({}) end}
end)
