local function setup()
    vim.cmd [[packadd sonokai]]

    local config = require'theming.configuration'.get({
        style = 'maia',
        transparent = false,
    })

    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_sign_column_background = 'none'
    vim.g.sonokai_style = config.style
    vim.g.sonokai_transparent_background = config.transparent

    vim.cmd [[colorscheme sonokai]]
end

return {
    setup = setup
}
