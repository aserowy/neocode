local M = {}
M.setup = function()
    local config = require("theming.configuration").get({
        style = "darker",
        transparent = false,
    })

    vim.g.material_style = config.style

    require("material").setup({
        borders = true,
        italics = {
            comments = true,
        },

        contrast_windows = {
            "aerial",
            "nvimtree",
            "terminal",
            "packer",
            "qf",
        },

        disable = {
            background = config.transparent,
            eob_lines = false,
        },
    })

    vim.cmd([[colorscheme material]])
end

return M
