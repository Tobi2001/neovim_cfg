local M = {
    "edluffy/specs.nvim",
    event = "VeryLazy",
}

function M.config()
    require("specs").setup {
        show_jumps = false,
        min_jump = 10,
        popup = {
            delay_ms = 0, -- delay before popup displays
            inc_ms = 10, -- time increments used for fade/resize effects
            blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
            width = 15,
            winhl = "PMenu",
            fader = require("specs").linear_fader,
            resizer = require("specs").shrink_resizer,
        },
        ignore_filetypes = {
            qf = true,
        },
        ignore_buftypes = {
            nofile = true,
        },
    }
end

return M
