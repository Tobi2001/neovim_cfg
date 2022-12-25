local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
    options = {
        close_command = "lua require('close_buffers').delete({ type = %d })",
        right_mouse_command = "lua require('close_buffers').delete({ type = %d })",
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = "slant",
    },
    highlights = {
        tab_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
    },
}
