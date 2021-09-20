local M = {}
function M.setup()
    require("nvim-autopairs").setup()
    
    require("nvim-autopairs.completion.cmp").setup({
        map_cr = true,
        map_complete = true,
        auto_select = true,
        insert = false,
    })
end

return M
