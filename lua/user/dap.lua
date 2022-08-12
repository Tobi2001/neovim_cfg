local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    return
end

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '',
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        miDebuggerArgs = '--nh',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        --cwd = '${workspaceFolder}',
        cwd = '',
        stopOnEntry = false,
    },
    {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    miDebuggerArgs = '--nh',
    cwd = '',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

dapui.setup( {
    expand_lines = true,
    layouts = {
        {
            elements = {
                { id = "console", size = 0.2 },
            },
            size = 0.2,
            position = "bottom", -- Can be "left", "right", "top", "bottom"
        },
        {
            elements = {
                {
                    id = "scopes",
                    size = 0.25, -- Can be float or integer > 1
                },
                { id = "breakpoints", size = 0.25 },
            },
            size = 40,
            position = "right", -- Can be "left", "right", "top", "bottom"
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    }
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
