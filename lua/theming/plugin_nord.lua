local function setup()
    vim.cmd [[packadd nord.nvim]]

    local config = require'theming.configuration'.get({
        transparent = false,
    })

    vim.g.nord_disable_background = config.transparent

    require'nord'.set()
end

return {
    setup = setup
}
