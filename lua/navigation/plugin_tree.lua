local keymaps = require("nvim.keymaps")

local function on_attach(bufnr)
    require("nvim-tree.api").config.mappings.default_on_attach(bufnr)

    vim.keymap.del("n", "<2-RightMouse>", { buffer = bufnr })
    vim.keymap.del("n", "D", { buffer = bufnr })
    vim.keymap.del("n", "[e", { buffer = bufnr })
    vim.keymap.del("n", "]e", { buffer = bufnr })
    vim.keymap.del("n", "[c", { buffer = bufnr })
    vim.keymap.del("n", "]c", { buffer = bufnr })
    vim.keymap.del("n", "g?", { buffer = bufnr })
    vim.keymap.del("n", "<BS>", { buffer = bufnr })
    vim.keymap.del("n", "<C-e>", { buffer = bufnr })
    vim.keymap.del("n", "f", { buffer = bufnr })
    vim.keymap.del("n", "F", { buffer = bufnr })
    vim.keymap.del("n", "m", { buffer = bufnr })
    vim.keymap.del("n", "p", { buffer = bufnr })
    vim.keymap.del("n", "y", { buffer = bufnr })

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
