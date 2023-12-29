local M = {
    theme = {
        name = "tokyonight",
        style = "storm",
        transparent = false,
    },
}

function M.setup()
    vim.g.mapleader = "["

    vim.g.netrw_banner = 0
    vim.g.netrw_winsize = 25

    -- FIX: currently not working: vim.opt.formatoptions:remove { "c", "r", "o" }
    -- https://github.com/neovim/neovim/blob/a49924a318520a3b5c2f210f22a8d450165e89b5/runtime/ftplugin/lua.vim#L20
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
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

    autocmd("BufWritePre", {
        group = augroup("StripTrailingWhitespace", {}),
        pattern = "*",
        command = [[%s/\s\+$//e]],
    })

    vim.cmd([[set fillchars=eob:\ ,]])
    vim.cmd([[set shortmess+=c]])
    vim.cmd([[set undofile]])

    -- options
    vim.opt.clipboard = "unnamed,unnamedplus"

    vim.opt.ignorecase = true
    vim.opt.mouse = "a"
    vim.opt.showmode = false
    vim.opt.smartcase = true
    vim.opt.splitbelow = true
    vim.opt.splitright = true
    vim.opt.termguicolors = true

    vim.opt.wrap = false

    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    vim.opt.colorcolumn = "80"
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.signcolumn = "yes:2"
end

return M
