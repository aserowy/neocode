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
	use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
	use 'karb94/neoscroll.nvim'
	use 'norcalli/nvim-base16.lua'
	use '907th/vim-auto-save'

        -- navigation
	use 'kyazdani42/nvim-tree.lua'

	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-telescope/telescope.nvim'

	use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'kabouzeid/nvim-lspinstall'

	use 'onsails/lspkind-nvim'

	-- linting
	use 'nvim-treesitter/nvim-treesitter'
	use 'norcalli/nvim-colorizer.lua'

	-- formatting
	use 'sbdchd/neoformat'

	-- autocompletion
	use 'windwp/nvim-autopairs'
	use 'hrsh7th/nvim-compe'
	use 'norcalli/snippets.nvim'
end)

-- common
require'configs.indentblanklinenvim'
require'configs.neoscrollnvim'
require'configs.nvimbase16'
require'configs.vimautosave'

-- navigation
require'configs.nvimtree'
require'configs.nvimbufferline'

-- lsp
require'configs.nvimlspinstall'
require'configs.lspkindnvim'

-- linting
require'configs.nvimtreesitter'
require'configs.nvimcolorizer'

-- autocompletion
require'configs.nvimautopair'
require'configs.nvimcompe'
require'configs.snippetsnvim'
