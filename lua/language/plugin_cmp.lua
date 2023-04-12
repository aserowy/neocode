local cmp = require("cmp")
local handle = require("language.completion")
local lspkind = require("lspkind")

local M = {}
function M.setup()
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
        -- TODO: Refactor mapping into mappings.lua
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = false,
            }),
            ["<Tab>"] = cmp.mapping(handle.jump_next, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(handle.jump_previous, { "i", "s" }),
        },
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

return M
