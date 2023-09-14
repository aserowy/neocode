local M = {
    theme = {
        name = "tokyonight",
        style = "storm",
        transparent = false,
    },
}

function M.setup()
    vim.g.mapleader = "["

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local options = require("nvim.options")
    local option, buffer, window = options.scope.option, options.scope.buffer, options.scope.window

    -- FIX: currently not working: vim.opt.formatoptions:remove { "c", "r", "o" }
    -- https://github.com/neovim/neovim/blob/a49924a318520a3b5c2f210f22a8d450165e89b5/runtime/ftplugin/lua.vim#L20
    vim.api.nvim_create_autocmd("FileType", {
        command = "set formatoptions-=cro",
    })

    vim.cmd([[set fillchars=eob:\ ,]])
    vim.cmd([[set shortmess+=c]])
    vim.cmd([[set undofile]])

    -- options
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
