local M = {}
M.setup = function()
    require("aerial").setup({
        default_direction = "left",
        max_width = 30,
        min_width = 30,
        placement_editor_edge = true,
    })
end

return M
