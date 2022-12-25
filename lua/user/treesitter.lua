local status_ok = pcall(require, "nvim-treesitter")
if not status_ok then
    return
end

local cfg_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not cfg_status_ok then
    return
end

configs.setup({
    ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css", "bash", "markdown" }, -- list of language that will be disabled
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = false, disable = { "python", "css" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    additional_vim_regex_highlighting = false,
})
