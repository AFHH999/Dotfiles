return {
  "MeanderingProgrammer/render-markdown.nvim",

  -- Load only when it makes sense
  ft = { "markdown" },

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.nvim",
  },

  ---@module "render-markdown"
  ---@type render.md.UserConfig
  opts = {
    heading = {
      sign = false, -- cleaner gutter
      icons = {
        "󰲡 ",
        "󰲣 ",
        "󰲥 ",
        "󰲧 ",
        "󰲩 ",
        "󰲫 ",
      },
    },

    code = {
      sign = false,
      width = "block",
      right_pad = 4,
    },
  },

  config = function(_, opts)
    local ok, render_md = pcall(require, "render-markdown")
    if not ok then
      return
    end

    render_md.setup(opts)

    -- Localize conceal settings to markdown buffers only
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = "nc"
      end,
    })
  end,
}
