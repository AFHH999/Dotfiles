-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set the keymap to open and close Neotree
vim.api.nvim_set_keymap("n", "\\", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- Nvim DAP
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", { desc = "Debugger step into" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_over()<CR>", { desc = "Debugger step over" })
vim.keymap.set("n", "<leader>dh", "<cmd>lua require('dap').step_out()<CR>", { desc = "Debugger step out" })
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", { desc = "Debugger continue" })
vim.keymap.set(
  "n",
  "<leader>db",
  "<cmd>lua require('dap').toggle_breakpoint()<CR>",
  { desc = "Debugger toggle breakpoint" }
)
vim.keymap.set(
  "n",
  "<leader>dcd",
  "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
vim.keymap.set("n", "<leader>de", "<cmd>lua require('dap').terminate()<CR>", { desc = "Debugger reset" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dap').run_last()<CR>", { desc = "Debugger run last" })

-- Corrected keymap for rustaceanvim
vim.keymap.set("n", "<leader>dc", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
