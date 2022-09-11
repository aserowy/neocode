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

        ["<leader>k"] = [[<cmd>HopChar1<cr>]],
        ["<leader>l"] = [[<cmd>HopLine<cr>]],
        ["<leader>w"] = [[<cmd>HopWord<cr>]],
    })
end

function M.register_packages(use)
    use({
        "phaazon/hop.nvim",
        branch = "v2",
        as = "hop",
        config = function()
            require("hop").setup({})
        end,
    })
    use({
        "b3nj5m1n/kommentary",
        config = function()
            require("kommentary.config")
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.install").prefer_git = true

            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c_sharp",
                    "css",
                    "dockerfile",
                    "go",
                    "graphql",
                    "html",
                    "javascript",
                    "json",
                    "json5",
                    "jsonc",
                    "latex",
                    "lua",
                    "markdown",
                    "nix",
                    "python",
                    "regex",
                    "rust",
                    "scss",
                    "toml",
                    "typescript",
                    "yaml",
                },
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
