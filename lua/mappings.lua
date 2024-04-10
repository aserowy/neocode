local keymaps = require("nvim.keymaps")
local mappings = {}

local function tabs()
    keymaps.register("n", {
        ["<C-n>"] = [[<cmd>tabnext<cr>]],
        ["<C-p>"] = [[<cmd>tabprevious<cr>]],
    })
end

local function windows()
    -- INFO: standard window switching is registered with tmux.nvim
    keymaps.register("t", {
        ["<C-h>"] = [[<cmd>lua require'tmux'.move_left()<cr>]],
        ["<C-j>"] = [[<cmd>lua require'tmux'.move_bottom()<cr>]],
        ["<C-k>"] = [[<cmd>lua require'tmux'.move_top()<cr>]],
        ["<C-l>"] = [[<cmd>lua require'tmux'.move_right()<cr>]],
        ["<C-i>"] = [[<C-\><C-n><C-i>]],
        ["<C-o>"] = [[<C-\><C-n><C-o>]],
    })
    keymaps.register("n", {
        ["<C-w>x"] = [[<C-w>s]],
    })
end

local function navigations()
    -- TODO: extend with telescope git pickers? C-?...
    keymaps.register({ "n", "t" }, {
        ["<C-a>"] = [[<cmd>TodoTrouble<cr>]],
        ["<C-f><C-b>"] = [[<cmd>lua require'telescope.builtin'.buffers()<cr>]],
        ["<C-f><C-d>"] = [[<cmd>lua require'telescope.builtin'.diagnostics()<cr>]],
        ["<C-f><C-f>"] = [[<cmd>lua require'nvim.search'.git_or_local()<cr>]],
        ["<C-f><C-w>"] = [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]],
        ["<C-f><C-h>"] = [[<cmd>lua require'telescope.builtin'.oldfiles()<cr>]],
        ["<C-f><C-q>"] = [[<cmd>lua require'telescope.builtin'.quickfixhistory()<cr>]],
        ["<C-f><C-p>"] = [[<cmd>Telescope persisted<cr>]],
        ["<C-f><C-s>"] = [[<cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>]],
        ["<C-f><C-a>"] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>]],
        ["<C-f><C-t>"] = [[<cmd>lua require'theming.theme_picker'.open_picker()<cr>]],
        ["<C-e><C-e>"] = [[<cmd>lua require'nvim.terminal'.open_file_manager_tui('')<cr>]],
        ["<C-e><C-t>"] = [[<cmd>lua require'nvim.terminal'.open_file_manager_tui('tabnew')<cr>]],
        ["<C-e><C-v>"] = [[<cmd>lua require'nvim.terminal'.open_file_manager_tui('vsplit')<cr>]],
        ["<C-e><C-x>"] = [[<cmd>lua require'nvim.terminal'.open_file_manager_tui('split')<cr>]],
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

-- copilot
local function copilot_chat()
    keymaps.register("n", {
        ["<C-c><C-e>"] = [[<cmd>CopilotChatExplain<cr>]],
        ["<C-c><C-t>"] = [[<cmd>CopilotChatTests<cr>]],
    })
end

-- editor
mappings.editor_on_text = {
    ["ga"] = [[<cmd>lua vim.lsp.buf.format()<cr>]],
    ["gd"] = [[<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>]],
    ["gf"] = [[<cmd>lua vim.lsp.buf.declaration()<cr>]],
    ["gH"] = [[<cmd>lua require'telescope.builtin'.lsp_references()<cr>]],
    ["gi"] = [[<cmd>lua require'telescope.builtin'.lsp_implementations()<cr>]],
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
    }
end

mappings.setup = function()
    tabs()
    windows()
    navigations()
    buffer()
    copilot_chat()
    editor_dap()
    editor_motion()
    editor_visual()
end

return mappings
