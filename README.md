# NeoCode

In my current workflow I use VSCode more and more, because features like remote containers or developing via SSH are not supported in nvim. To be able to work without interruption and not have to use different key bindings everywhere, NeoCode was born. With this configuration I can work fluently in both environments with a only few exceptions.

![intro](./docs/preview/intro.png)

## look & feel

Theme your nvim with ease under [settings](./lua/settings.lua) with [darcula](https://github.com/briones-gabriel/darcula-solid.nvim), [edge](https://github.com/sainnhe/edge), [nord (papadark)](https://github.com/MordechaiHadad/nvim-papadark), [onedark](https://github.com/monsonjeremy/onedark.nvim), [sonokai (monokai pro)](https://github.com/sainnhe/sonokai), or [tokyonight](https://github.com/folke/tokyonight.nvim).

![theming](./docs/preview/theming.png)

Navigate files, symbols, grep and more with explorer ([nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)) and search ([telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)).

![telescope](./docs/preview/telescope.png)

Keep buffers on sight with a buffer bar ([barbar.nvim](https://github.com/romgrk/barbar.nvim)). 

![buffers](./docs/preview/buffers.png)

Handle your code with lsp support with [nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall), [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim), [lspsaga](https://github.com/glepnir/lspsaga.nvim), and [trouble.nvim](https://github.com/folke/trouble.nvim).

![diagnostics](./docs/preview/diagnostics.png)

![signature](./docs/preview/signature.png)

Complete your thoughts with auto completion ([nvim-compe](https://github.com/hrsh7th/nvim-compe)) and snippets ([vim-vsnip](https://github.com/hrsh7th/vim-vsnip)).

![completion](./docs/preview/completion.png)

Move your cursor with lightning speed with [hop (like easymotion)](https://github.com/phaazon/hop.nvim), [numb.nvim](https://github.com/nacro90/numb.nvim), and [quick-scope](https://github.com/unblevable/quick-scope).

![hop](./docs/preview/hop.png)

Mark your thoughts with [todo-comments.nvim](https://github.com/folke/todo-comments.nvim).

![todo](./docs/preview/todo.png)

Focus with zen style ([zen-mode.nvim](https://github.com/folke/zen-mode.nvim)).

![zen](./docs/preview/zen.png)

Many more plugins are used to round up the experience.

## keymaps

Most standard keymaps of nvim are untouched. You can find a list for custom mappings and exceptions between both environments [here](./docs/keybindings.md).

## setup

### nvim (> 0.5)

Clone or copy the repo into your `.config/nvim` folder and start nvim. The package manager will get installed automatically. After the first start, install all packages with `:PackerInstall` and restart nvim.

### vscode

To be able to use vscode accordingly, the following plugins must be installed and set up:

- [Neo Vim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)
- [Keyboard Quickfix](https://marketplace.visualstudio.com/items?itemName=pascalsenn.keyboard-quickfix)

Beside these plugins you also have to set keybindings and settings. You can find them [here](./docs/vscode.md).

> On newer neovim versions check <https://github.com/asvetliakov/vscode-neovim/issues/632> to prevent open new file loops!

## Todos

- [ ] todo views in vscode
- [ ] git integration
- [ ] dba integration in nvim
- [ ] harmonize keybindings for debugging
- [ ] add dev container (predefined docker with complete NeoCode integration for different languages with linter and formatter)
