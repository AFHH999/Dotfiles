return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "fade_in_slide_out",
        timeout = 3000,
        render = "compact",
        background_colour = "#000000",
      })
      vim.notify = notify
    end,
  },

  {
    "folke/snacks.nvim",
    config = function()
      require("snacks").setup({
        notifier = {
          backend = "notify", -- use nvim-notify
        },
      })
    end,
  },
}
