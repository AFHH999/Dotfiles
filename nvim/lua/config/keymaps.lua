-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set the keymap to open and close Neotree
vim.api.nvim_set_keymap("n", "\\", ":Neotree toggle<CR>", { noremap = true, silent = true })
