local function setup()
    require("toggleterm").setup({
        open_mapping = require("mappings").functions_terminal,
    })
end

return {
    setup = setup,
}
