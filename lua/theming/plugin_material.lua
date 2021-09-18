local M = {}
M.setup = function()
    local config = require("theming.configuration").get({
        style = "darker",
        transparent = false,
    })

    vim.g.material_style = config.style

    require("material").setup({
        borders = true,
        contrast_windows = config.sidebars,
        disable = {
            background = config.transparent,
            eob_lines = false,
        },
        italics = {
            comments = true,
        },
    })

    vim.cmd([[colorscheme material]])
end

return M
