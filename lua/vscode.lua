local M = {
    path = vim.fn.stdpath("data") .. "/env/vscode",
}

function M.configure()
    -- settings
    vim.g.mapleader = "["

    local options = require("nvim.options")
    local option = options.scope.option

    options.set(option, "clipboard", "unnamedplus")
    options.set(option, "ignorecase", true)
    options.set(option, "smartcase", true)

    vim.cmd([[hi QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]])
    vim.cmd([[hi QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]])

    -- mappings
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

function M.register_packages(use)
    use("asvetliakov/vim-easymotion")
    use({
        "b3nj5m1n/kommentary",
        config = function()
            require("kommentary.config")
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "maintained",
                highlight = {
                    enable = false,
                },
                indent = {
                    enable = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = require("mappings").editor_motion_textsubjects,
                },
            })
        end,
        run = ":TSUpdate",
    })
    use("unblevable/quick-scope")
end

return M
