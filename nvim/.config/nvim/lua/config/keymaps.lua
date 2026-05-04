-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional keymaps here

-- Corrected keymap for rustaceanvim
vim.keymap.set("n", "<leader>rt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Rust testables" })

-- Toggle LSP Inlay Hints
-- Why: Disabling them globally strips too much context in typed languages.
-- Toggling allows us to hide them when the screen gets too cluttered.
vim.keymap.set("n", "<leader>uh", function()
	-- Check the current state of inlay hints in the active buffer
	local is_enabled = vim.lsp.inlay_hint.is_enabled({})
	-- Flip the state
	vim.lsp.inlay_hint.enable(not is_enabled)
end, { desc = "Toggle Inlay Hints" })
