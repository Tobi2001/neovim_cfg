return {
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--clang-tidy",
        "--all-scopes-completion",
        "--header-insertion=iwyu",
        "--background-index"
    },
}
