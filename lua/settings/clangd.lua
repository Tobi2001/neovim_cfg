return {
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--clang-tidy",
        "--all-scopes-completion",
        "--background-index",
        "--header-insertion=iwyu",
        "--completion-style=detailed"
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}
