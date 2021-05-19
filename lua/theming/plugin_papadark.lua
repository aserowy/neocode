---@diagnostic disable: undefined-global

local function setup()
    vim.cmd [[packadd lush.nvim]]
    vim.cmd [[packadd nvim-papadark]]

    vim.cmd [[colorscheme papadark]]
end

return {
    setup = setup
}
