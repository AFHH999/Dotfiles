return {
	"yetone/avante.nvim",
	build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	event = "VeryLazy",
	version = false,
	---@module 'avante'
	---@type avante.Config
	opts = {
		instructions_file = "avante.md",
		provider = "deepseek", -- Change to "moonshot" whenever you want to use it

		providers = {
			deepseek = {
				__inherited_from = "openai",
				api_key_name = "DEEPSEEK_API_KEY",
				endpoint = "https://api.deepseek.com",
				model = "deepseek-v4-flash",
				extra_request_body = {
					thinking = { type = "disabled" },
				},
			},

			moonshot = {
				__inherited_from = "openai",
				api_key_name = "KIMI_API_KEY",
				endpoint = "https://api.moonshot.ai/v1",
				model = "kimi-k2-0711-preview",
			},

			file_selector = {
				provider = "fzf",
			},
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"ibhagwan/fzf-lua",
			"folke/snacks.nvim",
			"nvim-tree/nvim-web-devicons",
			"hrsh7th/nvim-cmp",
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
			},
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
