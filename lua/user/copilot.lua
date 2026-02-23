local M = {
    "github/copilot.vim",
    event = "BufRead",
    enabled = false,
}

function M.config()
    vim.b.copilot_enabled = false
    vim.g.copilot_no_maps = true
end

return M
