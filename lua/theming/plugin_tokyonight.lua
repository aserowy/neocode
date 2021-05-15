local vim = vim

local function setup()
    vim.g.tokyonight_style = "storm"
    vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

    vim.cmd[[colorscheme tokyonight]]
end

return {
    setup = setup
}
