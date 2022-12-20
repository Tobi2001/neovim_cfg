local status_ok, debugprint = pcall(require, "debugprint")
if not status_ok then
    return
end

debugprint.setup({})
