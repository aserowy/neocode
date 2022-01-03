local mappings = require("mappings")

vim.cmd([[autocmd WinEnter * if winnr('$') == 1 && &ft == 'Trouble' | q | endif]])

require("trouble").setup({
    action_keys = mappings.diagnostics,
})
