local M = {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
}

function M.config()
    local illuminate = require "illuminate"
    vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }

    illuminate.configure {
        providers = {
            "lsp",
            "treesitter",
            "regex",
        },
        delay = 100,
        filetypes_denylist = {
            "DiffviewFiles",
            "DressingInput",
            "DressingSelect",
            "Jaq",
            "NeogitCommitMessage",
            "NeogitStatus",
            "NvimTree",
            "Outline",
            "TelescopePrompt",
            "Trouble",
            "alpha",
            "dirvish",
            "fugitive",
            "harpoon",
            "lazy",
            "lir",
            "mason",
            "minifiles",
            "neogitstatus",
            "netrw",
            "oil",
            "packer",
            "qf",
            "spectre_panel",
            "toggleterm",
        },
        filetypes_allowlist = {},
        modes_denylist = {},
        modes_allowlist = {},
        providers_regex_syntax_denylist = {},
        providers_regex_syntax_allowlist = {},
        under_cursor = true,
        large_file_cutoff = 5000,
    }
end

return M
