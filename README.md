# NeoCode

In my current workflow I use VSCode more and more, because features like remote containers or developing via SSH are not supported in nvim. To be able to work without interruption and not have to use different key bindings everywhere, NeoCode was born. With this configuration I can work fluently in both environments with a only few exceptions.

## requirements

- neovim >= 0.6

## keymaps

Most standard keymaps of nvim are untouched. You can find a list for custom mappings and exceptions between both environments [here](./docs/keybindings.md).

## setup

### neovim (>= 0.6)

Clone or copy the repo into your `.config/nvim` folder and start nvim. The package manager will get installed automatically. After the first start, install all packages with `:PackerInstall` and restart nvim.

### vscode

To be able to use vscode accordingly, the following plugins must be installed and set up:

- [Neo Vim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)
- [Keyboard Quickfix](https://marketplace.visualstudio.com/items?itemName=pascalsenn.keyboard-quickfix)
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)

Beside these plugins you also have to set keybindings and settings. You can find them [here](./docs/vscode.md).

> On newer neovim versions check <https://github.com/asvetliakov/vscode-neovim/issues/632> to prevent open new file loops!
