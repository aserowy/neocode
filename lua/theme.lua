local vim = vim

local colors = require'colors'

vim.cmd('hi EndOfBuffer guifg='..colors.bg)
vim.cmd('hi LineNr guibg='..colors.bg)
vim.cmd('hi SignColumn guibg='..colors.bg)
vim.cmd('hi VertSplit guibg='..colors.bg)

-- gitsigns
vim.cmd('hi DiffAdd guibg='..colors.bg)
vim.cmd('hi DiffChange guibg='..colors.bg)
vim.cmd('hi DiffModified guibg='..colors.bg)

-- popup
vim.cmd('hi Pmenu guibg='..colors.bg_accent)
vim.cmd('hi PmenuSel guibg='..colors.highlight01)
