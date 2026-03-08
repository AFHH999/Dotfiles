-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional keymaps here

-- Corrected keymap for rustaceanvim
vim.keymap.set("n", "<leader>rt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Rust testables" })
