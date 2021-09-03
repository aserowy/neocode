local luasnip = require("luasnip")

local function rtc(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function check_back_space()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local M = {}
--[[ function M.confirm()
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"](require("nvim-autopairs").esc("<cr>"))
        elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
            return rtc("<plug>(vsnip-jump-next)")
        else
            return require("nvim-autopairs").autopairs_cr()
        end
    else
        return require("nvim-autopairs").autopairs_cr()
    end
end ]]

function M.jump_next(fallback)
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(rtc("<C-n>"), "n")
    elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(rtc("<Plug>luasnip-expand-or-jump"), "")
    elseif check_back_space() then
        vim.fn.feedkeys(rtc("<Tab>"), "n")
    else
        fallback()
    end
end

function M.jump_previous(fallback)
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(rtc("<C-p>"), "n")
    elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(rtc("<Plug>luasnip-jump-prev"), "")
    else
        fallback()
    end
end

return M
