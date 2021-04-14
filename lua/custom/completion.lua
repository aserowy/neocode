local vim = vim

local try_complete = function(keys)
    if vim.fn.complete_info()['selected'] ~= -1 then
        return vim.fn['compe#confirm']('<CR>')
    end
    return vim.api.nvim_replace_termcodes(keys, true, false, true)
end

local completion = {}
completion.complete_or_jump = function(keys)
    if vim.fn.pumvisible() > 0 then
        return try_complete(keys)
    end
    require'luasnip'.jump(1)
    return true
end

return completion
