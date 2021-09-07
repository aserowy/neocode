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
            },
            mappings = {
                i = mapping.search(actions),
                n = mapping.search(actions),
            },
            layout_strategy = "flex",
        },
    })

    require("telescope").load_extension("fzf")
end

return M
