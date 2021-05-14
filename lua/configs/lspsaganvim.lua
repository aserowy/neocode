local function setup()
    require('lspsaga').init_lsp_saga({
        use_saga_diagnostic_sign = false,
        code_action_icon = '',
        code_action_prompt = {
            virtual_text = false,
        },
    })
end

return {
    setup = setup,
}
