local M = {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
}

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", opts)
    keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.jump({count = 1, float = true})<cr>", opts)
    keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.jump({count = -1, float = true})<cr>", opts)
    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    -- if client.supports_method "textDocument/inlayHint" then
    --     vim.lsp.inlay_hint.enable(true)
    -- end
end

function M.common_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return capabilities
end

local function decode_html_entities(str)
    if not str then return str end
    local entities = {
        ["&nbsp;"] = " ",
        ["&#160;"] = " ",
    }
    local rep_str = (str:gsub("(&#?%w+;)", entities))
    return rep_str:gsub("\\_", "_")
end

function M.config()
    local lspconfig = require "lspconfig"
    local servers = {
        "clangd",
        "lua_ls",
        "pyright",
        "bashls",
        "jsonls",
        "yamlls",
        "protols",
        "starpls"
    }

    local default_diagnostic_config = {
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
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
            suffix = "",
        },
    }
    vim.diagnostic.config(default_diagnostic_config)

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
        if result and result.contents then
            if type(result.contents) == "string" then
                result.contents = decode_html_entities(result.contents)
            elseif type(result.contents) == "table" then
                if result.contents.value then
                    result.contents.value = decode_html_entities(result.contents.value)
                elseif vim.tbl_islist(result.contents) then
                    -- If contents is a list of MarkedString or MarkupContent
                    for _, content in ipairs(result.contents) do
                        if type(content) == "string" then
                            content = decode_html_entities(content)
                        elseif type(content) == "table" and content.value then
                            content.value = decode_html_entities(content.value)
                        end
                    end
                end
            end
        end
        -- Call original hover handler with border option preserved
        vim.lsp.handlers.hover(err, result, ctx, vim.tbl_extend("force", { border = "rounded" }, config or {}))
    end

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    require("lspconfig.ui.windows").default_options.border = "rounded"

    for _, server in pairs(servers) do
        local opts = {
            on_attach = M.on_attach,
            capabilities = M.common_capabilities(),
        }

        local require_ok, settings = pcall(require, "settings." .. server)
        if require_ok then
            opts = vim.tbl_deep_extend("force", settings, opts)
        end

        -- if server == "lua_ls" then
        --     require("neodev").setup {}
        -- end

        lspconfig[server].setup(opts)
    end
end

return M
