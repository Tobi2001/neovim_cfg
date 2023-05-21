local M = {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
        {
            "mfussenegger/nvim-dap",
            event = "VeryLazy",
        },
    },
}

function M.config()
    require("dapui").setup {
        expand_lines = true,
        layouts = {
            {
                elements = {
                    { id = "console", size = 0.5 },
                    { id = "repl", size = 0.5 },
                },
                size = 0.2,
                position = "bottom", -- Can be "left", "right", "top", "bottom"
            },
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.25, -- Can be float or integer > 1
                    },
                    { id = "breakpoints", size = 0.25 },
                },
                size = 0.25,
                position = "right", -- Can be "left", "right", "top", "bottom"
            },
        },
        floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        windows = { indent = 1 },
        render = {
            max_type_length = nil, -- Can be integer or nil.
        },
    }

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
end

return M
