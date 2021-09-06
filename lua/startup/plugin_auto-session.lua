local M = {}
M.setup = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"

    local function pre_save()
        if package.loaded["aerial"] then
            vim.cmd("AerialClose")
        end
        if package.loaded["nvim-tree"] then
            require("nvim-tree").close()
        end
        if package.loaded["trouble"] then
            require("trouble").close()
        end
    end

    require("auto-session").setup({
        auto_save_enabled = true,
        pre_save_cmds = { pre_save },
    })
end

return M
