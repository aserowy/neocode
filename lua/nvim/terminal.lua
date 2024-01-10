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
                [require("nvim.yazi").valid_for_pattern] = require("nvim.yazi").close,
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

    local usercmd = vim.api.nvim_create_user_command

    usercmd("Vterm", "vsplit | term", { nargs = 0 })
    usercmd("Xterm", "split | term", { nargs = 0 })
end

function M.open_file_manager_tui(split)
    local file_manager = {
        [1] = require("nvim.yazi"),
        [2] = require("nvim.lf"),
    }

    for _, manager in ipairs(file_manager) do
        if manager.is_executable then
            manager.open(split)
            break
        end
    end
end

return M
