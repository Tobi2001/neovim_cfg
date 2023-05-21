local M = {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
}

function M.config()
    require("nvim-tmux-navigation").setup {}
end

return M
