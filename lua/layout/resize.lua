local vim = vim

local function winnr(direction)
    return vim.api.nvim_call_function('winnr', {direction})
end

local function wincmd(direction)
    return vim.api.nvim_command('wincmd '..direction)
end

local M = {}
M.resize = function(direction)
    local current = winnr()
    if direction == 'h' then
        if current == winnr('1l') then
            wincmd('>')
        else
            wincmd('<')
        end
    end
    if direction == 'j' then
        if current == winnr('1j') and current ~= winnr('1k') then
            wincmd('-')
        else
            wincmd('+')
        end
    end
    if direction == 'k' then
        if current == winnr('1j') then
            wincmd('+')
        else
            wincmd('-')
        end
    end
    if direction == 'l' then
        if current == winnr('1l') then
            wincmd('<')
        else
            wincmd('>')
        end
    end
end

return M
