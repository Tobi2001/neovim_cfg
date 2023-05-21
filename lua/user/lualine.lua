local M = {
    "nvim-lualine/lualine.nvim",
    event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
    dependencies = {
        {
            "f-person/git-blame.nvim",
            event = "VeryLazy",
        },
    },
}

function M.config()
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
        return
    end

    local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end

    local diff = {
        "diff",
        colored = false,
        symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
        cond = hide_in_width,
    }

    local filetype = {
        "filetype",
        icons_enabled = false,
    }

    local location = {
        "location",
        padding = 0,
    }

    local spaces = function()
        return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end

    local git_blame = require "gitblame"
    lualine.setup {
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "alpha", "dashboard" },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { git_blame.get_current_blame_text },
            lualine_x = { diff, spaces, "encoding", filetype },
            lualine_y = { location },
            lualine_z = { "progress" },
        },
    }
end

return M
