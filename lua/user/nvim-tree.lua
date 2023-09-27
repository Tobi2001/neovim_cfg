local M = {
    "kyazdani42/nvim-tree.lua",
    event = "VimEnter",
}

function M.config()
    local function on_attach(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Mappings migrated from view.mappings.list
        --
        -- You will need to insert "your code goes here" for any mappings with a custom action_cb
        vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
        vim.keymap.set("n", "o", api.node.open.edit, opts "Open")
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
        vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
    end

    require("nvim-tree").setup {
        on_attach = on_attach,
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        actions = {
            change_dir = {
                global = true,
            },
        },
        sync_root_with_cwd = true,
        renderer = {
            root_folder_modifier = ":t",
            icons = {
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        arrow_open = "",
                        arrow_closed = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "",
                        staged = "S",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "U",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = "󰌵",
                info = "",
                warning = "",
                error = "",
            },
        },
        view = {
            width = 60,
            side = "left",
        },
    }
end

return M
