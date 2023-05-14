local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

if not vim.g.vscode then
    local neovim = require("neovim")
    neovim.setup()

    local options = {}
    if vim.loop.os_uname().version:match("Windows") then
        options.concurrency = 1
    end

    require("lazy").setup("plugins", options)

    neovim.activate_theme()
    neovim.configure_mappings()
    neovim.configure_lsp()
else
    local vscode = require("vscode")
    vscode.configure()

    local options = {
        root = vim.fn.stdpath("data") .. "/lazy-vscode",
        lockfile = vim.fn.stdpath("config") .. "/lazy-vscode-lock.json",
    }
    if vim.loop.os_uname().version:match("Windows") then
        options.concurrency = 1
    end

    require("lazy").setup(vscode.packages(), options)
end
