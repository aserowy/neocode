# Keybindings

## Introduction

To enable fluent developement in nvim and vscode (with neovim integration) all keybindings are equal. Small differences caused by different ui concepts are marked under the note column.

The bindings can have the following status:

- b for implemented in both environments
- v for currently in nvim only
- c for currently in vscode only
- m for missing in both

## General

| status | key                         | effect               | notes |
| ------ | --------------------------- | -------------------- | ----- |
| b      | <kbd>ctrl + shift + c</kbd> | copy to clipboard    |       |
| b      | <kbd>ctrl + shift + v</kbd> | paste from clipboard |       |

## Zen

| status | key                 | effect           | notes |
| ------ | ------------------- | ---------------- | ----- |
| b      | <kbd>ctrl + z</kbd> | enables zen mode |       |

## Functions

> all keys are configured for normal mode

| status | key                 | effect                     | notes |
| ------ | ------------------- | -------------------------- | ----- |
| b      | <kbd>ctrl + e</kbd> | focus explorer (file tree) |       |
| b      | <kbd>ctrl + q</kbd> | focus diagnostics          |       |
| b      | <kbd>ctrl + f</kbd> | focus file search          |       |
| b      | <kbd>ctrl + g</kbd> | focus grep search          |       |
| b      | <kbd>ctrl + s</kbd> | focus symbol search        |       |
| v      | <kbd>ctrl + t</kbd> | focus integrated terminal  |       |

## Windows

> all keys are configured for normal mode

### Splits & closes

| status | key                              | effect                          | notes |
| ------ | -------------------------------- | ------------------------------- | ----- |
| b      | <kbd>ctrl + w</kbd> <kbd>n</kbd> | creates new file                |       |
| b      | <kbd>ctrl + w</kbd> <kbd>v</kbd> | splits editor vertically        |       |
| b      | <kbd>ctrl + w</kbd> <kbd>s</kbd> | splits editor horizontally      |       |
| b      | <kbd>ctrl + w</kbd> <kbd>q</kbd> | closes window and buffer        |       |
| b      | <kbd>ctrl + w</kbd> <kbd>o</kbd> | closes window and merges buffer |       |

### Focus

| status | key                 | effect                       | notes |
| ------ | ------------------- | ---------------------------- | ----- |
| b      | <kbd>ctrl + h</kbd> | moves window focus to left   |       |
| b      | <kbd>ctrl + l</kbd> | moves window focus to right  |       |
| b      | <kbd>ctrl + k</kbd> | moves window focus to top    |       |
| b      | <kbd>ctrl + j</kbd> | moves window focus to bottom |       |

## Buffer

> all keys are configured for normal mode and are working only while in a buffer

| status | key                 | effect                    | notes |
| ------ | ------------------- | ------------------------- | ----- |
| b      | <kbd>ctrl + p</kbd> | move to previous buffer   |       |
| b      | <kbd>ctrl + n</kbd> | move to next buffer       |       |
| b      | <kbd>ctrl + c</kbd> | closes the current buffer |       |

## Editor

| status | key                                          | effect                                                      | notes                                                                  |
| ------ | -------------------------------------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------- |
| b      | <kbd>g</kbd> <kbd>d</kbd>                    | definitions                                                 |                                                                        |
| b      | <kbd>ctrl + w</kbd><kbd>g</kbd> <kbd>d</kbd> | opens definition aside                                      |                                                                        |
| b      | <kbd>g</kbd> <kbd>f</kbd>                    | declarations                                                |                                                                        |
| b      | <kbd>g</kbd> <kbd>H</kbd>                    | references                                                  |                                                                        |
| b      | <kbd>g</kbd> <kbd>i</kbd>                    | implementations                                             |                                                                        |
| b      | <kbd>space</kbd> <kbd>r</kbd>                | rename symbol                                               |                                                                        |
| b      | <kbd>space</kbd> <kbd>f</kbd>                | format document                                             |                                                                        |
| b      | <kbd>space</kbd> <kbd>p</kbd>                | show previous diagnostic                                    |                                                                        |
| b      | <kbd>space</kbd> <kbd>n</kbd>                | show next diagnostic                                        |                                                                        |
| v      | <kbd>space</kbd> <kbd>l</kbd>                | show diagnostic in current line                             | Is only needed in vim, because space p/n triggers not in current line. |
| b      | <kbd>space</kbd> <kbd>q</kbd>                | show quick fixes                                            |                                                                        |
| v      | <kbd>space</kbd> <kbd>h</kbd>                | show signature help                                         |                                                                        |
| v      | <kbd>space</kbd> <kbd>d</kbd>                | show type definition                                        |                                                                        |
| c      | <kbd>ctrl + space</kbd>                      | show completion menu                                        | is shown automatically                                                 |
| b      | <kbd>shift + tab</kbd>                       | navigate to previous in completion menu/snippet placeholder |                                                                        |
| b      | <kbd>tab</kbd>                               | navigate to next in completion menu/snippet placeholder     |                                                                        |
| b      | <kbd>enter</kbd>                             | use marked completion                                       |                                                                        |

## Explorer

> works only while explorer is focused

| status | key                 | effect                         | notes                            |
| ------ | ------------------- | ------------------------------ | -------------------------------- |
| b      | <kbd>ctrl + c</kbd> | closes the explorer            |                                  |
| b      | <kbd>j</kbd>        | move one line down             |                                  |
| b      | <kbd>k</kbd>        | move one line up               |                                  |
| b      | <kbd>h</kbd>        | collapse folder                |                                  |
| b      | <kbd>l</kbd>        | expand folder                  | opens the file in vim only       |
| c      | <kbd>f</kbd>        | grep in current folder         |                                  |
| v      | <kbd>H</kbd>        | show/hide hidden files         |                                  |
| b      | <kbd>y</kbd>        | yanks file/folder under cursor |                                  |
| b      | <kbd>m</kbd>        | moves file/folder              | paste file to finish the move    |
| b      | <kbd>p</kbd>        | paste file/folder              |                                  |
| b      | <kbd>d</kbd>        | deletes file/folder            |                                  |
| b      | <kbd>r</kbd>        | renames file/foler             |                                  |
| v      | <kbd>a</kbd>        | adds file/foler                |                                  |
| b      | <kbd>enter</kbd>    | opens file                     |                                  |
| b      | <kbd>ctrl + v</kbd> | opens file in vertical split   | in vscode currently ctrl + enter |

## File search

## Grep search

## Symbol search

## Terminal
