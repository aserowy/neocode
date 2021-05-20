---@diagnostic disable: undefined-global

local function setup()
    vim.cmd [[packadd moonlight.nvim]]

    local config = require'theming.configuration'.get({
        transparent = false,
    })

    vim.g.moonlight_disable_background = config.transparent

    require'moonlight'.set()
end

return {
    setup = setup
}
