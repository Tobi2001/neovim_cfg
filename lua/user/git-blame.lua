local M = {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
}

function M.config()
    vim.g.gitblame_enabled = true
    vim.g.gitblame_display_virtual_text = true
    vim.g.gitblame_message_template = "<author> • <date>"
    vim.g.gitblame_date_format = "%r"
end

return M
