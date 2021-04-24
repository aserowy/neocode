# Keybindings

## Introduction

To enable fluent developement in nvim and vscode (with neovim integration) all keybindings are equal. Small differences caused by different ui concepts are marked under the note column.

The bindings can have the following status:

- b for implemented in both environments
- v for currently in nvim only
- c for currently in vscode only
- m for missing in both

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

| status | key                       | effect          | notes |
| ------ | ------------------------- | --------------- | ----- |
| b      | <kbd>g</kbd> <kbd>d</kbd> | definitions     |       |
| b      | <kbd>g</kbd> <kbd>f</kbd> | declarations    |       |
| b      | <kbd>g</kbd> <kbd>H</kbd> | references      |       |
| b      | <kbd>g</kbd> <kbd>i</kbd> | implementations |       |
| b      | <kbd></kbd> <kbd></kbd>   |                 |       |

## Explorer

## File search

## Grep search

## Symbol search

## Terminal
