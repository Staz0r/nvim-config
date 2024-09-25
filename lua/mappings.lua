require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Dap
-- local dap = require("configs.dap")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toggle Undotree Panel" })
map({ "n", "v" }, "<leader>fj", function()
  require("hop").hint_words()
end, { desc = "telescope hop" })

map("n", "<leader>S", "<cmd>lua require('spectre').toggle()<CR>", {
  desc = "Toggle Spectre",
})
map("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", {
  desc = "Search current word",
})
map("n", "<leader>sw", "<esc><cmd>lua require('spectre').open_visual()<CR>", {
  desc = "Search current word",
})
map("n", "<leader>sp", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", {
  desc = "Search on current file",
})

-- telescope for todo
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Add breakpoint at line" })
-- map("n", "<leader>dr", dap.continue, { desc = "Start or continue the debugger" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

