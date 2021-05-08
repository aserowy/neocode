# Keybindings

## Introduction

To enable fluent developement in nvim and vscode (with neovim integration) all keybindings are equal. Small differences caused by different ui concepts are marked under the note column. All standard vim keybindings are supported in both environments.

Got any troubles in your workflows? Issues are welcome!

> all keys are configured for normal mode, except completion and snippet bindings of course :)

## General

| only? | key                         | effect               | notes |
| ----- | --------------------------- | -------------------- | ----- |
|       | <kbd>ctrl + shift + c</kbd> | copy to clipboard    |       |
|       | <kbd>ctrl + shift + v</kbd> | paste from clipboard |       |

## Zen

| only? | key                 | effect           | notes |
| ----- | ------------------- | ---------------- | ----- |
|       | <kbd>ctrl + z</kbd> | toggles zen mode |       |

## Functions

| only? | key                 | effect                     | notes |
| ----- | ------------------- | -------------------------- | ----- |
|       | <kbd>ctrl + e</kbd> | focus explorer (file tree) |       |
|       | <kbd>ctrl + f</kbd> | focus file search          |       |
|       | <kbd>ctrl + g</kbd> | focus grep search          |       |
|       | <kbd>ctrl + q</kbd> | focus diagnostics          |       |
|       | <kbd>ctrl + s</kbd> | focus symbol search        |       |
|       | <kbd>ctrl + t</kbd> | focus integrated terminal  |       |
| vim   | <kbd>ctrl + x</kbd> | focus quickfix list        |       |

## Windows

### Splits & closes

| only? | key                              | effect                               | notes |
| ----- | -------------------------------- | ------------------------------------ | ----- |
|       | <kbd>ctrl + w</kbd> <kbd>n</kbd> | creates new window with empty buffer |       |
|       | <kbd>ctrl + w</kbd> <kbd>v</kbd> | splits editor vertically             |       |
|       | <kbd>ctrl + w</kbd> <kbd>s</kbd> | splits editor horizontally           |       |
|       | <kbd>ctrl + w</kbd> <kbd>q</kbd> | closes window and buffer             |       |
|       | <kbd>ctrl + w</kbd> <kbd>o</kbd> | closes window and merges buffer      |       |

### Focus

| only? | key                 | effect                       | notes |
| ----- | ------------------- | ---------------------------- | ----- |
|       | <kbd>ctrl + h</kbd> | moves window focus to left   |       |
|       | <kbd>ctrl + l</kbd> | moves window focus to right  |       |
|       | <kbd>ctrl + k</kbd> | moves window focus to top    |       |
|       | <kbd>ctrl + j</kbd> | moves window focus to bottom |       |

## Buffer

| only? | key                 | effect                    | notes |
| ----- | ------------------- | ------------------------- | ----- |
|       | <kbd>ctrl + a</kbd> | open new empty buffer     |       |
|       | <kbd>ctrl + p</kbd> | move to previous buffer   |       |
|       | <kbd>ctrl + n</kbd> | move to next buffer       |       |
|       | <kbd>ctrl + c</kbd> | closes the current buffer |       |

## Editor

### on text

| only?  | key                                          | effect                          | notes                                                              |
| ------ | -------------------------------------------- | ------------------------------- | ------------------------------------------------------------------ |
|        | <kbd>g</kbd> <kbd>s</kbd>                    | saves file                      |                                                                    |
|        | <kbd>g</kbd> <kbd>d</kbd>                    | definitions                     |                                                                    |
|        | <kbd>ctrl + w</kbd><kbd>g</kbd> <kbd>d</kbd> | opens definition aside          |                                                                    |
|        | <kbd>g</kbd> <kbd>f</kbd>                    | declarations                    |                                                                    |
|        | <kbd>g</kbd> <kbd>H</kbd>                    | references                      |                                                                    |
|        | <kbd>g</kbd> <kbd>i</kbd>                    | implementations                 |                                                                    |
|        | <kbd>g</kbd> <kbd>r</kbd>                    | rename symbol                   |                                                                    |
|        | <kbd>g</kbd> <kbd>a</kbd>                    | arrange/format document         |                                                                    |
|        | <kbd>g</kbd> <kbd>p</kbd>                    | show previous diagnostic        |                                                                    |
|        | <kbd>g</kbd> <kbd>n</kbd>                    | show next diagnostic            |                                                                    |
| vim    | <kbd>g</kbd> <kbd>l</kbd>                    | show diagnostic in current line | Is only needed in vim, because g p/n triggers not in current line. |
|        | <kbd>g</kbd> <kbd>q</kbd>                    | show quick fixes                |                                                                    |
| vim    | <kbd>g</kbd> <kbd>h</kbd>                    | show signature help             |                                                                    |
| vscode | <kbd>ctrl + space</kbd>                      | show completion menu            | is shown automatically                                             |

