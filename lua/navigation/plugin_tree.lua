local keymaps = require("nvim.keymaps")

local function on_attach(bufnr)
    keymaps.register_with_keymap(
        "n",
        require("mappings").explorer,
        { buffer = bufnr, noremap = true, silent = true, nowait = true }
    )
end

require("nvim-tree").setup({
    on_attach = on_attach,
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
    update_focused_file = {
        enable = true,
    },
})
