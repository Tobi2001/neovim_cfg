local status_ok, yanky = pcall(require, "yanky")
if not status_ok then
    return
end

yanky.setup({
    ring = {
        storage = "memory"
    },
    highlight = {
        on_put = true,
        on_yank = false,
        timer = 300
    }
})