### completion

| only? | key                    | effect                                          | notes |
| ----- | ---------------------- | ----------------------------------------------- | ----- |
|       | <kbd>shift + tab</kbd> | jump to previous completion/snippet placeholder |       |
|       | <kbd>tab</kbd>         | jump to next completion/snippet placeholder     |       |
|       | <kbd>enter</kbd>       | insert completion/snippet                       |       |

### motion

| only? | key                                | effect                              | notes |
| ----- | ---------------------------------- | ----------------------------------- | ----- |
|       | <kbd>leader ([)</kbd> <kbd>w</kbd> | trigger hop words (like easymotion) |       |

## Explorer

> works only while explorer is focused

| only?  | key                 | effect                         | notes                            |
| ------ | ------------------- | ------------------------------ | -------------------------------- |
|        | <kbd>ctrl + c</kbd> | closes the explorer            |                                  |
|        | <kbd>j</kbd>        | move one line down             |                                  |
|        | <kbd>k</kbd>        | move one line up               |                                  |
|        | <kbd>h</kbd>        | collapse folder                |                                  |
|        | <kbd>l</kbd>        | expand folder                  | opens the file in vim only       |
| vscode | <kbd>f</kbd>        | grep in current folder         |                                  |
| vim    | <kbd>H</kbd>        | show/hide hidden files         |                                  |
|        | <kbd>y</kbd>        | yanks file/folder under cursor |                                  |
|        | <kbd>m</kbd>        | moves file/folder              | paste file to finish the move    |
|        | <kbd>p</kbd>        | paste file/folder              |                                  |
|        | <kbd>d</kbd>        | deletes file/folder            |                                  |
|        | <kbd>r</kbd>        | renames file/foler             |                                  |
|        | <kbd>a</kbd>        | adds file/foler                | in vscode only files are added   |
| vscode | <kbd>A</kbd>        | adds folder                    | is only needed in vscode         |
|        | <kbd>enter</kbd>    | opens file                     |                                  |
|        | <kbd>ctrl + v</kbd> | opens file in vertical split   | in vscode currently ctrl + enter |

## Diagnostics (& quickfix in vim)

| only? | key                 | effect                              | notes                            |
| ----- | ------------------- | ----------------------------------- | -------------------------------- |
|       | <kbd>space</kbd>    | toggle current fold                 |                                  |
|       | <kbd>ctrl + c</kbd> | closes the diagnostics              |                                  |
|       | <kbd>ctrl + p</kbd> | select previous entry               |                                  |
|       | <kbd>ctrl + n</kbd> | select next entry                   |                                  |
|       | <kbd>enter</kbd>    | opens file                          |                                  |
|       | <kbd>ctrl + v</kbd> | opens file in vertical split        | in vscode currently ctrl + enter |
| vim   | <kbd>m</kbd>        | toggles workspace and document mode |                                  |

## File/grep/symbol search

| only? | key                 | effect                        | notes                                                |
| ----- | ------------------- | ----------------------------- | ---------------------------------------------------- |
|       | <kbd>ctrl + c</kbd> | closes the search             |                                                      |
| vim   | <kbd>ctrl + q</kbd> | transfere results to quickfix | quickfix and local lists are not supported in vscode |
|       | <kbd>ctrl + p</kbd> | select previous search entry  |                                                      |
|       | <kbd>ctrl + n</kbd> | select next search entry      |                                                      |
|       | <kbd>enter</kbd>    | opens file                    |                                                      |
|       | <kbd>ctrl + v</kbd> | opens file in vertical split  | in vscode currently ctrl + enter                     |

> to research grep in vscode press <kbd>ctrl + g</kbd> again while the search is focused. This resets the search and selects the search input.

## Terminal

| only?  | key                             | effect                      | notes                                                         |
| ------ | ------------------------------- | --------------------------- | ------------------------------------------------------------- |
| vim    | <kbd>ctrl + c</kbd>             | closes the terminal         |                                                               |
|        | <kbd>ctrl + k</kbd>             | focuses current buffer      | closes the terminal in vim                                    |
|        | <kbd>ctrl + j</kbd>             | closes the terminal         | ctrl + c as keybinding in terminal is not supported in vscode |
| vscode | <kbd>ctrl + w</kbd><kbd>n</kbd> | opens new terminal          |                                                               |
| vscode | <kbd>ctrl + w</kbd><kbd>v</kbd> | opens new terminal in split |                                                               |
| vscode | <kbd>ctrl + p</kbd>             | focuses previous terminal   |                                                               |
| vscode | <kbd>ctrl + n</kbd>             | focuses next terminal       |                                                               |
