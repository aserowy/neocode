local function setup()
    vim.cmd [[packadd nvim-solarized-lua]]

    local config = require'theming.configuration'.get({
        style = 'high',
        flavour = 'dark',
    })

    vim.o.background = config.flavour

    vim.cmd('colorscheme solarized-'..config.style)
end

return {
    setup = setup
}
