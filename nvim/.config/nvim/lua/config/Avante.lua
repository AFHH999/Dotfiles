require("lazy").setup({
  {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "gemini", -- 👈 use Gemini provider
      auto_suggestions_provider = "gemini", -- Add this line
      gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-latest:generateContent",
        model = "gemini-2.5-flash-exp",
        api_key = os.getenv("GEMINI_API_KEY"), -- ✅ use env var if possible
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },

      input = {
        provider = "dressing", -- ✅ recommended over 'native' to avoid errors
      },

      -- ❌ do NOT define other providers (anthropic, moonshot, etc.)
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "stevearc/dressing.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
}}
