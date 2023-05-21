local M = {
    "max397574/better-escape.nvim",
    event = "BufEnter",
}

function M.config()
    require("better_escape").setup {
        mapping = { "jk" }, -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        keys = "<Esc>",
    }
end

return M
