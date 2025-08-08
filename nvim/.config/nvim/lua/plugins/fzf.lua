return {
  {
    "junegunn/fzf",
    build = function()
      vim.cmd([[helptags ALL]])
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    lazy = false, -- Load this plugin on startup or when needed
    -- You can add configuration here if needed, but it works well out of the box
    -- config = function()
    --   vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { desc = 'Fuzzy find buffers' })
    -- end,
  },
}
