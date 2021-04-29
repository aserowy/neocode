# NeoCode

In my current workflow I use VSCode more and more, because features like remote containers or developing via SSH are not supported in nvim. To be able to work fluently and not have to use different key bindings everywhere, NeoCode was created. With this configuration I can work fluently in both environments with a few exceptions.

Bindings and settings are NOT the best you can get with vim. BUT the ability to switch between both tools without interrupting your flow is worth the trade off imho.

## setup

### nvim (> 0.5)

Clone or copy the repo into your `.config/nvim` folder and start nvim. The package manager will get installed automatically. After the first error `<CR>` install all packages with `:PackerInstall` and restart nvim.

Default theme is `solarized-dark` currently. You can change the theme in `lua/settings.lua`. Just look up themes e.g. here <http://chriskempson.com/projects/base16/>.

### vscode

To be able to use vscode accordingly, the following plugins must be installed and set up:

- [Neo Vim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)
- [Keyboard Quickfix](https://marketplace.visualstudio.com/items?itemName=pascalsenn.keyboard-quickfix)

Beside these plugins you also have to set keybindings and settings. You can find them [here](./docs/vscode.md)

## keymaps

Most standard keymaps of nvim are untouched. You can find a list for custom mappings and exceptions between both environments [here](./docs/keybindings.md).
