if not require'checker'.packadd_if_exists('nvim-toggleterm.lua') then
    return
end

local function setup()
    require'toggleterm'.setup({
        open_mapping = require'mappings'.functions_terminal
    })
end

return {
    setup = setup,
}
