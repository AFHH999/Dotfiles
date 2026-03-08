-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.python3_host_prog = "/usr/bin/python3"
vim.opt.spelllang = { "en", "es" }
vim.keymap.set("n", "<leader>us", "<cmd>set spell!<CR>", { desc = "Toggle spell check" })
-- Disable inlay hints globally
vim.lsp.inlay_hint.enable(false)
