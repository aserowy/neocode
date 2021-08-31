local actions = require("telescope.actions")
local mapping = require("mappings")

require("telescope").setup({
    defaults = {
        mappings = {
            i = mapping.search(actions),
            n = mapping.search(actions),
        },
        layout_strategy = "flex",
    },
})
