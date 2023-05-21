local M = {
    "nvim-telescope/telescope.nvim",
    event = "Bufenter",
    cmd = { "Telescope" },
    dependencies = {
        {
            "ahmedkhalf/project.nvim",
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
        {
            "nvim-telescope/telescope-ui-select.nvim",
        },
    },
}

function M.config()
    local actions = require "telescope.actions"
    local telescope = require "telescope"
    telescope.setup {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            path_display = { "smart" },
            file_ignore_patterns = {
                ".git/",
                "node_modules",
                "bazel-bin",
                "bazel-out",
                "bazel-project",
                "bazel-testlogs",
            },
            mappings = {
                n = {
                    ["<C-j>"] = actions.preview_scrolling_down,
                    ["<C-k>"] = actions.preview_scrolling_up,
                },
                i = {
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                },
            },
        },
    }
    telescope.load_extension "fzf"
    telescope.load_extension "ui-select"
end

return M
