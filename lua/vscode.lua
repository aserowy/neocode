local function set_plugins()
    local use = vim.fn["plug#"]

    vim.call("plug#begin")

    use("asvetliakov/vim-easymotion")
    use("b3nj5m1n/kommentary")
    use("unblevable/quick-scope")

    vim.call("plug#end")

    require("kommentary.config")
end

local function set_settings()
    vim.g.mapleader = "["

    local options = require("nvim.options")
    local option = options.scope.option

    options.set(option, "clipboard", "unnamedplus")
    options.set(option, "ignorecase", true)
    options.set(option, "smartcase", true)
    options.set(option, "termguicolors", true)
end

local function set_theme()
    vim.cmd([[hi QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]])
    vim.cmd([[hi QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]])
end

local function set_mappings()
    local keymaps = require("nvim.keymaps")

    keymaps.register("n", {
        ["<C-b><C-s>"] = [[<cmd>call VSCodeNotify('workbench.action.files.save')<cr>]],
        ["ga"] = [[<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>]],
        ["gi"] = [[<cmd>call VSCodeNotify('editor.action.goToImplementation')<cr>]],
        ["gn"] = [[<cmd>call VSCodeNotify('editor.action.marker.next')<cr>]],
        ["gp"] = [[<cmd>call VSCodeNotify('editor.action.marker.prev')<cr>]],
        ["gr"] = [[<cmd>call VSCodeNotify('editor.action.rename')<cr>]],
        ["gx"] = [[<cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<cr>]],
    })

    vim.cmd([[nmap <Leader>k <Plug>(easymotion-bd-f)]])
    vim.cmd([[nmap <Leader>l <Plug>(easymotion-bd-jk)]])
    vim.cmd([[nmap <Leader>w <Plug>(easymotion-bd-w)]])
end

local function setup()
    set_plugins()
    set_settings()
    set_theme()
    set_mappings()
end

return {
    setup = setup,
}
