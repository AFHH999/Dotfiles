-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.spelllang = { "en", "es" }
vim.keymap.set("n", "<leader>us", "<cmd>set spell!<CR>", { desc = "Toggle spell check" })
