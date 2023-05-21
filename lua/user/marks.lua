local M = {
    "chentoast/marks.nvim",
    event = "VeryLazy",
}

M.opts = {
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 250,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    excluded_filetypes = { "NvimTree" },
    bookmark_0 = {
        sign = "⚑",
        virt_text = "",
        annotate = false,
    },
    default_mappings = false,
    mappings = {
        set_bookmark0 = "mm",
        delete_bookmark0 = "dmc",
        delete_bookmark = "dmm",
        next_bookmark0 = "mn",
        prev_bookmark0 = "mp",
        delete = "dm",
    },
}

return M
