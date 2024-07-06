local M = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
}

function M.config()
    require("ibl").setup {
        exclude = {
            buftypes = { "terminal", "nofile" },
            filetypes = {
                "NvimTree",
                "Trouble",
                "checkhealth",
                "dashboard",
                "help",
                "lazy",
                "lspinfo",
                "man",
                "neogitstatus",
                "packer",
                "startify",
                "text",
            },
        },
        indent = {
            char = "▏",
            highlight = {
                "IndentBlanklineIndent1",
            },
        },
        scope = {
            show_start = false,
            show_end = false,
        },
    }
end

return M
