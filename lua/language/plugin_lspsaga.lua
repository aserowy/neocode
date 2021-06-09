if not require'checker'.packadd_if_exists('lspsaga.nvim') then
    return
end

local function setup()
    require('lspsaga').init_lsp_saga({
        code_action_icon = '',
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
