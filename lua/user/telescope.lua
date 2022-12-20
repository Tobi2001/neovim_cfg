local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        file_ignore_patterns = { ".git/", "node_modules", "bazel-bin", "bazel-out", "bazel-project", "bazel-testlogs"},
        layout_strategy='horizontal',
        layout_config = {
            horizontal = {
                width = 0.9,
                preview_width = 0.5,
            }
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<Down>"] = actions.preview_scrolling_down,
                ["<Up>"] = actions.preview_scrolling_up,
            },
            n = {
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-k>"] = actions.preview_scrolling_up,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    },
}
telescope.load_extension('fzf')
telescope.load_extension("ui-select")

