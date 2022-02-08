local function has_aktive_lsp()
    local bufnr = vim.api.nvim_get_current_buf()
    for _, client in pairs(vim.lsp.buf_get_clients(bufnr)) do
        if client.resolved_capabilities.document_symbol then
            return true
        end
    end
    return false
end

local M = {}
function M.close()
    vim.cmd("AerialClose")
    vim.cmd("NvimTreeClose")
end

function M.explorer()
    M.close()
    require("nvim-tree").find_file(true)
end

function M.symbols()
    M.close()

    if has_aktive_lsp() then
        vim.cmd("AerialOpen")
    end
end

return M
