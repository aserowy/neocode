local vim = vim

vim.fn.sign_define('LspDiagnosticsSignError', {
    text = '',
    texthl = 'LspDiagnosticsSignError'
})

vim.fn.sign_define('LspDiagnosticsSignWarning', {
    text = '',
    texthl = 'LspDiagnosticsSignWarning'
})

vim.fn.sign_define('LspDiagnosticsSignInformation', {
    text = '',
    texthl = 'LspDiagnosticsSignInformation'
})

vim.fn.sign_define('LspDiagnosticsSignHint', {
    text = '',
    texthl = 'LspDiagnosticsSignHint'
})
