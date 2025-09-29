return {
  -- The core Mason plugin for managing language servers and linters.
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
  },

  -- The bridge between Mason and LSP settings.
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "rust_analyzer", -- install it
        "lua_ls",
        "jsonls",
        "bashls",
        "marksman",
        "pylsp",
      },
      handlers = {
        -- default setup for everything
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        -- disable auto-setup for Rust (rustaceanvim handles it)
        ["rust_analyzer"] = function() end,
      },
    },
  },
}
