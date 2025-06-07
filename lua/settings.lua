local M = {
    theme = {
        name = "onenord",
        style = "dark",
        transparent = false,
    },
}

function M.activate_theme()
    local theme = M.theme

    local themes = require("theming.themes")
    themes.activate_theme(theme.name, theme.style, theme.transparent)
end

function M.setup()
    vim.g.mapleader = "["
    vim.g.maplocalleader = "["

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd

    autocmd("BufWritePre", {
        group = augroup("StripTrailingWhitespace", {}),
        pattern = "*",
        command = [[%s/\s\+$//e]],
    })

    -- FIX: currently not working: vim.opt.formatoptions:remove { "c", "r", "o" }
    -- https://github.com/neovim/neovim/blob/a49924a318520a3b5c2f210f22a8d450165e89b5/runtime/ftplugin/lua.vim#L20
    autocmd("FileType", {
        command = "set formatoptions-=cro",
    })

    autocmd("TextYankPost", {
        group = augroup("HighlightYank", {}),
        pattern = "*",
        callback = function()
            vim.highlight.on_yank({
                higroup = "IncSearch",
                timeout = 250,
            })
        end,
    })

    -- styling
    vim.o.winborder = 'rounded'

    -- diagnostics
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.HINT] = '󰌶',
                [vim.diagnostic.severity.INFO] = '',
                [vim.diagnostic.severity.WARN] = '',
                [vim.diagnostic.severity.ERROR] = '',
            },
        },
        virtual_lines = { current_line = true, }
    })

    -- options
    vim.opt.clipboard = "unnamed,unnamedplus"

    vim.opt.backup = false
    vim.opt.ignorecase = true
    vim.opt.mouse = "a"
    vim.opt.undofile = true
    vim.opt.showmode = false
    vim.opt.smartcase = true
    vim.opt.splitbelow = true
    vim.opt.splitright = true
    vim.opt.swapfile = false
    vim.opt.termguicolors = true

    vim.opt.expandtab = true
    vim.opt.fillchars.eob = "\\ "
    vim.opt.linebreak = true
    vim.opt.shiftwidth = 4
    vim.opt.shortmess:append({ c = true })
    vim.opt.softtabstop = 4
    vim.opt.tabstop = 4
    vim.opt.wrap = true

    vim.opt.colorcolumn = "100"
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.signcolumn = "yes:2"

    vim.opt.updatetime = 250
end

return M
