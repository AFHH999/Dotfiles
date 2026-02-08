return {
  "mbbill/undotree",
  lazy = true,
  keys = {
    {
      "<leader>t", -- Changed from "<leader>u" to "<leader>t"
      function()
        vim.cmd.UndotreeToggle()
      end,
      desc = "Toggle UndoTree",
    },
  },
  config = function()
    local ok, undotree = pcall(require, "undotree")
    if not ok then
      return
    end

    undotree.setup({
      window = {
        winblend = 10,
        border = "rounded",
        width = 40,
        height = 15,
        position = "right",
      },
      keymaps = {
        ["q"] = "quit",
        ["<CR>"] = "restore",
        ["<2-LeftMouse>"] = "restore",
      },
      diff_auto = true,
      diff_context = 3,
      focus_on_toggle = false,
    })
  end,
}
