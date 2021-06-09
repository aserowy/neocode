if not require'checker'.packadd_if_exists('neoscroll.nvim') then
    return
end

require('neoscroll').setup({
    mappings = {'<C-u>', '<C-d>', 'zt', 'zz', 'zb'},
})
