local keymaps = require("nvim.keymaps")
local mappings = {}

mappings.avante = {
    suggestion = {
        accept = "<C-l>",
        next = "<C-j>",
        prev = "<C-k>",
    },
}

local function avante_templates()
    local template_add_docstring = "Add docstring to the following codes"
    local template_add_tests = "Implement tests for the following code"
    local template_code_readability_analysis = "You must identify any readability issues in the code snippet. "
        .. "Some readability issues to consider: "
        .. "- Unclear naming "
        .. "- Unclear purpose "
        .. "- Redundant or obvious comments "
        .. "- Lack of comments "
        .. "- Long or complex one liners "
        .. "- Too much nesting "
        .. "- Long variable names "
        .. "- Inconsistent naming and code style  "
        .. "- Code repetition "
        .. "You may identify additional problems. The user submits a small section of code from a larger file. "
        .. "Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>. "
        .. "If there's no issues with code respond with only: <OK>"
    local template_complete_code = "Complete the following codes written in " .. vim.bo.filetype
    local template_explain_code = "Explain the following code"
    local template_fix_bugs = "Fix the bugs inside the following codes if any"
    local template_optimize_code = "Optimize the following code"
    local template_summarize = "Summarize the following text"

    local function resolve_cmd(template)
        return string.format("<cmd>lua require'avante.api'.ask({ question = \"%s\"})<cr>", template)
    end

    keymaps.register({ "n", "v" }, {
        ["<leader>ac"] = resolve_cmd(template_complete_code),
        ["<leader>ad"] = resolve_cmd(template_add_docstring),
        ["<leader>ae"] = resolve_cmd(template_explain_code),
        ["<leader>af"] = resolve_cmd(template_fix_bugs),
        ["<leader>ao"] = resolve_cmd(template_optimize_code),
        ["<leader>ar"] = resolve_cmd(template_code_readability_analysis),
        ["<leader>as"] = resolve_cmd(template_summarize),
        ["<leader>at"] = resolve_cmd(template_add_tests),
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
    ["gh"] = [[<cmd>lua require'telescope.builtin'.lsp_references()<cr>]],
    ["gi"] = [[<cmd>lua require'telescope.builtin'.lsp_implementations()<cr>]],
    ["gr"] = [[<cmd>lua vim.lsp.buf.rename()<cr>]],
    ["gx"] = [[<cmd>lua vim.lsp.buf.code_action()<cr>]],
    ["gn"] = [[<cmd>lua vim.diagnostic.goto_next()<cr>]],
    ["gp"] = [[<cmd>lua vim.diagnostic.goto_prev()<cr>]],
    ["K"] = [[<cmd>lua vim.lsp.buf.hover()<cr>]],
}

local function editor_motion()
    keymaps.register("n", {
        ["<leader>w"] = [[<cmd>lua require("flash").treesitter()<cr>]],
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

local function navigations()
    keymaps.register({ "n", "t" }, {
        ["<C-f><C-a>"] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>]],
        ["<C-f><C-b>"] = [[<cmd>lua require'telescope.builtin'.buffers()<cr>]],
        ["<C-f><C-d>"] = [[<cmd>lua require'telescope.builtin'.diagnostics()<cr>]],
        ["<C-f><C-f>"] = [[<cmd>lua require'nvim.search'.git_or_local()<cr>]],
        ["<C-f><C-h>"] = [[<cmd>lua require'telescope.builtin'.oldfiles()<cr>]],
        ["<C-f><C-q>"] = [[<cmd>lua require'telescope.builtin'.quickfixhistory()<cr>]],
        ["<C-f><C-p>"] = [[<cmd>Telescope persisted<cr>]],
        ["<C-f><C-s>"] = [[<cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>]],
        ["<C-f>t"] = [[<cmd>lua require'theming.theme_picker'.open_picker()<cr>]],
        ["<C-f><C-u>"] = [[<cmd>Telescope undo<cr>]],
        ["<C-f><C-w>"] = [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]],
        ["<C-e><C-e>"] = [[<cmd>lua require'nvim.terminal'.open_file_manager_tui('')<cr>]],
        ["<C-e><C-t>"] = [[<cmd>lua require'nvim.terminal'.open_file_manager_tui('tabnew')<cr>]],
        ["<C-e><C-v>"] = [[<cmd>lua require'nvim.terminal'.open_file_manager_tui('vsplit')<cr>]],
        ["<C-e><C-x>"] = [[<cmd>lua require'nvim.terminal'.open_file_manager_tui('split')<cr>]],
    })

    keymaps.register("n", {
        ["<leader>t"] = [[<cmd>TodoTrouble toggle<cr>]],
        ["<leader>lw"] = [[<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.WARN<cr>]],
        ["<leader>le"] = [[<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>]],
        ["<leader>la"] = [[<cmd>Trouble diagnostics toggle<cr>]],
    })
end

local function tabs()
    keymaps.register("n", {
        ["<C-n>"] = [[<cmd>tabnext<cr>]],
        ["<C-p>"] = [[<cmd>tabprevious<cr>]],
    })
end

mappings.telescope = function()
    local actions = require("telescope.actions")
    return {
        i = {
            ["<C-c>"] = actions.delete_buffer,
        },
        n = {
            ["<C-c>"] = actions.delete_buffer,
        },
    }
end

mappings.undo = function()
    local actions = require("telescope-undo.actions")
    return {
        i = {
            ["<cr>"] = actions.yank_additions,
            ["<C-cr>"] = actions.yank_deletions,
            ["<S-cr>"] = actions.restore,
        },
        n = {
            ["<cr>"] = actions.yank_additions,
            ["<C-cr>"] = actions.yank_deletions,
            ["<S-cr>"] = actions.restore,
        },
    }
end

local function windows()
    keymaps.register({ "n", "t" }, {
        ["<C-h>"] = [[<C-\><C-n><C-w><C-h>]],
        ["<C-j>"] = [[<C-\><C-n><C-w><C-j>]],
        ["<C-k>"] = [[<C-\><C-n><C-w><C-k>]],
        ["<C-l>"] = [[<C-\><C-n><C-w><C-l>]],
        ["<C-i>"] = [[<C-\><C-n><C-i>]],
        ["<C-o>"] = [[<C-\><C-n><C-o>]],
    })
    keymaps.register("n", {
        ["<C-h>"] = [[<C-w><C-h>]],
        ["<C-j>"] = [[<C-w><C-j>]],
        ["<C-k>"] = [[<C-w><C-k>]],
        ["<C-l>"] = [[<C-w><C-l>]],
        ["<C-w>x"] = [[<C-w>s]],
        ["<leader>n"] = [[<cmd>cn<cr>]],
        ["<leader>p"] = [[<cmd>cp<cr>]],
    })
end

mappings.setup = function()
    avante_templates()
    buffer()
    editor_dap()
    editor_motion()
    editor_visual()
    navigations()
    tabs()
    windows()
end

return mappings
