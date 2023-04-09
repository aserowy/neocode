local keymaps = require("nvim.keymaps")

local mappings = {}

local function tabs()
    keymaps.register("n", {
        ["<C-t><C-q>"] = [[<cmd>tabclose<cr>]],
        ["<C-t><C-n>"] = [[<cmd>tabnext<cr>]],
        ["<C-t><C-p>"] = [[<cmd>tabprevious<cr>]],
    })
end

local function windows()
    keymaps.register("n", {
        ["<C-w>x"] = [[<C-w>s]],
    })
end

local function functions()
    keymaps.register("n", {
        ["<C-a>"] = [[<cmd>TodoTrouble<cr>]],
        ["<C-e>"] = [[<cmd>NvimTreeFocus<cr>]],
        ["<C-f><C-b>"] = [[<cmd>lua require'telescope.builtin'.buffers()<cr>]],
        ["<C-f><C-d>"] = [[Telescope diagnostics]],
        ["<C-f><C-f>"] = [[<cmd>lua require'navigation.search'.git_or_local()<cr>]],
        ["<C-f><C-g>"] = [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]],
        ["<C-f><C-h>"] = [[<cmd>lua require'telescope.builtin'.oldfiles()<cr>]],
        ["<C-f><C-l>"] = [[<cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>]],
        ["<C-f><C-s>"] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>]],
        ["<C-q>"] = [[<cmd>Trouble quickfix<cr>]],
        ["<C-x>"] = [[<cmd>Trouble workspace_diagnostics<cr>]],
    })
end

local function buffer()
    keymaps.register("n", {
        -- ["<C-c>"] = [[<cmd>bp<bar>sp<bar>bn<bar>bd<cr>]],
        ["<C-n>"] = [[<cmd>bnext<cr>]],
        ["<C-p>"] = [[<cmd>bprevious<cr>]],

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
        ["<leader>k"] = [[<cmd>HopChar1<cr>]],
        ["<leader>l"] = [[<cmd>HopLine<cr>]],
        ["<leader>w"] = [[<cmd>HopWord<cr>]],
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
    node_incremental = "<TAB>",
    node_decremental = "<S-TAB>",
}

local api = require("nvim-tree.api")
mappings.explorer = {
    ["a"] = api.fs.create,
    ["d"] = api.fs.remove,
    ["gn"] = api.node.navigate.diagnostics.next,
    ["gp"] = api.node.navigate.diagnostics.previous,
    ["m"] = api.fs.cut,
    ["p"] = api.fs.paste,
    ["R"] = api.tree.reload,
    ["y"] = api.fs.copy.node,
    ["<C-c>"] = api.tree.close,
    ["<C-v>"] = api.node.open.vertical,
    ["<C-x>"] = api.node.open.horizontal,
    ["<CR>"] = api.node.open.edit,
    ["<Tab>"] = api.node.open.preview,
}

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

mappings.search = function(actions)
    return {
        ["<C-q>"] = actions.send_to_qflist,
    }
end

mappings.setup = function()
    tabs()
    windows()
    functions()
    buffer()
    editor_motion()
    editor_visual()
end

return mappings
