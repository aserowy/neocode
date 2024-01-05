local M = {}

function M.setup()
    vim.g.netrw_banner = 0
    vim.g.netrw_winsize = 25

    local autocmd = vim.api.nvim_create_autocmd

    autocmd("BufEnter", {
        pattern = "term://*",
        command = "startinsert",
    })

    autocmd("TermOpen", {
        pattern = "*",
        command = "startinsert | setlocal nonumber norelativenumber",
    })

    autocmd("TermClose", {
        callback = function()
            local title = vim.api.nvim_buf_get_name(0)

            local case = {
                [require("nvim.lf").valid_for_pattern] = require("nvim.lf").close,
            }

            local result = 1
            for pattern, close_handle in pairs(case) do
                if title:match(pattern) then
                    result = close_handle()

                    break
                end
            end

            if result > 0 then
                vim.cmd("b# | bd#")
            end
        end,
    })
end

return M
