local M = {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            lazy = true,
        },
        {
            "jay-babu/mason-nvim-dap.nvim",
            lazy = true,
        },
    },
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

function M.config()
    require("mason").setup(settings)
    require("mason-lspconfig").setup {
        ensure_installed = require("utils").servers,
        automatic_installation = true,
    }
    require("mason-nvim-dap").setup {
        ensure_installed = { "cppdbg" },
        automatic_setup = true,
        handlers = {}
    }
end

return M
