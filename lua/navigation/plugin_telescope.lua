local actions = require("telescope.actions")
local mapping = require("mappings")

local M = {}
function M.setup()
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

return M
