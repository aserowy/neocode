local cmp = require("cmp")
local handle = require("language.completion")

local M = {}
function M.setup()
    cmp.setup({
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = require("lspkind").presets.default[vim_item.kind]

                vim_item.menu = ({
                    luasnip = "[snip]",
                    buffer = "[buffer]",
                    nvim_lsp = "[lsp]",
                    nvim_lua = "[lua]",
                    path = "[path]",
                })[entry.source.name]

                return vim_item
            end,
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
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
            { name = "buffer" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
        },
    })
end

return M
