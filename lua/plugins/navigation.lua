local function setup_telescope()
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
            },
            layout_strategy = "flex",
            mappings = mapping.telescope(),
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
            vimgrep_arguments = grep_args,
        },
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
            },
            undo = {
                mappings = mapping.undo(),
            },
        },
    })

    require("telescope").load_extension("dap")
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("undo")
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
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            keywords = {
                WAITING = { icon = "󰥔 ", color = "warning" },
            },
            highlight = {
                comments_only = false,
                pattern = [[.*<(KEYWORDS)\s*]],
            },
            search = {
                pattern = [[(- \[(KEYWORDS)\])|(\b(KEYWORDS):)]],
            },
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
            "debugloop/telescope-undo.nvim",
        },
    },
}
