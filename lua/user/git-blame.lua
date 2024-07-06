local M = {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
}

function M.config()
    require('gitblame').setup {
        enabled = true,
        display_virtual_text = false,
        message_template = "<author> • <date>",
        date_format = "%r",
    }
end

return M
