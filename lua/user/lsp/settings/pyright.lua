local function get_bazel_extra_paths()
    local Path = require'plenary.path'
    local extra_paths = {}
    local add_extra_paths = function(_, stdout)
        for _, line in ipairs(stdout) do
            if Path:new(line):exists() and line ~= "" then
                table.insert(extra_paths, line)
            end
        end
    end
    -- local find_python_modules = [[find . | grep __init__.py | grep -v .runfiles | xargs -r dirname | xargs -r dirname | grep -v "\.$" | awk '$0 ~ "^"r"\\/"{ next }{ r=$0 }1' | sort | uniq | xargs -r readlink -f;]]
    -- local find_python_modules = [[fdfind --type d project | sort | uniq | xargs -r readlink -f]]
    local find_python_modules = [[cat ~/.config/bazel_project_paths]]
    local jobid = vim.fn.jobstart(find_python_modules, { on_stdout = add_extra_paths })
    vim.fn.jobwait({jobid})
    table.insert(extra_paths, vim.fn.getcwd())
    table.insert(extra_paths, "/home/tobias/workspace/project/")
    return extra_paths
end



return {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "openFilesOnly",
                -- extraPaths = {"/home/tobias/workspace/project"},
                -- extraPaths = {get_bazel_extra_paths(), "/home/tobias/workspace/project"},
                extraPaths = get_bazel_extra_paths(),
                useLibraryCodeForTypes = true,
                stubPath = "/home/tobias/.apps/python-type-stubs/",
                verboseOutput = true
            },
        },
    },
}
