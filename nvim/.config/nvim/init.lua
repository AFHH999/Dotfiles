-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.python3_host_prog = "/usr/bin/python3"
vim.opt.spelllang = { "en", "es" }
vim.keymap.set("n", "<F5>", "<cmd>set spell!<CR>", { desc = "Toggle spell check" })
