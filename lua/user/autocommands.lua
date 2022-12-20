-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
    callback = function()
        vim.cmd [[
        nnoremap <silent> <buffer> q :close<CR>
        set nobuflisted
        ]]
    end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd "set formatoptions-=cro"
    end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
    end,
})

-- Autoformat on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.cpp", "*.h", "*.hpp" },
    callback =function() vim.lsp.buf.formatting_sync() end,
})

-- Disable neoscroll keymappings in nvim-tree
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "NvimTree" },
    callback = function()
        vim.keymap.set("n", "<C-u>", "<C-u>", { buffer = true })
        vim.keymap.set("n", "<C-d>", "<C-d>", { buffer = true })
    end,
})
