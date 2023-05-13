local M = {
    lualine_theme = "palenight",
}

M.setup = function()
    vim.g.hardhacker_darker = 1
end

M.activate = function()
    local config = require("theming.configuration").get({
        style = "dark",
    })

    if config.style == "dark" then
        vim.g.hardhacker_darker = 1
    end

    vim.cmd.colorscheme("hardhacker")
end

return M
