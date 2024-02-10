local function setup_telescope()
    local actions = require("telescope.actions")
    local config = require("telescope.config")
    local mapping = require("mappings")

    local grep_args = { unpack(config.values.vimgrep_arguments) }
    table.insert(grep_args, "--hidden")
    table.insert(grep_args, "--glob")
    table.insert(grep_args, "!**/.git/*")

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
            layout_strategy = "flex",
            mappings = {
                i = mapping.search(actions),
                n = mapping.search(actions),
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
            vimgrep_arguments = grep_args,
        },
    })

    require("telescope").load_extension("dap")
    require("telescope").load_extension("ui-select")
end

return {
    {
        "folke/trouble.nvim",
        opts = {
            action_keys = require("mappings").diagnostics,
        },
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
}
