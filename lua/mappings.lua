local keymaps = require("nvim.keymaps")

local mappings = {}

local function tabs()
    keymaps.register("n", {
        ["<C-t><C-q>"] = [[<cmd>tabclose<cr>]],
        ["<C-t><C-t>"] = [[<cmd>tabnew<cr>]],
        ["<C-n>"] = [[<cmd>tabnext<cr>]],
        ["<C-p>"] = [[<cmd>tabprevious<cr>]],
    })
end

local function windows()
    keymaps.register("n", {
        ["<C-w>x"] = [[<C-w>s]],
    })
end

local function navigations()
    keymaps.register("n", {
        ["<C-a>"] = [[<cmd>TodoTrouble<cr>]],
        ["<C-f><C-b>"] = [[<cmd>lua require'telescope.builtin'.buffers()<cr>]],
        ["<C-f><C-d>"] = [[<cmd>lua require'telescope.builtin'.diagnostics()<cr>]],
        ["<C-f><C-f>"] = [[<cmd>lua require'navigation.search'.git_or_local()<cr>]],
        ["<C-f><C-g>"] = [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]],
        ["<C-f><C-h>"] = [[<cmd>lua require'telescope.builtin'.oldfiles()<cr>]],
        ["<C-f><C-q>"] = [[<cmd>lua require'telescope.builtin'.quickfixhistory()<cr>]],
        ["<C-f><C-p>"] = [[<cmd>Telescope persisted<cr>]],
        ["<C-f><C-s>"] = [[<cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>]],
        ["<C-f><C-a>"] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>]],
        ["<C-f><C-t>"] = [[<cmd>lua require'theming.theme_picker'.open_picker()<cr>]],
        ["<C-g>"] = [[<cmd>Lexplore %:p:h<cr>]],
        ["<C-q>"] = [[<cmd>Trouble quickfix<cr>]],
        ["<C-x>"] = [[<cmd>Trouble workspace_diagnostics<cr>]],
    })
end

local function buffer()
    keymaps.register("n", {
        ["+"] = [[<C-a>]],
        ["-"] = [[<C-x>]],
    })
    keymaps.register("x", {
        ["+"] = [[g<C-a>]],
        ["-"] = [[g<C-x>]],
    })
end

-- editor
mappings.editor_on_text = {
    ["ga"] = [[<cmd>lua vim.lsp.buf.format()<cr>]],
    ["gd"] = [[<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>]],
    ["gf"] = [[<cmd>lua vim.lsp.buf.declaration()<cr>]],
    ["gH"] = [[<cmd>lua require'telescope.builtin'.lsp_references()<cr>]],
    ["gi"] = [[<cmd>lua vim.lsp.buf.implementation()<cr>]],
    ["gh"] = [[<cmd>lua vim.lsp.buf.signature_help()<cr>]],
    ["gr"] = [[<cmd>lua vim.lsp.buf.rename()<cr>]],
    ["gx"] = [[<cmd>lua vim.lsp.buf.code_action()<cr>]],
    ["gn"] = [[<cmd>lua vim.diagnostic.goto_next()<cr>]],
    ["gp"] = [[<cmd>lua vim.diagnostic.goto_prev()<cr>]],
    ["K"] = [[<cmd>lua vim.lsp.buf.hover()<cr>]],
}

local function editor_motion()
    keymaps.register("n", {
        ["<leader>w"] = [[<cmd>lua require("flash").treesitter()<cr>]],
        ["<leader>t"] = [[<cmd>lua require("flash").treesitter_search()<cr>]],
    })
end

local function editor_visual()
    keymaps.register("v", {
        ["J"] = [[:m'>+1<CR>gv=gv]],
        ["K"] = [[:m-2<CR>gv=gv]],
    })
end

mappings.editor_motion_textsubjects = {
    init_selection = "<CR>",
    scope_incremental = "<CR>",
}

-- diagnostics
mappings.diagnostics = {
    ["close"] = "<C-c>",
    ["cancel"] = "<C-k>",
    ["refresh"] = "r",
    ["jump"] = "<cr>",
    ["hover"] = "K",
    ["toggle_fold"] = "<space>",
    ["previous"] = "<C-p>",
    ["next"] = "<C-n>",
}

local function editor_dap()
    keymaps.register("n", {
        ["<F5>"] = [[<cmd>lua require'dap'.continue()<cr>]],
        ["<F10>"] = [[<cmd>lua require'dap'.step_over()<cr>]],
        ["<F11>"] = [[<cmd>lua require'dap'.step_into()<cr>]],
        ["<F12>"] = [[<cmd>lua require'dap'.step_out()<cr>]],
        ["<leader>b"] = [[<cmd>lua require'dap'.toggle_breakpoint()<cr>]],
        ["<leader>d"] = [[<cmd>lua require'dapui'.toggle()<cr>]],
        ["<leader>c"] = [[<cmd>lua require'telescope'.extensions.dap.configurations{}<cr>]],
    })
end

mappings.editor_completion = function(cmp, handle)
    return {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
        }),
        ["<Tab>"] = cmp.mapping(handle.jump_next, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(handle.jump_previous, { "i", "s" }),
    }
end

mappings.search = function(actions)
    return {
        ["<C-c>"] = actions.delete_buffer,
        ["<C-q>"] = actions.send_to_qflist,
    }
end

mappings.setup = function()
    tabs()
    windows()
    navigations()
    buffer()
    editor_dap()
    editor_motion()
    editor_visual()
end

return mappings
