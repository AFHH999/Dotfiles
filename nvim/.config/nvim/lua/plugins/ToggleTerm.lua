return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-ñ>]],
        hide_numbers = true,
        direction = "float",
        shade_terminals = true,
      })
      -- This section adds the keymaps.
      -- This tells Neovim to use a different key to close the terminal
      -- while you are in normal mode.
      -- 't' is for terminal mode. You press <C-c> to go back to Normal mode.
      vim.api.nvim_set_keymap("t", "<C-c>", "<C-\\><C-n>", {
        noremap = true,
        silent = true,
        desc = "Close terminal",
      })
    end,
  },
}
