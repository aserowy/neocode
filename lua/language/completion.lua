local cmp = require("cmp")
local luasnip = require("luasnip")

local function rtc(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function check_back_space()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local M = {}
function M.jump_next(fallback)
    if cmp and cmp.visible() then
        vim.fn.feedkeys(cmp.select_next_item())
    elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(rtc("<Plug>luasnip-expand-or-jump"), "")
    elseif check_back_space() then
        vim.fn.feedkeys(rtc("<Tab>"), "n")
    else
        fallback()
    end
end

function M.jump_previous(fallback)
    if cmp and cmp.visible() then
        vim.fn.feedkeys(cmp.select_prev_item())
    elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(rtc("<Plug>luasnip-jump-prev"), "")
    else
        fallback()
    end
end

return M
