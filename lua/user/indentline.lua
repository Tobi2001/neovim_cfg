local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
}

M.opts = {
    char = "▏",
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = false,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
        "lspinfo",
        "checkhealth",
        "man"
    },
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
}

return M
