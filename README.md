# lua lua mpu yahh

Minimal nvim configuration in lua. All used plugins are mostly untouched.

## setup

Clone or copy the repo into your `.config/nvim` folder and start nvim. The package manager will get installed automatically. After the first error `<CR>` install all packages with `:PackerInstall` and restart nvim.

Default theme is `solarized-dark` currently. You can change the theme in `lua/configs/nvimbase16.lua`. Just look up themes e.g. here <http://chriskempson.com/projects/base16/>.

## todo

- [-] complete documentation
- [-] save on file open to trigger lsp hints
- [-] adding automated imports
- [-] add theme management
- [-] pr omnisharp to used lspinstall
- [-] add releases to stabilize while working on trunk
- [-] add install scripts for ubuntu and win

## plugins

| plugin |     |
| ------ | --- |
|        |     |

## keymaps

All standard keymaps of nvim are untouched. The leader key is `space`. To open files in vertical or horizontal split use `<C-v>` or `<C-x>`. To create new tabs while opening a file use `<C-t>`.

### window movement

| map    | function |
| ------ | -------- |
| <C-j\> |          |
| <C-k\> |          |
| <C-l\> |          |
| <C-h\> |          |

### buffer

| map         | function |
| ----------- | -------- |
| <Leader\>bs |          |
| <Leader\>bd |          |
| <Leader\>bn |          |
| <Leader\>bp |          |

### file operations

| map         | function |
| ----------- | -------- |
| <Leader\>fs |          |
| <Leader\>fo |          |
| <Leader\>ft |          |
| <Leader\>fi |          |
| <Leader\>fm |          |

### file tree

| map        | function |
| ---------- | -------- |
| l          |          |
| h          |          |
| <          |          |
| \>         |          |
| <space\>rn |          |
| a          |          |
| cc         |          |
| dd         |          |
| yy         |          |
| I          |          |
| H          |          |

### terminal

| map         | function |
| ----------- | -------- |
| <Leader\>tt |          |
| <Leader\>tv |          |
| <Leader\>tx |          |
| <Leader\>td |          |

### selection extension

| map | function |
| --- | -------- |
| af  |          |
| if  |          |
| ac  |          |
| ic  |          |

### lsp

| map | function |
| --- | -------- |
