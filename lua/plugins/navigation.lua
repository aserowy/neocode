local function setup_nvimtree()
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
end

local function setup_trouble()
    local mappings = require("mappings")

    vim.cmd([[autocmd WinEnter * if winnr('$') == 1 && &ft == 'Trouble' | q | endif]])

    require("trouble").setup({
        action_keys = mappings.diagnostics,
    })
end

local function setup_telescope()
    local actions = require("telescope.actions")
    local mapping = require("mappings")
    require("telescope").setup({
        defaults = {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
            mappings = {
                i = mapping.search(actions),
                n = mapping.search(actions),
            },
            layout_strategy = "flex",
        },
    })

    require("telescope").load_extension("dap")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            setup_nvimtree()
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "folke/trouble.nvim",
        config = function()
            setup_trouble()
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            setup_telescope()
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-dap.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
