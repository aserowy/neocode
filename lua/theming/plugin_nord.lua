local function setup()
    vim.cmd [[packadd nord.nvim]]

    local theme = require'settings'.theme()

    vim.g.nord_disable_background = theme.transparent

    require'nord'.set()
end

return {
    setup = setup
}
