local M = {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim"
    }
}

function M.config()
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
        debug = false,
        sources = {
            -- formatting.prettier.with {
            --     extra_filetypes = { "toml" },
            --     extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
            -- },
            formatting.black,
            formatting.isort,
            -- formatting.google_java_format,
            -- diagnostics.flake8,
            diagnostics.buildifier,
            formatting.buildifier,
            formatting.clang_format.with({
                command = "/usr/bin/clang-format-16",
            }),
            formatting.shfmt.with({
                extra_args = { "-i", "4", "-fn" },
            }),
        },
    }
end

return M
