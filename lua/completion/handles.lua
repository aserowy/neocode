local rtc = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

local function confirm()
    if vim.fn.pumvisible() ~= 0 then
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
end

local function jump_next(keys)
    if vim.fn.pumvisible() ~= 0 then
        return rtc("<C-n>")
    elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
        return rtc("<plug>(vsnip-jump-next)")
    elseif check_back_space() then
        return rtc(keys)
    else
        return vim.fn["compe#complete"]()
    end
end

local function jump_previous(keys)
    if vim.fn.pumvisible() ~= 0 then
        return rtc("<C-p>")
    elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
        return rtc("<plug>(vsnip-jump-prev)")
    else
        return rtc(keys)
    end
end

_G.completion = {
    confirm = confirm,
    jump_next = jump_next,
    jump_previous = jump_previous,
}
