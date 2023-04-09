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

    require("lazy").setup("plugins")

    neovim.configure_lsp()
else
    local vscode = require("vscode")
    vscode.configure()

    require("lazy").setup(vscode.packages(), {
        root = vim.fn.stdpath("data") .. "/lazy-vscode",
        lockfile = vim.fn.stdpath("config") .. "/lazy-vscode-lock.json",
    })
end
