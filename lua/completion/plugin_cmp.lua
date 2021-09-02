local cmp = require("cmp")
local handle = require("completion.handle")

local M = {}
function M.setup()
    cmp.setup({
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
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
