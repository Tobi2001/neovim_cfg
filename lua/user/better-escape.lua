local M = {
    "max397574/better-escape.nvim",
    event = "BufEnter",
}

function M.config()
    require("better_escape").setup {
        mappings = {
            i = {
                j = {
                    k = "<Esc>",
                },
            },
        },
        timeout = vim.o.timeoutlen,
        clear_empty_lines = false,
    }
end

return M
