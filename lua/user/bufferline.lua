local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
    options = {
        close_command = "lua require('close_buffers').delete({ type = %d })", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "lua require('close_buffers').delete({ type = %d })", -- can be a string | function, see "Mouse actions"
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
    },
    highlights = {
        tab_selected = {
            guifg = '#ff0000',
        },
    },
}
