vim.diagnostic.config({
    signs = {
        active = true,
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
        },
    },
    virtual_text = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    -- float = {
    --     focusable = false,
    --     style = "minimal",
    --     border = "rounded",
    --     source = "always",
    --     header = "",
    --     prefix = "",
    --     suffix = "",
    -- },
})
