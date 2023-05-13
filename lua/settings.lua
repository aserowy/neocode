local M = {}

function M.theme()
    return {
        theme = "tokyonight",
        style = "storm",
        transparent = false,

        -- theme = "hardhacker",
        -- style = "dark", "warm"

        -- theme = "onedark",
        -- style = "dark", "darker", "cool", "deep", "warm", "warmer", "light"
        -- transparent = false,

        -- theme = "tokyonight"
        -- style = "storm", "moon", "night", "day",
        -- transparent = false,
    }
end

function M.setup()
    vim.g.mapleader = "["

    local options = require("nvim.options")
    local option, buffer, window = options.scope.option, options.scope.buffer, options.scope.window

    vim.cmd([[set fillchars=eob:\ ,]])
    vim.cmd([[set shortmess+=c]])
    vim.cmd([[set undofile]])

    -- options
    if not M.theme().transparent then
        options.set(option, "cursorline", true)
    end

    options.set(option, "clipboard", "unnamed,unnamedplus")

    options.set(option, "hidden", true)
    options.set(option, "ignorecase", true)
    options.set(option, "mouse", "a")
    options.set(option, "showmode", false)
    options.set(option, "smartcase", true)
    options.set(option, "splitbelow", true)
    options.set(option, "splitright", true)
    options.set(option, "termguicolors", true)

    options.set(window, "number", true)
    options.set(window, "relativenumber", true)
    options.set(window, "signcolumn", "yes:2")

    options.set(buffer, "expandtab", true)
    options.set(buffer, "shiftwidth", 4)
    options.set(buffer, "softtabstop", 4)
    options.set(buffer, "tabstop", 4)
end

return M
