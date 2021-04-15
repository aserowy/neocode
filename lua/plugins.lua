local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

require'packer'.startup(
    function(use)
        use 'wbthomason/packer.nvim'

        -- common
        use 'glepnir/dashboard-nvim'
        use 'glepnir/galaxyline.nvim'
        use {'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim'}
        use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
        use 'norcalli/nvim-base16.lua'
        use '907th/vim-auto-save'

        -- scrolling
        use 'karb94/neoscroll.nvim'
        use 'nacro90/numb.nvim'
        use 'dstein64/nvim-scrollview'

        -- navigation
        use 'kyazdani42/nvim-tree.lua'
        use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/popup.nvim'}
        use {'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'}

        -- lsp
        use 'neovim/nvim-lspconfig'
        use 'kabouzeid/nvim-lspinstall'
        use 'onsails/lspkind-nvim'

        -- linting
        use 'norcalli/nvim-colorizer.lua'

        use 'nvim-treesitter/nvim-treesitter'
        use 'p00f/nvim-ts-rainbow'
        use 'romgrk/nvim-treesitter-context'
        use 'nvim-treesitter/nvim-treesitter-textobjects'

        -- formatting
        vim.g.kommentary_create_default_mappings = false
        use 'b3nj5m1n/kommentary'
        use 'sbdchd/neoformat'
        -- vim.g.neoformat_verbose = 1

        -- autocompletion
        use 'windwp/nvim-autopairs'
        use 'hrsh7th/nvim-compe'
        use 'kosayoda/nvim-lightbulb'
        use 'L3MON4D3/LuaSnip'

        -- registers
        use 'tversteeg/registers.nvim'

        -- terminal
        use 'numtostr/FTerm.nvim'
    end)

-- common
require'configs.dashboardnvim'
require'configs.galaxylinenvim'
require'configs.gitsignsnvim'
require'configs.indentblanklinenvim'
require'configs.nvimbase16'.init()
require'configs.vimautosave'

-- scrolling
require'configs.neoscrollnvim'
require'numb'.setup()
require'configs.nvimscrollview'

-- navigation
require'configs.nvimtree'
require'configs.telescopenvim'

-- lsp
require'configs.nvimlspconfig'
require'configs.nvimlspinstall'
require'configs.lspkindnvim'

-- linting
require'configs.nvimcolorizer'
require'configs.nvimtreesitter'

-- formatting
require'kommentary.config'.use_extended_mappings()

-- autocompletion
require'configs.nvimautopair'
require'configs.nvimcompe'
require'configs.nvimlightbulb'
require'luasnip'

-- terminal
require'FTerm'.setup()
