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
            enable = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = require("mappings").editor_motion_textsubjects,
        },
        sync_install = false,

        -- third party
        rainbow = {
            enable = true,
        },
    })
end

local function setup_cmp()
    local cmp = require("cmp")
    local handle = require("language.completion")
    local lspkind = require("lspkind")

    local options = require("nvim.options")
    options.set(options.scope.option, "pumheight", 12)

    cmp.setup({
        completion = {
            completeopt = "menu,menuone,noinsert",
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = "symbol_text",
                menu = {
                    buffer = "[Buffer]",
                    luasnip = "[LuaSnip]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[Lua]",
                },
            }),
        },
        mapping = require("mappings").editor_completion(cmp, handle),
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        sources = {
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "buffer" },
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
        "github/copilot.vim",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()

        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            setup_treesitter()
        end,
        dependencies = {
            "p00f/nvim-ts-rainbow",
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
}
