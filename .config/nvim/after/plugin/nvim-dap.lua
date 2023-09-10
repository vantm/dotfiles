local dap = require 'dap'

dap.adapters.coreclr = {
    type = 'executable',
    command = 'netcoredbg',
    args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
    {
        type = 'coreclr',
        name = 'attach - netcoredbg',
        request = 'attach',
        args = { '--attach ${command:pickProcess}' }
    }
}
