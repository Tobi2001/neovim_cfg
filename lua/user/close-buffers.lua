local M = {
    "kazhala/close-buffers.nvim",
    event = "VeryLazy",
}

function M.config()
    require("close_buffers").setup {}
end

return M
