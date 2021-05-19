---@diagnostic disable: undefined-global

local function setup()
    vim.cmd [[packadd omni.vim]]

    vim.cmd [[colorscheme omni]]
end

return {
    setup = setup
}
