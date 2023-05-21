local M = {
    "iamcco/markdown-preview.nvim",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    event = "VeryLazy",
}

function M.config()
    vim.g.mkdp_auto_close = false
end

return M
