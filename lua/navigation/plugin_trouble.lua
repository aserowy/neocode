local mappings = require("mappings")

vim.cmd([[autocmd WinEnter * if winnr('$') == 1 && &ft == 'LspTrouble' | q | endif]])

require("trouble").setup({
    action_keys = mappings.diagnostics,
})
