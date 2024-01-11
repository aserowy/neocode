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

require("settings").setup()

local options = {
    ui = { border = "rounded" },
}

if require("nvim.os").is_windows then
    options.concurrency = 1
end

require("lazy").setup("plugins", options)

require("settings").activate_theme()

require("nvim.terminal").setup()
require("nvim.hlsearch").setup()

require("mappings").setup()
require("language").setup()
