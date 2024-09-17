local function setup_treesitter()
    require("nvim-treesitter.install").prefer_git = true

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "angular",
            "bash",
            "bicep",
            "c",
            "c_sharp",
            "css",
            "csv",
            "dockerfile",
            "go",
            "graphql",
            "html",
            "htmldjango",
            "hyprlang",
            "javascript",
            "json",
            "json5",
            "jsonc",
            "lua",
            "markdown",
            "nix",
            "nu",
            "python",
            "regex",
            "rust",
            "scss",
            "terraform",
            "toml",
            "typescript",
            "yaml",
            "yuck",
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
    local cmparer = require("cmp.config.compare")
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
        sorting = {
            priority_weight = 1.0,
            comparators = {
                cmparer.locality,
                cmparer.recently_used,
                cmparer.score,
                cmparer.offset,
                cmparer.order,
            },
        },
        sources = {
            { name = "luasnip", max_item_count = 3 },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path",    max_item_count = 3 },
            { name = "buffer",  max_item_count = 5 },
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
        "nvim-treesitter/nvim-treesitter",
        config = function()
            setup_treesitter()
        end,
        dependencies = {
            { "p00f/nvim-ts-rainbow" },

            -- NOTE: additional parser
            { "nushell/tree-sitter-nu" },
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
