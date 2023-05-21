local M = {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
}

function M.config()
    require("neoscroll").setup {
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
    }

    local t = {}
    t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "75" } }
    t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "75" } }
    t["zt"] = { "zt", { "75" } }
    t["zz"] = { "zz", { "75" } }
    t["zb"] = { "zb", { "75" } }
    t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "250" } }
    t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "250" } }
    t["<C-y>"] = { "scroll", { "-0.10", "false", "75" } }
    t["<C-e>"] = { "scroll", { "0.10", "false", "75" } }
    require("neoscroll.config").set_mappings(t)
end

return M
