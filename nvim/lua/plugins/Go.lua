-- ~/.config/nvim/lua/plugins/go.lua

-- Lazy.nvim setup for Go-related plugins and configurations
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- LSP Configuration for gopls
      lspconfig.gopls.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end,
      })
    end,
  },

  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls" },
      })
    end,
  },

  -- Go.nvim for Go-specific utilities
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    config = function()
      require("go").setup({
        goimports = "gopls",
        gofmt = "goimports",
        max_line_len = 120,
        lsp_inlay_hints = { enabled = true },
        auto_format = true,
        auto_lint = true,
      })

      -- Keybindings for Go.nvim commands
      vim.api.nvim_set_keymap("n", "<Leader>gt", "<cmd>GoTest<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>gi", "<cmd>GoIfErr<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>gf", "<cmd>GoFmt<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<Leader>gI", "<cmd>GoImports<CR>", { noremap = true, silent = true })
    end,
  },

  -- Autocompletion setup
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }),
      })
    end,
  },
}
