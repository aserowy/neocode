-- TODO: Replace with builtins
local function setup()
    require("lspsaga").init_lsp_saga({
        code_action_icon = "",
        code_action_prompt = {
            virtual_text = false,
        },
        error_sign = "",
        hint_sign = "",
        infor_sign = "",
        warn_sign = "",
    })
end

return {
    setup = setup,
}
