local function setup()
    require("completion.handles")

    require("compe").setup({
        preselect = "disable",
        documentation = true,

        source = {
            nvim_lsp = true,
            nvim_treesitter = true,
            path = true,
            vsnip = true,
        },
    })
end

return {
    setup = setup,
}
