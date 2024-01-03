local function setup_treesitter()
    require("nvim-treesitter.install").prefer_git = true

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash",
            "c",
            "c_sharp",
            "css",
            "dockerfile",
            "go",
            "graphql",
            "html",
            "htmldjango",
            "hypr",
            "javascript",
            "json",
            "json5",
            "jsonc",
            "latex",
            "lua",
            "markdown",
            "nix",
            "nu",
            "python",
            "regex",
            "rust",
            "scss",
            "toml",
            "typescript",
            "yaml",
            "zig",
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = require("mappings").editor_motion_textsubjects,
            is_supported = function()
                local mode = vim.api.nvim_get_mode().mode
                if mode == "c" then
                    return false
                end
                return true
            end,
        },
        sync_install = false,

        -- third party
        rainbow = {
            enable = true,
        },
    })
end

local function setup_cmp()
    local ELLIPSIS_CHAR = "…"
    local LABEL_WIDTH = 35

    local cmp = require("cmp")
    local handle = require("language.completion")
    local lspkind = require("lspkind")

    vim.opt.pumheight = 12

    cmp.setup({
        completion = {
            completeopt = "menu,menuone,noinsert",
        },
        formatting = {
            format = lspkind.cmp_format({
                maxwidth = LABEL_WIDTH,
                mode = "symbol_text",
                symbol_map = { Copilot = "" },
                before = function(_, vim_item)
                    local ellipsis_char_len = string.len(ELLIPSIS_CHAR)

                    local label = vim_item.abbr
                    if string.len(label) <= LABEL_WIDTH then
                        local truncated_label = vim.fn.strcharpart(label, 0, LABEL_WIDTH - ellipsis_char_len)
                        vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
                    end

                    local padding = string.rep(" ", LABEL_WIDTH - string.len(label))
                    vim_item.abbr = label .. padding

                    return vim_item
                end,
            }),
        },
        mapping = require("mappings").editor_completion(cmp, handle),
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        sources = {
            { name = "copilot",  group_index = 2 },
            { name = "luasnip",  group_index = 2 },
            { name = "nvim_lsp", group_index = 2 },
            { name = "nvim_lua", group_index = 2 },
            { name = "path",     group_index = 2 },
            { name = "buffer",   group_index = 2 },
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    })
end

local function setup_luasnip()
    local luasnip = require("luasnip")

    luasnip.config.set_config({
        history = true,
    })

    require("luasnip/loaders/from_vscode").load()
end

return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            setup_treesitter()
        end,
        dependencies = {
            { "p00f/nvim-ts-rainbow" },

            -- NOTE: additional parser
            {
                "luckasRanarison/tree-sitter-hypr",
                config = function()
                    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
                    parser_config.hypr = {
                        install_info = {
                            url = "https://github.com/luckasRanarison/tree-sitter-hypr",
                            files = { "src/parser.c" },
                            branch = "master",
                        },
                        filetype = "hypr",
                    }
                end,
            },
            -- FIX: change to nushell url after merge of https://github.com/nushell/tree-sitter-nu/pull/57
            { "aserowy/tree-sitter-nu" },
        },
        build = ":TSUpdate",
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            setup_cmp()
        end,
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
        },
    },
    "saadparwaiz1/cmp_luasnip",
    {
        "L3MON4D3/LuaSnip",
        config = function()
            setup_luasnip()
        end,
    },
    "rafamadriz/friendly-snippets",
    "onsails/lspkind-nvim",
}
