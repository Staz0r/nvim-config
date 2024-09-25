local dap = require "dap"
local dapui = require "dapui"
local map = vim.keymap.set

map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Add breakpoint at line" })
map("n", "<leader>dr", dap.continue, { desc = "Start or continue the debugger" })

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = 'D:/IDK Core/2. Programming/bin/codelldb/adapter/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
--
-- dap.configurations.c = dap.configurations.cpp

-- return {
--   "mfussenegger/nvim-dap",
--   config = function()
--     local dap = require("dap")
--     local map = vim.keymap.set
--     map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Add breakpoint at line" })
--     map("n", "<leader>dr", dap.continue, { desc = "Start or continue the debugger" })
--   end,
-- }
