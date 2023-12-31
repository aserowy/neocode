local M = {}

function M.setup()
    vim.g.netrw_banner = 0
    vim.g.netrw_winsize = 25

    local autocmd = vim.api.nvim_create_autocmd

    autocmd({ "BufWinEnter", "WinEnter" }, {
        pattern = "term://*",
        command = "startinsert",
    })

    autocmd("TermClose", {
        callback = function()
            local title = vim.fn.expand("%")

            local case = {
                [require("nvim.lf").is_handle_valid_pattern] = require("nvim.lf").handle_termclose,
            }

            local is_executed = false
            for key, value in pairs(case) do
                if title:match(key) then
                    value()
                    is_executed = true
                end
            end

            if not is_executed then
                vim.cmd("bd")
            end
        end,
    })

    autocmd("TermOpen", {
        pattern = "*",
        command = "startinsert | setlocal nonumber norelativenumber",
    })
end

return M
