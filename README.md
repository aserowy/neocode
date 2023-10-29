# NeoCode

My workflow mainly takes place in nvim, but there are occasional exceptions to
work in vscode. In order to maintain large parts of the flow within vscode,
neocode was created.

## requirements

- neovim >= 0.9

## keymaps

Most standard keymaps of nvim are untouched. You can find a list for custom
mappings and exceptions [here](./lua/mappings.lua).

## setup

### neovim (>= 0.9)

Clone or copy the repo into your `.config/nvim` folder and start nvim. The
package manager will get installed automatically.

### vscode

To be able to use vscode accordingly, the following plugins must be installed
and set up:

- [Neo Vim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)
- [Keyboard Quickfix](https://marketplace.visualstudio.com/items?itemName=pascalsenn.keyboard-quickfix)
- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)

The full setup for vscode including extensions, bindings and settings can be found
[here](https://github.com/aserowy/dots/blob/main/home/components/vscode/default.nix).
