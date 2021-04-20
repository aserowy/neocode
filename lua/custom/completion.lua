local vim = vim

local rtc = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

local completion = {}
completion.complete = function(keys)
    if vim.fn.complete_info()['selected'] ~= -1 then
        return vim.fn.call('compe#confirm', {'<CR>'})
    end
    return rtc(keys)
end

completion.completion_or_jump_down = function(keys)
    if vim.fn.pumvisible() == 1 then
        return rtc('<C-n>')
    elseif vim.fn.call('vsnip#available', {1}) == 1 then
        return rtc('<plug>(vsnip-jump-next)')
    elseif check_back_space() then
        return rtc(keys)
    else
        return vim.fn['compe#complete']()
    end
end

completion.completion_or_jump_up = function(keys)
    if vim.fn.pumvisible() == 1 then
        return rtc('<C-p>')
    elseif vim.fn.call('vsnip#jumpable', {-1}) == 1 then
        return rtc('<plug>(vsnip-jump-prev)')
    else
        return rtc(keys)
    end
end

_G.completion = completion
