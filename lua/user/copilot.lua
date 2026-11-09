local M = {
    "github/copilot.vim",
    lazy = false,
    enabled = true,
}

function M.config()
    vim.b.copilot_enabled = true
    vim.g.copilot_no_tab_map = true
end

return M

