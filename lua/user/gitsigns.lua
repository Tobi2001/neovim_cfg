local M = {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
}

function M.config()
    require('gitsigns').setup {
        signs = {
            add = { text = "▎", },
            change = { text = "▎", },
            delete = { text = "契", },
            topdelete = { text = "契", },
            changedelete = { text = "▎", },
        },
        signcolumn = true,
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        preview_config = {
            border = "single",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
    }
end

return M
