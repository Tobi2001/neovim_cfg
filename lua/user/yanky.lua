local M = {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
}

M.opts = {
    ring = {
        storage = "memory",
    },
    highlight = {
        on_put = true,
        on_yank = false,
        timer = 300,
    },
}

return M
