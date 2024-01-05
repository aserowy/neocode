-- copied from https://github.com/nvimdev/hlsearch.nvim

local api, fn = vim.api, vim.fn
local group = api.nvim_create_augroup("HighlightSearch", { clear = true })

local function stop()
    if vim.v.hlsearch == 0 then
        return
    end

    local keycode = api.nvim_replace_termcodes("<Cmd>nohl<CR>", true, false, true)

    api.nvim_feedkeys(keycode, "n", false)
end

local function start()
    if vim.v.hlsearch ~= 1 then
        return
    end

    local command_regex = fn.getreg("/")
    if command_regex:find([[%#]]) then
        stop()
        return
    end

    local ok, result = pcall(fn.search, [[\%#\zs]] .. command_regex, "cnW")
    if ok and result == 0 then
        stop()
        return
    end
end

local buffers = {}

local function register_autocmds(bufnr)
    if buffers[bufnr] then
        return
    end

    buffers[bufnr] = true

    local cursormoved_id = api.nvim_create_autocmd("CursorMoved", {
        buffer = bufnr,
        group = group,
        callback = function()
            start()
        end,
        desc = "Auto hlsearch",
    })

    local insertenter_id = api.nvim_create_autocmd("InsertEnter", {
        buffer = bufnr,
        group = group,
        callback = function()
            stop()
        end,
        desc = "Auto remove hlsearch",
    })

    api.nvim_create_autocmd("BufDelete", {
        buffer = bufnr,
        group = group,
        callback = function(opt)
            buffers[bufnr] = nil
            pcall(api.nvim_del_autocmd, cursormoved_id)
            pcall(api.nvim_del_autocmd, insertenter_id)
            pcall(api.nvim_del_autocmd, opt.id)
        end,
    })
end

local M = {}

function M.setup()
    api.nvim_create_autocmd("BufWinEnter", {
        group = group,
        callback = function(opt)
            register_autocmds(opt.buf)
        end,
        desc = "hlsearch.nvim event",
    })
end

return M
