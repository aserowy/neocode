local function setup()
    vim.cmd [[packadd material.nvim]]

    local theme = require'settings'.theme()

    vim.g.material_style = theme.style
    vim.g.material_disable_background = theme.transparent

    require'material'.set()
end

return {
    setup = setup
}
