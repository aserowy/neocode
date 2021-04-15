# aluhaVim

Minimal nvim configuration in lua. All used plugins are mostly untouched.

## setup

Clone or copy the repo into your `.config/nvim` folder and start nvim. The package manager will get installed automatically. After the first error `<CR>` install all packages with `:PackerInstall` and restart nvim.

Default theme is `solarized-dark` currently. You can change the theme in `lua/settings.lua`. Just look up themes e.g. here <http://chriskempson.com/projects/base16/>.

## keymaps

Most standard keymaps of nvim are untouched. The leader key is `space`. To open files in vertical or horizontal split use `<C-v>` or `<C-x>`. To create new tabs while opening a file use `<C-t>`.

You can find all custom mappings in `lua/mappings.lua`.
