require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- theme
    use {'norcalli/nvim-base16.lua', config = function()
        require'configs.nvimbase16'.init()
        require'theme'
    end}

    -- zen
    use {'kdav5758/TrueZen.nvim', config = function() require'true-zen' end}

    -- common
    use {'glepnir/dashboard-nvim', config = function() require'configs.dashboardnvim' end}
    use {'glepnir/galaxyline.nvim', config = function() require'configs.galaxylinenvim' end, requires = 'kyazdani42/nvim-web-devicons'}
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua', config = function() require'configs.indentblanklinenvim' end}
    use {'907th/vim-auto-save', config = function() require'configs.vimautosave' end}
    use {'folke/which-key.nvim', config = function() require'which-key'.setup {} end}

    -- scrolling
    use {'karb94/neoscroll.nvim', config = function() require'configs.neoscrollnvim' end}
    use {'nacro90/numb.nvim', config = function() require'numb'.setup() end}
    use {'dstein64/nvim-scrollview', config = function() require'configs.nvimscrollview' end}

    -- navigation
    use {'kyazdani42/nvim-tree.lua', config = function() require'configs.nvimtree' end, requires = 'kyazdani42/nvim-web-devicons'}
    use {'nvim-telescope/telescope.nvim', config = function() require'configs.telescopenvim' end, requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
    use {'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- lsp
    use {'neovim/nvim-lspconfig', config = function() require'configs.nvimlspconfig' end}
    use {'kabouzeid/nvim-lspinstall', config = function() require'configs.nvimlspinstall' end}
    use {'onsails/lspkind-nvim', config = function() require'configs.lspkindnvim' end}
    use {'folke/lsp-trouble.nvim', config = function() require'configs.lsptroublenvim' end, requires = 'kyazdani42/nvim-web-devicons'}

    -- linting
    use {'norcalli/nvim-colorizer.lua', config = function() require'configs.nvimcolorizer' end}

    use {'nvim-treesitter/nvim-treesitter', config = function() require'configs.nvimtreesitter' end, run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use 'romgrk/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- motion
    use {'phaazon/hop.nvim', as = 'hop', config = function() require'hop'.setup {} end}
    use 'unblevable/quick-scope'

    -- formatting
    use {'b3nj5m1n/kommentary', config = function() require'kommentary.config' end}
    use 'sbdchd/neoformat'

    -- autocompletion
    use {'windwp/nvim-autopairs', config = function() require'configs.nvimautopair' end}
    use {'hrsh7th/nvim-compe', config = function() require'configs.nvimcompe' end}
    use {'kosayoda/nvim-lightbulb', config = function() require'configs.nvimlightbulb' end}
    use 'hrsh7th/vim-vsnip'

    -- terminal
    use {'numtostr/FTerm.nvim', config = function() require'FTerm'.setup() end}

    -- TODO git
    -- https://github.com/sindrets/diffview.nvim
    use {'lewis6991/gitsigns.nvim', config = function() require'configs.gitsignsnvim' end, requires = 'nvim-lua/plenary.nvim'}
end)
