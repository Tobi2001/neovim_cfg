M = {
    "vim-scripts/DoxygenToolkit.vim",
    event = "VeryLazy",
}

function M.config()
    vim.g.DoxygenToolkit_commentType = "C++"
    vim.g.DoxygenToolkit_startCommentTag = "/// "
    vim.g.DoxygenToolkit_interCommentTag = "/// "
    vim.g.DoxygenToolkit_endCommentTag = ""
    vim.g.DoxygenToolkit_startCommentBlock = "// "
    vim.g.DoxygenToolkit_interCommentBlock = "// "
    vim.g.DoxygenToolkit_endCommentBlock = ""
end

return M
